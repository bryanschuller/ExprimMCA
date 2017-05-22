


<logic:iterate name="lstPaiementsRO" id="paiementRO"  indexId="ind">
	
	<div id="paieFullR<bean:write name="ind"/>" class="pay_vis" style="clear:both;">
		<div id="EXC_PRESENT_PAIEMENT">
			<div id="entete_paieR<bean:write name="ind"/>" class="pay_vis">
				<div class="headerPaie" onClick="javascript:detailPaie('R' + <bean:write name="ind"/>)">
		
					<div class="texteH">
					    <img src="<%= (String)request.getContextPath()  %>/images/Rarrow.gif" id="imageR<bean:write name="ind"/>" alt="voir le détail" border="0"/>
					  	
					  	<layout:write name="paiementRO" property="libellePaiement"  layout="false" filter="false"/>
					  	
					</div>
					
	 				<div class="iconesH">
				        <input type="checkbox" style="cursor:pointer;"
				        title="Cocher pour inclure ce paiement dans l'impression."
				        onClick="javascript:chkImpr('R' + <bean:write name="ind"/>, event);" class="pay_vis">
				         </input>
			    	</div> 
				</div> 
			</div>
		
		
			<div  id="paieR<bean:write name="ind"/>" class="pay_mask">
				<div class="headerContPaie">		
					<layout:write name="paiementRO" property="commentaire"  layout="false" />
				</div>	
				<div class="row">
					<div class="col-xs-12">
						<div class="box box-mca-yellow">
				
							<layout:collection name="paiementRO" id="listePrestations" title="" property="listePrestations" styleClass="LIGNE_A" styleClass2="LIGNE_B"  >
							  	
				 
								<layout:collectionItem title="paie.benef.soins"  style="text-align:left;">
									<logic:equal name="listePrestations" property="NPNBEN" value="La reprise concerne :">			 
										<span style="font-style:italic"><layout:write name="listePrestations" property="NPNBEN" /></span>	
									</logic:equal>
								
									<logic:notEqual name="listePrestations" property="NPNBEN" value="La reprise concerne :">			 
										<layout:write name="listePrestations" property="NPNBEN" />
									</logic:notEqual>
								</layout:collectionItem>
								
								<layout:collectionItem title="paie.nature"  style="text-align:left;" width="250">
									<logic:equal name="listePrestations" property="NPNBEN" value="La reprise concerne :">			 
										<span style="font-style:italic"><layout:write name="listePrestations" property="PRESTA" /></span>	
									</logic:equal>
								
									<logic:notEqual name="listePrestations" property="NPNBEN" value="La reprise concerne :">			 
										<layout:write name="listePrestations" property="PRESTA" />
									</logic:notEqual>
								</layout:collectionItem>					
			
								<layout:collectionItem title="paie.date"  style="text-align:left;">
									<logic:equal name="listePrestations" property="NPNBEN" value="La reprise concerne :">			 
										<span style="font-style:italic"><layout:write name="listePrestations" property="dateSoin" type="dateYMD" /></span>	
									</logic:equal>
								
									<logic:notEqual name="listePrestations" property="NPNBEN" value="La reprise concerne :">			 
										<layout:write name="listePrestations" property="dateSoin" style="text-align:left;" type="dateYMD" />
									</logic:notEqual>
								</layout:collectionItem>						
								
								<layout:collectionItem title="paie.honoraire"  style="text-align:right;">
									<logic:equal name="listePrestations" property="NPNBEN" value="La reprise concerne :">			 
										<span style="font-style:italic"><layout:write name="listePrestations" property="HONO" type="money" /></span>	
									</logic:equal>
								
									<logic:notEqual name="listePrestations" property="NPNBEN" value="La reprise concerne :">			 
										<layout:write name="listePrestations" property="HONO" style="text-align:right;" type="money" />
									</logic:notEqual>
								</layout:collectionItem>	
			
								<layout:collectionItem title="paie.base"  style="text-align:right;">
									<logic:equal name="listePrestations" property="NPNBEN" value="La reprise concerne :">			 
										<span style="font-style:italic"><layout:write name="listePrestations" property="BASE" style="text-align:right;" type="money"/></span>	
									</logic:equal>
								
									<logic:notEqual name="listePrestations" property="NPNBEN" value="La reprise concerne :">			 
										<layout:write name="listePrestations" property="BASE" type="money"/>
									</logic:notEqual>
								</layout:collectionItem>	
			
								<layout:collectionItem title="paie.taux"  style="text-align:right;">
									<logic:equal name="listePrestations" property="NPNBEN" value="La reprise concerne :">			 
										<span style="font-style:italic"><layout:write name="listePrestations" property="TAUX" type="pourcent_entier"/></span>	
									</logic:equal>
								
									<logic:notEqual name="listePrestations" property="NPNBEN" value="La reprise concerne :">			 
										<layout:write name="listePrestations" property="TAUX" type="pourcent_entier"/>
									</logic:notEqual>
								</layout:collectionItem>
								
								<layout:collectionItem title="remb.regl.ss"  style="text-align:right;">
									<logic:equal name="listePrestations" property="NPNBEN" value="La reprise concerne :">			 
										<span style="font-style:italic"><layout:write name="listePrestations" property="RBSECU" type="money"/></span>	
									</logic:equal>
								
									<logic:notEqual name="listePrestations" property="NPNBEN" value="La reprise concerne :">			 
										<layout:write name="listePrestations" property="RBSECU" type="money"/>
									</logic:notEqual>
								</layout:collectionItem>					
								
								<layout:collectionItem title="remb.regl.mut"  style="text-align:right;">
									<logic:equal name="listePrestations" property="NPNBEN" value="La reprise concerne :">			 
										<span style="font-style:italic"><layout:write name="listePrestations" property="RBMUT" type="money"/></span>	
									</logic:equal>
								
									<logic:notEqual name="listePrestations" property="NPNBEN" value="La reprise concerne :">			 
										<layout:write name="listePrestations" property="RBMUT" type="money"/>
									</logic:notEqual>
								</layout:collectionItem>						
								
			
			
							
							</layout:collection>
						</div>
					</div>	
				</div>
			</div>
			<%--	<div>
				<hr id="sep_R<bean:write name="ind"/>" class="pay_mask" size=2 width=250 align="center">
			</div>	--%>
		</div>
	</div>
</logic:iterate>

<script>

document.getElementById("paieR0").className = "pay_vis";
document.getElementById('imageR0').src = "<%= (String)request.getContextPath()  %>/images/Darrow.gif";

</script>


