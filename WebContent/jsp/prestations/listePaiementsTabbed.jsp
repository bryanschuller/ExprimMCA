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
			<a href="<%= (String)request.getContextPath()  %>/retourArriere.do<%= (null != (String)request.getAttribute("pileRequestReqParam")?(String)request.getAttribute("pileRequestReqParam"):"") %>"><i class="fa fa-arrow-left" data-toggle="tooltip" data-placement="bottom" data-original-title="Retour"></i></a>
	        <a href="javascript:window.print()" title="Imprimer les paiements cochés ci-dessous"><i class="fa fa-print" data-toggle="tooltip" data-placement="bottom" data-original-title="Imprimer les paiements séléctionnés"></i></a>
        </div> 
	</div>
</H1>
<br/><br/>

<% int actTab = 1;
	String adhRO = (String) session.getAttribute("adhRO");
	if(null == adhRO || !adhRO.equals("O"))	actTab = 2; 
	String actTabA = request.getParameter("tab");
	if(null != actTabA){
		actTab = Integer.parseInt(actTabA);
	}
%>

<div class="row">
	<div class="col-xs-12">
		<div class="nav-tabs-custom">
			<ul class="nav nav-tabs">
				<%
					String tab2class = "";
					String tab3class = "";
					String tab4class = "";

					switch(actTab)
					{
						case 2:
							tab2class = "active";
							break;
						case 3:
							tab3class = "active";
							break;
						case 4:
							tab4class = "active";
							break;
					}
				%>
					<li class="<%= tab2class %>"><a href="<%= (String)request.getContextPath() %>/viewPaiements.do?tab=2">Prestations santé</a></li>
					<li class="<%= tab3class %>"><a href="<%= (String)request.getContextPath() %>/viewPaiements.do?tab=3">Remboursements aux tiers</a></li>
					<li class="<%= tab4class %>"><a href="<%= (String)request.getContextPath() %>/viewPaiements.do?tab=4">Prestations prévoyance</a></li>
			</ul>
			<div class="tab-content">
			<%
				tab2class = "tab-pane";
				tab3class = "tab-pane";
				tab4class = "tab-pane";

				switch(actTab)
				{
					case 2:
						tab2class += " active";
						break;
					case 3:
						tab3class += " active";
						break;
					case 4:
						tab4class += " active";
						break;
				}
			%>

				<div class="<%= tab2class %>" id="tab_2">
					<logic:present name="lstPaiementsInst" scope="request">
						<%@ include file="/jsp/prestations/incl/incl_listePaiements_Inst.jsp"%>
					</logic:present>
					<logic:present name="lstPaiementsEff" scope="request"> 
						<%@ include file="/jsp/prestations/incl/incl_listePaiements_Eff.jsp"%>
					</logic:present>
					<logic:notPresent name="lstPaiementsEff" scope="request">
						<logic:notPresent name="lstPaiementsInst" scope="request">		
							<div class="callout callout-info">
								<strong>
									<li>Aucune prestation santé</li>
								</strong> 
							</div><br style="clear:both;">
						</logic:notPresent>
					</logic:notPresent>
				</div>
				<div class="<%= tab3class %>" id="tab_3">
					<logic:present name="lstPaiementsTiers" scope="request">
						<%@ include file="/jsp/prestations/incl/incl_listePaiements_Tiers.jsp"%>
					</logic:present>
					<logic:notPresent name="lstPaiementsTiers" scope="request">	
						<div class="callout callout-info">
							<strong>
								<html:errors property="tiers"/>
							</strong>     
						</div><br style="clear:both;"> 			
					</logic:notPresent>
				</div>
				<div class="<%= tab4class %>" id="tab_4">
					<logic:present name="lstPaiementsPrev" scope="request">
						<%@ include file="/jsp/prestations/incl/incl_listePaiements_Prev.jsp"%>
					</logic:present>
					<logic:notPresent name="lstPaiementsPrev" scope="request">			
						<div class="callout callout-info">
							<strong>
								<html:errors property="prevoyance"/>
							</strong>     
						</div><br style="clear:both;"> 			
					</logic:notPresent>
				</div>
			</div>
		</div>
	</div>
</div>
