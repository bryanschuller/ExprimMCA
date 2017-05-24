<%@ include file="/declaration/taglibs.jsp"%>

<logic:notEqual name="contrat" property="typeAppelCot" value="I">
	<logic:notEqual name="contrat" property="typeAppelCot" value="M">
		<div class="box box-mca-yellow">
			<div class="box-header with-border">
				<h3 class="box-title">
					Vos cotisations
				</h3>
			</div>
			<div class="box-body">
				Vos cotisations sont réglées via votre employeur.
			</div>
		</div>
	</logic:notEqual>
</logic:notEqual>

<logic:equal name="contrat" property="typeAppelCot" value="I">
	<div class="box box-mca-yellow">
		<div class="box-header with-border">
			<h3 class="box-title">
				Vos cotisations
			</h3>
		</div>
		<div class="box-body">
			<div>
				Vous avez choisi le 
				<logic:equal name="contrat" property="modeRgltCot" value="P">prélèvement</logic:equal>
				<logic:equal name="contrat" property="modeRgltCot" value="C">paiement par chèque</logic:equal>
				<logic:equal name="contrat" property="modeRgltCot" value="E">paiement en espèce</logic:equal>
				
				<logic:equal name="contrat" property="periodiciteCot" value="A">annuel</logic:equal>
				<logic:equal name="contrat" property="periodiciteCot" value="M">mensuel</logic:equal>
				<logic:equal name="contrat" property="periodiciteCot" value="S">semestriel</logic:equal>
				<logic:equal name="contrat" property="periodiciteCot" value="T">trimestriel</logic:equal>
				<logic:equal name="contrat" property="periodiciteCot" value="U">en prime unique</logic:equal>
			</div>
			<logic:equal name="contrat" property="modeRgltCot" value="P">
				<logic:notPresent name="banqueCotis" scope="request">
					<H3>
						<div class="texteH">
							Vous n'êtes pas autorisé à consulter le RIB de prélèvement
						</div>	
					</H3>	
				</logic:notPresent>	
				<logic:present name="banqueCotis" scope="request">
					<div class="row">
						<div class="col-xs-12">
							<div class="box box-mca-yellow">
								<div class="box-header with-border">
									<h3 class="box-title">
										Votre RIB de prélèvement
									</h3>
								</div>
								<div class="box-body">
									<layout:collection name="banqueCotis" id="banqueCotis" title=""
										styleClass="LIGNE_A" styleClass2="LIGNE_B" >
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
										<layout:collectionItem title="&nbsp;">
											<div class="btn-group">
												<a href="<%= (String)request.getContextPath()  %>/documentServe.do?code=docAutPrel" class="btn btn-flat btn-sm btn-default" target="_blank"><i class="fa fa-pencil"></i><span class="hidden-sm hidden-xs"><layout:message key="libelle.modifier" /></span></a>
											</div>
										</layout:collectionItem>
									</layout:collection>
								</div>
							</div>
						</div>
					</div>	
				</logic:present>			
			</logic:equal>
		</div>
	</div>
</logic:equal>

