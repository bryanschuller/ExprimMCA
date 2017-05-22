var posColEnfant_jour = 0;
var posColEnfant_mois = 1;
var posColEnfant_annees = 2;
var posColEnfant_regime = 3;



	// Suppression d'un commentaire (value ? '-') d'un SELECT :
  function select_removeComment(objSelect) {
		if ((objSelect.item(0).value == "-") && (objSelect.selectedValue != 0)) {
		  var w = objSelect.offsetWidth;
			objSelect.remove(0);
			objSelect.style.width = w+"px";
		}
	}
	
	// Grise le commentaire (ne fonctionne pas sur IE) :
	function select_disableComment(objSelect) {
		if (objSelect.item(0).value == "-") {
			objSelect.item(0).disabled = true;
		}
	}
  
  // ============
  // Transparence sour IE
  //
  // Definie une fonction setOpacity(objet,opacit?En%)
  
  var navType = navigator.userAgent.toLowerCase();
 
	// Si mozilla <= 1.6
	if ( (navType.indexOf('mozilla')!=-1) && (navigator.appVersion<=1.6)) {
	  function setOpacity(obj,nOpacity) {
	    obj.style.MozOpacity=""+(nOpacity/100); // Mozilla<=1.6
	  }
	}
	// Sinon si Firefox ou version suivante de Mozilla
	else if (navType.indexOf('mozilla')!=-1) {
	 function setOpacity(obj,nOpacity) {
	  obj.style.opacity=""+(nOpacity/100);
	 }
	}
	// Sinon si Microsoft IE
	else if (navType.indexOf('msie')!=-1) {
	 function setOpacity(obj,nOpacity) {
	  obj.style.filter="alpha(opacity="+nOpacity+")"; //IE
	 }
	}
	// Sinon tout
	else {
	 function setOpacity(obj,nOpacity) {
	  obj.style.MozOpacity=""+(nOpacity/100); // Mozilla<=1.6
	  obj.style.opacity=""+(nOpacity/100); // FF
	  obj.style.filter="alpha(opacity="+nOpacity+")"; //IE
	 }
	}
  
	// ============ 
	// getElementsByName pour IE :
	// D?finition d'un getElementsByName pour IE :
	// Raison: getElementsByName de IE ne trouve pas les objets dynamiques
	// Test? avec IE6:ok 
	
	// cherche un ?l?ment par son nom dans le DOM
	// (sort d?s que l'?l?ment est trouv? !)
var listeEl=new Array();
function rechercheParNom(nomRecherche)
{
  var tab,lListe,lTab,i,j;
 
  lListe = listeEl.length;
 
  for (i=0; i<lListe; i++)
  {
    tab = document.getElementsByTagName(listeEl[i]);
    lTab = tab.length;
    for (j=lTab-1;j>=0; j--)
    {
      if (tab[j].name==nomRecherche)
         return tab[j];
    }
  }

  return null;
 
}
 
function Init_IE_getElementsByName() {
  // pour optimisation: mettre les tagName dans cette liste du plus frequent au moins:
  listeEl="SELECT,INPUT,OPTION,A,ABBR,ACRONYM,ADDRESS,APPLET,AREA,B,BASE,BASEFONT,BDO,BGSOUND,BIG,BLOCKQUOTE,BODY,BR,BUTTON,CAPTION,CENTER,CITE,CODE,COL,COLGROUP,COMMENT,CUSTOM,DD,DEL,DFN,DIR,DIV,DL,!DOCTYPE,DT,EM,EMBED,FIELDSET,FONT,FORM,FRAME,FRAMESET,HEAD,hn,HR,HTML Comment,HTML,I,IFRAME,IMG,INS,KBD,LABEL,LEGEND,LI,LINK,LISTING,MAP,MARQUEE,MENU,META,nextID,NOBR,OBJECT,OL,P,PLAINTEXT,PRE,Q,RT,RUBY,S,SAMP,SCRIPT,SMALL,SPAN,STRIKE,STRONG,SUB,SUP,TABLE,TBODY,TD,TEXTAREA,TFOOT,TH,THEAD,TITLE,TR,TT,U,UL,VAR,XMP".split(/[,]/);
}

