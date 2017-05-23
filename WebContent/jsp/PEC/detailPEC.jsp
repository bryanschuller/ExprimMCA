<%@ include file="/declaration/taglibs.jsp"%>

<H1>
	<div class="texteH">
    	<layout:message key="info.tiers.pec.detail"/> 
	</div>
	<div class="iconesH">
		<a href="<%= (String)request.getContextPath()  %>/retourArriere.do<%= (null != (String)request.getAttribute("pileRequestReqParam")?(String)request.getAttribute("pileRequestReqParam"):"") %>"><html:img page="/images/RETURN.gif" alt="Retour" border="0"/></a>
	</div>
</H1> 


<br/>
<logic:present name="ActPEC">

	<div id="EXC_PRESENT_DATA_COL_1" style="margin-top:20px; margin-bottom:10px; float:left;">
		<table >
			<tr><th>Prise en charge</th><td><layout:write name="ActPECDetail" property="typePEC" type="typePEC" layout="false"/></td></tr>
			<tr><th>Du</th><td><layout:write name="ActPECDetail" property="datePrestation" type="dateYMD" layout="false"/></td></tr>
			<tr><th>Adhérent</th><td><bean:write name="ActPECDetail" property="designationAdh"/></td></tr>
			<tr><th>N° S.S. adhérent</th><td><layout:write name="ActPECDetail" property="numROAdh" layout="false"/></td></tr>			
			<tr><th>Ordonnance du</th><td><layout:write name="ActPECDetail" property="dateOrdonnance" type="dateYMD" layout="false"/></td></tr>
		</table>
	</div>
	
	<div id="EXC_PEC_RESULT">
	
		<%	String typeResultPEC = "REJ"; %>
	
		<logic:equal name="ActPECDetail" property="etat" value="A">
			<%	typeResultPEC = "OK"; %>
		</logic:equal>
		<logic:equal name="ActPECDetail" property="etat" value="F">
			<%	typeResultPEC = "OK"; %>
		</logic:equal>
		<logic:equal name="ActPECDetail" property="etat" value="L">
			<%	typeResultPEC = "OK"; %>
		</logic:equal>
	
		<% if (typeResultPEC.equals("OK")) { %>
			<div class="PEC_OK">
				<blockquote><table><tr><td>
					<html:img page="/images/paiement/check.gif" border="0" alt="Acceptée !"/>
				</td><td>
					<layout:write name="ActPECDetail" property="message" layout="false" filter="false"/>
				</td></tr>
					<tr><td>	</td><td>&nbsp;	</td></tr>
					<tr><td><html:img page="/images/run_tool.gif" border="0" alt=""/></td><td>
						<a href="<%= (String) request.getContextPath() %>/listePEC.do">Retour à la liste des prises en charge</a>
					</td></tr>
					<logic:equal name="ActPECDetail" property="isAnnulable" value="O">
						<tr><td><html:img page="/images/run_tool.gif" border="0" alt=""/></td><td>
							<a href="<%= (String) request.getContextPath() %>/annulerPEC.do?numPEC=<bean:write name="ActPEC" property="numPEC"/>">Annuler la prise en charge</a>
						</td></tr>				
					</logic:equal>
					<logic:equal name="ActPECDetail" property="isFacturable" value="O">
						<tr><td><html:img page="/images/run_tool.gif" border="0" alt=""/></td><td>
						<a href="<%= (String) request.getContextPath() %>/facturerPEC.do?numPEC=<bean:write name="ActPEC" property="numPEC"/>">Facturer la prise en charge</a>
						</td></tr>
					</logic:equal>	
					<tr><td><html:img page="/images/run_tool.gif" border="0" alt=""/></td><td>
						<a href="<%= (String) request.getContextPath() %>/imprimerPEC.do?numPEC=<bean:write name="ActPEC" property="numPEC"/>">Imprimer la prise en charge</a>
					</td></tr>
				</table></blockquote>
			</div>						   
		
		<% } else { %>
		
			<div class="PEC_REJ">
				<blockquote><table>
					<tr><td>
						<html:img page="/images/paiement/unchecked.gif" border="0" alt="Rejetée !"/>
					</td><td>
						<layout:write name="ActPECDetail" property="message" layout="false"/>
					</td></tr>
					<tr><td>	</td><td>&nbsp;	</td></tr>
					<tr><td><html:img page="/images/run_tool.gif" border="0" alt=""/></td><td>
						<a href="<%= (String) request.getContextPath() %>/listePEC.do">Retour à la liste des prises en charge</a>
					</td></tr>
					<logic:equal name="ActPECDetail" property="etat" value="R">
						<tr><td><html:img page="/images/run_tool.gif" border="0" alt=""/></td><td>
						<a href="<%= (String) request.getContextPath() %>/annulerPEC.do?numPEC=<bean:write name="ActPEC" property="numPEC"/>">Annuler la prise en charge</a>
						</td></tr>
					</logic:equal>						
				</table></blockquote>		
			</div>			
		<% } %>
	</div>
	
	<br>
	
