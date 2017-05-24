<%@ page errorPage="/jsp/erreur/erreur.jsp" %>
<%@ page import="java.io.File"%>
<%@ include file="/declaration/taglibs.jsp"%>

<%
String grantFilePath = (String) request.getSession().getServletContext().getRealPath("/") + "TEMP/granted.ini";
System.out.println(grantFilePath);
	boolean grantFile = (new File(grantFilePath)).exists();
if (!grantFile) {
	%>
    <jsp:forward page="/jsp/messages/pageMaintenance.jsp"/>
<%
} %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<layout:html layout ="false">
	<div id="container">
		<div id="header">
			<tiles:insert attribute="header" />
		</div>
	  
		<div class="content">
			<div  id="panneauCentreALeft">
				<noscript>
					<span class="NO_JS">
		   				<layout:message key="general.info.noscript" /> &nbsp;&nbsp;
		   			</span>
	   				<a href="<%= (String)request.getContextPath() %>/Commun/Assistance.jsp"><layout:message key="general.info.resoudre" /></a> 
				</noscript>
				<tiles:insert attribute="body" />
			</div>
				
			<div id="footerMCA">
					<tiles:insert attribute="footer" />
			</div>
		</div>
	</div>
</layout:html>
