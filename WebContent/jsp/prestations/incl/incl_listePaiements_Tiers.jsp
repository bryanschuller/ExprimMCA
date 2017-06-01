<logic:iterate name="lstPaiementsTiers" id="paiementTiers"  indexId="ind">
	<div class="box box-mca-yellow collapsed-box">
		<div class="box-header with-border">
			<div class="pull-left">
				<button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-plus"></i>
				</button>
			</div>

			<h3 class="box-title">
				Règlement de <layout:write name="paiementTiers" property="MNT_TOTAL" type="money" layout="false"/> &euro; 
					  	à <bean:write name="paiementTiers" property="TIERS_NOM"/>
			</h3>
		</div>
		<div class="box-body" style="display: none;">
			<div  id="paieT<bean:write name="ind"/>" class="pay_mask">
				<div class="headerContPaie">		
					N° Facture : <bean:write name="paiementTiers" property="NUM_FACTURE"/> Traité le <bean:write name="paiementTiers" property="DATE_ETAT"/> par la MCA.
				</div>	
				<div class="row">
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