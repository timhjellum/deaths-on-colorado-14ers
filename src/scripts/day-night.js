// Dark & Light toggle (shared by the register, About and Contact pages)
const toggle = document.querySelector(".day-night input");
if (toggle) {
  toggle.addEventListener("change", () => {
    document.body.classList.add("toggle");
    setTimeout(() => {
      document.body.classList.toggle("light");
      setTimeout(() => document.body.classList.remove("toggle"), 10);
    }, 5);
  });
}
