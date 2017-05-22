<%@page import="java.io.File"%>
<%@ include file="/declaration/taglibs.jsp"%>



<%
String basePath = "http://localhost:8080/";
String contextPath = "ExprimMCA";

String grantFilePath = (String) request.getSession().getServletContext().getRealPath("/") + "TEMP/granted.ini";
System.out.println(grantFilePath);
	boolean grantFile = (new File(grantFilePath)).exists();
if (!grantFile) {
%>
    <jsp:forward page="/Commun/maintenance_newStyle.html"/>
<%
  }
%>



<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
 

<html>
<head>

	<base href="<%= basePath %><%= contextPath %>/EspaceAdh/loginAdh_newStyle.jsp">
   <link rel="stylesheet" href="/MCA/styles/prospectiv.css" type="text/css" media="screen" /> 
	<script language="Javascript" src="/MCA/config/javascript.js"></script><script>var imgsrc="/MCA/images/"; var scriptsrc="/MCA/config/"; var langue="fr"; var contextPath="/MCA";</script>
	<META http-equiv="Cache-Control" content="no-cache">
	<META http-equiv="Pragma" content="no-cache">
	<META http-equiv="Expires" content="0"> 
	

</head>
<body>
<script language="javascript">		
		function redirErr(){
			parent.location.href = "/MCA/No400.do";			
		}	
</script>
<div>

<%
	System.out.println(pageContext.);
	System.out.println(request.getLocalAddr());
	System.out.println(request.getRequestURI());
	System.out.println(request.getServletPath());
   

%>



<form name="AuthentificationInterneForm" method="POST" action="/ExprimMCA/authinterne.do" class="LOGIN_FORM" target="_top" onsubmit="setTimeout('redirErr()',90000);">
<table cellspacing="0" cellpadding="0" border="0" class="LOGIN_FORM">
<tr>
    <td valign="top">
        <table cellspacing="1" cellpadding="1" border="0" width="100%">
        <tr>
            <td class="LOGIN_FORM">
            <table width="100%"  border="0">
            <tr>
                <td colspan="2"><bean:message key="hello.message.edit"/></td></tr>
            <tr>
                <th class="LOGIN_LABEL"><span class="LOGIN_LABEL LOGIN"><bean:message key="app.adh.identifiant"/></span></th>
                <td class="LOGIN_LABEL">
                    <table>
                    <tr>
                        <td class="ERROR"><input type="text" name="idinternaute" maxlength="11" size="16" value="" onchange="checkValue(this, 'idinternaute','TEXT',true);" class="LOGIN_LABEL"></td>
                    </tr>
                    </table>
                    <img name="nomUserrequired" src="/MCA/images/ast.gif">
                 </td>
            </tr>
            <tr>
                <th class="LOGIN_LABEL"><span class="LOGIN_LABEL PASSWORD"><bean:message key="app.password"/></span></th>
                <td class="LOGIN_LABEL"><table>
            <tr>
                <td class="ERROR"><input type="password" name="motpasse" maxlength="10" size="16" value="" onchange="checkValue(this, 'motpasse','PASSWORD',true);" class="LOGIN_LABEL"></td>
            </tr>
         </table><img name="passwordrequired" src="/MCA/images/ast.gif"></td>
         </tr>     
        <tr><td align="CENTER" colspan="2">

        <input type="hidden" name="typeAcces" value="MAP.AB">    
        <input type="reset" value="Rétablir" class="bouton reset"> 
        <input type="submit" name="submit" value="Valider" class="bouton valid" >  
    </td></tr>

 
<tr><td colspan="2"><p class="avert" align="center"><font size="1">Si vous rencontrez des problèmes d'accès, <a href="loginAdh.jsp"  target="_top">cliquez ici.</a></font></p>
</td></tr>
</table></td></tr>
</table></td></tr></table>
</form>

<script type="text/javascript" language="JavaScript">
  <!--
  var focusControl = document.forms["AuthentificationInterneForm"].elements["idinternaute"];

  if (focusControl.type != "hidden" && !focusControl.disabled) {
     focusControl.focus();
  }
  // -->
</script>

<p class="avert" align="center">Si vous avez oubli&eacute; votre mot de passe, <a href="ForgetPasswordAdhPage.jsp"  target="_top">cliquez ici.</a></p>




</div>
</body>

</html>