if (navigator.appName == "Microsoft Internet Explorer") {
  // init
 Init_IE_getElementsByName();
  // redef de la m?thode :
  document.getElementsByName = function(str) {
   o=rechercheParNom(str);
    if (o) { 
      return new Array(o); 
    } 
    return undefined; 
  } 
} 
 

	// FIN getElementsByName==========
	

  // Affichage * ou non ? c?t? d'un champs :
  function isSelectboxValide(objElement) {
  	var objName = objElement.getAttribute('name');
  	if (objElement.value == '-') {
  		document.images[objName+"required"].src = imgsrc + "ast.gif";
  	} else {
  		document.images[objName+"required"].src = imgsrc + "clearpixel.gif";
  	}
  }
  
  
  
  //======
  // Concerne la zone conjoint :
  //
  function set_divConjoint() {
    zConjoint = document.getElementById('ZoneConjoint');
    /*var listArr = new Array("nomConj","prenomConj","adresseConj","villeConj"
    												,"cpConj","jourNaissConj","moisNaissConj","anneeNaissConj","codeRoConj");
    	*/
    												
  	if (document.getElementsByName("boolConjointEnable")[0].checked == true) {
  	  // Affiche
			/*for (var i=0;i<listArr.length;++i) {
				n = listArr[i];
				document.getElementsByName(n)[0].disabled = false;
				setOpacity(document.getElementsByName(n)[0],100);
			}*/
			zConjoint.style.display="block";
  	} else {
  		// Cache
			/*for (var i=0;i<listArr.length;++i){
				n=listArr[i];
				document.getElementsByName(n)[0].disabled = true;
				setOpacity(document.getElementsByName(n)[0],50);				
			}*/
			zConjoint.style.display="none";
  	}
  }
  
  
  // =======
  // Concerne la datagrid enfants :
	//
	var datagridName = "listeEnfants";
  var tableName = datagridName + "JsId";
  var Dtg_CountDeleted = 0;
  
	// Param?tre l'?tat d'un ligne par son num?ro (commence ? 0) :
	//    mettre state ? 'removed' pour supprimer
	function datagrid_setLineStates(property,numLine,state) {
	
		// Get the datagrid.
		var datagrid = strutsLayoutDatagridData[property];

		// Get the table object.
		var table = document.getElementById(tableName);
	
		// Set the state of the line to "removed".
		document.forms[0].elements[property + ".dataState[" + numLine + "]"].value = state;
			
		// Hide the line
		table.rows[numLine+1].className = datagrid.rowStyleClassMap[state];

	}
  
  // Retourne le nombre de lignes de la datagrid :
  function Enfants_getCountLines() {
	    return document.getElementById(tableName).rows.length - 1;	
  }
  
  // Retourne le nombre de lignes supprim?es ::
  function Enfants_getCountLinesVisible() {
  	return Enfants_getCountLines() - Dtg_CountDeleted;
  }
  
  // Param?tre les required pour la datagrid enfants :
  function Enfants_setRequired(numLine) {

				// Pour suppression :
		Enfants_insertHTML(numLine+1,posColEnfant_regime,'<a href="javascript:Datagrid_DelLine('+numLine+')"><img src="'+imgsrc+'delete.gif" alt="Annuler cet enfant" title="Annuler cet enfant"></a>'); // Ajout du bouton de suppression
			
			
    		// r?gime
  	Enfants_insertHTML(numLine+1,posColEnfant_regime,'<img name="'+datagridName+'.codeRegime['+numLine+']required" src="/MCA/images/ast.gif">');
  	document.getElementsByName('listeEnfants.codeRegime['+numLine+']')[0].onclick = function() {
			select_disableComment(document.getElementsByName('listeEnfants.codeRegime['+numLine+']')[0]);  
	  }
  	document.getElementsByName('listeEnfants.codeRegime['+numLine+']')[0].onchange = function() {
	  	select_removeComment(document.getElementsByName('listeEnfants.codeRegime['+numLine+']')[0]);   	
  		isSelectboxValide(this);
  	}
  	
  	  	// ann?e
  	Enfants_insertHTML(numLine+1,posColEnfant_annees,'<img name="'+datagridName+'.anneeNaissance['+numLine+']required" src="/MCA/images/ast.gif">');
  	document.getElementsByName('listeEnfants.anneeNaissance['+numLine+']')[0].onclick = function() {
			select_disableComment(document.getElementsByName('listeEnfants.anneeNaissance['+numLine+']')[0]);  
	  }
  	document.getElementsByName('listeEnfants.anneeNaissance['+numLine+']')[0].onchange = function() {
  		isSelectboxValide(this);
	  	select_removeComment(document.getElementsByName('listeEnfants.anneeNaissance['+numLine+']')[0]);
  	}  	
  	
  	  	// mois
  	Enfants_insertHTML(numLine+1,posColEnfant_mois,'<img name="'+datagridName+'.moisNaissance['+numLine+']required" src="/MCA/images/ast.gif">');
  	document.getElementsByName('listeEnfants.moisNaissance['+numLine+']')[0].onclick = function() {
	  	select_disableComment(document.getElementsByName('listeEnfants.moisNaissance['+numLine+']')[0]);
	  }
  	document.getElementsByName('listeEnfants.moisNaissance['+numLine+']')[0].onchange = function() {
	  	select_removeComment(document.getElementsByName('listeEnfants.moisNaissance['+numLine+']')[0]);  	
  		isSelectboxValide(this);
  	}  	
  	  	
		  	// jour
  	Enfants_insertHTML(numLine+1,posColEnfant_jour,'<img name="'+datagridName+'.jourNaissance['+numLine+']required" src="/MCA/images/ast.gif">');
  	document.getElementsByName('listeEnfants.jourNaissance['+numLine+']')[0].click = function() {
	  	select_disableComment(document.getElementsByName('listeEnfants.jourNaissance['+numLine+']')[0]);
	  }
  	document.getElementsByName('listeEnfants.jourNaissance['+numLine+']')[0].onchange = function() {
	  	select_removeComment(document.getElementsByName('listeEnfants.jourNaissance['+numLine+']')[0]);  	
  		isSelectboxValide(this);
  	}  	

  }
  
  // Insert une cellule dans la datagrid enfant :
  function Enfants_insertHTML(numLine,afterNumCell,html) {
  	var table = document.getElementById(tableName);
  	var row = table.rows[numLine];
  	var cell = row.insertCell(afterNumCell+1);

  	cell.innerHTML = html;
  }

  
  // Appel? pour ajouter une ligne ? la datagrid des enfants :
	function ajouterEnfant() {
		
		StrutsLayout.addDatagridLine(datagridName);
		
		// parametre la ligne :
		Enfants_setRequired(Enfants_getCountLines()-1); // Mets la ligne ajoute en isRequired
		
		setDtgEnfant_Visibility()
		
	}
	
	// Supprimer un enregistrement de la Datagrid :
	function Datagrid_DelLine(idx) {

		// mets le flag de la ligne ? 'remove' (inspir? de setDatagridLineState de "datagrid.js")
		datagrid_setLineStates(datagridName,idx,'removed');
		
		// cache la ligne
		var table = document.getElementById(tableName);
		table.rows[idx+1].style.visibility = "hidden";
		table.rows[idx+1].style.display = "none";
		
		// Pour le compteur de lignes supprim?es :
		Dtg_CountDeleted++;

		setDtgEnfant_Visibility();
		
	}
	
	function setDtgEnfant_Visibility() {
		if (Enfants_getCountLinesVisible() > 0) {
			document.getElementById(tableName).style.visibility = "visible";
		} else {
			document.getElementById(tableName).style.visibility = "hidden";
		}
	}
	
	// Initialise la datagrid enfants :
	function Enfant_INIT() {

				// Bouton supprimer
		Enfants_insertHTML(0,posColEnfant_regime,'');
    		// r?gime
  	Enfants_insertHTML(0,posColEnfant_regime,'');  	
  	  	// ann?e
  	Enfants_insertHTML(0,posColEnfant_annees,''); 
  	  	// mois
  	Enfants_insertHTML(0,posColEnfant_mois,'');
		  	// jour
  	Enfants_insertHTML(0,posColEnfant_jour,'');
  	
  	// dans le cas d'un rechargement de la page :
  	if (Enfants_getCountLines()>0) {
  		for (var numLine=0;numLine<Enfants_getCountLines();++numLine) {
  			Enfants_setRequired(numLine);
  			isSelectboxValide(document.getElementsByName('listeEnfants.codeRegime['+numLine+']')[0]);
  			isSelectboxValide(document.getElementsByName('listeEnfants.anneeNaissance['+numLine+']')[0]);
  			isSelectboxValide(document.getElementsByName('listeEnfants.moisNaissance['+numLine+']')[0]);
  			isSelectboxValide(document.getElementsByName('listeEnfants.jourNaissance['+numLine+']')[0]);
  		}
  	}
  	
  	// R?glage de la taille de la datagrid :
  	// Ajout et suppression d'une ligne pour ?largir le datagrid ? la taille n?cessaire
  	if (Enfants_getCountLines() == 0) {
	  	ajouterEnfant();
			var w = document.getElementById(tableName).clientWidth;
	  	Datagrid_DelLine(0);
	  	document.getElementById(tableName).style.width = w+"px";
	  	setDtgEnfant_Visibility()
  	}
  	
	}
