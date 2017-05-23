<%@ include file="/declaration/taglibs.jsp"%>

  
<H1>
   	<div class="texteH">	<layout:message key="info.adh.rib.changement"/>
   	</div>
   	<div class="iconesH">
<a href="<%= (String)request.getContextPath()  %>/retourArriere.do<%= (null != (String)request.getAttribute("pileRequestReqParam")?(String)request.getAttribute("pileRequestReqParam"):"") %>"><html:img page="/images/RETURN.gif" alt="Retour" border="0"/></a>
	</div>
</H1>


<script>
var fieldsRIB = new Array();
var fieldsIBAN = new Array();
var cptIBAN = new Array();


function initCheckValue(fieldName, fType){
	var tousElements = document.getElementsByTagName("INPUT");
	for(var i= 0; i < tousElements.length; i++)
	{
	    if(tousElements[i].name == fieldName) {
	    	// checkValue(tousElements[i], fieldName,'TEXT',true);
	    	if(fType == "RIB") fieldsRIB.push(tousElements[i]);
	    	if(fType == "IBAN") fieldsIBAN.push(tousElements[i]);
	    	if(fType == "CPTIBAN") cptIBAN.push(tousElements[i]);
	    	
	    	// alert("RIB : " + fieldsRIB.length + "\nIBAN : " + fieldsIBAN.length);
	    	break;
	    }
	}
}

</script>

	
<br/><br/>
<layout:form action="updatebqe.do" focus="code_banque" styleClass="box">


		<logic:empty name="sepaSaisieObligatoire">
		
			<tr><td colspan="2">			
				<div id="modeSaisie">
					Mode de saisie : 
					<layout:select name="modRIBForm" property="typeSaisie" layout="false" onchange="changeModeSaisie(this.value);" onkeyup="changeModeSaisie(this.value);">
						<layout:options collection="lTypeSaisie"/>
					</layout:select>
				</div>
			</td></tr>
			<tr><td colspan="2">	
			&nbsp;		
			</td></tr>
		</logic:empty>
		<logic:notEmpty name="sepaSaisieObligatoire">
			<html:hidden name="modRIBForm" property="typeSaisie" /> 
		</logic:notEmpty>
		
		
