<%@ include file="/declaration/taglibs.jsp"%>

<logic:notEqual name="contrat" property="typeAppelCot" value="I">
	<logic:notEqual name="contrat" property="typeAppelCot" value="M">
	<H2>
		<div class="texteH">Vos cotisations</div>
		
	</H2>
	
	
		<div id="EXC_MESSAGE" style="margin-top:0px;">
			<strong>
				<li> Vos cotisations sont réglées via votre employeur.</li>
			</strong> 
		</div><br style="clear:both;">
	</logic:notEqual>
	
<%-- 	<logic:equal name="contrat" property="typeAppelCot" value="M">
		<div id="EXC_MESSAGE" style="margin-top:0px;">
			<strong>
				<li> Vos cotisations sont réglées en partie via votre employeur.</li>
			</strong> 
		</div><br style="clear:both;">
	</logic:equal> --%>
	
	
</logic:notEqual>

<logic:equal name="contrat" property="typeAppelCot" value="I">
	<H2>
		<div class="texteH">
			Vos cotisations
		</div>	
<%-- 	<div class="iconesH">
			<a href="<%= (String)request.getContextPath()  %>/listeDocuments.do?tab=3">Télécharger vos appels de cotisation</a>
		</div> --%>
	</H2>
	
	<div style="margin: 20px 50px 0px 50px;">
	<div class="EXC_TEXTE">
			Vous avez choisi le 
			<logic:equal name="contrat" property="modeRgltCot" value="P">prélèvement</logic:equal>
			<logic:equal name="contrat" property="modeRgltCot" value="C">paiement par chèque</logic:equal>
			<logic:equal name="contrat" property="modeRgltCot" value="E">paiement en espèce</logic:equal>
			
			<logic:equal name="contrat" property="periodiciteCot" value="A">annuel</logic:equal>
			<logic:equal name="contrat" property="periodiciteCot" value="M">mensuel</logic:equal>
			<logic:equal name="contrat" property="periodiciteCot" value="S">semestriel</logic:equal>
			<logic:equal name="contrat" property="periodiciteCot" value="T">trimestriel</logic:equal>
			<logic:equal name="contrat" property="periodiciteCot" value="U">en prime unique</logic:equal>
			
<%--			 pour un montant de <layout:write name="contrat" property="mntCot" layout="false" type="money"/> &euro; --%>
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
				<H3>
					<div class="texteH">
						Votre RIB de prélèvement
					</div>					
					<div class="iconesH">					
					</div>
				</H3>					
				<div class="row">
					<div class="col-xs-12">
						<div class="box box-mca-yellow">
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
								<a href="<%= (String)request.getContextPath()  %>/documentServe.do?code=docAutPrel" target="_blank"><layout:message key="libelle.modifier" /></a>
							</layout:collectionItem>
							
						</layout:collection>
					</div>
				</div>	
			</logic:present>			
		</logic:equal>
	</div>
	<br>
</logic:equal>

