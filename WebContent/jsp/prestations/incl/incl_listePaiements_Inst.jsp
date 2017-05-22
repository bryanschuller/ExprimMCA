

<%
 if(((Vector)request.getAttribute("lstPaiementsInst")).size() > 0 )
 {
 %>

<logic:iterate name="lstPaiementsInst" id="paiementInst"  indexId="ind">

	<div id="paieFullI<bean:write name="ind"/>" class="pay_vis" style="clear:both;">
	
		<div id="EXC_PRESENT_PAIEMENT">
			<div id="entete_paieI<bean:write name="ind"/>" class="pay_vis">
				<div class="headerPaie" onClick="javascript:detailPaie('I' + <bean:write name="ind"/>)">
						
					<div class="texteH">
				    	<img src="<%= (String)request.getContextPath()  %>/images/Rarrow.gif" id="imageI<bean:write name="ind"/>" alt="voir le détail" border="0"/>
					  	<layout:write name="paiementInst"  property="message"  layout="false" filter="false"/>
					</div>		
					<div class="iconesH">
					    <input type="checkbox" style="cursor:pointer;"
				        title="Imprimer les <bean:write name="paiementInst" property="message"/>"
				        onClick="javascript:chkImpr('I' + <bean:write name="ind"/>, event);" class="pay_vis">
				         </input> 
					</div> 
					
				</div>
			</div>
		
			<div  id="paieI<bean:write name="ind"/>" class="pay_mask">
				<div class="headerContPaie">
					
				</div>	
				<div class="row">
					<div class="col-xs-12">
						<div class="box box-mca-yellow">
				
							<layout:collection name="paiementInst" id="listPresta" title="" property="listePresta" styleClass="LIGNE_A" styleClass2="LIGNE_B"  >			  
							 
								<layout:collectionItem title="paie.benef.soins" property="NPNBEN" style="text-align:left;"/>
								<layout:collectionItem title="paie.nature" property="PRESTA" style="text-align:left;"/>
								<layout:collectionItem title="paie.date" property="DATPRE"/>
								<layout:collectionItem title="paie.honoraire" property="HONO" style="text-align:right;" type="money"/>
								<layout:collectionItem title="paie.base" property="BASE" style="text-align:right;" type="money"/>
								<layout:collectionItem title="paie.taux" property="TAUX" style="text-align:right;" type="pourcent_entier"/> 
								<layout:collectionItem title="paie.remb.ss" property="RBSECU" style="text-align:right;" type="money"/>
								<layout:collectionItem title="paie.remb.mut" property="RBMUT" style="text-align:right;" type="money"/>
							
							</layout:collection>
						</div>
					</div>
				</div>
			
			</div>
			<%-- 	<div height="10">	
				<hr id="sep_I<bean:write name="ind"/>" class="pay_mask" size=2 width=250 align="center">
			</div>	--%>
		
		</div>
	</div>
</logic:iterate>

<script>
<!-- REND VISIBLE 1ER PAIEMENT AU CHARGEMENT 
document.getElementById("paieI0").className = "pay_vis";
document.getElementById('imageI0').src = "<%= (String)request.getContextPath()  %>/images/Darrow.gif";
-->
</script>
<%
}
else
{
%>
<div id="EXC_MESSAGE">
	<strong>
		<html:errors  property="instance"/>
	</strong> 
</div><br style="clear:both;">
<%
}
%>


