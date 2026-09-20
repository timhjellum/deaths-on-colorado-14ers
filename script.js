        (async function () {
            "use strict";

            /* ============ DATA ============ */
            // Fallback seed, used only if records.json is also unavailable (e.g. this
            // file opened directly, offline, from disk).
            var RECORDS_SEED = [];

            var MONTH_NAMES = [
                "January",
                "February",
                "March",
                "April",
                "May",
                "June",
                "July",
                "August",
                "September",
                "October",
                "November",
                "December"
            ];

            // All named peaks on the map: [id, label, range, x, y, hasDeaths]
            // Each row: [slug, name, range, x, y, labeled, elevationFt].
            // elevationFt drives the peak list's "Tallest" sort and the
            // elevation readout next to each name -- not used by the map.
            var PEAKS = [
                ["capitol", "Capitol Peak", "Elk Range", 273.5, 366.5, true, 14130],
                ["snowmass", "Snowmass Mountain", "Elk Range", 277, 375.5, true, 14092],
                ["maroon-bells", "Maroon Bells", "Elk Range", 295.5, 389.25, true, 14156],
                ["pyramid", "Pyramid Peak", "Elk Range", 303, 390.5, false, 14018],
                ["conundrum", "Conundrum Peak", "Elk Range", 321, 405, false, 14060],
                ["castle", "Castle Peak", "Elk Range", 321, 411, false, 14265],

                ["holy-cross", "Mount of the Holy Cross", "Sawatch Range", 405.5, 275, false, 14005],
                ["massive", "Mount Massive", "Sawatch Range", 407.5, 355, false, 14421],
                ["elbert", "Mount Elbert", "Sawatch Range", 412.5, 376.5, false, 14433],
                ["la-plata", "La Plata Peak", "Sawatch Range", 406.5, 402.5, false, 14336],
                ["oxford", "Mount Oxford", "Sawatch Range", 438.5, 418.5, false, 14153],
                ["harvard", "Mount Harvard", "Sawatch Range", 430.5, 420.5, true, 14420],
                ["huron", "Huron Peak", "Sawatch Range", 414.5, 426, false, 14003],
                ["missouri", "Missouri Mountain", "Sawatch Range", 428, 427.5, true, 14067],
                ["belford", "Mount Belford", "Sawatch Range", 442, 432.5, false, 14197],
                ["columbia", "Mount Columbia", "Sawatch Range", 447.5, 439, false, 14073],
                ["yale", "Mount Yale", "Sawatch Range", 441, 455, true, 14196],
                ["princeton", "Mount Princeton", "Sawatch Range", 458.5, 483, true, 14197],
                ["antero", "Mount Antero", "Sawatch Range", 457.5, 504.5, true, 14269],
                ["tabeguache", "Tabeguache Peak", "Sawatch Range", 456, 517.5, false, 14155],
                ["shavano", "Mount Shavano", "Sawatch Range", 461, 522, false, 14229],

                ["pikes-peak", "Pikes Peak", "Front Range", 727.5, 455, false, 14115],
                ["longs", "Longs Peak", "Front Range", 597.5, 50, true, 14255],
                ["torreys", "Torreys Peak", "Front Range", 547.5, 220, true, 14267],
                ["grays", "Grays Peak", "Front Range", 550, 230, false, 14270],
                ["evans", "Mount Evans", "Front Range", 592.5, 240, true, 14258],
                ["bierstadt", "Mount Bierstadt", "Front Range", 582.5, 242.5, false, 14060],

                ["kit-carson", "Kit Carson Peak", "Sangre de Cristo Range", 600, 702.5, true, 14165],
                ["humboldt", "Humboldt Peak", "Sangre de Cristo Range", 612.5, 702.5, false, 14064],
                ["challenger", "Challenger Point", "Sangre de Cristo Range", 587.5, 702.5, true, 14081],
                ["crestone-peak", "Crestone Peak", "Sangre de Cristo Range", 600, 710, true, 14294],
                ["crestone-needle", "Crestone Needle", "Sangre de Cristo Range", 612.5, 715, true, 14197],
                ["ellingwood", "Ellingwood Point", "Sangre de Cristo Range", 620, 815, false, 14042],
                ["lindsey", "Mount Lindsey", "Sangre de Cristo Range", 640, 815, false, 14042],
                ["little-bear", "Little Bear Peak", "Sangre de Cristo Range", 648, 838, true, 14037],
                ["blanca", "Blanca Peak", "Sangre de Cristo Range", 632.5, 822.5, true, 14345],
                ["culebra", "Culebra Peak", "Sangre de Cristo Range", 690, 952.5, false, 14047],

                ["san-luis", "San Luis Peak", "San Juan Range", 307.5, 702.5, false, 14014],
                ["uncompahgre", "Uncompahgre Peak", "San Juan Range", 190, 680, false, 14309],
                ["wetterhorn", "Wetterhorn Peak", "San Juan Range", 177.5, 682.5, false, 14015],
                ["sneffels", "Mount Sneffels", "San Juan Range", 112.5, 697.5, false, 14150],
                ["redcloud", "Redcloud Peak", "San Juan Range", 197.5, 715, false, 14034],
                ["sunshine", "Sunshine Peak", "San Juan Range", 200, 722.5, false, 14001],
                ["handies", "Handies Peak", "San Juan Range", 180, 725, false, 14048],
                ["wilson-peak", "Wilson Peak", "San Juan Range", 72.5, 740, false, 14017],
                ["el-diente", "El Diente Peak", "San Juan Range", 62.5, 745, true, 14159],
                ["mount-wilson", "Mount Wilson", "San Juan Range", 75, 750, false, 14246],
                ["north-eolus", "North Eolus", "San Juan Range", 147.5, 805, false, 14039],
                ["sunlight", "Sunlight Peak", "San Juan Range", 160, 805, false, 14059],
                ["eolus", "Mount Eolus", "San Juan Range", 142.5, 812.5, false, 14083],
                ["windom", "Windom Peak", "San Juan Range", 162.5, 815, true, 14082],

                ["quandary", "Quandary Peak", "Tenmile-Mosquito Range", 487.5, 295, true, 14265],
                ["lincoln", "Mount Lincoln", "Tenmile-Mosquito Range", 495, 307.5, false, 14286],
                ["cameron", "Mount Cameron", "Tenmile-Mosquito Range", 486, 310, false, 14238],
                ["democrat", "Mount Democrat", "Tenmile-Mosquito Range", 477.5, 312.5, false, 14148],
                ["bross", "Mount Bross", "Tenmile-Mosquito Range", 490, 320, false, 14172],
                ["sherman", "Mount Sherman", "Tenmile-Mosquito Range", 473.5, 342.5, false, 14036]
            ];

            async function loadStaticRecords() {
                // Historical/curated records, self-hosted alongside this page.
                try {
                    var res = await fetch("records.json", { cache: "no-store" });
                    if (res && res.ok) {
                        var json = await res.json();
                        if (Array.isArray(json) && json.length) return json;
                    }
                } catch (e) {
                    /* fall through to seed */
                }

                // Baked-in seed, used only if records.json is also unavailable (e.g.
                // this file opened directly, offline, from disk).
                return RECORDS_SEED;
            }

            function findPeak(mountainName) {
                for (var i = 0; i < PEAKS.length; i++) {
                    if (PEAKS[i][1] === mountainName) return PEAKS[i];
                }
                return null;
            }

            // Pulls user-submitted incidents that a reviewer has approved in Supabase.
            // Only columns needed for display are requested -- nothing about who
            // submitted it, or its review history, is fetched here. This runs with
            // the public anon key, so it only ever sees what the "Anyone can view
            // approved incidents" policy allows: rows where status = 'approved'.
            async function loadLiveRecords(startingId) {
                if (typeof supabase === "undefined") return [];
                try {
                    var client = supabase.createClient(SUPABASE_URL, SUPABASE_ANON_KEY);
                    var result = await client
                        .from("incidents")
                        .select(
                            "mountain,year,month,day,cause,gender,age,climber_name,incident_details"
                        )
                        .eq("status", "approved");

                    if (result.error || !result.data) return [];

                    return result.data.map(function (row, i) {
                        var peak = findPeak(row.mountain);
                        return {
                            id: startingId + i,
                            mountain: row.mountain,
                            range: peak ? peak[2] : "",
                            x: peak ? peak[3] : 0,
                            y: peak ? peak[4] : 0,
                            year: row.year != null ? String(row.year) : "",
                            month: row.month ? MONTH_NAMES[row.month - 1] : null,
                            day: row.day || null,
                            cause: row.cause,
                            gender: row.gender,
                            age: row.age,
                            climberName: row.climber_name,
                            incidentDetails: row.incident_details
                        };
                    });
                } catch (e) {
                    // Network hiccup, Supabase unreachable, etc. -- the page still works
                    // with just the static/historical records.
                    return [];
                }
            }

            async function loadRecords() {
                var staticRecords = await loadStaticRecords();
                var maxId = staticRecords.reduce(function (m, r) {
                    var n = +r.id;
                    return isNaN(n) ? m : Math.max(m, n);
                }, 0);
                var liveRecords = await loadLiveRecords(maxId + 1);
                return staticRecords.concat(liveRecords);
            }

            var RECORDS = await loadRecords();

            // "No gender recorded" is a first-class Unknown bucket, not a
            // separate deliberate "Other" category (nothing ever used one) --
            // normalize null/blank here so it shows up consistently in the
            // Sex chart, the click-to-filter state, and the table, instead
            // of silently disappearing from the chart while still leaving a
            // blank dash in the table.
            RECORDS.forEach(function (r) {
                if (!r.gender) r.gender = "U";
            });

            var RANGE_CENTROIDS = {
                "Elk Range": [298, 390],
                "Sawatch Range": [434, 430],
                "Front Range": [600, 240],
                "Sangre de Cristo Range": [622, 771],
                "San Juan Range": [156, 743],
                "Tenmile-Mosquito Range": [485, 315]
            };

            var CAUSE_ORDER = [
                "Fall",
                "Falling rock/ice",
                "Avalanche",
                "Cardiac event",
                "Lightning",
                "Weather exposure",
                "Accident, other",
                "Intentional",
                "Unclear"
            ];
            var RANGE_ORDER = [
                "Elk Range",
                "Sangre de Cristo Range",
                "Front Range",
                "Sawatch Range",
                "San Juan Range",
                "Tenmile-Mosquito Range"
            ];
            // Maps each range to one of the 6 --range-* swatches, for the
            // small colored icon next to each mountain in the peak list.
            var RANGE_COLOR = {
                "Elk Range": "orange",
                "Sangre de Cristo Range": "blue",
                "Front Range": "red",
                "Sawatch Range": "green",
                "San Juan Range": "yellow",
                "Tenmile-Mosquito Range": "purple"
            };
            var AGE_ORDER = ["<20", "20-29", "30-39", "40-49", "50-59", "60+"];
            var GENDER_ORDER = ["M", "F", "U"];
            var GENDER_LABEL = { M: "Male", F: "Female", U: "Unknown" };
            var MONTH_NUM = {
                January: "01",
                February: "02",
                March: "03",
                April: "04",
                May: "05",
                June: "06",
                July: "07",
                August: "08",
                September: "09",
                October: "10",
                November: "11",
                December: "12"
            };

            // Built from whatever years are actually present -- entries need not be
            // contiguous or confined to any one window.
            var YEAR_ORDER = Array.from(
                new Set(
                    RECORDS.map(function (r) {
                        return r.year;
                    })
                )
            ).sort(function (a, b) {
                return +a - +b;
            });

            // Which peaks actually have a recorded incident is now driven by RECORDS
            // itself (static history + anything approved in Supabase) rather than the
            // static "hasDeaths" flag on PEAKS -- otherwise a newly-approved incident
            // on a previously death-free peak would keep showing up as "no recorded
            // fatalities" on the map.
            var recordMountains = {};
            RECORDS.forEach(function (r) {
                recordMountains[r.mountain] = true;
            });
            var deathPeaks = PEAKS.filter(function (p) {
                return !!recordMountains[p[1]];
            });
            var maxCount = 0;
            var peakCounts = {};
            deathPeaks.forEach(function (p) {
                var c = RECORDS.filter(function (r) {
                    return r.mountain === p[1];
                }).length;
                peakCounts[p[1]] = c;
                if (c > maxCount) maxCount = c;
            });

            function radiusFor(count) {
                return 9 + 30 * Math.sqrt(count / maxCount);
            }
            function opacityFor(count) {
                return 0.28 + 0.5 * Math.sqrt(count / maxCount);
            }

            function escapeHtml(s) {
                return String(s)
                    .replace(/&/g, "&amp;")
                    .replace(/</g, "&lt;")
                    .replace(/>/g, "&gt;");
            }

            function formatDate(r) {
                if (r.year && r.month && r.day) {
                    var mm = MONTH_NUM[r.month] || "";
                    var dd = ("0" + r.day).slice(-2);
                    if (mm) return mm + "/" + dd + "/" + r.year;
                }
                return r.year || "—";
            }

            function formatIncident(text) {
                var blocks = String(text).split(/\n\s*\n/);
                var headline = blocks.shift();
                var html =
                    "<h3 class='story-headline'>" + escapeHtml(headline) + "</h3>";
                blocks.forEach(function (block) {
                    var lines = block.split("\n").filter(function (l) {
                        return l.trim().length;
                    });
                    var isList =
                        lines.length > 0 &&
                        lines.every(function (l) {
                            return /^\*\s+/.test(l.trim());
                        });
                    if (isList) {
                        html += "<ul class='story-list'>";
                        lines.forEach(function (l) {
                            var item = escapeHtml(l.trim().replace(/^\*\s+/, ""));
                            item = item.replace(
                                /^([^:]{1,60}):\s/,
                                "<strong>$1:</strong> "
                            );
                            html += "<li>" + item + "</li>";
                        });
                        html += "</ul>";
                    } else {
                        html += "<p>" + escapeHtml(block.trim()) + "</p>";
                    }
                });
                return html;
            }

            /* ============ MASTHEAD STATS (computed from whatever data loaded) ============ */
            (function updateStats() {
                document.getElementById("statEntries").textContent = RECORDS.length;

                var years = RECORDS.map(function (r) {
                    return +r.year;
                }).filter(function (y) {
                    return !isNaN(y);
                });
                var minY = Math.min.apply(null, years),
                    maxY = Math.max.apply(null, years);
                document.getElementById("statSpan").textContent =
                    minY === maxY ? String(minY) : minY + "–" + maxY;
                // Footer used to hardcode "2010–2017" -- drive it off the
                // same span the Span stat shows instead, so it can't drift
                // out of date as more years of records get added.
                document.getElementById("footerSpan").textContent =
                    minY === maxY ? String(minY) : minY + "–" + maxY;
                // Length of the covered period itself (inclusive of both end
                // years), not how many of those years actually have a
                // recorded death -- e.g. 1884-2026 is a 143-year span even
                // though only some of those years have entries.
                var spanYears = maxY - minY + 1;
                document.getElementById("statSpanSub").textContent =
                    spanYears +
                    " recorded year" +
                    (spanYears === 1 ? "" : "s");

                var top = [],
                    best = 0;
                Object.keys(peakCounts).forEach(function (m) {
                    if (peakCounts[m] > best) {
                        best = peakCounts[m];
                        top = [m];
                    } else if (peakCounts[m] === best) {
                        top.push(m);
                    }
                });
                var shortNames = top.map(function (m) {
                    return m.replace(/ (Peak|Mountain|Point)$/, "");
                });
                document.getElementById("statDeadliest").textContent =
                    shortNames.join(" · ");
                document.getElementById("statDeadliestSub").textContent =
                    best +
                    " death" +
                    (best === 1 ? "" : "s") +
                    (top.length > 1 ? " apiece" : "");
            })();

            /* ============ STATE ============ */
            var filter = null; // {dim:'mountain'|'cause'|'range'|'age'|'gender'|'year', value:string}
            var sortKey = "date";
            var sortDir = 1;

            function matches(r) {
                if (!filter) return true;
                return r[filter.dim] === filter.value;
            }

            function setFilter(dim, value) {
                if (filter && filter.dim === dim && filter.value === value)
                    filter = null;
                else filter = { dim: dim, value: value };
                renderAll();
            }
            function clearFilter() {
                filter = null;
                renderAll();
            }

            /* ============ MAP ============ */
            var svg = document.getElementById("map");
            (function buildMap() {
                var ns = "http://www.w3.org/2000/svg";
                function el(tag, attrs) {
                    var e = document.createElementNS(ns, tag);
                    for (var k in attrs) e.setAttribute(k, attrs[k]);
                    return e;
                }

                var bg = el("rect", {
                    x: 0,
                    y: 0,
                    width: 786,
                    height: 1000,
                    fill: "none"
                });
                svg.appendChild(bg);

                // Range labels -- colored to match each range's icon in the
                // peak list instead of the old decorative contour rings,
                // which are redundant now that range is color-coded.
                Object.keys(RANGE_CENTROIDS).forEach(function (name) {
                    var c = RANGE_CENTROIDS[name];
                    var label = el("text", {
                        class: "range-label",
                        "data-range": RANGE_COLOR[name] || "orange",
                        x: c[0],
                        y: c[1] - 70,
                        "text-anchor": "middle"
                    });
                    label.textContent = name;
                    svg.appendChild(label);
                });

                var capText = "COLORADO \u00b7 FOURTEENERS";
                if (YEAR_ORDER.length) {
                    capText +=
                        " \u00b7 " +
                        (YEAR_ORDER[0] === YEAR_ORDER[YEAR_ORDER.length - 1]
                            ? YEAR_ORDER[0]
                            : YEAR_ORDER[0] + "\u2013" + YEAR_ORDER[YEAR_ORDER.length - 1]);
                }
                var cap = el("text", { class: "map-caption", x: 14, y: 988 });
                cap.textContent = capText;
                svg.appendChild(cap);

                // heat circles (rendered before markers so markers sit on top)
                var heatLayer = el("g", { id: "heatLayer" });
                svg.appendChild(heatLayer);
                deathPeaks.forEach(function (p) {
                    var count = peakCounts[p[1]];
                    heatLayer.appendChild(
                        el("circle", {
                            class: "heat-circle",
                            cx: p[3],
                            cy: p[4],
                            r: radiusFor(count),
                            opacity: opacityFor(count),
                            "data-mountain": p[1]
                        })
                    );
                });

                // context (non-death) peak glyphs
                PEAKS.filter(function (p) {
                    return !recordMountains[p[1]];
                }).forEach(function (p) {
                    var g = triangle(p[3], p[4], 5, "peak-context");
                    g.setAttribute("data-mountain", p[1]);
                    g.setAttribute("data-range", RANGE_COLOR[p[2]] || "orange");
                    var t = el("title", {});
                    t.textContent = p[1] + " \u2014 no recorded fatalities on file";
                    g.appendChild(t);
                    svg.appendChild(g);
                });

                // death peak markers + hit targets
                var markerLayer = el("g", { id: "markerLayer" });
                svg.appendChild(markerLayer);
                deathPeaks.forEach(function (p) {
                    var count = peakCounts[p[1]];
                    var g = triangle(p[3], p[4], 6.5, "peak-death");
                    g.setAttribute("data-mountain", p[1]);
                    g.setAttribute("data-range", RANGE_COLOR[p[2]] || "orange");
                    markerLayer.appendChild(g);

                    var hit = el("circle", {
                        class: "peak-hit",
                        cx: p[3],
                        cy: p[4],
                        r: 16,
                        "data-mountain": p[1]
                    });
                    var t = el("title", {});
                    t.textContent =
                        p[1] +
                        " \u2014 " +
                        count +
                        " death" +
                        (count === 1 ? "" : "s") +
                        " (" +
                        p[2] +
                        ")";
                    hit.appendChild(t);
                    // Read-only: the map is a visual overview only, so this
                    // hit target keeps its hover tooltip but has no click
                    // handler. Use the peak list to filter by mountain.
                    markerLayer.appendChild(hit);
                });

                // Same isosceles-triangle proportions as the .peak-icon
                // glyph in the sidebar (apex centered above a base twice
                // its own half-height wide) so the map markers read as the
                // same icon, just at a different scale.
                function triangle(cx, cy, r, cls) {
                    var halfW = r * (7 / 6);
                    var pts = [
                        [cx, cy - r],
                        [cx + halfW, cy + r],
                        [cx - halfW, cy + r]
                    ]
                        .map(function (pt) {
                            return pt.join(",");
                        })
                        .join(" ");
                    return el("polygon", { points: pts, class: cls });
                }
            })();

            document
                .getElementById("heatToggle")
                .addEventListener("change", function (e) {
                    document.getElementById("heatLayer").style.display = e.target
                        .checked
                        ? ""
                        : "none";
                });

            /* ============ PEAK LIST (left sidebar / mobile dropdown) ============ */
            // The map is read-only, so this list is now the only way to
            // find a specific mountain: mousing over (or focusing) a row
            // highlights that mountain on the map -- the marker in
            // standard view, the heat circle in heat-map view, since
            // whichever one is hidden by the mode toggle stays hidden --
            // and choosing a row (click, Enter, or the mobile dropdown)
            // filters the incident log the same way clicking a map marker
            // used to.
            var peakSort = "alpha"; // 'alpha' | 'tall' | 'deadly' -- no reverse variants

            function highlightMountain(name) {
                document.querySelectorAll("[data-mountain]").forEach(function (node) {
                    node.classList.toggle(
                        "is-hover",
                        node.getAttribute("data-mountain") === name
                    );
                });
            }

            function clearMountainHighlight() {
                document.querySelectorAll(".is-hover").forEach(function (node) {
                    node.classList.remove("is-hover");
                });
            }

            function onPeakChoose(name) {
                if (!name) clearFilter();
                else setFilter("mountain", name);
            }

            function sortedPeakList() {
                var list = PEAKS.slice();
                if (peakSort === "tall") {
                    list.sort(function (a, b) {
                        return b[6] - a[6];
                    });
                } else if (peakSort === "deadly") {
                    list.sort(function (a, b) {
                        var da = peakCounts[a[1]] || 0,
                            db = peakCounts[b[1]] || 0;
                        if (db !== da) return db - da;
                        return a[1].localeCompare(b[1]);
                    });
                } else {
                    list.sort(function (a, b) {
                        return a[1].localeCompare(b[1]);
                    });
                }
                return list;
            }

            function peakIconSVG(colorKey) {
                return (
                    '<svg class="peak-icon" data-range="' +
                    colorKey +
                    '" viewBox="0 0 16 14" width="14" height="12" aria-hidden="true" focusable="false"><polygon points="8,1 15,13 1,13"></polygon></svg>'
                );
            }

            function peakRowHTML(p) {
                var colorKey = RANGE_COLOR[p[2]] || "orange";
                return (
                    '<div class="peak-item">' +
                    '<button type="button" class="peak-row" data-mountain="' +
                    escapeHtml(p[1]) +
                    '" aria-expanded="false">' +
                    peakIconSVG(colorKey) +
                    "<span class='peak-row-name'>" +
                    escapeHtml(p[1]) +
                    "</span>" +
                    "<span class='peak-row-elev'>" +
                    p[6].toLocaleString() +
                    "'</span>" +
                    "</button>" +
                    '<div class="peak-row-detail" data-mountain="' +
                    escapeHtml(p[1]) +
                    '" hidden></div>' +
                    "</div>"
                );
            }

            function renderPeakList() {
                var list = sortedPeakList();

                var box = document.getElementById("peakList");
                box.innerHTML = list.map(peakRowHTML).join("");
                box.querySelectorAll(".peak-row").forEach(function (row) {
                    var name = row.getAttribute("data-mountain");
                    row.addEventListener("mouseenter", function () {
                        highlightMountain(name);
                    });
                    row.addEventListener("mouseleave", clearMountainHighlight);
                    row.addEventListener("focus", function () {
                        highlightMountain(name);
                    });
                    row.addEventListener("blur", clearMountainHighlight);
                    row.addEventListener("click", function () {
                        onPeakChoose(name);
                    });
                });

                var select = document.getElementById("peakDropdown");
                select.innerHTML =
                    '<option value="">Browse 14ers…</option>' +
                    list
                        .map(function (p) {
                            return (
                                "<option value='" +
                                escapeHtml(p[1]) +
                                "'>" +
                                escapeHtml(p[1]) +
                                " — " +
                                p[6].toLocaleString() +
                                "'</option>"
                            );
                        })
                        .join("");

                syncActiveStates();
            }

            document.querySelectorAll(".peak-sort-btn").forEach(function (btn) {
                btn.addEventListener("click", function () {
                    if (btn.dataset.sort === peakSort) return;
                    peakSort = btn.dataset.sort;
                    document.querySelectorAll(".peak-sort-btn").forEach(function (b) {
                        b.classList.toggle("is-active", b === btn);
                    });
                    renderPeakList();
                });
            });

            document
                .getElementById("peakDropdown")
                .addEventListener("change", function (e) {
                    onPeakChoose(e.target.value);
                });

            renderPeakList();

            /* ============ PEAK LIST DETAIL (replaces the old Selection panel) ============ */
            // Builds the cause breakdown shown inline under a mountain's row
            // once it's the active filter -- same data the old Selection
            // panel showed, just rendered in place instead of off to the
            // side.
            function peakDetailHTML(name) {
                var rows = RECORDS.filter(function (r) {
                    return r.mountain === name;
                });
                var causeCounts = {};
                rows.forEach(function (r) {
                    causeCounts[r.cause] = (causeCounts[r.cause] || 0) + 1;
                });
                var html =
                    "<div class='peak-detail-summary'><b>" +
                    rows.length +
                    "</b> recorded death" +
                    (rows.length === 1 ? "" : "s") +
                    " on file</div>";
                html += "<div class='breakdown'>";
                Object.keys(causeCounts)
                    .sort(function (a, b) {
                        return causeCounts[b] - causeCounts[a];
                    })
                    .forEach(function (c) {
                        html +=
                            "<div class='breakdown-row'><span class='cause-tag' data-cause='" +
                            escapeHtml(c) +
                            "'>" +
                            escapeHtml(c) +
                            "</span><b>" +
                            causeCounts[c] +
                            "</b></div>";
                    });
                html += "</div>";
                return html;
            }

            /* ============ CHARTS ============ */
            function count(dim, value) {
                return RECORDS.filter(function (r) {
                    return r[dim] === value;
                }).length;
            }

            function buildBarChart(containerId, dim, order, labelFn) {
                var el = document.getElementById(containerId);
                el.innerHTML = "";
                var counts = order.map(function (v) {
                    return count(dim, v);
                });
                var max = Math.max.apply(null, counts);
                order.forEach(function (v, i) {
                    var c = counts[i];
                    var row = document.createElement("button");
                    row.className = "bar-row";
                    row.type = "button";
                    row.innerHTML =
                        "<span class='bar-label'>" +
                        (labelFn ? labelFn(v) : v) +
                        "</span>" +
                        "<span class='bar-track'><span class='bar-fill' style='width:" +
                        (max ? (c / max) * 100 : 0) +
                        "%'></span></span>" +
                        "<span class='bar-count'>" +
                        c +
                        "</span>";
                    row.addEventListener("click", function () {
                        setFilter(dim, v);
                    });
                    el.appendChild(row);
                });
            }

            function buildYearChart() {
                var el = document.getElementById("chartYear");
                el.innerHTML = "";
                // .year-chart (el) is just the horizontal scroller; the flex
                // row of columns -- and the baseline rule -- live on this
                // inner wrapper so they scroll together as one unit.
                var inner = document.createElement("div");
                inner.className = "year-chart-inner";
                var counts = YEAR_ORDER.map(function (y) {
                    return count("year", y);
                });
                var max = Math.max.apply(null, counts);
                YEAR_ORDER.forEach(function (y, i) {
                    var c = counts[i];
                    var col = document.createElement("div");
                    col.className = "year-col";
                    var h = max ? (c / max) * 100 : 0;
                    col.innerHTML =
                        "<span class='year-bar-value'>" +
                        c +
                        "</span>" +
                        "<span class='year-bar' style='height:" +
                        h +
                        "%'></span>" +
                        "<span class='year-label'>" +
                        y +
                        "</span>";
                    col.addEventListener("click", function () {
                        setFilter("year", y);
                    });
                    inner.appendChild(col);
                });
                el.appendChild(inner);
            }

            /* ============ TABLE ============ */
            var COLUMNS = [
                { key: "id", label: "#", cls: "num" },
                { key: "date", label: "Date", cls: "num" },
                { key: "climberName", label: "Climber" },
                { key: "mountain", label: "Mountain" },
                { key: "range", label: "Range" },
                { key: "cause", label: "Cause" },
                { key: "gender", label: "Sex" },
                { key: "age", label: "Age band" }
            ];

            function buildTableHead() {
                var head = document.getElementById("tableHead");
                head.innerHTML = "";
                COLUMNS.forEach(function (col) {
                    var th = document.createElement("th");
                    if (col.cls) th.className = col.cls;
                    var btn = document.createElement("button");
                    btn.innerHTML = col.label + " <span class='arrow'>\u25b2</span>";
                    btn.addEventListener("click", function () {
                        if (sortKey === col.key) sortDir *= -1;
                        else {
                            sortKey = col.key;
                            sortDir = 1;
                        }
                        renderTable();
                        updateSortIndicators();
                    });
                    th.appendChild(btn);
                    head.appendChild(th);
                });
                updateSortIndicators();
            }

            function updateSortIndicators() {
                var ths = document.querySelectorAll("#tableHead th");
                COLUMNS.forEach(function (col, i) {
                    var th = ths[i];
                    th.classList.toggle("sorted", col.key === sortKey);
                    var arrow = th.querySelector(".arrow");
                    arrow.textContent = sortDir === 1 ? "\u25b2" : "\u25bc";
                });
            }

            function sortValue(r, key) {
                if (key === "id") return +r.id;
                if (key === "date") return +r.year; // mm/dd are display-only, not sortable
                if (key === "climberName")
                    return (r.climberName || "\uffff").toLowerCase(); // blanks sort last
                return r[key];
            }

            function renderTable() {
                var rows = RECORDS.slice().sort(function (a, b) {
                    var av = sortValue(a, sortKey),
                        bv = sortValue(b, sortKey);
                    if (av < bv) return -1 * sortDir;
                    if (av > bv) return 1 * sortDir;
                    return 0;
                });

                var body = document.getElementById("tableBody");
                body.innerHTML = "";
                var shown = 0;
                rows.forEach(function (r) {
                    if (filter && !matches(r)) return;
                    shown++;

                    var hasStory = !!(
                        r.incidentDetails && String(r.incidentDetails).trim()
                    );
                    var tr = document.createElement("tr");
                    if (filter) tr.classList.add("is-match");
                    if (hasStory) tr.classList.add("has-story");
                    tr.innerHTML =
                        "<td class='id-cell'>" +
                        String(r.id).padStart(2, "0") +
                        "</td>" +
                        "<td class='num'>" +
                        formatDate(r) +
                        "</td>" +
                        "<td>" +
                        (r.climberName
                            ? escapeHtml(r.climberName)
                            : "<span class='muted-cell'>\u2014</span>") +
                        (hasStory ? " <span class='chevron'>\u25b8</span>" : "") +
                        "</td>" +
                        "<td>" +
                        r.mountain +
                        "</td>" +
                        "<td>" +
                        r.range +
                        "</td>" +
                        "<td><span class='cause-tag' data-cause='" +
                        escapeHtml(r.cause) +
                        "'>" +
                        escapeHtml(r.cause) +
                        "</span></td>" +
                        "<td>" +
                        (GENDER_LABEL[r.gender] || "<span class='muted-cell'>—</span>") +
                        "</td>" +
                        "<td>" +
                        (r.age || "<span class='muted-cell'>—</span>") +
                        "</td>";
                    body.appendChild(tr);

                    if (hasStory) {
                        var storyTr = document.createElement("tr");
                        storyTr.className = "story-row";
                        storyTr.hidden = true;
                        var td = document.createElement("td");
                        td.colSpan = COLUMNS.length;
                        td.innerHTML =
                            "<div class='story-body'>" +
                            formatIncident(r.incidentDetails) +
                            "</div>";
                        storyTr.appendChild(td);
                        body.appendChild(storyTr);

                        tr.addEventListener("click", function () {
                            var willOpen = storyTr.hidden;
                            storyTr.hidden = !willOpen;
                            tr.classList.toggle("expanded", willOpen);
                        });
                    }
                });

                document.getElementById("countReadout").textContent = filter
                    ? "Showing " + shown + " of " + RECORDS.length
                    : "Showing " + RECORDS.length + " of " + RECORDS.length;
                document.getElementById("clearBtn").disabled = !filter;
            }

            document
                .getElementById("clearBtn")
                .addEventListener("click", clearFilter);

            /* ============ ACTIVE-STATE SYNC ============ */
            function syncActiveStates() {
                // map markers
                document.querySelectorAll(".peak-death").forEach(function (m) {
                    var label = m.getAttribute("data-mountain");
                    m.classList.toggle("is-dim", !!filter && !mountainVisible(label));
                });

                // bar rows
                document.querySelectorAll(".bar-row").forEach(function (row) {
                    var owner = row
                        .closest(".chart-card")
                        .querySelector(".panel-title")
                        .textContent.trim();
                    var dim = {
                        Cause: "cause",
                        Range: "range",
                        "Age band": "age",
                        Sex: "gender"
                    }[owner];
                    var val = row.dataset.value;
                    row.classList.remove("is-active", "is-dim");
                    if (!filter) return;
                    if (filter.dim === dim && filter.value === val)
                        row.classList.add("is-active");
                    else if (filter.dim === dim) row.classList.add("is-dim");
                });

                // year columns
                document.querySelectorAll(".year-col").forEach(function (col) {
                    col.classList.remove("is-active", "is-dim");
                    if (!filter || filter.dim !== "year") return;
                    if (filter.value === col.dataset.value)
                        col.classList.add("is-active");
                    else col.classList.add("is-dim");
                });

                // peak list rows (sidebar) + mobile dropdown
                document.querySelectorAll(".peak-row").forEach(function (row) {
                    var label = row.getAttribute("data-mountain");
                    var isActive =
                        !!filter && filter.dim === "mountain" && filter.value === label;
                    row.classList.toggle("is-active", isActive);
                    row.setAttribute("aria-expanded", isActive ? "true" : "false");
                });
                var dropdown = document.getElementById("peakDropdown");
                if (dropdown) {
                    dropdown.value =
                        filter && filter.dim === "mountain" ? filter.value : "";
                }

                // inline detail -- expands under whichever row is the
                // active mountain filter, same data the old Selection
                // panel showed
                document.querySelectorAll(".peak-row-detail").forEach(function (box) {
                    var label = box.getAttribute("data-mountain");
                    var isActive =
                        !!filter && filter.dim === "mountain" && filter.value === label;
                    box.hidden = !isActive;
                    box.innerHTML = isActive ? peakDetailHTML(label) : "";
                });
            }

            function mountainVisible(label) {
                if (!filter) return true;
                if (filter.dim === "mountain") return filter.value === label;
                // dim by another dimension: visible if this mountain has >=1 matching record
                return RECORDS.some(function (r) {
                    return r.mountain === label && matches(r);
                });
            }

            /* ============ WIRE-UP (rebuild charts with data-value + labels) ============ */
            function buildBarChartsFinal() {
                buildBarChart("chartCause", "cause", CAUSE_ORDER);
                buildBarChart("chartRange", "range", RANGE_ORDER, function (v) {
                    return v.replace(" Range", "");
                });
                buildBarChart("chartAge", "age", AGE_ORDER);
                buildBarChart("chartGender", "gender", GENDER_ORDER, function (v) {
                    return GENDER_LABEL[v];
                });
                // attach dataset.value for state sync
                document
                    .querySelectorAll("#chartCause .bar-row")
                    .forEach(function (row, i) {
                        row.dataset.value = CAUSE_ORDER[i];
                    });
                document
                    .querySelectorAll("#chartRange .bar-row")
                    .forEach(function (row, i) {
                        row.dataset.value = RANGE_ORDER[i];
                    });
                document
                    .querySelectorAll("#chartAge .bar-row")
                    .forEach(function (row, i) {
                        row.dataset.value = AGE_ORDER[i];
                    });
                document
                    .querySelectorAll("#chartGender .bar-row")
                    .forEach(function (row, i) {
                        row.dataset.value = GENDER_ORDER[i];
                    });

                buildYearChart();
                document
                    .querySelectorAll("#chartYear .year-col")
                    .forEach(function (col, i) {
                        col.dataset.value = YEAR_ORDER[i];
                    });
            }

            function renderAll() {
                buildBarChartsFinal();
                renderTable();
                syncActiveStates();
            }

            buildTableHead();
            renderAll();
        })();