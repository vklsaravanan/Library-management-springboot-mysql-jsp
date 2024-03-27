/**
 * 
 */
$(document).ready(function() {
	domLastic.init({
		itemsClassnameToConnect: 'nav-item',
		itemsJointStrength: 10,
		animationSpeed: 500,
		animationIntensity: 0.6,
		animationDirection: 'vertical'

	});
	//if drag stopped...
	domLastic.animateItems();
});