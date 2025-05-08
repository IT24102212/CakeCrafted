// MENU TOGGLE
const selectElement = (element) => document.querySelector(element);

let menuToggler = selectElement('.menu-toggle');
let body = selectElement('body');

menuToggler?.addEventListener('click', () => {
  body.classList.toggle('show');
});

// CLOSE NAV ON LINK CLICK
document.querySelectorAll('.nav-link').forEach((link) => {
  link.addEventListener('click', () => {
    body.classList.remove('show');
  });
});

// SCROLL REVEAL
window.sr = ScrollReveal();

sr.reveal('.animate-left', { origin: 'left', duration: 1000, distance: '25rem', delay: 300 });
sr.reveal('.animate-right', { origin: 'right', duration: 1000, distance: '25rem', delay: 600 });
sr.reveal('.animate-top', { origin: 'top', duration: 1000, distance: '25rem', delay: 600 });
sr.reveal('.animate-bottom', { origin: 'bottom', duration: 1000, distance: '25rem', delay: 600 });
