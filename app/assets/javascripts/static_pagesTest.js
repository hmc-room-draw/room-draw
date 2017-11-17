
// Class to create a popup effect, updated to only have
// one function for all of the popups, instead of 9
function popDorm(e, area) {
	var thing = document.getElementById(area.title.toLowerCase());
	thing.style.left = (e.clientX) + 'px';
	thing.style.top = e.clientY + 'px';
	$("#" + area.title.toLowerCase()).toggle();
	return true;

}