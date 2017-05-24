<%@ include file="/declaration/taglibs.jsp"%>

<logic:present name="adresse" scope="request">

	<div class="box box-mca-yellow">
		<div class="box-header with-border">
			<h3 class="box-title">
				<i class="fa fa-envelope-square"></i>
				<bean:message key="tiers.principale.coordonnees" />
			</h3>
		</div>
		<div class="box-body">
			<div class="row">
				<div class="col-xs-12">
					<div class="row">
						<div class="col-xs-12 col-md-6">
							<label><bean:message key="tiers.adresse.principale"/></label>
						</div>
						<div class="col-xs-12 col-md-6">
							<layout:write name="adresse" property="destinataire" layout="false" />
						</div>
					</div>
					<div class="row">
						<div class="col-xs-12 col-md-6">
							<label><bean:message key="tiers.adresse.ville" /></label>
						</div>
						<div class="col-xs-12 col-md-6">
							<layout:write name="adresse" property="codePostal" layout="false" /> &nbsp;<layout:write name="adresse" property="ville" layout="false" />
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</logic:present>