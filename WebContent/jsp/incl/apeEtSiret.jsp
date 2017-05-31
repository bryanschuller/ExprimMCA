
<%@ include file="/declaration/taglibs.jsp"%>


<logic:equal name="DoCheckSiret" value="O">
	<logic:notEqual name="ATT_DS0" value="EXCLUS">

		<div class="box box-mca-yellow">
			<div class="box-header with-border">
				<h3 class="box-title"><layout:write name="entreprise" property="raisonSociale" layout="false" /></h3>

				<div class="box-tools pull-right" data-toggle="tooltip" title data-original-title="<layout:message key="libelle.modifier" />">
					<div class="btn-group">
						<a href="<%=(String) request.getContextPath()%>/changementSiretNAF.do?reqCode=initForm" class="btn btn-flat btn-sm btn-default"><i class="fa fa-pencil"></i><span class="hidden-sm hidden-xs"><layout:message key="libelle.modifier" /></span></a>
					</div>
				</div>
			</div>

			<div class="box-body">
				<div class="row">
					<div class="col-xs-12 col-md-6">
						<label><bean:message key="ent.liste.ape" /></label>
					</div>
					<div class="col-xs-12 col-md-6">
						<layout:write name="entreprise" property="numNAF" layout="false" />
					</div>
				</div>
				<div class="row">
					<div class="col-xs-12 col-md-6">
						<label>
							<logic:notEqual name="entreprise" property="numSIRET" value="*MULTIPLE">
								<bean:message key="ent.liste.siret" />
							</logic:notEqual>
							<logic:equal name="entreprise" property="numSIRET" value="*MULTIPLE">
								<bean:message key="ent.liste.sirets" />
							</logic:equal>
						</label>
					</div>
					<div class="col-xs-12 col-md-6">
						<logic:notEmpty name="entreprise" property="listSiret">
							<logic:iterate id="siret" name="entreprise" property="listSiret" indexId="indSiret">
								<logic:notEqual name="indSiret" value="0">
									<br>
								</logic:notEqual>
								<layout:write name="siret" layout="false" type="siret" />						
							</logic:iterate>
						</logic:notEmpty>
					</div>
				</div>
			</div>
		</div>
	</logic:notEqual>
</logic:equal>