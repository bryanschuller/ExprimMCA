<%@ include file="/declaration/taglibs.jsp"%>

<logic:present name="adresse" scope="request">

<H2>
	<div class="texteH"><bean:message key="tiers.principale.coordonnees" />
	</div>
</H2>

	<div id="EXC_PRESENT_DATA_COL_1" style="margin-top: 20px;">
	<table>
		<tr>
			<th><bean:message key="tiers.adresse.principale" /></th>
			<td><layout:write name="adresse" property="destinataire"
				layout="false" /></td>
		</tr>
		<tr>
			<th><bean:message key="tiers.adresse.ville" /></th>
			<td><layout:write name="adresse" property="codePostal"
				layout="false" /> &nbsp; <layout:write name="adresse"
				property="ville" layout="false" /></td>
		</tr>
	</table>
	</div>
	
</logic:present>