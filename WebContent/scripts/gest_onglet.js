
/*
*	Gestion des onglets
*
*/

var a_num = 1;
var ongl_bg_col_unsel = '#DFF5FF';
var ongl_bg_col_sel = '#A54A00';
var ongl_txt_col_unsel = '#000000';
var ongl_txt_col_sel = '#FFFFFF';

function view_tab(t_num){
	
	document.getElementById("ongl_" + a_num).style.display = "none";
	document.getElementById("ongl_" + t_num).style.display = "block";
	
	document.getElementById("tete_ongl_" + a_num).style.backgroundColor = ongl_bg_col_unsel;
	document.getElementById("tete_ongl_" + t_num).style.backgroundColor = ongl_bg_col_sel;
	
	document.getElementById("tete_ongl_" + a_num).style.color = ongl_txt_col_unsel;
	document.getElementById("tete_ongl_" + t_num).style.color = ongl_txt_col_sel;

	
	a_num = t_num;
	return false;
}



var a_sub_num = 1;
var ongl_sub_bg_col_unsel = '#DFF5FF';
var ongl_sub_bg_col_sel = '#A54A00';
var ongl_sub_txt_col_unsel = '#000000';
var ongl_sub_txt_col_sel = '#FFFFFF';

function view_tab_sub(t_num, t_sub_num){
	
	document.getElementById("ongl_" + a_num).style.display = "none";
	document.getElementById("ongl_" + a_num + "_sub_" + a_sub_num).style.display = "none";
	document.getElementById("ongl_" + t_num + "_sub_" + t_sub_num).style.display = "block";
	document.getElementById("ongl_" + t_num).style.display = "block";
	
	
	document.getElementById("tete_ongl_" + a_num).style.backgroundColor = ongl_bg_col_unsel;
	document.getElementById("tete_ongl_" + t_num).style.backgroundColor = ongl_bg_col_sel;
	
	document.getElementById("tete_ongl_" + a_num).style.color = ongl_txt_col_unsel;
	document.getElementById("tete_ongl_" + t_num).style.color = ongl_txt_col_sel;

	
	document.getElementById("tete_ongl_" + a_num + "_sub_" + a_sub_num).style.backgroundColor = ongl_sub_bg_col_unsel;
	document.getElementById("tete_ongl_" + t_num + "_sub_" + t_sub_num).style.backgroundColor = ongl_sub_bg_col_sel;
	
	document.getElementById("tete_ongl_" + a_num + "_sub_" + a_sub_num).style.color = ongl_sub_txt_col_unsel;
	document.getElementById("tete_ongl_" + t_num + "_sub_" + t_sub_num).style.color = ongl_sub_txt_col_sel;

	a_num = t_num;
	a_sub_num = t_sub_num;
	return false;
}



	