<tr><td colspan="2">
		
	<table class="FORM_BEN" width="90%" align="center">
	<tr><td  align="center">
	
		
		<div id="saisieRIB" style="display:none;">
			<table  >
				<tr>
					<th>Domiciliation</th>
					<th>Titulaire</th>
					<th>Banque</th>
					<th>Guichet</th>
					<th>N° Compte</th>
					<th>Clé</th>
				</tr>
				<tr>
					<% 
					String domObg = (String)request.getSession().getServletContext().getInitParameter("DomiciliationBancaire");
					if(null == domObg || domObg.equals("O")) {
					%>
						<td><layout:text key="" property="domiciliation" name="modRIBForm" size="24" maxlength="24" isRequired="true" layout="false" onchange="up_text(this);" />
						<script> var domObg = "O"; initCheckValue("domiciliation", "RIB");</script></td>
					<% }else{ %>
						<td><layout:text key="" property="domiciliation" name="modRIBForm" size="24" maxlength="24" isRequired="false" layout="false" onchange="up_text(this);" /></td>
					<% } %>
					<td><layout:text key="" property="titulaire" name="modRIBForm" size="24" maxlength="24" isRequired="true" layout="false" onchange="up_text(this);" />
						<script> initCheckValue("titulaire", "RIB");</script></td>
					<td><layout:text key="" property="code_banque" name="modRIBForm" size="5" maxlength="5" isRequired="true" layout="false" onchange="up_text(this);" />
						<script> initCheckValue("code_banque", "RIB");</script></td>
					<td><layout:text key="" property="code_guichet" name="modRIBForm" size="5" maxlength="5" isRequired="true" layout="false" onchange="up_text(this);" />
						<script> initCheckValue("code_guichet", "RIB");</script></td>
					<td><layout:text key="" property="num_compte" name="modRIBForm" size="11" maxlength="11" isRequired="true" layout="false" onchange="up_text(this);" />
						<script> initCheckValue("num_compte", "RIB");</script></td>
					<td><layout:text key="" property="cle" name="modRIBForm" size="2" maxlength="2" isRequired="true"  layout="false" onchange="up_text(this);" />
						<script> initCheckValue("cle", "RIB");</script></td>
						
				</tr>
				<tr>
					<% if(null == domObg || domObg.equals("O")) {	%>
						<td><img name="domiciliationrequired" src="<%= (String)request.getContextPath()  %>/images/clearpixel.gif"></td>
					<% }else{ %>
						<td>&nbsp;</td>
					<% } %>
					<td><img name="titulairerequired" src="<%= (String)request.getContextPath()  %>/images/clearpixel.gif" ></td>
					<td><img name="code_banquerequired" src="<%= (String)request.getContextPath()  %>/images/clearpixel.gif"></td>
					<td><img name="code_guichetrequired" src="<%= (String)request.getContextPath()  %>/images/clearpixel.gif"></td>
					<td><img name="num_compterequired" src="<%= (String)request.getContextPath()  %>/images/clearpixel.gif"></td>
					<td><img name="clerequired" src="<%= (String)request.getContextPath()  %>/images/clearpixel.gif"></td>
				</tr>
				<tr class="ERROR">
					<td><html:errors property="domiciliation" /></td>
					<td><html:errors property="titulaire" /></td>
					<td><html:errors property="code_banque" /></td>
					<td><html:errors property="code_guichet" /></td>
					<td><html:errors property="num_compte" /></td>
					<td><html:errors property="cle" /></td>
				</tr>
				<tr>
					<th style="text-align:left;">
						<bean:message key="info.interloc.dateeffet"/>
						<img name="dateEffetrequired" src="<%= (String)request.getContextPath()  %>/images/clearpixel.gif">
					</th>
					<td style="text-align:left;">
						<layout:date key=""  name="modRIBForm" property="dateEffet"  layout="false" 
							patternKey="format.date" size="10" maxlength="10" 
							isRequired="true" startYear="2013" endYear="2025"
							onblur="javascript:return isDate(this.value);" 
							calendarTooltip="Sélectionner la date" styleClass="dateEffetForm" />
						<script> initCheckValue("dateEffet", "RIB");</script>
					</td>
					<td colspan="4" class="ERROR" style="text-align:left;">
						<html:errors property="dateEffet" />
					</td>
				</tr>
				<tr>
					<th>&nbsp;</th>
					<td class="obligatoire" style="text-align:left;">
						<img src="<%=(String) request.getContextPath() %>/images/ast.gif"><bean:message key="general.formulaire.obligatoire"/>
					</td>
				</tr>
			</table>
		</div>
		
		<div id="saisieIBAN" style="display:none;">
			<table>
				<tr>
					<th style="text-align:left;" width="150px">
						Titulaire
						<img name="nomTitLongrequired" src="<%= (String)request.getContextPath()  %>/images/clearpixel.gif">
					</th>
					<td class="ERROR" style="text-align:left;">
						<html:errors property="nomTitLong" />
					</td>
				</tr>
				<tr>
					<td colspan="2" style="text-align:left;">
						<layout:text key="" property="nomTitLong" name="modRIBForm" size="80" maxlength="70" isRequired="true" layout="false" onchange="up_text(this);" />
						<script> initCheckValue("nomTitLong", "IBAN");</script>
					</td>
				</tr>
					
				<tr>
					<th style="text-align:left;">
						Compte IBAN
						<img name="compteIbanrequired" src="<%= (String)request.getContextPath()  %>/images/clearpixel.gif">
					</th>
					<td class="ERROR" style="text-align:left;">
						<html:errors property="compteIban" />
					</td>
				</tr>
				<tr>
					<td colspan="2" style="text-align:left;">
						<layout:text key="" property="iban1" name="modRIBForm" size="4" maxlength="4" isRequired="true" layout="false" onchange="up_text(this);checkIBANValue();" onkeyup="jumpNextField(this, key(event));" />
						<layout:text key="" property="iban2" name="modRIBForm" size="4" maxlength="4" isRequired="true" layout="false" onchange="up_text(this);checkIBANValue();" onkeyup="jumpNextField(this, key(event));" />
						<layout:text key="" property="iban3" name="modRIBForm" size="4" maxlength="4" isRequired="true" layout="false" onchange="up_text(this);checkIBANValue();" onkeyup="jumpNextField(this, key(event));" />
						<layout:text key="" property="iban4" name="modRIBForm" size="4" maxlength="4" isRequired="true" layout="false" onchange="up_text(this);checkIBANValue();" onkeyup="jumpNextField(this, key(event));" />
						<layout:text key="" property="iban5" name="modRIBForm" size="4" maxlength="4" isRequired="true" layout="false" onchange="up_text(this);checkIBANValue();" onkeyup="jumpNextField(this, key(event));" />
						<layout:text key="" property="iban6" name="modRIBForm" size="4" maxlength="4" isRequired="true" layout="false" onchange="up_text(this);checkIBANValue();" onkeyup="jumpNextField(this, key(event));" />
						<layout:text key="" property="iban7" name="modRIBForm" size="4" maxlength="4" isRequired="true" layout="false" onchange="up_text(this);checkIBANValue();" onkeyup="jumpNextField(this, key(event));" />
						<layout:text key="" property="iban8" name="modRIBForm" size="4" maxlength="4" isRequired="true" layout="false" onchange="up_text(this);checkIBANValue();" onkeyup="jumpNextField(this, key(event));" />
						<layout:text key="" property="iban9" name="modRIBForm" size="2" maxlength="2" isRequired="true" layout="false" onchange="up_text(this);checkIBANValue();" />
						<script>	initCheckValue("iban1", "CPTIBAN");initCheckValue("iban2", "CPTIBAN");initCheckValue("iban3", "CPTIBAN");
									initCheckValue("iban4", "CPTIBAN");initCheckValue("iban5", "CPTIBAN");initCheckValue("iban6", "CPTIBAN");
									initCheckValue("iban7", "CPTIBAN");initCheckValue("iban8", "CPTIBAN");initCheckValue("iban9", "CPTIBAN");
						</script>
					</td>
					</tr>
								
				<tr>
					<th style="text-align:left;">
						Code BIC
						<img name="codeBICrequired" src="<%= (String)request.getContextPath()  %>/images/clearpixel.gif">
					</th>
					<td style="text-align:left;">
						<layout:text key="" property="codeBIC" name="modRIBForm" size="20" maxlength="11" isRequired="true" layout="false" onchange="up_text(this);" />
						<script> initCheckValue("codeBIC", "IBAN");</script>
						<span  class="ERROR" style="text-align:left;">
							<html:errors property="codeBIC" />
						</span>  
					</td>
				</tr>
				<tr>
					<th style="text-align:left;">
						<bean:message key="info.interloc.dateeffet"/>
						<img name="dateEffetIbanrequired" src="<%= (String)request.getContextPath()  %>/images/clearpixel.gif">
					</th>
					<td style="text-align:left;">
						<layout:date key=""  name="modRIBForm" property="dateEffetIban"  layout="false" 
							patternKey="format.date" size="10" maxlength="10" 
							isRequired="true" startYear="2013" endYear="2025"
							onblur="javascript:return isDate(this.value);" 
							calendarTooltip="Sélectionner la date" styleClass="dateEffetForm" />
						<script> initCheckValue("dateEffetIban", "IBAN");</script>
						<span  class="ERROR" style="text-align:left;">
							<html:errors property="dateEffetIban" />
						</span>  
					</td>
				</tr>
				<tr>
					<th>&nbsp; </th>
					<td class="obligatoire" style="text-align:left;">
						<img src="<%=(String) request.getContextPath() %>/images/ast.gif"><bean:message key="general.formulaire.obligatoire"/>
					</td>
				</tr>
			</table>
		</div>
				

		</td></tr>
		</table>
	</td></tr>



	<layout:row>&nbsp;</layout:row>
	
	
	<html:hidden name="modRIBForm" property="codeGroupe" /> 
	<html:hidden name="modRIBForm" property="numEntreprise" /> 
	<html:hidden name="modRIBForm" property="codeCategorie" /> 
	<html:hidden name="modRIBForm" property="numAdherent" /> 
	<html:hidden name="modRIBForm" property="rangBenef" />
	<html:hidden name="modRIBForm" property="numBanque" />
	
	<html:hidden name="modRIBForm" property="actionRIB" /> 
	
	<layout:formActions>
	
		<layout:row space="false">
			<layout:reset styleClass="btn" value="Rétablir" />
			<layout:submit styleClass="btn" property="submit" value="Envoyer la demande de changement de RIB" /> 
		</layout:row>
	
	</layout:formActions> 
