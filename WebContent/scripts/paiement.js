

function detailPaie(id){
	
		if(document.getElementById('paie' + id).className == "pay_mask"){
			document.getElementById('paie' + id).className = "pay_vis";
			document.getElementById('image' + id).src = path + "/images/Darrow.gif";
		}else{
			if(document.getElementById('paie' + id).className == "pay_vis"){
				document.getElementById('paie' + id).className = "pay_mask";
				document.getElementById('image' + id).src = path + "/images/Rarrow.gif";
			}
		}
		if(document.getElementById('paie' + id).className == "pay_mask_imp"){
			document.getElementById('paie' + id).className = "pay_vis_imp";
			document.getElementById('image' + id).src = path + "/images/Darrow.gif";
		}else{	
			if(document.getElementById('paie' + id).className == "pay_vis_imp"){
				document.getElementById('paie' + id).className = "pay_mask_imp";
				document.getElementById('image' + id).src = path + "/images/Rarrow.gif";
			}
		}
		
		document.getElementById('paieFull' + id).className = document.getElementById('paieFull' + id).className;
		
}

function chkImpr(id, evt){
		
	if(document.getElementById('entete_paie' + id).className == "pay_vis"){
		document.getElementById('entete_paie' + id).className = "pay_vis_imp";
		document.getElementById('paieFull' + id).className = "pay_vis_imp";
		if(document.getElementById('paie' + id).className == "pay_mask"){
			document.getElementById('paie' + id).className = "pay_mask_imp";
		}else{
			document.getElementById('paie' + id).className = "pay_vis_imp";
		}
	} else {
		document.getElementById('entete_paie' + id).className = "pay_vis";
		document.getElementById('paieFull' + id).className = "pay_vis";
		if(document.getElementById('paie' + id).className == "pay_mask_imp"){
			document.getElementById('paie' + id).className = "pay_mask";
		}else{
			document.getElementById('paie' + id).className = "pay_vis";
		}
	}
	
	/*
	if(document.getElementById('sep_' + id).className == "pay_mask"){
		document.getElementById('sep_' + id).className = "pay_mask_imp";		
	} else {
		document.getElementById('sep_' + id).className = "pay_mask";	
	}
	*/
	
	evt.cancelBubble = true;	
}

