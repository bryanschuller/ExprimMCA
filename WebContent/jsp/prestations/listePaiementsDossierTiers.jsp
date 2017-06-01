<%@ include file="/declaration/taglibs.jsp"%>

<%@page import="java.util.Vector"%> 
   
<script>
	var path = "<%= (String)request.getContextPath()  %>";
</script>

<script type="text/javascript" src="<%= (String)request.getContextPath()  %>/scripts/paiement.js"></script>

<style type="text/css">
	@media print
	{    
	    .collapsed-box
	    {
	        display: none !important;
	    }
	}
</style>

<div>
	<div class="texteH">
		<bean:message key="paie.histo.paiements"/>
	</div>
	<div class="iconesH hidden-print">
		<logic:notEqual name="TiersPaiementsRetro" value="MAX">
			<a href="<%= (String)request.getContextPath()  %>/viewPaiementsDossierTiers.do?retro=MAX">Visualiser les paiements sur 1 an</a>
		</logic:notEqual>
		<a href="<%= (String)request.getContextPath()  %>/retourArriere.do<%= (null != (String)request.getAttribute("pileRequestReqParam")?(String)request.getAttribute("pileRequestReqParam"):"") %>"><i class="fa fa-arrow-left" data-toggle="tooltip" data-placement="bottom" data-original-title="Retour"></i></a>
		<a href="javascript:window.print()" title="Imprimer les paiements ouverts ci-dessous"><i class="fa fa-print" data-toggle="tooltip" data-placement="bottom" data-original-title="Imprimer les paiements séléctionnés"></i></a>
	</div>
</div>
<div class="clearfix"></div>

<div class="box box-mca-yellow hidden-print">
	<div class="box-body">
		<layout:form action="filtrePaiementsDossierTiers.do" focus="numFiltre"> 
			<tr><td colspan="2">
				<table class="FORM_BEN" width="90%" align="center">
					<tr><td align="center">
						<table class="FORM_BEN_SUB_LEFT" style="min-width:300px;">
							<layout:field key="tiers.liste.paiement.filtre.libelle" property="numFiltre" size="30" maxlength="13" type="text" isRequired="false"/>									
						</table>
					</td></tr>
				</table>
			</td></tr>

			<layout:formActions>
				<layout:row>
					<layout:reset styleClass="btn btn-danger" value="Rétablir"/> 
					<layout:submit styleClass="btn" property="submit" value="Filtrer"/> 
				</layout:row>	
			</layout:formActions> 
		</layout:form> 	
	</div>
</div>

<logic:present name="erreurFiltre">
	<div class="callout callout-info">
		<strong>
			Aucune correspondance pour le filtre saisie.
		</strong> 
	</div><br style="clear:both;">
</logic:present>

<logic:notPresent name="erreurFiltre">
	<logic:present name="infoFiltre">
		<h2 class="hidden-print">
			<layout:write name="infoFiltre" layout="false" />
		</h2>
	</logic:present>
	<logic:notPresent name="infoFiltre">
		<h2 class="hidden-print">Toutes les prestations remboursées</h2>
	</logic:notPresent>
	
	<% if ((Vector)request.getAttribute("lstPaiementsEff") != null) {
	 if(((Vector)request.getAttribute("lstPaiementsEff")).size() > 0 )
	 {
	 %> 
	<logic:iterate name="lstPaiementsEff" id="paiementEff"  indexId="ind">
		<div class="box box-mca-yellow collapsed-box">
			<div class="box-header with-border">
				<div class="pull-left">
					<button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-plus"></i>
					</button>
				</div>

				<h3 class="box-title">
					<bean:message key="paie.paiement"/>
					<bean:write name="paiementEff" property="DATEPAIE"/> de <layout:write name="paiementEff" property="MNTPAIE"   type="money" layout="false" /> &euro;
				</h3>
			</div>
			<div class="box-body" style="display: none;">
				<!-- Libellé infos banque -->
				<div class="headerContPaie">
					<bean:message key="paie.rembourse"/> <layout:write name="paiementEff" property="TYPEPAIE"  layout="false" /> <bean:message key="paie.compte"/> 
					<logic:notEqual name="sepaAffWeb" value="IBAN">	
							<layout:write name="paiementEff" property="BANQUE"  layout="false" /> <layout:write name="paiementEff" property="GUICHET"  layout="false" /> <layout:write name="paiementEff" property="COMPTE"  layout="false" /> 
					</logic:notEqual> 
					<logic:equal name="sepaAffWeb" value="IBAN">
						IBAN <layout:write name="paiementEff" property="compteIBAN"  layout="false" type="compteIBAN"/> 	
						<logic:equal name="sepaAffBIC" value="O">
							/ BIC <layout:write name="paiementEff" property="codeBIC"  layout="false" /> 
						</logic:equal>
					</logic:equal>
					 de <layout:write name="paiementEff" property="TITRE"  layout="false" />
					<layout:write name="paiementEff" property="NOMPRENOM"  layout="false" />
				</div>
				<div id="EXC_PRESENT_DATA_1">
					<!--  TABLEAU DES LIGNES -->
					<layout:collection name="paiementEff" id="listPresta" title="" property="listePrestations" styleClass="LIGNE_A" styleClass2="LIGNE_B">
					
						<layout:collectionItem title="paie.remb.tiers.numero.lot" property="NUMLOT" style="text-align:left;"/> 
						<layout:collectionItem title="paie.remb.tiers.numero.facture" property="NUMFACTURE" style="text-align:left;"/>
						<layout:collectionItem title="paie.benef.soins" property="NPNBEN" style="text-align:left;"/>
						<layout:collectionItem title="paie.nature" property="PRESTA" style="text-align:left;"/>
						<layout:collectionItem title="paie.date" property="DATPRE"/>
						<layout:collectionItem title="paie.honoraire" property="HONO" style="text-align:right;" type="money"/>
						<layout:collectionItem title="paie.base" property="BASE" style="text-align:right;" type="money"/>
						<layout:collectionItem title="paie.taux" property="TAUX" style="text-align:right;" type="pourcent_entier"/> 
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
	</logic:iterate>
	<%
	}
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

</logic:notPresent>

<script type="text/javascript">
	$(document).ready(function () {
		var element = $("[data-widget='collapse']")[0];
		if(element != null)
		{
			element.click();
		}
	});
</script>