// =======================
// MENU TOGGLE
// =======================
const selectElement = function (element) {
  return document.querySelector(element);
};

let menuToggler = selectElement('.menu-toggle');
let body = selectElement('body');

if (menuToggler) {
  menuToggler.addEventListener('click', function () {
    body.classList.toggle('show');
  });
}

// =======================
// CLOSE NAV ON LINK CLICK
// =======================
let navLinks = document.querySelectorAll('.nav-link');

navLinks.forEach(function (navLink) {
  navLink.addEventListener('click', function () {
    body.classList.remove('show');
  });
});

// =======================
// SCROLL REVEAL ANIMATIONS
// =======================
if (typeof ScrollReveal !== 'undefined') {
  const sr = ScrollReveal();

  sr.reveal('.animate-top', {
    origin: 'top',
    distance: '50px',
    duration: 1000,
    delay: 200,
    easing: 'ease-in-out'
  });

  sr.reveal('.animate-bottom', {
    origin: 'bottom',
    distance: '50px',
    duration: 1000,
    delay: 300,
    easing: 'ease-in-out'
  });

  sr.reveal('.animate-left', {
    origin: 'left',
    distance: '50px',
    duration: 1000,
    delay: 400,
    easing: 'ease-in-out'
  });

  sr.reveal('.animate-right', {
    origin: 'right',
    distance: '50px',
    duration: 1000,
    delay: 400,
    easing: 'ease-in-out'
  });
}
ScrollReveal().reveal('.animate-bottom', {
  origin: 'bottom',
  distance: '50px',
  duration: 1000,
  delay: 200,
  easing: 'ease-in-out',
  interval: 200 // for grid animation stagger
});

