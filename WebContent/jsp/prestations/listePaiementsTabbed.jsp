<%@ include file="/declaration/taglibs.jsp"%>

<%@page import="java.util.Vector"%> 
<%@ taglib uri="/WEB-INF/Except-onglets.tld"    prefix="onglets" %>
   
<script>
	var path = "<%= (String)request.getContextPath()  %>";
</script>

<script type="text/javascript" src="<%= (String)request.getContextPath()  %>/scripts/paiement.js"></script>


<H1>
	<div class="texteH">
		<bean:message key="paie.histo.paiements"/>
	</div>
	<div class="iconesH">
		<div  class="pay_vis">
<%--		<a href="<%= (String)request.getContextPath()  %>/listeDocuments.do?tab=4">Télécharger vos décomptes de prestations</a> --%>
			<a href="<%= (String)request.getContextPath()  %>/retourArriere.do<%= (null != (String)request.getAttribute("pileRequestReqParam")?(String)request.getAttribute("pileRequestReqParam"):"") %>"><html:img page="/images/RETURN.gif" alt="Retour" border="0"/></a>
	        <a href="javascript:window.print()" title="Imprimer les paiements cochés ci-dessous"><html:img page="/images/PRINT.gif" alt="imprimer les paiements séléctionnés" border="0"/></a>
        </div> 
	</div>
</H1>
<br/><br/>

<div class="pay_vis">
	<onglets:onglet_Gr >
	   	<onglets:tete name="2" tooltip="Prestations santé" 			test_been="lstPaiementsEff" actionBase="/viewPaiements.do" >Prestations santé</onglets:tete>
	   	<onglets:tete name="3" tooltip="Remboursements aux tiers" 	test_been="lstPaiementsTiers" actionBase="/viewPaiements.do" >Remboursements aux tiers</onglets:tete>
	   	<onglets:tete name="4" tooltip="Prestations prévoyance" 	test_been="lstPaiementsPrev" actionBase="/viewPaiements.do" >Prestations prévoyance</onglets:tete>
	</onglets:onglet_Gr>
</div>

<% int actTab = 1;
	String adhRO = (String) session.getAttribute("adhRO");
	if(null == adhRO || !adhRO.equals("O"))	actTab = 2; 
	String actTabA = request.getParameter("tab");
	
	if(null != actTabA){
		actTab = Integer.parseInt(actTabA);
	}
%>
		

 
<onglets:corps name="2">
	<logic:present name="lstPaiementsInst" scope="request">
		<%@ include file="/jsp/prestations/incl/incl_listePaiements_Inst.jsp"%>
	</logic:present>
	<logic:present name="lstPaiementsEff" scope="request"> 
		<%@ include file="/jsp/prestations/incl/incl_listePaiements_Eff.jsp"%>
	</logic:present>
	<% if(actTab == 2){ %>
		<logic:notPresent name="lstPaiementsEff" scope="request">
			<logic:notPresent name="lstPaiementsInst" scope="request">		
				<div class="callout callout-info">
					<strong>
						Aucune prestation santé
					</strong> 
				</div><br style="clear:both;">
			</logic:notPresent>
		</logic:notPresent>
	<% } %>
</onglets:corps>	

<onglets:corps name="3">
	<logic:present name="lstPaiementsTiers" scope="request">
		<%@ include file="/jsp/prestations/incl/incl_listePaiements_Tiers.jsp"%>
	</logic:present>
	<% if(actTab == 3){ %>		
		<logic:notPresent name="lstPaiementsTiers" scope="request">	
			<div class="callout callout-info">
				<strong>
					<html:errors property="tiers"/>
				</strong>     
			</div><br style="clear:both;"> 			
		</logic:notPresent>
	<% } %>
</onglets:corps>

<onglets:corps name="4">
	<logic:present name="lstPaiementsPrev" scope="request">
		<%@ include file="/jsp/prestations/incl/incl_listePaiements_Prev.jsp"%>
	</logic:present>
	<% if(actTab == 4){ %>
		<logic:notPresent name="lstPaiementsPrev" scope="request">			
			<div class="callout callout-info">
				<strong>
					<html:errors property="prevoyance"/>
				</strong>     
			</div><br style="clear:both;"> 			
		</logic:notPresent>
	<% } %>
</onglets:corps>

<BR>&nbsp;


<logic:equal name="adhRO" value="O">
	<onglets:init def_ongl="1"></onglets:init>
</logic:equal>
<logic:notEqual name="adhRO" value="O">
	<onglets:init def_ongl="2"></onglets:init>
</logic:notEqual>

