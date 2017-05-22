<%@ include file="/declaration/taglibs.jsp"%>

<H1>
<div class="texteH"><layout:message key="info.tiers.pec.facturer" />
</div>
<div class="iconesH"><a
	href="<%= (String)request.getContextPath()  %>/retourArriere.do<%= (null != (String)request.getAttribute("pileRequestReqParam")?(String)request.getAttribute("pileRequestReqParam"):"") %>"><html:img
	page="/images/RETURN.gif" alt="Retour" border="0" /></a></div>
</H1>


<br />

<div id="EXC_PRESENT_DATA_COL_1" style="margin-top: 20px;">
<table>
	<tr>
		<th>Prise en charge</th>
		<td><layout:write name="ActPEC" property="typePEC" type="typePEC"
			layout="false" /></td>
	</tr>
	<tr>
		<th>Du</th>
		<td><layout:write name="ActPEC" property="dateCreation"
			type="dateYMD" layout="false" /></td>
	</tr>
	<tr>
		<th>Adhérent</th>
		<td><bean:write name="ActPEC" property="designationAdh" /></td>
	</tr>
	<tr>
		<th>Montant facturé</th>
		<td><layout:write name="ActPEC" property="mntFacture"
			type="money" layout="false" /> &euro;</td>
	</tr>
</table>
</div>

<br />

