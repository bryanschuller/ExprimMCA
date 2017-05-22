<%@ include file="/declaration/taglibs.jsp"%>

<H1>
	<div class="texteH">
    	<layout:message key="info.tiers.pec.facturer"/> 
	</div>
	<div class="iconesH">
		<a href="<%= (String)request.getContextPath()  %>/retourArriere.do<%= (null != (String)request.getAttribute("pileRequestReqParam")?(String)request.getAttribute("pileRequestReqParam"):"") %>"><html:img page="/images/RETURN.gif" alt="Retour" border="0"/></a>
	</div>
</H1> 


<br/>

<div id="EXC_PRESENT_DATA_COL_1" style="margin-top:20px;">
	<table >
		<tr><th>Prise en charge</th><td><layout:write name="ActPEC" property="typePEC" type="typePEC" layout="false"/></td></tr>
		<tr><th>Du</th><td><layout:write name="ActPEC" property="dateCreation" type="dateYMD" layout="false"/></td></tr>
		<tr><th>Adhérent</th><td><bean:write name="ActPEC" property="designationAdh"/></td></tr>
		<tr><th>Montant facturé</th><td><layout:write name="ActPEC" property="mntFacture" type="money" layout="false"/> &euro;</td></tr>			
	</table>
</div>

<br/>

<layout:form action="facturerPECExec.do" focus="numFacture" styleClass="FORMULAIRE" width="80%" enctype="multipart/form-data" > 

	<tr><td colspan="2">
		<table class="FORM_BEN" width="90%" align="center">
			<tr><td align="center">
				<table class="FORM_BEN_SUB_LEFT" style="min-width:300px;">							
					<tr>
						<th><bean:message key="tiers.facturer.numFacture"/></th>
						<td style="width:50px;"><layout:text key="" property="numFacture" size="9" maxlength="9" type="text" layout="false" isRequired="true"/></td>
						<td class="ERROR"><html:errors property="numFacture" /></td>
					</tr>
												
						<tr>
							<td colspan="3">
								<hr>
							</td>
						</tr>
						<tr>
							<th><bean:message key="tiers.facturer.modeJustif"/></th>
							<td colspan="2">
								<layout:radios property="modeJustif" cols="2" layout="false" styleClass="FORM_BEN" onchange="affMode(this.value);">
									<layout:options collection="listeModeJustifPEC" property="tabcod" labelProperty="tabdta" />
								</layout:radios>							
							</td>
						</tr>
					
					<tr>
						<td colspan="3">
							&nbsp;<br>
							<div id="modeW" style="display:block">
								<table class="FORM_BEN_SUB_LEFT" style="min-width:300px;">							
								<tr>
									<th><bean:message key="tiers.facturer.file.accord"/></th>
									<td>
										<logic:equal name="PECFacturerForm" property="fichierAccordName" value="">
											<html:file property="fichierAccord" />
										</logic:equal>
										<logic:notEqual name="PECFacturerForm" property="fichierAccordName" value="">
											<layout:text key="" property="fichierAccordName" size="40" type="text" layout="false" readonly="true"/>
										</logic:notEqual>
									</td>
									<td class="ERROR"><html:errors property="fichierAccord" /></td>
								</tr>
								<tr>
									<th><bean:message key="tiers.facturer.file.ordonnance"/></th>
									<td>
										<logic:equal name="PECFacturerForm" property="fichierOrdonnanceName" value="">
											<html:file property="fichierOrdonnance" />
										</logic:equal>
										<logic:notEqual name="PECFacturerForm" property="fichierOrdonnanceName" value="">
											<layout:text key="" property="fichierOrdonnanceName" size="40" type="text" layout="false" readonly="true"/>
										</logic:notEqual>
									</td>						
									<td class="ERROR"><html:errors property="fichierOrdonnance" /></td>
								</tr>
								<tr>
									<th><bean:message key="tiers.facturer.file.facture"/></th>
									<td>
										<logic:equal name="PECFacturerForm" property="fichierFactureName" value="">
											<html:file property="fichierFacture" />
										</logic:equal>
										<logic:notEqual name="PECFacturerForm" property="fichierFactureName" value="">
											<layout:text key="" property="fichierFactureName" size="40" type="text" layout="false" readonly="true"/>
										</logic:notEqual>
									</td>
									<td class="ERROR"><html:errors property="fichierFacture" /></td>
								</tr>
					
						
							</table>
						</div>
						<div id="modeP" style="display:none;padding:7px;border: #FF0000 solid 1px;text-align:center;font-size:18px;">
							Joindre impérativement le <br><a href="<%= (String)request.getContextPath()  %>/docGenExged.do?code=BOR_FACPEC" target="_blank" style="font-size:18px;">Bordereau de demande de facturation</a><BR> à votre envoi.
						</div>
						&nbsp;	
						</td>
					</tr>
					
				</table>
			</td></tr>
		</table>
	</td></tr>
	
	<html:hidden name="PECFacturerForm" property="numPEC"/> 
	<html:hidden name="PECFacturerForm" property="idFacturation"/> 
				
	<layout:formActions>
		<layout:row>
			<layout:reset styleClass="BOUT1" value="Rétablir"/> 
			<layout:submit styleClass="BOUT1" property="submit" value="Demander la facturation de la PEC" onclick="return isClicked();"/> 
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

