<%@ include file="/declaration/taglibs.jsp"%>

<div class="box box-mca-yellow">
	<div class="box-header with-border">
		<h3 class="box-title">
			Vos remboursements de prestations
		</h3>
	</div>
<div class="box-body">
	<div>		
		<a href="<%= (String)request.getContextPath()  %>/viewPaiements.do">Consultez l'historique de vos prestations. </a>
	</div>
	<logic:equal name="contrat" property="modeReglPresta" value="C">
		<H3>
			<div class="texteH">
				Prestations réglées par chèque
			</div>
		</H3>
	</logic:equal>
	<logic:equal name="contrat" property="modeReglPresta" value="V">	
		<logic:notPresent name="banquePresta" scope="request">	
			<H3>
				Prestations réglées par virement (RIB non consultable)
			</H3>
		</logic:notPresent>
		<logic:present name="banquePresta" scope="request">	
			<H3>
				Prestations réglées par virement sur le compte ci-dessous
			</H3>
			<div>
				<layout:collection name="banquePresta" id="banquePresta" title=""
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
						<a href="<%= (String)request.getContextPath()  %>/semiModifBanque.do?id=<bean:write name="banquePresta" property="index"/>"><layout:message key="libelle.modifier" /></a>
						<logic:notEqual name="banquePresta" property="dateModifDemande" value="0">
					<br>
					<span class="EXC_TEXTE_MODIF_DEMANDE">(Dem. au : <layout:write name="banquePresta" property="dateModifDemande" type="dateYMD" />)</span>
					</logic:notEqual>
					</layout:collectionItem>
				</layout:collection>
			</div>
		</logic:present>
	</logic:equal>
</div>