// GET /export.geojson  (redirected to this function by netlify.toml)
//
// Same live Supabase data as export-kml.js, reshaped for Mapbox GL JS
// instead of KML/My Maps. My Maps' file-import silently truncates large
// imports and has no "link" import option; Mapbox just renders whatever
// GeoJSON you hand it, so there's no row cap to run into.
//
// One Feature per MOUNTAIN (not per death) -- all of that mountain's
// approved incidents are embedded as a JSON array in the feature's
// `incidents` property. map.html reads that array to build the popup.
// This keeps the feature count at "peaks with a recorded death" (a few
// dozen) instead of one marker per fatality stacked on identical
// coordinates, which is both smaller to transfer and easier to render
// (circle size = death count) than a marker-per-incident approach.
//
// Uses the same public anon key the site itself uses client-side --
// no secrets, no environment variable setup required to deploy this.
 
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
 
  var incidentsByMountain = {};
  incidents.forEach(function (r) {
    (incidentsByMountain[r.mountain] = incidentsByMountain[r.mountain] || []).push(r);
  });
 
  var features = mountains
    .filter(function (m) {
      return (incidentsByMountain[m.mountain] || []).length > 0;
    })
    .map(function (m) {
      var rows = incidentsByMountain[m.mountain];
      var incidentList = rows.map(function (r) {
        var climber = r.climber_name && r.climber_name.trim() ? r.climber_name : "Unidentified climber";
        var sex = r.gender === "M" ? "Male" : r.gender === "F" ? "Female" : "Unknown";
        return {
          climber: climber,
          date: formatDate(r),
          age: r.age || "Unknown",
          sex: sex,
          cause: r.cause || "Unknown"
        };
      });
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
          death_count: incidentList.length,
          incidents: incidentList
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