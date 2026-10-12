/* ============ SITE FOOTER ============
   Typed role line, fade-in columns, copy-email chip (with a small
   "Email copied" toast) and an optional back-to-top button. Every part
   checks that its element is on the page first, so the footer can be
   used on any page, with or without each piece. */
(function () {
  const reduce = window.matchMedia("(prefers-reduced-motion: reduce)").matches;

  /* Year (only if the page has a #year span) */
  const year = document.getElementById("year");
  if (year) year.textContent = new Date().getFullYear();

  /* Typed role line */
  const typed = document.getElementById("typed");
  if (typed) {
    const roles = [
		"❤️ Turtles",
		"❤️ User Experience (UX)",
		"❤️ dayta and datta",
		"I know HTML",
		"❤️ User Interface (UI)",
		"I'm the Best Skier on the mountain",
		"❤️ Animals",
		"I'm a Navy Veteran",
		"I almost won a Pac Man tournament",
		"Lancia Stratos is my dream car",
		"❤️ 95% of most statistics",
    ];
    if (reduce) {
      typed.textContent = roles[0];
    } else {
      let r = 0,
        i = 0,
        del = false;
      (function type() {
        const word = roles[r];
        typed.textContent = word.slice(0, i);
        if (!del && i < word.length) {
          i++;
          setTimeout(type, 70);
        } else if (!del) {
          del = true;
          setTimeout(type, 1800);
        } else if (i > 0) {
          i--;
          setTimeout(type, 35);
        } else {
          del = false;
          r = (r + 1) % roles.length;
          setTimeout(type, 300);
        }
      })();
    }
  }

  /* Reveal columns as they scroll into view */
  const cols = document.querySelectorAll(".site-footer .reveal");
  if ("IntersectionObserver" in window) {
    const io = new IntersectionObserver(
      (entries) => {
        entries.forEach((e) => {
          if (e.isIntersecting) {
            e.target.classList.add("in");
            io.unobserve(e.target);
          }
        });
      },
      { threshold: 0.15 }
    );
    cols.forEach((c) => io.observe(c));
  } else cols.forEach((c) => c.classList.add("in"));

  /* Copy email. The toast is created here if the page doesn't have one. */
  const chip = document.getElementById("emailChip");
  if (chip) {
    let toast = document.getElementById("toast");
    if (!toast) {
      toast = document.createElement("div");
      toast.id = "toast";
      toast.className = "toast";
      toast.setAttribute("role", "status");
      toast.innerHTML = "<span></span>";
      document.body.appendChild(toast);
    }
    let toastTimer;
    const showToast = (msg) => {
      toast.querySelector("span").textContent = msg;
      toast.classList.add("show");
      clearTimeout(toastTimer);
      toastTimer = setTimeout(() => toast.classList.remove("show"), 1800);
    };
    chip.addEventListener("click", async () => {
      const email = chip.dataset.email;
      try {
        await navigator.clipboard.writeText(email);
        showToast("Email copied");
      } catch (err) {
        window.location.href = "mailto:" + email;
      }
    });
  }

  /* Back-to-top with scroll progress ring (only if the page has #toTop) */
  const toTop = document.getElementById("toTop");
  const bar = toTop && toTop.querySelector(".bar");
  if (toTop && bar) {
    const C = 2 * Math.PI * 23;
    bar.style.strokeDasharray = C;
    const onScroll = () => {
      const max = document.documentElement.scrollHeight - innerHeight;
      const p = max > 0 ? scrollY / max : 0;
      bar.style.strokeDashoffset = C * (1 - p);
      toTop.classList.toggle("show", scrollY > 200);
    };
    addEventListener("scroll", onScroll, { passive: true });
    onScroll();
    toTop.addEventListener("click", () =>
      scrollTo({ top: 0, behavior: reduce ? "auto" : "smooth" })
    );
  }
})();
