// Entry for the About and Contact pages: site styles, page styles, day/night toggle.
import './src/style.css';
import './src/styles/pages.less';
import './src/scripts/day-night.js';

// Contact form: Netlify redirects back with ?sent=1 after a successful submit.
const doc = document.getElementById('doc');
if (doc && new URLSearchParams(location.search).has('sent')) {
  doc.classList.add('is-sent');
}
