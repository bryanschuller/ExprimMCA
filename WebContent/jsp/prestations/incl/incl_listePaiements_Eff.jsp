

<%
 if(((Vector)request.getAttribute("lstPaiementsEff")).size() > 0 )
 {
 %> 
<logic:iterate name="lstPaiementsEff" id="paiementEff" indexId="ind">
	<div class="box box-mca-yellow collapsed-box" id="paieFullE<bean:write name="ind"/>">
		<div class="box-header with-border">
			<div class="pull-left">
                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-plus"></i>
                </button>
            </div>

			<h3 class="box-title">
		    	<bean:message key="paie.paiement"/>
			  	<bean:write name="paiementEff" property="DATEPAIE"/>
				de <layout:write name="paiementEff" property="MNTPAIE" type="money" layout="false" /> &euro;
			</h3>
		</div>
		<div class="box-body" style="display: none;">
			<div id="paieE<bean:write name="ind"/>">
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
	</div>
</logic:iterate>

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

<script type="text/javascript">
	$(document).ready(function () {
		var element = $("[data-widget='collapse']")[0];
		if(element != null)
		{
			element.click();
		}
	});
</script>