</layout:form>

<br>
<div id="footPanneau">
	*Cette modification concerne exclusivement le règlement de vos prestations. Pour modifier le RIB concernant le prélèvement de vos cotisations, veuillez <a target="_blank" href="<%= (String)request.getContextPath()  %>/documentServe.do?code=docAutPrel">télécharger la demande d'autorisation de prélèvement.</a>
</div>
<br>

<script>
function listeFields(){
	var tmpStr = "Champs répertoriés :\n";
	for(var i= 0; i < fieldsRIB.length; i++)
	{
	    checkValue(fieldsRIB[i], fieldsRIB[i].name,'TEXT',true);
	    tmpStr += "\nRIB : " + fieldsRIB[i].name;
	}
	tmpStr += "\n";
	for(var i= 0; i < fieldsIBAN.length; i++)
	{
	    checkValue(fieldsIBAN[i], fieldsIBAN[i].name,'TEXT',true);
	    tmpStr += "\nIBAN : " + fieldsIBAN[i].name;
	}
	tmpStr += "\n";
	for(var i= 0; i < cptIBAN.length; i++)
	{
	    checkValue(cptIBAN[i], cptIBAN[i].name,'TEXT',true);
	    tmpStr += "\nCompte IBAN : " + cptIBAN[i].name;
	}
	alert(tmpStr);
}

