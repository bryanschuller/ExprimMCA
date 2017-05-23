

<%
 if(((Vector)request.getAttribute("lstPaiementsEff")).size() > 0 )
 {
 %> 
<logic:iterate name="lstPaiementsEff" id="paiementEff"  indexId="ind">
 
 	<div id="paieFullE<bean:write name="ind"/>" class="pay_vis" style="clear:both;">
		<div id="EXC_PRESENT_PAIEMENT">
			<!--  EN TETE DU PAIEMENT -->
			<div id="entete_paieE<bean:write name="ind"/>" class="pay_vis">
				<div class="headerPaie" onClick="javascript:detailPaie('E' + <bean:write name="ind"/>)">
									
					<div class="texteH" >
					    <img src="<%= (String)request.getContextPath()  %>/images/Rarrow.gif" id="imageE<bean:write name="ind"/>" alt="voir le détail" border="0"/>
				    	
				    	<bean:message key="paie.paiement"/>
					  	<bean:write name="paiementEff" property="DATEPAIE"/>
						de <layout:write name="paiementEff" property="MNTPAIE"   type="money" layout="false" /> &euro;
					</div>
						
					<div class="iconesH">
				        <input type="checkbox" style="cursor:pointer; " 
				        title="Cocher pour inclure ce paiement dans l'impression."
				        onClick="javascript:chkImpr('E' + <bean:write name="ind"/>, event);" class="pay_vis">
				         </input>
			    	</div> 
				
				</div>
			</div>
			
			
			<!-- CONTENU UN PAIEMENT  --> 
			<div id="paieE<bean:write name="ind"/>" class="pay_mask">
				<!-- Libellé infos banque -->
				<div class="headerContPaie">
					<bean:message key="paie.rembourse"/> <layout:write name="paiementEff" property="TYPEPAIE"  layout="false" />
					
					<logic:notEqual name="paiementEff" property="TYPEPAIE" value="Lettre chèque">
					<bean:message key="paie.compte"/> 
					<logic:notEqual name="paiementEff" property="BANQUE" value="MASK">
						<logic:notEqual name="sepaAffWeb" value="IBAN">	
							<layout:write name="paiementEff" property="BANQUE"  layout="false" /> <layout:write name="paiementEff" property="GUICHET"  layout="false" /> <layout:write name="paiementEff" property="COMPTE"  layout="false" />
						</logic:notEqual> 
						<logic:equal name="sepaAffWeb" value="IBAN">
							IBAN <layout:write name="paiementEff" property="compteIBAN"  layout="false" type="compteIBAN"/> 	
							<logic:equal name="sepaAffBIC" value="O">
								/ BIC <layout:write name="paiementEff" property="codeBIC"  layout="false" /> 
							</logic:equal>
						</logic:equal>
					</logic:notEqual> 
					 de <layout:write name="paiementEff" property="TITRE"  layout="false" />
					<layout:write name="paiementEff" property="NOMPRENOM"  layout="false" />
					</logic:notEqual>
				</div>
				<div class="row">
					<div class="col-xs-12">
						<div class="box box-mca-yellow">
							<!--  TABLEAU DES LIGNES -->
							<layout:collection name="paiementEff" id="listPresta" title="" property="listePrestations" styleClass="LIGNE_A" styleClass2="LIGNE_B">
								 
								<layout:collectionItem title="paie.benef.soins" property="NPNBEN" style="text-align:left;"/>
								<layout:collectionItem title="paie.nature" property="PRESTA" style="text-align:left;"/>
								<layout:collectionItem title="paie.date" property="DATPRE"/>
								<layout:collectionItem title="paie.honoraire" property="HONO" style="text-align:right;" type="money"/>
								<layout:collectionItem title="paie.base" property="BASE" style="text-align:right;" type="money"/>
								<layout:collectionItem title="paie.taux" property="TAUX" style="text-align:right;" type="pourcent_negatif"/> 
								<layout:collectionItem title="paie.remb.ss" property="RBSECU" style="text-align:right;" type="money"/>
								<layout:collectionItem title="paie.remb.mut" property="RBMUT" style="text-align:right;" type="money"/>
							
							</layout:collection>
							
							<!-- TEXTE ASSOCIE AU DECOMPTE  -->
							<div>
							 	<layout:write name="paiementEff" property="REMARQUE"  layout="false" />
							</div>
						</div>
					</div>				
				</div> 
				<!-- SEPARATEUR  pour impression-->
				<%-- <div height="10px">
					<hr id="sep_E<bean:write name="ind"/>" class="pay_mask" size=2 width=250 align="center">
				</div>  --%>
			
			</div>
		</div>
	</div>
</logic:iterate>

<script>
<!-- REND VISIBLE 1ER PAIEMENT AU CHARGEMENT 
document.getElementById("paieE0").className = "pay_vis";
document.getElementById('imageE0').src = "<%= (String)request.getContextPath()  %>/images/Darrow.gif";
-->
</script>

<%
}
else
{
%>
<div class="callout callout-info">
	<strong>
		<html:errors property="effectue"/>
	</strong> 
</div><br style="clear:both;">
<%
}
%>

