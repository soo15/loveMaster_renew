// Toggle side menu 
var menuToggleButton = document.querySelector("button.toggle");
var menuTarget = document.querySelector(".side-menu");
var menuBlock = document.querySelector("menu");

function toggleMenuVisibility(){
	menuTarget.classList.toggle("side-menu--active");
	animateCSS(".menu", "fadeIn");
}

function animateCSS(element, animationName, callback) {
    var node = document.querySelector(element)
    node.classList.add('animated', animationName)

    function handleAnimationEnd() {
        node.classList.remove('animated', animationName)
        node.removeEventListener('animationend', handleAnimationEnd)

        if (typeof callback === 'function') callback()
    }

    node.addEventListener('animationend', handleAnimationEnd)
}

menuToggleButton.addEventListener('click', toggleMenuVisibility);




// Toggle dark/light mode 
var wrapper = document.querySelector("body");
var darkModeToggle = document.querySelector(".dark-mode-button");

function toggleSunMoon() {
	wrapper.classList.toggle("dark");
	if (darkModeToggle.name == "moon") {
		darkModeToggle.name = "sunny";
	} else {
		darkModeToggle.name = "moon";
	}
}

function toggleDarkMode() {
	toggleSunMoon();
}

darkModeToggle.addEventListener("click", toggleDarkMode);