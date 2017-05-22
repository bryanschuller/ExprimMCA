<%@ include file="/declaration/taglibs.jsp"%>
<%@ page import="com.exprimweb.struts.modele.Dossier"%>

<footer class="main-footer">
	<!-- To the right -->
	<div class="pull-right hidden-xs">
		<div>
            <strong>Copyright &#169; 2017
                <a href="http://www.atlante-group.com/mutuelle-assurance/">Except</a>,
                <a href="https://www.mc-alsace.fr">MCA</a>.
            </strong>
        </div>
	</div>
	<!-- Default to the left -->
	<%--  <a  title="Plan du site" id="pdp_plan">Plan du site</a>  --%> 
  	<a href="<%= (String) request.getContextPath() %>/page.do?code=MENT_LEGAL" title="Mentions l&eacute;gales" id="pdp_mentions">Mentions l&eacute;gales</a>
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
</footer>


	