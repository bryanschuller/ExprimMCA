
<%@ include file="/declaration/taglibs.jsp"%>

<logic:present name="InfoInterloc" scope="session">
	<H2>
	<div class="texteH"><bean:message
		key="adherent.principale.interlo" /></div>

	</H2>
	<div id="EXC_PRESENT_DATA_COL_1" style="margin-top: 20px;">

	<table>
		<tr>
			<th><bean:message key="info.interloc.tel" /></th>
			<td style="width: 150px;"><layout:write name="InfoInterloc"
				property="telephone" layout="false"  type="numPhone"/></td>
			<td rowspan="3" style="width: 90px;"><a
				href="<%=(String) request.getContextPath()%>/changementTelephone.do?action=initForm">
			<layout:message key="libelle.modifier" /> </a></td>
		</tr>
		<tr>
			<th><bean:message key="info.interloc.mobile" /></th>
			<td style="width: 150px;"><layout:write name="InfoInterloc"
				property="telephonePortable" layout="false" type="numPhone"/></td>
		</tr>
		<tr>
			<th><bean:message key="info.interloc.telpro" /></th>
			<td style="width: 150px;"><layout:write name="InfoInterloc"
				property="telephoneProfessionnel" layout="false"  type="numPhone"/></td>
		</tr>
		<tr>
			<th><bean:message key="info.adh.mail" /></th>
			<td style="width: 150px;">
				<layout:write name="InfoInterloc" property="adresseMail" layout="false" />
				
			</td>
			<logic:notEqual name="nftActive" value="O">
				<td style="width: 90px;"><a
					href="<%=(String) request.getContextPath()%>/loadAllEmails.do?type=Change">
				<layout:message key="libelle.modifier" /> </a></td>
			</logic:notEqual>
			<logic:equal name="nftActive" value="O">
				<td style="width: 90px;" rowspan="2" ><a
					href="<%=(String) request.getContextPath()%>/loadAllEmails.do?type=Change">
				<layout:message key="libelle.modifier" /> </a></td>
			</logic:equal>
		</tr>
		<logic:equal name="nftActive" value="O">
			<tr>
				<th><bean:message key="info.adh.mail.notification" /></th>
				<td style="width: 150px;">
					<logic:equal name="InfoInterloc" property="notifMail" value="INEXISTS">
						Indéfini
					</logic:equal>
					<logic:notEqual name="InfoInterloc" property="notifMail" value="INEXISTS">
						<logic:equal name="InfoInterloc" property="notifMail" value="VALIDE">
							Notifications accéptées
						</logic:equal>
						<logic:notEqual name="InfoInterloc" property="notifMail" value="VALIDE">
							Notifications refusées
						</logic:notEqual>
					</logic:notEqual>
				</td>
			</tr>
		</logic:equal>
	</table>
	<br>
	<span style="font-size:11px">La MCA s'engage à ne pas divulguer les informations vous concernant.</span>
	</div>
	<br>

</logic:present>