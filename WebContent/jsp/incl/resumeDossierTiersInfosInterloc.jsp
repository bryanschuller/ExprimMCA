<%@ include file="/declaration/taglibs.jsp"%>

<logic:present name="InfoInterloc" scope="session">
	<div class="box box-mca-yellow">
		<div class="box-header with-border">
			<h3 class="box-title">
				<bean:message key="info.ent.interlocuteur" />
			</h3>
			<div class="box-tools pull-right" data-toggle="tooltip" title data-original-title="<layout:message key="libelle.modifier" />">
				<div class="btn-group">
					<a href="<%=(String) request.getContextPath()%>/modifierInfoInterlocuteur.do?action=initForm" class="btn btn-flat btn-sm btn-default"><i class="fa fa-pencil"> </i><span class="hidden-sm hidden-xs"><layout:message key="libelle.modifier" /> </span></a>
				</div>
			</div>
		</div>
		<div class="box-body">
			<div class="row">
				<div class="col-xs-12">
					<div class="row">
						<div class="col-xs-12 col-md-6">
							<label><bean:message key="info.interloc.nom.prenom" /></label>
						</div>
						<div class="col-xs-12 col-md-6">
							<layout:write name="InfoInterloc" property="nom" layout="false" />
						</div>
					</div>
					<div class="row">
						<div class="col-xs-12 col-md-6">
							<label><bean:message key="info.interloc.fonction" /></label>
						</div>
						<div class="col-xs-12 col-md-6">
							<layout:write name="InfoInterloc" property="fonction" layout="false"/>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</logic:present>