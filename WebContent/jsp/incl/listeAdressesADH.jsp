<%@ include file="/declaration/taglibs.jsp"%>


<logic:notEmpty name="lAdresse">
	<div class="row">
		<div class="col-xs-12">
			<div class="box box-mca-yellow">
				<div class="box-header with-border">
					<h3 class="box-title">
						<bean:message key="adherent.principale.coord" />
					</h3>
				</div>
				<div class="box-body">
					<layout:collection name="lAdresse" id="adresse" title="" styleClass="LIGNE_A" styleClass2="LIGNE_B" >
						<layout:collectionItem title="Adresse">
							<bean:write name="adresse" property="adresse1"/>
							<logic:notEmpty name="adresse" property="adresse2">
								<br>
								<bean:write name="adresse" property="adresse2"/>
							</logic:notEmpty>
							<logic:notEmpty name="adresse" property="adresse3">
								<br>
								<bean:write name="adresse" property="adresse3"/>
							</logic:notEmpty>
						</layout:collectionItem> 
						
						<layout:collectionItem title="Code Postal" property="codePostal"/>
						<layout:collectionItem title="Ville" property="ville"/>
						<layout:collectionItem title="Du" property="effetAdresse" type="dateYMD" width="90px"/>
						<layout:collectionItem title="Au" property="finAdresse" type="dateYMD" width="90px"/>
						
						
						<layout:collectionItem title="&nbsp;">
							<logic:equal name="adresse" property="adrTop" value="OUI">
								<div class="btn-group">
									<a href="<%= (String)request.getContextPath()  %>/semiModifAdresse.do?id=<bean:write name="adresse" property="index"/>" class="btn btn-flat btn-sm btn-default"><i class="fa fa-pencil"></i><span class="hidden-sm hidden-xs"><layout:message key="libelle.modifier" /></span></a>
								</div>

								<logic:notEqual name="adresse" property="dateModifDemande" value="0">
									<br>
									<span class="EXC_TEXTE_MODIF_DEMANDE">(Dem. au : <layout:write name="adresse" property="dateModifDemande" type="dateYMD" />)</span>
								</logic:notEqual>
							</logic:equal>
						</layout:collectionItem>
					</layout:collection>
				</div>
			</div>
		</div>
	</div>
</logic:notEmpty>