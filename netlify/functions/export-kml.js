// GET /export.kml  (redirected to this function by netlify.toml)
//
// Builds a KML file live from Supabase every time it's requested -- the
// `mountains` table for coordinates/range/color/icon, and `incidents`
// (status = 'approved' only, same as the public site) for the individual
// death placemarks. No build step, no stale export: whatever's in the
// database right now is what comes out.
//
// Point it at Google My Maps via "Import > Link" (a URL, not a file upload)
// and My Maps will re-fetch this endpoint, so re-importing later picks up
// new data without you re-exporting anything by hand.
//
// Uses the same public anon key the site itself uses client-side (it's
// already exposed in index.html and only has the read access RLS grants
// the public) -- no secrets needed here, so no environment variable setup
// is required to deploy this.

const SUPABASE_URL = "https://upwnwylhlykrxokvcuhu.supabase.co";
const SUPABASE_ANON_KEY = "sb_publishable_c3m71XRj9-VBcnoml2tjVw_2pW4rndB";

const MONTH_NAMES = [
  "", "January", "February", "March", "April", "May", "June",
  "July", "August", "September", "October", "November", "December"
];

function escapeXml(s) {
  return String(s == null ? "" : s)
    .replace(/&/g, "&amp;")
    .replace(/</g, "&lt;")
    .replace(/>/g, "&gt;")
    .replace(/"/g, "&quot;")
    .replace(/'/g, "&apos;");
}

// KML IconStyle <color> is aabbggrr. Convert a "#RRGGBB" hex to that order.
function hexToKmlColor(hex, alpha) {
  var h = String(hex).replace("#", "");
  var r = h.slice(0, 2), g = h.slice(2, 4), b = h.slice(4, 6);
  return (alpha || "ff") + b + g + r;
}

function styleId(hex) {
  return "range-" + String(hex).replace("#", "");
}

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
      body: "Failed to load data from Supabase: " + err.message
    };
  }

  var byMountain = {};
  mountains.forEach(function (m) {
    byMountain[m.mountain] = m;
  });

  var incidentsByMountain = {};
  incidents.forEach(function (r) {
    (incidentsByMountain[r.mountain] = incidentsByMountain[r.mountain] || []).push(r);
  });

  // One Style/StyleMap per distinct range color actually in use.
  var colors = Array.from(new Set(mountains.map(function (m) { return m.range_color; })));
  var iconHref = (mountains[0] && mountains[0].icon_href) ||
    "https://www.gstatic.com/mapspro/images/stock/503-wht-blank_maps.png";

  var styleBlocks = colors.map(function (hex) {
    var id = styleId(hex);
    var normalColor = hexToKmlColor(hex, "ff");
    return (
      "    <Style id=\"" + id + "-normal\">\n" +
      "      <IconStyle><color>" + normalColor + "</color><scale>1</scale>" +
      "<Icon><href>" + escapeXml(iconHref) + "</href></Icon></IconStyle>\n" +
      "      <LabelStyle><scale>0</scale></LabelStyle>\n" +
      "    </Style>\n" +
      "    <Style id=\"" + id + "-highlight\">\n" +
      "      <IconStyle><color>" + normalColor + "</color><scale>1.15</scale>" +
      "<Icon><href>" + escapeXml(iconHref) + "</href></Icon></IconStyle>\n" +
      "      <LabelStyle><scale>1</scale></LabelStyle>\n" +
      "    </Style>\n" +
      "    <StyleMap id=\"" + id + "\">\n" +
      "      <Pair><key>normal</key><styleUrl>#" + id + "-normal</styleUrl></Pair>\n" +
      "      <Pair><key>highlight</key><styleUrl>#" + id + "-highlight</styleUrl></Pair>\n" +
      "    </StyleMap>\n"
    );
  }).join("");

  var mountainNames = Object.keys(byMountain).sort();

  var folders = mountainNames.map(function (name) {
    var mtn = byMountain[name];
    var rows = incidentsByMountain[name] || [];
    if (!rows.length) return "";

    var placemarks = rows.map(function (r) {
      var climber = r.climber_name && r.climber_name.trim() ? r.climber_name : "Unidentified climber";
      var sex = r.gender === "M" ? "Male" : r.gender === "F" ? "Female" : "Unknown";
      var age = r.age || "Unknown";
      var date = formatDate(r);
      var descLines = [
        "Mountain: " + name,
        "Range: " + mtn.range,
        "Date: " + date,
        "Age: " + age,
        "Sex: " + sex,
        "Cause: " + r.cause
      ];
      return (
        "      <Placemark>\n" +
        "        <name>" + escapeXml(climber) + "</name>\n" +
        "        <description><![CDATA[" + descLines.join("<br>") + "]]></description>\n" +
        "        <styleUrl>#" + styleId(mtn.range_color) + "</styleUrl>\n" +
        "        <ExtendedData>\n" +
        "          <Data name=\"mountain\"><value>" + escapeXml(name) + "</value></Data>\n" +
        "          <Data name=\"range\"><value>" + escapeXml(mtn.range) + "</value></Data>\n" +
        "          <Data name=\"date\"><value>" + escapeXml(date) + "</value></Data>\n" +
        "          <Data name=\"climber\"><value>" + escapeXml(climber) + "</value></Data>\n" +
        "          <Data name=\"age\"><value>" + escapeXml(age) + "</value></Data>\n" +
        "          <Data name=\"sex\"><value>" + escapeXml(sex) + "</value></Data>\n" +
        "          <Data name=\"cause\"><value>" + escapeXml(r.cause) + "</value></Data>\n" +
        "        </ExtendedData>\n" +
        "        <Point><coordinates>" + mtn.longitude + "," + mtn.latitude + ",0</coordinates></Point>\n" +
        "      </Placemark>\n"
      );
    }).join("");

    return (
      "    <Folder>\n" +
      "      <name>" + escapeXml(name) + " (" + rows.length + ")</name>\n" +
      placemarks +
      "    </Folder>\n"
    );
  }).join("");

  var kml =
    "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n" +
    "<kml xmlns=\"http://www.opengis.net/kml/2.2\">\n" +
    "  <Document>\n" +
    "    <name>Deaths on Colorado 14ers</name>\n" +
    styleBlocks +
    folders +
    "  </Document>\n" +
    "</kml>\n";

  return {
    statusCode: 200,
    headers: {
      "Content-Type": "application/vnd.google-earth.kml+xml; charset=utf-8",
      "Content-Disposition": "inline; filename=\"deaths-on-colorado-14ers.kml\"",
      "Cache-Control": "public, max-age=300"
    },
    body: kml
  };
};
