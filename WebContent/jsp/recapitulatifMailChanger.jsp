<%@ include file="/declaration/taglibs.jsp"%>

<div id="ADRESSEADH" style="margin-top:20px;">
		<table class="CORPS_ADRESSE" >
			<tr>
				<th valign="top" >
					<bean:message key="info.adh.adresse" />
				</th>
				<td>
					<layout:write name="adresse" property="adresse1" layout="false" />
					<br>

					<layout:write name="adresse" property="adresse2" layout="false" />
					<br>

					<layout:write name="adresse" property="adresse3" layout="false" />
				</td>
			</tr>
			<tr>
				<th>
					<bean:message key="info.adh.ville" />
				</th>
				<td>
					<layout:write name="adresse" property="codePostal" layout="false" />
					&nbsp;
					<layout:write name="adresse" property="ville" layout="false" />
				</td>
			</tr>
		</table>
</div>

