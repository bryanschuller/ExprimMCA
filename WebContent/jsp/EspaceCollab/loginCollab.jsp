<%@page import="java.io.File"%>
<%@ include file="/taglibs.jsp"%>



<%

String grantFilePath = (String) request.getSession().getServletContext().getRealPath("/") + "TEMP/granted.ini";
System.out.println(grantFilePath);
	boolean grantFile = (new File(grantFilePath)).exists();
if (!grantFile) {
%>
    <jsp:forward page="/Commun/maintenance.html"/>
<%
  }
%>



<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<layout:html layout="false">

<script language="javascript">		
		function redirErr(){
			parent.location.href = "/MCA/No400.do";			
		}	
</script>

<%@ include file="/header_footer/header_log_1.jsp"%>
Connexion à l'espace collaborateur
<%@ include file="/header_footer/header_log_2.jsp"%>
 
<td class="LOGIN_BACKG" align="center">
<table width="100%" heigth = "50%" border="0" cellspacing="0" cellpadding="0" class="LOGIN_BACKG" align="center">
  <tr>
<td align="center" Class="CORPS_DONNE">
<p><strong>Espace Collaborateur</strong></p>
<p>Bonjour,</p> 
<p>Vous entrez dans un espace sécurisé.<br>
  Veuillez saisir votre identifiant et votre mot de passe :</p>
</td>
  </tr>
  <tr>
    <td align="center" valign="top" > 

<layout:form action="loginCollab.do" focus="nomUser" styleClass="LOGIN_FORM"  onsubmit="setTimeout('redirErr()',90000);">  
 	<layout:field key="app.username" property="nomUser" size="16" maxlength="9" isRequired="true" styleClass="LOGIN_LABEL" type="text"/> 
	<layout:field key="app.password" property="password" size="16" maxlength="10" type="password" styleClass="LOGIN_LABEL" isRequired="true"/> 
	<html:hidden property="acces" value="Collaborateur"/> 	    
	<layout:formActions>
		<layout:reset styleClass="btn" value="Rétablir"/> 
		<layout:submit styleClass="btn" property="submit" value="Valider"/>  
	</layout:formActions> 
</layout:form>

<p><font size="1">Si vous avez oublié votre mot de passe, <a href="ForgetPasswordCollabPage.jsp">cliquez ici.</a></font></p>  
    </td>
  </tr>
    <tr>
    <td  align="center" valign="top"  heigth = "25">
</td>
  </tr>
  
</table>

</td>
</td>
</tr>
</table>
</layout:html>

<%@ include file="/header_footer/footer_log.jsp"%>

