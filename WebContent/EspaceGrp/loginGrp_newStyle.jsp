<%@page import="java.io.File"%>
<%@ include file="/declaration/taglibs.jsp"%>



<%

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

   <link rel="stylesheet" href="<%= (String)request.getContextPath()  %>/config/prospectiv.css" type="text/css" media="screen" /> 
	<script language="Javascript" src="<%= (String)request.getContextPath()  %>/config/javascript.js"></script><script>var imgsrc="<%= (String)request.getContextPath()  %>/images/"; var scriptsrc="<%= (String)request.getContextPath()  %>/config/"; var langue="fr"; var contextPath="<%= (String)request.getContextPath()  %>";</script>
	<META http-equiv="Cache-Control" content="no-cache">
	<META http-equiv="Pragma" content="no-cache">
	<META http-equiv="Expires" content="0"> 
	
</head>
<body>

<script language="javascript">		
		function redirErr(){
			parent.location.href = "<%= (String)request.getContextPath()  %>/No400.do";			
		}	
</script>

	<div>
	
	
	
<form name="AuthentificationInterneForm" method="POST" action="<%= (String)request.getContextPath()  %>/authinterne.do" class="LOGIN_FORM" target="_top" onsubmit="setTimeout('redirErr()',90000);">
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
                <th class=LOGIN_LABEL><span class="LOGIN_LABEL LOGIN"><bean:message key="app.grp.identifiant"/></span></th>
                <td class=LOGIN_LABEL>
                    <table>
                    <tr>
                        <td class=ERROR><input type="text" name="idinternaute" maxlength="11" size="16" value="" onchange="checkValue(this, 'idinternaute','TEXT',true);" class="LOGIN_LABEL"></td>
                    </tr>
                    </table>
                    <img name="nomUserrequired" src="<%= (String)request.getContextPath()  %>/images/ast.gif">
                 </td>
            </tr>
            <tr>
                <th class=LOGIN_LABEL><span class="LOGIN_LABEL PASSWORD"><bean:message key="app.password"/></span></th>
                <td class=LOGIN_LABEL><table>
            <tr>
                <td class=ERROR><input type="password" name="motpasse" maxlength="10" size="16" value="" onchange="checkValue(this, 'motpasse','PASSWORD',true);" class="LOGIN_LABEL"></td>
            </tr>
         </table><img name="passwordrequired" src="<%= (String)request.getContextPath()  %>/images/ast.gif"></td>
         </tr>        
        <tr><td align="CENTER" colspan="2">

        <input type="hidden" name="typeAcces" value="MAP.GRP">
        <%
			String typeAcces = "MAP.GRP";
		%>   
        <input type="reset" value="Rétablir" class="btn btn-danger"> 
        <input type="submit" name="submit" value="Valider" class="btn btn-success">  
    </td></tr>

 
<tr><td colspan="2"><p class="avert" align="center"><font size="1">Si vous rencontrez des problèmes d'accès, <a href="<%= (String)request.getContextPath() %>/login.do?typeAcces=<%= typeAcces %>"  target="_top">cliquez ici.</a></font></p>
</td></tr>
</table></td></tr>
</table></td></tr></table>
</form>


		<p class="avert" align="center">Si vous avez oublié votre mot de passe, <a href="<%= (String)request.getContextPath() %>/forgetPswd.do?typeAcces=<%= typeAcces %>" target="_top">cliquez içi.</a></p>  

	
	
	
	
	</div>
</body>

</html>
