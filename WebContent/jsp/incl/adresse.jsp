
<%@ include file="/declaration/taglibs.jsp"%>


<logic:present name="adresse" scope="request">
	<div class="box box-mca-yellow">
		<div class="box-header with-border">
			<h3 class="box-title">
				<i class="fa fa-envelope-square"></i>
				<bean:message key="adherent.principale.coord" />
			</h3>
			<logic:notEqual name="dossierActuel" property="typeDossier" value="ENT">
				<div class="box-tools pull-right" data-toggle="tooltip" title data-original-title="<layout:message key="libelle.modifier" />">
					<logic:notEqual name="adresse" property="dateModifDemande" value="0">
						<span class="EXC_TEXTE_MODIF_DEMANDE">(Modification demandée au : <layout:write name="adresse" property="dateModifDemande" type="dateYMD" />)</span>
					</logic:notEqual>
					<div class="btn-group">
						<a href="<%=(String) request.getContextPath()%>/semiModifAdresse.do?id=<bean:write name="adresse" property="index"/>" class="btn btn-flat btn-sm btn-default"><i class="fa fa-pencil"> </i><span class="hidden-sm hidden-xs"><layout:message key="libelle.modifier" /> </span></a>
					</div>
				</div>
			</logic:notEqual>
		</div>
		<div class="box-body">
			<div class="row">
				<div class="col-xs-12">
					<div class="row">
						<div class="col-xs-12 col-md-6">
							<label><bean:message key="info.adh.adresse.destinataire" /></label>
						</div>
						<div class="col-xs-12 col-md-6">
							<layout:write name="adresse" property="destinataire" layout="false" />
						</div>
					</div>
					<div class="row">
						<div class="col-xs-12 col-md-6">
							<label><bean:message key="info.adh.adresse" /></label>
						</div>
						<div class="col-xs-12 col-md-6">
							<layout:write name="adresse" property="adresse1" layout="false" /> <br>
							<layout:write name="adresse" property="adresse2" layout="false" /> <br>
							<layout:write name="adresse" property="adresse3" layout="false" />
						</div>
					</div>
					<div class="row">
						<div class="col-xs-12 col-md-6">
							<label><bean:message key="info.adh.ville" /></label>
						</div>
						<div class="col-xs-12 col-md-6">
							<layout:write name="adresse" property="codePostal" layout="false" /> &nbsp; <layout:write name="adresse" property="ville" layout="false" />
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</logic:present>