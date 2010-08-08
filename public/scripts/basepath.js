$(document).ready(function() {
	/*$("#al_east").button();		
	$("#al_central").button();
	$("#al_west").button();
	$("#nl_east").button();
	$("#nl_central").button();
	$("#nl_west").button();
	
	$("#al_east").toggle(function() {showClass("al_east", $("#al_east"))}, 
						function() {hideClass("al_east", $("#al_east"))});
	$("#al_central").toggle(function() {showClass("al_central")}, 
						function() {hideClass("al_central")});
	$("#al_west").toggle(function() {showClass("al_west")}, 
						function() {hideClass("al_west")});
						
	$("#nl_east").toggle(function() {showClass("nl_east")}, 
						function() {hideClass("nl_east")});
	$("#nl_central").toggle(function() {showClass("nl_central")}, 
						function() {hideClass("nl_central")});
	$("#nl_west").toggle(function() {showClass("nl_west")}, 
						function() {hideClass("nl_west")});		
						*/
	$('.inlinesparkline').sparkline(null, 
									//{type: 'bar', barColor: 'green'});
									{type: 'tristate'});														
})

/*
function showClass(divClass, buttonSel)
{
	$("." + divClass).slideUp();
	buttonSel.toggleClass('ui-state-active');
	
}

function hideClass(divClass, buttonSel)
{
	$("." + divClass).slideDown();
	buttonSel.toggleClass('ui-state-active');
	
}
*/
