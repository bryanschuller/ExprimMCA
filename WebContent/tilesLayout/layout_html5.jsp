<%@ page errorPage="/jsp/erreur/erreur.jsp" %>
<%@ page import="java.io.File"%>
<%@ page import="com.exprimweb.struts.modele.*"%>

<%@ include file="/declaration/taglibs.jsp"%>


<%-- Executer les controls préalables :
			- Site en maintenance
			- Internaute authentifié --%>

<%

String grantFilePath = (String) request.getSession().getServletContext().getRealPath("/") + "TEMP/granted.ini";
System.out.println(grantFilePath);
	boolean grantFile = (new File(grantFilePath)).exists();
if (!grantFile) {
	%>
    <jsp:forward page="/jsp/messages/pageMaintenance.jsp"/>
<%
}

Internaute internaute = (Internaute) session.getAttribute("internaute");
if(null == internaute){ 
	%>
    <jsp:forward page="/jsp/formulaires/pageLogin.jsp"/>
<%
}

%>


<!doctype html>
<layout:html layout="false">
	<div id="container">

		<div id="header">
			<tiles:insert attribute="header" />
		</div>
		
		<div class="menu">
			<tiles:insert attribute="menu"/>
		</div>
		
		<div class="content">
		
		<progress></progress>
		
			<div  id="panneauCentreALeft">
				<tiles:insert attribute="body" />
			</div>
			
			
			<div>		
				<tiles:insert attribute="footer" />			
			</div>
		</div>
	</div>

	<div  id="wait" class="wait_mask" ></div>
	<div  id="wait_fond" class="wait_mask_fond"></div> 
</layout:html>
