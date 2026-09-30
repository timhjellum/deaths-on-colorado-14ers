
(function () {
    var ITEM_H = 100;
    var AUTO_MS = 4500;
    var track = document.querySelector(".vslider__track");
    if (!track) return;
    var slider = document.querySelector(".vslider");
    var originals = Array.prototype.slice.call(track.children);
    var N = originals.length;

    var before = document.createDocumentFragment();
    var after = document.createDocumentFragment();
    originals.forEach(function (el) {
        var a = el.cloneNode(true); a.setAttribute("aria-hidden", "true");
        var b = el.cloneNode(true); b.setAttribute("aria-hidden", "true");
        before.appendChild(a);
        after.appendChild(b);
    });
    track.insertBefore(before, track.firstChild);
    track.appendChild(after);

    var index = N;
    var busy = false;
    var timer = null;
    var reducedMotion = window.matchMedia && window.matchMedia("(prefers-reduced-motion: reduce)").matches;

    function setPos(animate) {
        track.classList.toggle("is-animating", animate && !reducedMotion);
        track.style.transform = "translateY(" + (-index * ITEM_H) + "px)";
    }

    function go(dir) {
        if (busy) return;
        busy = true;
        index += dir;
        setPos(true);
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
    start();
})();
