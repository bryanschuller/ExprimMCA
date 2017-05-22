<%@ include file="/declaration/taglibs.jsp"%>


<H2>
	<div class="texteH">Vos remboursements de prestations</div>
	<%-- <div class="iconesH">
		<a href="<%= (String)request.getContextPath()  %>/listeDocuments.do?tab=4">Télécharger vos décomptes de prestations</a>
	</div>	--%>
</H2>
<div style="margin: 20px 50px 0px 50px;">
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
				<div class="texteH">
					Prestations réglées par virement (RIB non consultable)
				</div>			
			</H3>
		</logic:notPresent>
		<logic:present name="banquePresta" scope="request">	
		<H3>
			<div class="texteH">
					Prestations réglées par virement sur le compte ci-dessous
			</div>					
			<div class="iconesH"></div>
		</H3>
		<div id="EXC_PRESENT_DATA_1" style="margin-top:20px;">
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
<br>
