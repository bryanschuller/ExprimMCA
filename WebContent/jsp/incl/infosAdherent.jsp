<%@ include file="/declaration/taglibs.jsp"%>




<H2>
	<div class="texteH">
	<logic:equal name="adherent" property="rangBenef" value="0">
		Adh�rent
	</logic:equal>
	<logic:greaterThan name="adherent" property="rangBenef" value="0">
		B�n�ficiaire
	</logic:greaterThan>
	</div>					
</H2>
<div id="EXC_PRESENT_DATA_COL_1" style="margin-top:20px;">
		<table >
			<tr><th>Nom</th><td><bean:write name="adherent" property="nomPrenom"/></td></tr>
			<tr><th>N� le</th><td><layout:write name="adherent" property="dateNaissance" type="dateYMD" layout="false"/></td></tr>
			<tr><th>N� S�curit� Sociale</th><td><layout:write name="adherent" property="numRO" type="numSS" layout="false"/></td></tr>
			<tr><th>R�gime obligatoire</th><td><bean:write name="adherent" property="regObligA"/></td></tr>
			<tr><th>T�l�transmission</th><td><bean:write name="adherent" property="libCPAM"/></td></tr>
		</table>
</div>
<br>