// GET /mapbox-config.js  (redirected to this function by netlify.toml)
//
// Serves the Mapbox public token as a tiny JS snippet, read from a Netlify
// environment variable instead of being hardcoded in map.html. Nothing
// resembling a token pattern ever sits in a committed file this way, so
// GitHub's push protection (which specifically recognizes Mapbox tokens,
// unlike the Supabase anon key used elsewhere in this project) has
// nothing to flag -- and rotating the token later is a Netlify dashboard
// edit, not a new commit.
//
// Set this in Netlify: Site settings > Environment variables > add
// MAPBOX_TOKEN = pk.your_actual_token. Trigger a deploy afterward so the
// function picks it up.
 
exports.handler = async function () {
  var token = process.env.MAPBOX_TOKEN || "";
 
  return {
    statusCode: 200,
    headers: {
      "Content-Type": "application/javascript; charset=utf-8",
      "Cache-Control": "public, max-age=3600"
    },
    body: "window.MAPBOX_TOKEN = " + JSON.stringify(token) + ";"
  };
};