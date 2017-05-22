
<%@ include file="/declaration/taglibs.jsp"%>


<logic:present name="adresse" scope="request">
	<H2>
	<div class="texteH"><bean:message key="adherent.principale.coord" />
	</div>
	<div class="iconesH">
		<logic:notEqual name="dossierActuel" property="typeDossier" value="ENT">
			<logic:notEqual name="adresse" property="dateModifDemande" value="0">
				<span class="EXC_TEXTE_MODIF_DEMANDE">(Modification demandée au : <layout:write name="adresse" property="dateModifDemande" type="dateYMD" />)</span>
			</logic:notEqual>
			<a href="<%=(String) request.getContextPath()%>/semiModifAdresse.do?id=<bean:write name="adresse" property="index"/>">
				<layout:message key="libelle.modifier" /> 
			</a>
		</logic:notEqual>		
	</div>
	</H2>
	<div id="EXC_PRESENT_DATA_COL_1" style="margin-top: 20px;">
	<table>
		<tr>
			<th><bean:message key="info.adh.adresse.destinataire" /></th>
			<td><layout:write name="adresse" property="destinataire"
				layout="false" /></td>
		</tr>
		<tr>
			<th valign="top"><bean:message key="info.adh.adresse" /></th>
			<td><layout:write name="adresse" property="adresse1"
				layout="false" /> <br>

			<layout:write name="adresse" property="adresse2" layout="false" /> <br>

			<layout:write name="adresse" property="adresse3" layout="false" /></td>
		</tr>
		<tr>
			<th><bean:message key="info.adh.ville" /></th>
			<td><layout:write name="adresse" property="codePostal"
				layout="false" /> &nbsp; <layout:write name="adresse"
				property="ville" layout="false" /></td>
		</tr>
	</table>
	</div>
	<br>
</logic:present>