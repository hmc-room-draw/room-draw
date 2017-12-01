
// Class to create a popup effect, updated to only have
// one function for all of the popups, instead of 9
function popDorm(e, area) {
	var thing = document.getElementById(area.id.toLowerCase());

	thing.style.left = (e.clientX + 5) + 'px';
	thing.style.top = (e.clientY + 5) + 'px';
	$("#" + area.id.toLowerCase()).toggle();
	return true;

}
function popTable(e) {
	$("#dormTable").toggle()
}