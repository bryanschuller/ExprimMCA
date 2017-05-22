<%@ include file="/declaration/taglibs.jsp"%>
<%@ page import="com.exprimweb.struts.modele.Dossier"%>

<div id="content_footerMCA" class="pay_vis">
	<div id="lien_footerMCA">
		<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
		<a href="<%= (String) request.getContextPath() %>/page.do?code=MENT_LEGAL" title="Mentions l&eacute;gales" id="pdp_mentions">Mentions l&eacute;gales</a> 
		<%--  <a  title="Plan du site" id="pdp_plan">Plan du site</a>  --%> 
		<a href="<%= (String) request.getContextPath() %>/page.do?code=PARTENAIRE" title="Nos partenaires" id="pdp_partenaires">Nos partenaires</a>
		
		<%
		Dossier dossAct = (Dossier) session.getAttribute("dossierActuel");
		if(null != dossAct) {
		%> 
			<a href="<%= (String) request.getContextPath() %>/echangeMsg.do?action=initForm"
				 title="Nous contacter" id="pdp_contact">Nous contacter</a>
		<% } else { %>
			<a href="https://www.mc-alsace.fr/contact/"
				 title="Nous contacter" id="pdp_contact">Nous contacter</a>
		<% } %>
	</div>
</div>


	