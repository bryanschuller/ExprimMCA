<%@ include file="/declaration/taglibs.jsp"%>

<div>
	<div class="texteH">
	    Déclaration Sociale Nominative
	</div>
	<div class="iconesH">
	</div>
</div>
<div class="clearfix"></div>

<layout:form action="/changementSiretNAF" styleClass="box" reqCode="sendModif" > 

<tr><td colspan="2" style="font-size:12px;">
	Dans le cadre de la mise en oeuvre de la DSN (Déclaration Sociale Nominative),<BR>
	merci de compléter et/ou corriger les informations ci-dessous :<BR>&nbsp;
</td></tr>


<tr><td>
<table class="FORM_BEN" width="90%" align="center">
<tr><td colspan="2">
&nbsp; 
</td></tr>

<tr><td colspan="2">
	
	<table align="center" style="text-align:left;">
		<layout:field key="ent.saisie.ape" property="naf" size="8" maxlength="5" isRequired="true" type="text"/> 

		<tr><td colspan="2"><table>			
		<layout:datagrid 	model="datagrid" property="listSiret" 
							multipleSelectionAllowed="false" selectionAllowed="false">
			
			<layout:datagridColumn title="ent.saisie.siren" property="siren" />								
			<layout:datagridColumn title="ent.saisie.nic" property="nic" />
			
		</layout:datagrid>
		</table></td></tr>
			
	</table>
	
</td></tr>
			
<tr class="ERROR"><td colspan="2">
&nbsp; <html:errors property="siret"/>
</td></tr>

<tr><td colspan="2">
	<img src="<%=(String) request.getContextPath() %>/images/ast.gif"><bean:message key="general.formulaire.obligatoire"/>
</td></tr>
			
</table>
</td></tr>

<tr><td colspan="4">&nbsp;</td></tr>


<layout:formActions> 
<layout:row>
<layout:submit styleClass="btn" property="submit" value="Valider"/> 
</layout:row>
</layout:formActions> 
</layout:form>

<script>

var imgsrc="<%= (String) request.getContextPath() %>/images/";

var posColSiren = 0;
var posColNIC = 1;

var datagridName = "listSiret";
var tableName = datagridName + "JsId";
var Dtg_CountDeleted = 0;


// Suppression d'un commentaire (value ? '-') d'un SELECT :
function select_removeComment(objSelect) {
	if ((objSelect.item(0).value == "") && (objSelect.selectedValue != 0)) {
	  var w = objSelect.offsetWidth;
		objSelect.remove(0);
		objSelect.style.width = w+"px";
	}
}
// Grise le commentaire (ne fonctionne pas sur IE) :
function select_disableComment(objSelect) {
	if (objSelect.item(0).value == "") {
		objSelect.item(0).disabled = true;
	}
}
// Affichage * ou non ? c?t? d'un champs :
function isFieldValide(objElement) {
	var objName = objElement.getAttribute('name');
	if (objElement.value == '') {
		document.images[objName+"required"].src = imgsrc + "ast.gif";
	} else {
		document.images[objName+"required"].src = imgsrc + "clearpixel.gif";
	}
}


// Param?tre les required pour la datagrid enfants :
function Enfants_setRequired(numLine) {

	if (numLine == 0) {
		Enfants_insertHTML(numLine + 1, posColNIC, '<span class="iconesH"><a href="javascript:addSiret();"><img src="' + imgsrc + 'add_obj.gif"/> Ajouter un Siret</a></span>');
	} else {
		Enfants_insertHTML(numLine + 1, posColNIC, '<a href="javascript:delSiret(' + numLine + ');"><img src="' + imgsrc + 'close.gif" alt="Supprimer le siret" title="Supprimer le siret"></a>');
	}
	// NIC
	Enfants_insertHTML(numLine+1,posColNIC,'<img name="'+datagridName+'.nic['+numLine+']required" src="' + imgsrc + 'ast.gif">');
	document.getElementsByName(datagridName + '.nic['+numLine+']')[0].onchange = function() {
	  	isFieldValide(this);
	};
	
  	// Siren
	Enfants_insertHTML(numLine+1,posColSiren,'<img name="'+datagridName+'.siren['+numLine+']required" src="' + imgsrc + 'ast.gif">');
	document.getElementsByName(datagridName + '.siren['+numLine+']')[0].onchange = function() {
	  	isFieldValide(this);
	};

}

// Param?tre l'?tat d'un ligne par son num?ro (commence ? 0) :
//    mettre state ? 'removed' pour supprimer
function datagrid_setLineStates(property, numLine, state) {
	// Get the datagrid.
	var datagrid = strutsLayoutDatagridData[property];
	// Get the table object.
	var table = document.getElementById(tableName);
	// Set the state of the line to "removed".
	document.forms[0].elements[property + ".dataState[" + numLine + "]"].value = state;		
	// Hide the line
	table.rows[numLine+1].className = datagrid.rowStyleClassMap[state];
}
function datagrid_getLineStates(property, numLine) {
	// Get the datagrid.
	var datagrid = strutsLayoutDatagridData[property];
	// Get the table object.
	var table = document.getElementById(tableName);
	// Set the state of the line to "removed".
	return document.forms[0].elements[property + ".dataState[" + numLine + "]"].value;	
}

// Retourne le nombre de lignes de la datagrid :
function Enfants_getCountLines() {
    return document.getElementById(tableName).rows.length - 1;	
}

// Retourne le nombre de lignes supprim?es ::
function Enfants_getCountLinesVisible() {
	return Enfants_getCountLines() - Dtg_CountDeleted;
}


// Insert une cellule dans la datagrid enfant :
function Enfants_insertHTML(numLine, afterNumCell, html) {
	var table = document.getElementById(tableName);
	var row = table.rows[numLine];
	var cell = row.insertCell(afterNumCell+1);

	cell.innerHTML = html;
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
	
}


// Initialise la datagrid enfants :
function Enfants_INIT() {

			// Bouton supprimer
	Enfants_insertHTML(0,posColNIC,'');
		// NIC
	Enfants_insertHTML(0,posColNIC,'');  	
	  	// Siren
	Enfants_insertHTML(0,posColSiren,''); 
	
	// dans le cas d'un rechargement de la page :
	if (Enfants_getCountLines() > 0) {
		for (var numLine=0 ; numLine < Enfants_getCountLines() ; ++numLine) {
			Enfants_setRequired(numLine);
			
			state = datagrid_getLineStates(datagridName, numLine);
			
			if (state == 'removed') {
				var table = document.getElementById(tableName);
				table.rows[numLine+1].style.visibility = "hidden";
				table.rows[numLine+1].style.display = "none";				
			} else {
				isFieldValide(document.getElementsByName(datagridName + '.siren[' + numLine + ']')[0]);
				isFieldValide(document.getElementsByName(datagridName + '.nic[' + numLine + ']')[0]);
				datagrid_setLineStates(datagridName, numLine, 'added');				
			}
		}
	}	
}

function addSiret() {
	StrutsLayout.addDatagridLine(datagridName);

	numLine = Enfants_getCountLines() - 1;
	 
	Enfants_setRequired(numLine);
	
	document.getElementsByName(datagridName + '.siren['+numLine+']')[0].value = document.getElementsByName(datagridName + '.siren[0]')[0].value;
	isFieldValide(document.getElementsByName(datagridName + '.siren['+numLine+']')[0]);
	datagrid_setLineStates(datagridName, numLine, 'added');	
}
function delSiret(numLine) {
	Datagrid_DelLine(numLine);
}

Enfants_INIT();

</script>



