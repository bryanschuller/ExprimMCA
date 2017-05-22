<%@ include file="/declaration/taglibs.jsp"%>

<logic:present name="InfoInterloc" scope="session">

<H2>
	<div class="texteH"><bean:message key="info.ent.interlocuteur" />
	</div>
	<div class="iconesH">
	<a href="<%=(String) request.getContextPath()%>/modifierInfoInterlocuteur.do?action=initForm"><layout:message key="libelle.modifier" /></a>
	</div>
</H2>

	<div id="EXC_PRESENT_DATA_COL_1" style="margin-top: 20px;">

	<table>
		<tr>
			<th><bean:message key="info.interloc.nom.prenom" /></th>
			<td><layout:write name="InfoInterloc"
				property="nom" layout="false" /></td>
				
		</tr>
		<tr>
			<th><bean:message key="info.interloc.fonction" /></th>
			<td><layout:write name="InfoInterloc"
				property="fonction" layout="false"/></td>
		</tr>
		
	</table>
	</div>
	<br>
	
</logic:present>