</script>

<script>
function key(e) {return e?e.which:event.keyCode;}

function checkIBANValue(){
	if (document.images["compteIbanrequired"] != null) {
		var tmpIbanValue = "";
		for(var i = 0; i < cptIBAN.length; i++)
		{
		    tmpIbanValue += cptIBAN[i].value;
		}
		if (tmpIbanValue != "") {		
			document.images["compteIbanrequired"].src = imgsrc + "clearpixel.gif";	
		} else {	
			document.images["compteIbanrequired"].src = imgsrc + "ast.gif";
		}
	}
}
function jumpNextField(actField, keyVal){
	if(keyVal != "9" && keyVal != "16" && keyVal != "37" && keyVal != "39"){
		if(actField.value.length == 4){
			var toNext = "";
			for(var i= 0; i < cptIBAN.length; i++)
			{	
				if(toNext == "O"){
					cptIBAN[i].focus();
					cptIBAN[i].select();
					break;
				}
				if(cptIBAN[i].name == actField.name) {
					toNext = "O";			
				}
			}
		}
	}
}
</script>

<script>
function changeModeSaisie(inVal){
	if(inVal == "IBAN"){
		document.getElementById("saisieRIB").style.display = "none";
		document.getElementById("saisieIBAN").style.display = "block";

		for(var i= 0; i < fieldsIBAN.length; i++)
		{
		    checkValue(fieldsIBAN[i], fieldsIBAN[i].name,'TEXT',true);
		    // alert("IBAN : " + fieldsIBAN[i].name);
		}
		checkIBANValue();
		cptIBAN[0].focus();
		cptIBAN[0].select();
	}else{
		document.getElementById("saisieRIB").style.display = "block";
		document.getElementById("saisieIBAN").style.display = "none";

		for(var i= 0; i < fieldsRIB.length; i++)
		{
		    checkValue(fieldsRIB[i], fieldsRIB[i].name,'TEXT',true);
	    	// alert("RIB : " + fieldsRIB[i].name);
		}
	}
	return true;
}
function up_text(el){
	el.value = el.value.toUpperCase();
}



var tousSelects = document.getElementsByTagName("SELECT");
var selValue = "";
for(var i= 0; i < tousSelects.length; i++)
{
    if(tousSelects[i].name == "typeSaisie") {
		var selValueIndex = tousSelects[i].selectedIndex;
		selValue = tousSelects[i].options[selValueIndex].value;
		// alert(selValue);
		break;
    }
}

if(selValue == ""){
	var tousInputs = document.getElementsByTagName("INPUT");
	for(var i= 0; i < tousInputs.length; i++)
	{
	    if(tousInputs[i].name == "typeSaisie") {
			selValue = tousInputs[i].value;
			// alert(selValue);
			break;
	    }
	}
}
changeModeSaisie(selValue);

</script>




<script type="text/javascript" src="<%= (String)request.getContextPath()  %>/scripts/control/control.js"></script>
