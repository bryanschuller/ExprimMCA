<%@ include file="/taglibs.jsp"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<layout:html layout="false">

<%@ include file="/header_footer/header_log_1.jsp"%>
Connexion à l'espace Collaborateur
<%@ include file="/header_footer/header_log_2.jsp"%>
  

<td class="LOGIN_BACKG" align="center">
<br>
<p></p>   

<layout:panel   styleClass="CORPS_MSGF" key="" width="98%" align="center">
<tr><td style="font-size:11px;color:#ff0000">
<html:errors property="org.apache.struts.action.GLOBAL_ERROR"/></font>
</td></tr>
 
<tr><td>
 <table width="100%" height="100%" align ="center">
 <tr>
 <td style="CORPS_MSGF" style="font-size:13px;color:#000000" ><div align="center">
 <p><strong>Retrouver votre mot de passe :</strong></p>
<br>
</div>
</td>
</tr>
  <tr>
 <td style="font-size:10px;color:#000000" >
<layout:form action="FpswrdCollab.do" focus="identifiant" styleClass="LOGIN_FORM" align="center"  > 

<layout:field key="app.username" property="identifiant" size="16" maxlength="7" isRequired="true" styleClass="LOGIN_LABEL" type="text"/> 
<layout:field key="app.mail.mail" property="mail" size="30" maxlength="80" type="text" styleClass="LOGIN_LABEL" isRequired="true"/> 

<html:hidden property="acces" value="Collaborateur"/> 

<layout:formActions>
<layout:reset styleClass="BOUT1" value="Rétablir"/> 
<layout:submit styleClass="BOUT1" property="submit" value="Valider"/> 
</layout:formActions> 
</layout:form> 

</td>
</tr>
  <tr>
 <td style="font-size:10px;color:#000000" >
  <table width="50%" align ="center">
<p><font size="1">Conformément aux dispositions de la loi du n°78-17 du 6 janvier 1978, vous disposez d'un droit d'accès, de rectification et d'opposition sur les données nominatives vous concernant.</font></p>  
  </table>
</td>
</tr>
</layout:panel>

</td>
</tr>
</table>

</layout:html>

<%@ include file="/header_footer/footer_log.jsp"%>

