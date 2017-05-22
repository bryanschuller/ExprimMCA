<%@ include file="/declaration/taglibs.jsp"%>



<logic:present name="bqeTiers" scope="request">
	<H2>
		<div class="texteH">
		<bean:message key="tiers.banque" />
		</div>
	</H2>

	<div class="row">
		<div class="col-xs-12">
			<div class="box box-mca-yellow">
				<layout:collection name="bqeTiers" id="bqeTiers" title=""
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
						<layout:collectionItem title="N� Compte" property="numCompte"/>
						<layout:collectionItem title="Titulaire" property="titulaire"/>
					</logic:notEqual>	
		
					<layout:collectionItem title="Du" property="effetBanque" type="dateYMD" width="90px"/>
					<layout:collectionItem title="Au" property="finBanque" type="dateYMD" width="90px"/>
					<layout:collectionItem title="&nbsp;">
						<a href="<%= (String)request.getContextPath()  %>/semiModifBanque.do?id=<bean:write name="bqeTiers" property="index"/>"><layout:message key="libelle.modifier" /></a>
						<logic:notEqual name="bqeTiers" property="dateModifDemande" value="0">
							<br>
							<span class="EXC_TEXTE_MODIF_DEMANDE">(Dem. au : <layout:write name="bqeTiers" property="dateModifDemande" type="dateYMD" />)</span>
						</logic:notEqual>
					</layout:collectionItem>
					
					
				</layout:collection>
			</div>
		</div>
	</div>					
</logic:present>			