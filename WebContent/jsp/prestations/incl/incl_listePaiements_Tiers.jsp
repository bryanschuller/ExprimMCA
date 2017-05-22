


<logic:iterate name="lstPaiementsTiers" id="paiementTiers"  indexId="ind">
	
	<div id="paieFullT<bean:write name="ind"/>" class="pay_vis" style="clear:both;">
		<div id="EXC_PRESENT_PAIEMENT">
			<div id="entete_paieT<bean:write name="ind"/>" class="pay_vis">
				<div class="headerPaie" onClick="javascript:detailPaie('T' + <bean:write name="ind"/>)">
		
					<div class="texteH">
					    <img src="<%= (String)request.getContextPath()  %>/images/Rarrow.gif" id="imageT<bean:write name="ind"/>" alt="voir le détail" border="0"/>
					  	Réglement de <layout:write name="paiementTiers" property="MNT_TOTAL" type="money" layout="false"/> &euro; 
					  	à <bean:write name="paiementTiers" property="TIERS_NOM"/>
					</div>
					
	 				<div class="iconesH">
				        <input type="checkbox" style="cursor:pointer;"
				        title="Cocher pour inclure ce paiement dans l'impression."
				        onClick="javascript:chkImpr('T' + <bean:write name="ind"/>, event);" class="pay_vis">
				         </input>
			    	</div> 
				</div> 
			</div>
		
		
			<div  id="paieT<bean:write name="ind"/>" class="pay_mask">
				<div class="headerContPaie">		
					N° Facture : <bean:write name="paiementTiers" property="NUM_FACTURE"/> Traité le <bean:write name="paiementTiers" property="DATE_ETAT"/> par la MCA.
				</div>	
				<div class="row">
					<div class="col-xs-12">
						<div class="box box-mca-yellow">
				
							<layout:collection name="paiementTiers" id="listeSoins" title="" property="soins" styleClass="LIGNE_A" styleClass2="LIGNE_B"  >
							  				 
								<layout:collectionItem title="paie.benef.soins" property="nomPrenom" style="text-align:left;"/>
								<layout:collectionItem title="paie.nature" property="act" style="text-align:left;"/>
								<layout:collectionItem title="paie.date" property="dateSoin" style="text-align:left;"/>
								<layout:collectionItem title="paie.honoraire" property="hono" style="text-align:right;" type="money"/>
								<layout:collectionItem title="paie.base" property="base" style="text-align:right;" type="money"/>
								<layout:collectionItem title="paie.taux" property="taux" style="text-align:right;" type="pourcent_entier"/> 
								<layout:collectionItem title="remb.regl.ss" property="rbSecu" style="text-align:right;" type="money"/>
								<layout:collectionItem title="remb.regl.mut" property="rbMut" style="text-align:right;" type="money"/>
							
							</layout:collection>
						</div>
					</div>
				</div>
			</div>
			<%--	<div>
				<hr id="sep_T<bean:write name="ind"/>" class="pay_mask" size=2 width=250 align="center">
			</div>	--%>
		</div>
	</div>
</logic:iterate>

<script>

document.getElementById("paieT0").className = "pay_vis";
document.getElementById('imageT0').src = "<%= (String)request.getContextPath()  %>/images/Darrow.gif";

</script>


