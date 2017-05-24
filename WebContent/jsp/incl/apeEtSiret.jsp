
<%@ include file="/declaration/taglibs.jsp"%>


<logic:equal name="DoCheckSiret" value="O">
	<logic:notEqual name="ATT_DS0" value="EXCLUS">
		<H2>
			<div class="texteH">
				<layout:write name="entreprise" property="raisonSociale" layout="false" />
			</div>
			<div class="iconesH">
				<logic:notEqual name="ATT_DS0" value="ACTIVE">
					<div class="btn-group">
						<a href="<%=(String) request.getContextPath()%>/changementSiretNAF.do?reqCode=initForm" class="btn btn-flat btn-sm btn-default"><i class="fa fa-pencil"></i><span class="hidden-sm hidden-xs"><layout:message key="libelle.modifier" /></span></a>
					</div>
				</logic:notEqual>
			</div>
		</H2>
		<div id="EXC_PRESENT_DATA_COL_1" style="margin-top: 20px;">
		<table>
			<tr>
				<th><bean:message key="ent.liste.ape" /></th>
				<td><layout:write name="entreprise" property="numNAF" layout="false" /></td>
			</tr>
			<tr>
				<th valign="top">
					<logic:notEqual name="entreprise" property="numSIRET" value="*MULTIPLE">
						<bean:message key="ent.liste.siret" />
					</logic:notEqual>
					<logic:equal name="entreprise" property="numSIRET" value="*MULTIPLE">
						<bean:message key="ent.liste.sirets" />
					</logic:equal>
				</th>
				<td>
					<logic:notEmpty name="entreprise" property="listSiret">
						<logic:iterate id="siret" name="entreprise" property="listSiret" indexId="indSiret">
							<logic:notEqual name="indSiret" value="0">
								<br>
							</logic:notEqual>
							<layout:write name="siret" layout="false" type="siret" />						
						</logic:iterate>
					</logic:notEmpty>
				</td>
			</tr>		
		</table>
		</div>
		<br>
	</logic:notEqual>
</logic:equal>