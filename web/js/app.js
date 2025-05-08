// ScrollReveal animations
ScrollReveal().reveal('.about-text', {
    origin: 'left',
    distance: '50px',
    duration: 1000,
    easing: 'ease-in-out',
});

ScrollReveal().reveal('.about-image', {
    origin: 'right',
    distance: '50px',
    duration: 1000,
    delay: 200,
    easing: 'ease-in-out',
});

ScrollReveal().reveal('.reservation', {
    origin: 'bottom',
    distance: '40px',
    duration: 1000,
    delay: 300,
    easing: 'ease-in-out',
});

// Smooth scroll for internal navigation links
document.querySelectorAll('.nav-link').forEach(link => {
    link.addEventListener('click', function (e) {
        const href = this.getAttribute('href');
        if (href && href.startsWith("#")) {
            const target = document.querySelector(href);
            if (target) {
                e.preventDefault();
                target.scrollIntoView({ behavior: 'smooth' });
            }
        }
    });
});

// Reservation form submission confirmation
const reservationForm = document.querySelector('.reservation-form');
if (reservationForm) {
    reservationForm.addEventListener('submit', function (e) {
        e.preventDefault();
        alert('🎉 Thank you! Your reservation has been submitted.');
        this.reset();
    });
}
