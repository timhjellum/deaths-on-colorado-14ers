(function () {
  var statusEl = document.getElementById("status");
  var legendEl = document.getElementById("legend");

  var map = L.map("map", { zoomControl: true }).setView([38.9, -106.2], 7);

  // Plain OpenStreetMap tiles -- free, no signup, no key, and (unlike
  // CartoDB's hosted basemaps) not something a provider can start
  // requiring an account for later. Recolored dark via CSS above.
  L.tileLayer("https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png", {
    attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors',
    subdomains: "abc",
    maxZoom: 19
  }).addTo(map);

  var clusters = L.markerClusterGroup({
    maxClusterRadius: 45,
    spiderfyOnMaxZoom: true,
    showCoverageOnHover: false,
    iconCreateFunction: function (cluster) {
      var children = cluster.getAllChildMarkers();
      var colors = {};
      children.forEach(function (m) { colors[m.options.rangeColor] = true; });
      var colorKeys = Object.keys(colors);
      var bg = colorKeys.length === 1 ? colorKeys[0] : "#5a6270"; // neutral gray for mixed-range clusters
      var count = children.length;
      var size = count >= 20 ? 44 : count >= 8 ? 36 : 28;

      return L.divIcon({
        html: '<div class="cluster-marker" style="width:' + size + 'px;height:' + size + 'px;background:' + bg + ';">' + count + "</div>",
        className: "",
        iconSize: [size, size]
      });
    }
  });

  fetch("/export.geojson")
    .then(function (res) {
      if (!res.ok) throw new Error("HTTP " + res.status);
      return res.json();
    })
    .then(function (geojson) {
      if (!geojson.features || !geojson.features.length) {
        statusEl.textContent = "No approved incidents found in the database yet.";
        return;
      }

      statusEl.className = "hidden";

      // climber name and details are free-text fields on the submission
      // form -- escape before dropping into innerHTML so an apostrophe,
      // "<", or similar in someone's entry can't break the popup markup.
      function escapeHtml(s) {
        return String(s == null ? "" : s)
          .replace(/&/g, "&amp;")
          .replace(/</g, "&lt;")
          .replace(/>/g, "&gt;")
          .replace(/"/g, "&quot;")
          .replace(/'/g, "&#39;");
      }

      geojson.features.forEach(function (f) {
        var p = f.properties;
        var lat = f.geometry.coordinates[1];
        var lon = f.geometry.coordinates[0];

        var icon = L.divIcon({
          className: "",
          html: '<div class="incident-marker" style="background:' + p.range_color + ';"></div>',
          iconSize: [14, 14],
          iconAnchor: [7, 7]
        });

        var popupHtml = "<div class=\"popup-title\">" + escapeHtml(p.climber) + "</div>" +
          "<div class=\"popup-sub\">" + p.mountain + " &middot; " + p.range + " Range</div>" +
          "<div class=\"popup-meta\">" +
          p.date + " &middot; Age " + p.age + " &middot; " + p.sex + "<br>" +
          p.cause +
          (p.details ? "<div class=\"popup-details\">" + escapeHtml(p.details) + "</div>" : "") +
          "</div>";

        var marker = L.marker([lat, lon], { icon: icon, rangeColor: p.range_color });
        marker.bindPopup(popupHtml, { maxWidth: 300 });
        clusters.addLayer(marker);
      });

      map.addLayer(clusters);

      // Legend: one swatch per distinct range color actually present.
      var seen = {};
      geojson.features.forEach(function (f) {
        seen[f.properties.range + "|" + f.properties.range_color] = true;
      });
      var rows = Object.keys(seen).map(function (key) {
        var parts = key.split("|");
        return "<div class=\"legend-row\"><span class=\"legend-swatch\" style=\"background:" + parts[1] + "\"></span>" + parts[0] + "</div>";
      }).sort().join("");
      legendEl.innerHTML = "<h4>Range</h4>" + rows;
      legendEl.className = "";
    })
    .catch(function (err) {
      statusEl.className = "error";
      statusEl.textContent = "Failed to load /export.geojson: " + err.message +
        ". If this is a fresh deploy, check that mountains_public_read_policy.sql has been run in Supabase (RLS blocking anon reads is the usual cause).";
    });
})();