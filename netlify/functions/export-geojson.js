console.log("hi")

const SUPABASE_URL = "https://upwnwylhlykrxokvcuhu.supabase.co";
const SUPABASE_ANON_KEY = "sb_publishable_c3m71XRj9-VBcnoml2tjVw_2pW4rndB";

const MONTH_NAMES = [
  "", "January", "February", "March", "April", "May", "June",
  "July", "August", "September", "October", "November", "December"
];

// `month` has been stored inconsistently (numeric 1-12 in some inserts,
// possibly a month name elsewhere) -- accept either rather than assume.
function monthNumber(month) {
  if (month == null || month === "") return null;
  var n = parseInt(month, 10);
  if (!isNaN(n) && n >= 1 && n <= 12) return n;
  var idx = MONTH_NAMES.findIndex(function (m) {
    return m.toLowerCase() === String(month).toLowerCase();
  });
  return idx > 0 ? idx : null;
}

function formatDate(r) {
  var mm = monthNumber(r.month);
  if (r.year && mm && r.day) {
    return String(mm).padStart(2, "0") + "/" + String(r.day).padStart(2, "0") + "/" + r.year;
  }
  if (r.year && mm) {
    return MONTH_NAMES[mm] + " " + r.year;
  }
  return r.year ? String(r.year) : "Unknown";
}

async function fetchAll(path) {
  var res = await fetch(SUPABASE_URL + "/rest/v1/" + path, {
    headers: {
      apikey: SUPABASE_ANON_KEY,
      Authorization: "Bearer " + SUPABASE_ANON_KEY
    }
  });
  if (!res.ok) {
    throw new Error("Supabase fetch failed (" + res.status + "): " + path);
  }
  return res.json();
}

exports.handler = async function () {
  var mountains, incidents;
  try {
    [mountains, incidents] = await Promise.all([
      fetchAll("mountains?select=*"),
      fetchAll("incidents?select=mountain,year,month,day,cause,gender,age,climber_name&status=eq.approved")
    ]);
  } catch (err) {
    return {
      statusCode: 502,
      body: JSON.stringify({ error: "Failed to load data from Supabase: " + err.message })
    };
  }

  var byMountain = {};
  mountains.forEach(function (m) {
    byMountain[m.mountain] = m;
  });

  var features = incidents
    .filter(function (r) {
      return byMountain[r.mountain]; // skip incidents whose mountain isn't in the reference table
    })
    .map(function (r) {
      var m = byMountain[r.mountain];
      var climber = r.climber_name && r.climber_name.trim() ? r.climber_name : "Unidentified climber";
      var sex = r.gender === "M" ? "Male" : r.gender === "F" ? "Female" : "Unknown";

      return {
        type: "Feature",
        geometry: {
          type: "Point",
          coordinates: [Number(m.longitude), Number(m.latitude)]
        },
        properties: {
          mountain: m.mountain,
          range: m.range,
          range_color: m.range_color,
          climber: climber,
          date: formatDate(r),
          age: r.age || "Unknown",
          sex: sex,
          cause: r.cause || "Unknown"
        }
      };
    });

  var geojson = {
    type: "FeatureCollection",
    features: features
  };

  return {
    statusCode: 200,
    headers: {
      "Content-Type": "application/geo+json; charset=utf-8",
      "Access-Control-Allow-Origin": "*",
      "Cache-Control": "public, max-age=300"
    },
    body: JSON.stringify(geojson)
  };
};