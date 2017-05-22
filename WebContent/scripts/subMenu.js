
var actSubMenuVisible = "";
var timeSubMenu = null;

function afficheSubMenu(elBase, elSubMenu){
	
	masqueActeSubMenu();
	
	document.getElementById(elSubMenu).style.left = elBase.offsetLeft + "px";
	var y = elBase.offsetTop + elBase.offsetHeight + 5;
	document.getElementById(elSubMenu).style.top = y + "px";
	
	document.getElementById(elSubMenu).style.display = "block";
	actSubMenuVisible = elSubMenu;
}

function masqueActeSubMenu(){
	if (actSubMenuVisible != ""){
		stopTimeMasqueSM();
		masqueSubMenu(actSubMenuVisible);
	}
}

function masqueSubMenu(elSubMenu){
	document.getElementById(elSubMenu).style.display = "none";
	actSubMenuVisible = "";
}

function startTimeMasqueSM(elSubMenu){
	stopTimeMasqueSM();
	timeSubMenu = setTimeout("masqueSubMenu('" + elSubMenu + "')", 1500);
}

function stopTimeMasqueSM(){
	clearTimeout(timeSubMenu);
}



