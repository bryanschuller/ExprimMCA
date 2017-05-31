

<%
 if(((Vector)request.getAttribute("lstPaiementsInst")).size() > 0 )
 {
 %>

<logic:iterate name="lstPaiementsInst" id="paiementInst"  indexId="ind">
	<div class="box box-mca-yellow collapsed-box">
		<div class="box-header with-border">
			<div class="pull-left">
				<button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-plus"></i>
				</button>
			</div>

			<h3 class="box-title">
				<layout:write name="paiementInst"  property="message"  layout="false" filter="false"/>
			</h3>

			<div class="box-tools pull-right">
				<input type="checkbox" style="cursor:pointer;"
			        title="Imprimer les <bean:write name="paiementInst" property="message"/>"
			        onClick="javascript:chkImpr('I' + <bean:write name="ind"/>, event);" class="pay_vis">
			         </input> 
			</div>
		</div>
		<div class="box-body" style="display: none;">
			<layout:collection name="paiementInst" id="listPresta" title="" property="listePresta" styleClass="LIGNE_A" styleClass2="LIGNE_B">
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
</logic:iterate>

<%
}
else
{
%>
<div class="callout callout-info">
	<strong>
		<html:errors  property="instance"/>
	</strong> 
</div><br style="clear:both;">
<%
}
%>


<script type="text/javascript">
	$(document).ready(function () {
		var element = $("[data-widget='collapse']")[0];
		if(element != null)
		{
			element.click();
		}
	});
</script>