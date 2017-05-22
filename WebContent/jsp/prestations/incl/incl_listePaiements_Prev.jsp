


<logic:iterate name="lstPaiementsPrev" id="paiementPrev"  indexId="ind">
	
	<%--<div id="paieFullP<bean:write name="ind"/>" class="pay_vis" style="clear:both;"> --%>
		<div id="EXC_PRESENT_PAIEMENT">
			<div id="entete_paieP<bean:write name="ind"/>" class="pay_vis">
				<div class="headerPaie" onClick="javascript:detailPaie('P' + <bean:write name="ind"/>)">
		
					<div class="texteH">
					    <img src="<%= (String)request.getContextPath()  %>/images/Rarrow.gif" id="imageP<bean:write name="ind"/>" alt="voir le détail" border="0"/>
					  	
					  	<logic:equal name="paiementPrev" property="datePaiement" value="99999999">				  	
							Prestations en cours de traitement 
					  	</logic:equal>
					  	<logic:notEqual name="paiementPrev" property="datePaiement" value="99999999">
					  		Paiement du <layout:write name="paiementPrev" property="datePaiement" layout="false" type="dateYMD" />
					  		 de <layout:write name="paiementPrev" property="mntTotal" layout="false" type="money_euro" filter="false" />
					  	</logic:notEqual>
					  	
					  	
					</div>
					
	<%-- 				<div class="iconesH">
				        <input type="checkbox" style="cursor:pointer;"
				        title="Cocher pour inclure ce paiement dans l'impression."
				        onClick="javascript:chkImpr('P' + <bean:write name="ind"/>, event);" class="pay_vis">
				         </input>
			    	</div> --%>
				</div> 
			</div>
			
			
			<div  id="paieP<bean:write name="ind"/>" class="pay_mask">
				<div class="headerContPaie">	
					<layout:write name="paiementPrev" property="mntPaiement" layout="false" type="money_euro" filter="false" />
					remboursé par <layout:write name="paiementPrev" property="modePaiement" layout="false"/>
					sur le compte 
					<logic:notEqual name="sepaAffWeb" value="IBAN">	
						<layout:write name="paiementPrev" property="ribBanque" layout="false"/>
						<layout:write name="paiementPrev" property="ribGuichet" layout="false"/>
						<layout:write name="paiementPrev" property="ribCompte" layout="false"/>
						de <layout:write name="paiementPrev" property="ribTitulaire" layout="false"/>
					</logic:notEqual> 
					<logic:equal name="sepaAffWeb" value="IBAN">
						IBAN <layout:write name="paiementPrev" property="compteIBAN"  layout="false" type="compteIBAN"/> 	
						<logic:equal name="sepaAffBIC" value="O">
							/ BIC <layout:write name="paiementPrev" property="codeBIC"  layout="false" /> 
						</logic:equal>
						de <layout:write name="paiementPrev" property="titulaireLong"  layout="false" />
					</logic:equal>
					<BR>
					
					<logic:iterate name="paiementPrev" property="listePaiements" id="listePaiements">
						<layout:write name="listePaiements" property="mntPaiement" layout="false" type="money_euro" filter="false" />
						remboursé à <layout:write name="listePaiements" property="destinataire" layout="false"/>
						<BR>				
					</logic:iterate>
					
				</div>	
				<div id="EXC_PRESENT_DATA_1">
				
					<layout:collection name="paiementPrev" id="listeSoins" title="" property="listePrestations" styleClass="LIGNE_A" styleClass2="LIGNE_B"  >
					  				 
						<layout:collectionItem title="paie.benef.soins" property="nomBenef" style="text-align:left;"/>
						<layout:collectionItem title="paie.garantie" property="libGarantie" style="text-align:left;"/>
						<layout:collectionItem title="paie.presta.du" property="prestaDu" style="text-align:right;" type="dateYMD"/>
						<layout:collectionItem title="paie.presta.au" property="prestaAu" style="text-align:right;" type="dateYMD"/>
						<layout:collectionItem title="paie.montant.presta" property="mntPresta" style="text-align:right;" type="money"/>
						<layout:collectionItem title="Situation Administrative" property="libSituAdmin" style="text-align:left;"/> 
						<layout:collectionItem title="paie.presta.du" property="situDu" style="text-align:right;" type="dateYMD"/>
						<layout:collectionItem title="paie.presta.au" property="situAu" style="text-align:right;" type="dateYMD"/>
					
					</layout:collection>
							
				</div>
			</div>
			<div>
				<hr id="sep_P<bean:write name="ind"/>" class="pay_mask" size=2 width=250 align="center">
			</div>
			
			
		</div>
	<%--</div> --%>
</logic:iterate>


<script>

document.getElementById("paieP0").className = "pay_vis";
document.getElementById('imageP0').src = "<%= (String)request.getContextPath()  %>/images/Darrow.gif";

</script>