<layout:form action="facturerPECExec.do" focus="numFacture"
	styleClass="FORMULAIRE" width="80%" enctype="multipart/form-data">

	<tr>
		<td colspan="2">
		<table class="FORM_BEN" width="90%" align="center">
			<tr>
				<td align="center">
				<table class="FORM_BEN_SUB_LEFT" style="min-width: 300px;">
					<tr>
						<th><bean:message key="tiers.facturer.numFacture" /></th>
						<td style="width: 50px;"><layout:text key=""
							property="numFacture" size="9" maxlength="9" type="text"
							layout="false" isRequired="true" /></td>
						<td class="ERROR"><html:errors property="numFacture" /></td>
					</tr>
					<tr>
						<th style="text-align:left;">
							<bean:message key="tiers.pec.saisie.dateFacturation"/>
							<img name="dateFacturationrequired" src="<%= (String)request.getContextPath()  %>/images/clearpixel.gif">
						</th>
						<td colspan="2" style="text-align:left;">
							<layout:date key=""  name="PECFacturerForm" property="dateFacturation"  layout="false" 
								patternKey="format.date" size="10" maxlength="10" 
								isRequired="true" startYear="2017" endYear="2027"
								onblur="javascript:return isDate(this.value);" 
								calendarTooltip="Sélectionner la date" styleClass="dateEffetForm" />
							<span class="ERROR" style="text-align:left;">
								<html:errors property="dateFacturation" />
							</span>
						</td>
					</tr>
					
					<tr>
						<td colspan="3">
						<hr>
						</td>
					</tr>
					<tr>
						<th><bean:message key="tiers.facturer.modeJustif" /></th>
						<td colspan="2"><layout:radios property="modeJustif" cols="2"
							layout="false" styleClass="FORM_BEN"
							onchange="affMode(this.value);">
							<layout:options collection="listeModeJustifPEC" property="tabcod"
								labelProperty="tabdta" />
						</layout:radios></td>
					</tr>

					<tr>
						<td colspan="3">&nbsp;<br>
						<div id="modeW" style="display: block">
						<table class="FORM_BEN_SUB_LEFT" style="min-width: 300px;">

							<logic:iterate name="ActPECLstJustif" property="listeDonnees" id="justif">
								<tr>
									<th><layout:write name="justif" property="libelle" layout="false"/></th>
									<td>
									<logic:equal name="justif" property="fichierNom" value="">
									
										<logic:equal name="justif" property="index" value="1">									
											<html:file property="fichier1" />
										</logic:equal> 
										<logic:equal name="justif" property="index" value="2">									
											<html:file property="fichier2" />
										</logic:equal> 
										<logic:equal name="justif" property="index" value="3">									
											<html:file property="fichier3" />
										</logic:equal> 
										<logic:equal name="justif" property="index" value="4">									
											<html:file property="fichier4" />
										</logic:equal> 
										<logic:equal name="justif" property="index" value="5">									
											<html:file property="fichier5" />
										</logic:equal> 
										<logic:equal name="justif" property="index" value="6">									
											<html:file property="fichier6" />
										</logic:equal> 
										<logic:equal name="justif" property="index" value="7">									
											<html:file property="fichier7" />
										</logic:equal> 
										<logic:equal name="justif" property="index" value="8">									
											<html:file property="fichier8" />
										</logic:equal> 
										<logic:equal name="justif" property="index" value="9">									
											<html:file property="fichier9" />
										</logic:equal> 
										<logic:equal name="justif" property="index" value="10">									
											<html:file property="fichier10" />
										</logic:equal> 
										
									</logic:equal> 
									
									<logic:notEqual name="justif" property="fichierNom" value="">
									
										<logic:equal name="justif" property="index" value="1">	
											<layout:text key="" property="fichier1Name" size="40" type="text" layout="false" readonly="true" />
										</logic:equal> 
										<logic:equal name="justif" property="index" value="2">	
											<layout:text key="" property="fichier2Name" size="40" type="text" layout="false" readonly="true" />
										</logic:equal> 
										<logic:equal name="justif" property="index" value="3">	
											<layout:text key="" property="fichier3Name" size="40" type="text" layout="false" readonly="true" />
										</logic:equal> 
										<logic:equal name="justif" property="index" value="4">	
											<layout:text key="" property="fichier4Name" size="40" type="text" layout="false" readonly="true" />
										</logic:equal> 
										<logic:equal name="justif" property="index" value="5">	
											<layout:text key="" property="fichier5Name" size="40" type="text" layout="false" readonly="true" />
										</logic:equal> 
										<logic:equal name="justif" property="index" value="6">	
											<layout:text key="" property="fichier6Name" size="40" type="text" layout="false" readonly="true" />
										</logic:equal> 
										<logic:equal name="justif" property="index" value="7">	
											<layout:text key="" property="fichier7Name" size="40" type="text" layout="false" readonly="true" />
										</logic:equal> 
										<logic:equal name="justif" property="index" value="8">	
											<layout:text key="" property="fichier8Name" size="40" type="text" layout="false" readonly="true" />
										</logic:equal> 
										<logic:equal name="justif" property="index" value="9">	
											<layout:text key="" property="fichier9Name" size="40" type="text" layout="false" readonly="true" />
										</logic:equal> 
										<logic:equal name="justif" property="index" value="10">	
											<layout:text key="" property="fichier10Name" size="40" type="text" layout="false" readonly="true" />
										</logic:equal> 
										
									</logic:notEqual>
									</td>
									<td class="ERROR">
									
										<logic:equal name="justif" property="index" value="1">
												<html:errors property="fichier1" />					
										</logic:equal> 
										<logic:equal name="justif" property="index" value="2">
												<html:errors property="fichier2" />					
										</logic:equal> 
										<logic:equal name="justif" property="index" value="3">
												<html:errors property="fichier3" />					
										</logic:equal> 
										<logic:equal name="justif" property="index" value="4">
												<html:errors property="fichier4" />					
										</logic:equal> 
										<logic:equal name="justif" property="index" value="5">
												<html:errors property="fichier5" />					
										</logic:equal> 
										<logic:equal name="justif" property="index" value="6">
												<html:errors property="fichier6" />					
										</logic:equal> 
										<logic:equal name="justif" property="index" value="7">
												<html:errors property="fichier7" />					
										</logic:equal> 
										<logic:equal name="justif" property="index" value="8">
												<html:errors property="fichier8" />					
										</logic:equal> 
										<logic:equal name="justif" property="index" value="9">
												<html:errors property="fichier9" />					
										</logic:equal> 
										<logic:equal name="justif" property="index" value="10">
												<html:errors property="fichier10" />					
										</logic:equal> 
										
									</td>
								</tr>

							</logic:iterate>

						</table>
						</div>
						<div id="modeP"
							style="display: none; padding: 7px; border: #FF0000 solid 1px; text-align: center; font-size: 18px;">
						Joindre impérativement le <br>
						<a
							href="<%= (String)request.getContextPath()  %>/docGenExged.do?code=BOR_FACPEC"
							target="_blank" style="font-size: 18px;">Bordereau de demande
						de facturation</a><BR>
						à votre envoi.</div>
						&nbsp;</td>
					</tr>

				</table>
				</td>
			</tr>
		</table>
		</td>
	</tr>

	<html:hidden name="PECFacturerForm" property="numPEC" />
	<html:hidden name="PECFacturerForm" property="idFacturation" />

	<layout:formActions>
		<layout:row>
			<layout:reset styleClass="BOUT1" value="Rétablir" />
			<layout:submit styleClass="BOUT1" property="submit"
				value="Demander la facturation de la PEC"
				onclick="return isClicked();" />
		</layout:row>
	</layout:formActions>

</layout:form>


<script>
var clickFlag = false;
function isClicked(){
	if(!clickFlag){
		clickFlag=true;
	} else {
		return false;
	}
	return true;
}


function affMode(modeJ) {
	if (modeJ == "P") {
		document.getElementById("modeW").style.display = "none";
		document.getElementById("modeP").style.display = "block";
	} else {
		document.getElementById("modeP").style.display = "none";
		document.getElementById("modeW").style.display = "block";
	}
}
affMode('<bean:write name="PECFacturerForm" property="modeJustif"/>');
</script>

