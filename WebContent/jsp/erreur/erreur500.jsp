<%@ page errorPage="/jsp/erreur/erreur.jsp" %>
<%@ include file="/declaration/taglibs.jsp"%>

<%@ page import="org.apache.log4j.Logger" %>

<%-- Layout component 
  parameters : title, header, menu, body, footer 
--%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<layout:html layout ="false">
	<% Logger loggerExprim = Logger.getLogger("com.exprimweb.erreur.500");
		loggerExprim.fatal("Erreur 500"); %>
	<div id="container">
		<div id="header">
			<tiles:insert page="/tilesLayout/header.jsp"/>
		</div>
		<div class="content">
			<div  id="panneauCentre"> <!-- pour compatibilité avec footer_incl_commun  -->
			    <noscript>
					<span class="NO_JS">
	    				<layout:message key="general.info.noscript" /> &nbsp;&nbsp;
	    			</span>
	    				<a href="<%= (String)request.getContextPath() %>/Commun/Assistance.jsp"><layout:message key="general.info.resoudre" /></a> 
	  			</noscript>
				<div class="LOGIN_BACKG" align="center">  
					<div class="callout callout-danger">
						<strong>erreur 500 : ERREUR INTERNE DU SERVEUR</strong>
					</div>
				</div>
			</div> <!-- Fin "PANNEAUPRINCIPAL" du header -->
			<div id="footer">
			    <tiles:insert page="/tilesLayout/footer.jsp"/>
			</div>
		</div> <!-- Fin "content" du header -->
	</div> <!-- Fin "container" du header -->
</layout:html>
