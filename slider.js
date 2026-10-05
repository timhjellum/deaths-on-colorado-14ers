(function () {
    var ITEM_H = 100;
    var AUTO_MS = 4500;
    var track = document.querySelector(".vslider__track");
    if (!track) return;
    var slider = document.querySelector(".vslider");
    var dotsEl = document.querySelector(".vslider__dots");
    var originals = Array.prototype.slice.call(track.children);
    var N = originals.length;

    function stripIds(node) {
        if (node.removeAttribute) node.removeAttribute("id");
        node.querySelectorAll("[id]").forEach(function (n) { n.removeAttribute("id"); });
        return node;
    }

    var before = document.createDocumentFragment();
    var after = document.createDocumentFragment();
    originals.forEach(function (el) {
        var a = stripIds(el.cloneNode(true)); a.setAttribute("aria-hidden", "true");
        var b = stripIds(el.cloneNode(true)); b.setAttribute("aria-hidden", "true");
        before.appendChild(a);
        after.appendChild(b);
    });
    track.insertBefore(before, track.firstChild);
    track.appendChild(after);

    // One dot per real slide.
    var dots = [];
    if (dotsEl) {
        for (var i = 0; i < N; i++) {
            var dot = document.createElement("button");
            dot.type = "button";
            dot.className = "vslider__dot";
            dot.setAttribute("aria-label", "Go to slide " + (i + 1) + " of " + N);
            (function (slideIndex) {
                dot.addEventListener("click", function () { goTo(slideIndex); });
            })(i);
            dotsEl.appendChild(dot);
            dots.push(dot);
        }
    }

    var index = N;
    var busy = false;
    var timer = null;
    var reducedMotion = window.matchMedia && window.matchMedia("(prefers-reduced-motion: reduce)").matches;

    function currentSlide() {
        return ((index - N) % N + N) % N;
    }

    function updateDots() {
        if (!dots.length) return;
        var active = currentSlide();
        dots.forEach(function (d, i) {
            d.classList.toggle("is-active", i === active);
            d.setAttribute("aria-current", i === active ? "true" : "false");
        });
    }

    function setPos(animate) {
        track.classList.toggle("is-animating", animate && !reducedMotion);
        track.style.transform = "translateY(" + (-index * ITEM_H) + "px)";
    }

    function go(dir) {
        if (busy) return;
        busy = true;
        index += dir;
        setPos(true);
        updateDots();
        if (reducedMotion) { track.dispatchEvent(new Event("transitionend")); }
    }

    function goTo(slideIndex) {
        if (busy || slideIndex === currentSlide()) return;
        busy = true;
        index = N + slideIndex;
        setPos(true);
        updateDots();
        stop();
        start();
        if (reducedMotion) { track.dispatchEvent(new Event("transitionend")); }
    }

    track.addEventListener("transitionend", function (e) {
        if (e.target !== track && e.type === "transitionend") return;
        if (index < N) index += N;
        else if (index >= N * 2) index -= N;
        setPos(false);
        void track.offsetHeight;
        busy = false;
    });

    function start() {
        if (reducedMotion) return;
        stop();
        timer = setInterval(function () { go(1); }, AUTO_MS);
    }
    function stop() {
        if (timer) clearInterval(timer);
        timer = null;
    }

    slider.addEventListener("mouseenter", stop);
    slider.addEventListener("mouseleave", start);
    slider.addEventListener("focusin", stop);
    slider.addEventListener("focusout", start);

    slider.addEventListener("keydown", function (e) {
        if (e.key === "ArrowUp") { e.preventDefault(); go(-1); }
        if (e.key === "ArrowDown") { e.preventDefault(); go(1); }
    });
    slider.tabIndex = 0;

    setPos(false);
    updateDots();
    start();
})();
