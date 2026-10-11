(function () {
  const reduce = window.matchMedia('(prefers-reduced-motion: reduce)').matches;

  /* Year */
  document.getElementById('year').textContent = new Date().getFullYear();

  /* Mountain-time clock 
  const clockEl = document.querySelector('#clock b');
  const tick = () => {
    clockEl.textContent = new Date().toLocaleTimeString('en-US', {
      hour: 'numeric', minute: '2-digit', timeZone: 'America/Denver'
    });
  };
  tick(); setInterval(tick, 30000);
*/
  /* Typed role line */
  const roles = ['User Experience (UX)', 'User Interface (UI)', 'Ski Instructor', '❤️ Animals'];
  const typed = document.getElementById('typed');
  if (reduce) { typed.textContent = roles[0]; }
  else {
    let r = 0, i = 0, del = false;
    (function type() {
      const word = roles[r];
      typed.textContent = word.slice(0, i);
      if (!del && i < word.length) { i++; setTimeout(type, 70); }
      else if (!del) { del = true; setTimeout(type, 1800); }
      else if (i > 0) { i--; setTimeout(type, 35); }
      else { del = false; r = (r + 1) % roles.length; setTimeout(type, 300); }
    })();
  }

  /* Reveal columns */
  const cols = document.querySelectorAll('.reveal');
  if ('IntersectionObserver' in window) {
    const io = new IntersectionObserver((entries) => {
      entries.forEach(e => { if (e.isIntersecting) { e.target.classList.add('in'); io.unobserve(e.target); } });
    }, { threshold: 0.15 });
    cols.forEach(c => io.observe(c));
  } else cols.forEach(c => c.classList.add('in'));

  /* Copy email */
  const chip = document.getElementById('emailChip');
  const toast = document.getElementById('toast');
  let toastTimer;
  const showToast = (msg) => {
    toast.querySelector('span').textContent = msg;
    toast.classList.add('show');
    clearTimeout(toastTimer);
    toastTimer = setTimeout(() => toast.classList.remove('show'), 1800);
  };
  chip.addEventListener('click', async () => {
    const email = chip.dataset.email;
    try {
      await navigator.clipboard.writeText(email);
      showToast('Email copied');
    } catch (err) {
      window.location.href = 'mailto:' + email;
    }
  });

  /* Magnetic social buttons */
  if (!reduce) {
    document.querySelectorAll('.social-links a').forEach(btn => {
      btn.addEventListener('pointermove', (e) => {
        const b = btn.getBoundingClientRect();
        const x = (e.clientX - b.left - b.width / 2) * 0.35;
        const y = (e.clientY - b.top - b.height / 2) * 0.35;
        btn.style.transform = `translate(${x}px, ${y}px)`;
      });
      btn.addEventListener('pointerleave', () => { btn.style.transform = ''; });
    });
  }

  /* Back-to-top with scroll progress ring */
  const toTop = document.getElementById('toTop');
  const bar = toTop.querySelector('.bar');
  const C = 2 * Math.PI * 23;
  bar.style.strokeDasharray = C;
  const onScroll = () => {
    const max = document.documentElement.scrollHeight - innerHeight;
    const p = max > 0 ? scrollY / max : 0;
    bar.style.strokeDashoffset = C * (1 - p);
    toTop.classList.toggle('show', scrollY > 200);
  };
  addEventListener('scroll', onScroll, { passive: true });
  onScroll();
  toTop.addEventListener('click', () => scrollTo({ top: 0, behavior: reduce ? 'auto' : 'smooth' }));

})();