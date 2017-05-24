<%@ include file="/declaration/taglibs.jsp"%>

<logic:notEmpty name="lBanque">
	<div class="row">
		<div class="col-xs-12">
			<div class="box box-mca-yellow">
				<div class="box-header with-border">
					<h3 class="box-title">
						<bean:message key="adherent.principale.banque" />
					</h3>
				</div>
				<div class="box-body">
					<layout:collection name="lBanque" id="banque" title=""styleClass="LIGNE_A" styleClass2="LIGNE_B" >
						<layout:collectionItem title="Type d'utilisation" property="typeUsed" type="type_banque"/>
						<logic:equal name="sepaAffWeb" value="IBAN">
							<layout:collectionItem title="Compte IBAN" property="compteIBAN" type="compteIBAN" width="250px"/>	
							<logic:equal name="sepaAffBIC" value="O">
								<layout:collectionItem title="Code BIC" property="codeBIC"/>
							</logic:equal>		
							<layout:collectionItem title="Titulaire" property="titulaireLong"/>
						</logic:equal>		
						<logic:notEqual name="sepaAffWeb" value="IBAN">
							<layout:collectionItem title="Banque" property="codeBanque"/>			
							<layout:collectionItem title="Guichet" property="codeGuichet"/>
							<layout:collectionItem title="N° Compte" property="numCompte"/>
							<layout:collectionItem title="Titulaire" property="titulaire"/>
						</logic:notEqual>	
						<layout:collectionItem title="Du" property="effetBanque" type="dateYMD" width="90px"/>
						<layout:collectionItem title="Au" property="finBanque" type="dateYMD" width="90px"/>
						<layout:collectionItem title="&nbsp;&nbsp;&nbsp;&nbsp;">
							<logic:equal name="banque" property="bqeTop" value="OUI">
								<logic:equal name="banque" value="P" property="typeUsed">
									<div class="btn-group">
										<a href="<%= (String)request.getContextPath()  %>/semiModifBanque.do?id=<bean:write name="banque" property="index"/>" class="btn btn-flat btn-sm btn-default"><i class="fa fa-pencil"></i><span class="hidden-sm hidden-xs"><layout:message key="libelle.modifier" /></span></a>
									</div>
									<logic:notEqual name="banque" property="dateModifDemande" value="0">
										<br>
										<span class="EXC_TEXTE_MODIF_DEMANDE">(Dem. au : <layout:write name="banque" property="dateModifDemande" type="dateYMD" />)</span>
									</logic:notEqual>
								</logic:equal>
								<logic:equal name="banque" value="C" property="typeUsed">
									<div class="btn-group">
										<a href="<%= (String)request.getContextPath()  %>/documentServe.do?code=docAutPrel" class="btn btn-flat btn-sm btn-default" target="_blank"><i class="fa fa-pencil"></i><span class="hidden-sm hidden-xs"><layout:message key="libelle.modifier" /></span></a>
									</div>
								</logic:equal>	
							</logic:equal>			
						</layout:collectionItem>
					</layout:collection>
				</div>
			</div>
		</div>
	</div>
</logic:notEmpty>