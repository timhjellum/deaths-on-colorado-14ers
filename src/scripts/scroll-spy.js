/* ============ SCROLL SPY (About page contents rail) ============
   Adapted from the "CSS Scroll-Spy Timeline Navigation" CodePen. The pen
   drives everything with CSS scroll timelines, which only some browsers
   support yet, so the same look is driven from scroll position here:

   - the rail fills as the page scrolls, with a dot riding its tip
   - the percentage read counts up beside "Contents"
   - the section you're reading turns bold, and a rule under it fills
     as you move through that section
   - sections already reached keep a filled marker

   Does nothing on pages without a .toc-container. */
(function () {
  var toc = document.querySelector(".toc-container");
  if (!toc) return;

  var links = Array.prototype.slice.call(toc.querySelectorAll("a[href^='#']"));
  var items = links
    .map(function (a) {
      var section = document.getElementById(a.getAttribute("href").slice(1));
      return section ? { link: a, li: a.closest("li"), section: section } : null;
    })
    .filter(Boolean);
  if (!items.length) return;

  var path = toc.querySelector(".toc-path");
  var pct = toc.querySelector(".toc-pct");
  var ticking = false;

  function update() {
    ticking = false;
    var doc = document.documentElement;
    var max = Math.max(1, doc.scrollHeight - window.innerHeight);
    var progress = Math.min(1, Math.max(0, window.scrollY / max));

    if (path) path.style.setProperty("--toc-progress", progress);
    if (pct) pct.textContent = Math.round(progress * 100) + "%";

    // The active section is the last one whose top has passed the
    // reading line (a third of the way down the window). At the very
    // bottom of the page the last section wins, even if it's short.
    var line = window.innerHeight / 3;
    var active = 0;
    items.forEach(function (it, i) {
      if (it.section.getBoundingClientRect().top <= line) active = i;
    });
    if (progress >= 0.999) active = items.length - 1;

    items.forEach(function (it, i) {
      var r = it.section.getBoundingClientRect();
      // how far the reading line has travelled through this section
      var through = Math.min(1, Math.max(0, (line - r.top) / Math.max(1, r.height)));
      if (i === items.length - 1 && progress >= 0.999) through = 1;
      it.li.classList.toggle("is-active", i === active);
      it.li.classList.toggle("is-passed", i < active);
      it.li.style.setProperty("--toc-section", i === active ? through : i < active ? 1 : 0);
      if (i === active) it.link.setAttribute("aria-current", "true");
      else it.link.removeAttribute("aria-current");
    });
  }

  function onScroll() {
    if (!ticking) {
      ticking = true;
      window.requestAnimationFrame(update);
    }
  }

  window.addEventListener("scroll", onScroll, { passive: true });
  window.addEventListener("resize", onScroll);
  window.addEventListener("load", update);
  update();
})();
