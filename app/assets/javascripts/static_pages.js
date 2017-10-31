
// Class to create a popup effect
function pop(e) {

	var thing = document.getElementById("popup");

	thing.style.left = e.clientX + 'px';
	thing.style.top = e.clientY + 'px';
	$("#popup").toggle();

	return true;

}
