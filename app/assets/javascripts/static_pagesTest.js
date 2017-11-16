
// Class to create a popup effect, updated to only have
// one function for all of the popups, instead of 9
function popDorm(e) {
	e.style.left = (e.clientX) + 'px';
	e.style.top = e.clientY + 'px';
	$("#" + e.title.toLowerCase()).toggle();
	return true;

}