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


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<layout:html layout="false">

<!--[if lte IE 7]><link rel="stylesheet" href="<%= (String)request.getContextPath()  %>/config/MCAExprim_IE.css" type="text/css"><![endif]-->
<!--[if IE 8]><link rel="stylesheet" href="<%= (String)request.getContextPath()  %>/config/MCAExprim_IE_8.css" type="text/css"><![endif]-->


<div id="container">

	<div id="header">
		<tiles:insert attribute="header" />
	</div>
	
	<div class="menu">
		<tiles:insert attribute="menu"/>
	</div>
	
	<div class="content">
		<div  id="panneauCentreALeft">
			<tiles:insert attribute="body" />
		</div>
		
		
		<div id="footerMCA">		
			<tiles:insert attribute="footer" />			
		</div>
	</div>
	

</div>

<div  id="wait" class="wait_mask" ></div>
<div  id="wait_fond" class="wait_mask_fond"></div> 

</layout:html>
