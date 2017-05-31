<logic:iterate name="lstPaiementsRO" id="paiementRO"  indexId="ind">
	<div class="box box-mca-yellow collapsed-box">
		<div class="box-header with-border">
			<div class="pull-left">
				<button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-plus"></i>
				</button>
			</div>

			<h3 class="box-title">
				<layout:write name="paiementRO" property="libellePaiement"  layout="false" filter="false"/>
			</h3>

			<div class="box-tools pull-right">
				<input type="checkbox" style="cursor:pointer;"
				title="Cocher pour inclure ce paiement dans l'impression."
				onClick="javascript:chkImpr('R' + <bean:write name="ind"/>, event);" class="pay_vis">
				 </input>
			</div>
		</div>
		<div class="box-body" style="display: none;">
			<div  id="paieR<bean:write name="ind"/>">
				<div class="headerContPaie">		
					<layout:write name="paiementRO" property="commentaire"  layout="false" />
				</div>	
				<div class="row">
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
</logic:iterate>

<script type="text/javascript">
	$(document).ready(function () {
		var element = $("[data-widget='collapse']")[0];
		if(element != null)
		{
			element.click();
		}
	});
</script>