<div class="row">
	<div class="col-xs-12">
		<div class="box box-mca-yellow">
			<p class="LIGNE_A"></p><table cellspacing="0" cellpadding="0" border="0" align="CENTER" class="LIGNE_A"><tr><td valign="top"><table cellspacing="1" cellpadding="1" border="0" width="100%">
			<tr valign="top">
				<th class="ON_LEFT"></th>
				<th class="LIGNE_A">Code LPP</th>
				<th class="LIGNE_A">Net TTC</th>
				<th class="LIGNE_A">Taux RO</th>
				<th class="LIGNE_A">Remb. RO</th>
				<th class="LIGNE_A">PEC MCA</th>
				<th class="LIGNE_A">Reste à charge</th>
				<th class="ON_RIGHT"></th>
			</tr>
				<%	String actClass = "LIGNE_A"; %>
				<logic:iterate name="ActPECDetail" property="lstLignes" id="lgnPec" >
					<%	if (actClass.equals("LIGNE_A")) {actClass = "LIGNE_B";} else {actClass = "LIGNE_A";} %>
					<tr>		
							 <logic:notEqual name="lgnPec" property="codeFormatage" value="TOTAL">
							
								<th class="ON_LEFT"><layout:write name="lgnPec" property="libNature" layout="false"/></th>
								<td class="<%= actClass %>"><layout:write name="lgnPec" property="codeLPP" layout="false"/></td>
								<td class="<%= actClass %>"><layout:write name="lgnPec" property="mntFacture" type="money" layout="false"/> &euro;</td>
								<td class="<%= actClass %>"><layout:write name="lgnPec" property="tauxRO" type="pourcent_entier" layout="false"/></td>
								<td class="<%= actClass %>"><layout:write name="lgnPec" property="rembRO" type="money" layout="false"/> &euro;</td>
								<td class="<%= actClass %>"><layout:write name="lgnPec" property="rembMut" type="money" layout="false"/> &euro;</td>
								<td class="<%= actClass %>"><layout:write name="lgnPec" property="resteACharge" type="money" layout="false"/> &euro;</td>
								<logic:equal name="lgnPec" property="codeFormatage" value="">
									<th class="ON_RIGHT"><layout:write name="lgnPec" property="message" layout="false"/></th>	
								</logic:equal>
								<logic:equal name="lgnPec" property="codeFormatage" value="PARTIEL">
									<th class="ON_RIGHT" style="color: #FF4500;"><layout:write name="lgnPec" property="message" layout="false"/></th>	
								</logic:equal>
								<logic:equal name="lgnPec" property="codeFormatage" value="ERREUR">
									<th class="ON_RIGHT" style="color: #FF0000;"><layout:write name="lgnPec" property="message" layout="false"/></th>	
								</logic:equal>
							</logic:notEqual>	
							
							<logic:equal name="lgnPec" property="codeFormatage" value="TOTAL">
							
								<th class="ON_LEFT"></th>
								<th class="TOTAL"><layout:write name="lgnPec" property="libNature" layout="false"/></th>
								<th class="TOTAL"><layout:write name="lgnPec" property="mntFacture" type="money" layout="false"/> &euro;</th>
								<th class="TOTAL"></th>
								<th class="TOTAL"><layout:write name="lgnPec" property="rembRO" type="money" layout="false"/> &euro;</th>
								<th class="TOTAL"><layout:write name="lgnPec" property="rembMut" type="money" layout="false"/> &euro;</th>
								<th class="TOTAL"><layout:write name="lgnPec" property="resteACharge" type="money" layout="false"/> &euro;</th>
								<th class="ON_RIGHT"><layout:write name="lgnPec" property="message" layout="false"/></th>	
						
							</logic:equal>
							
					</tr>
				</logic:iterate>
			</table></td></tr></table>
		</div>
	</div>
</div>

</logic:present>

<logic:notPresent name="ActPEC">
<br/><br/>
	<div class="callout callout-danger">
				
			<strong>Prise en charge non trouvée</strong>
			
	</div>
</logic:notPresent>

<br/>


