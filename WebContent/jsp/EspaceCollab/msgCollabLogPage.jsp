<%@ include file="/taglibs.jsp"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<layout:html layout="false">

<%@ include file="/header_footer/header_log_1.jsp"%>
Connexion � l'espace Collaborateur
<%@ include file="/header_footer/header_log_2.jsp"%>

<td class="BACKG">

<p>&nbsp;</p>
<p>&nbsp;</p>
<table  align="center" width="60%" class="ENTETE">
  <tr>
    
    <td  width="12" align="left" ><html:img page="/images/info.gif"  border="0"/> </td>
    <td width="1%" align="center" > </td>
    <td width="85%" height="18" align="left"> <layout:message key="title.msg.common"/> </td>
   <td width="5%" align="center" ><a href="loginCollab.jsp"><html:img page="/images/RETURN.gif" alt="retour � la page de connexion" border="0"/></td>
  </tr>
</table>
<layout:panel   styleClass="CORPS_MSG" key="" width="60%" align="center">
<p>&nbsp;</p>
<strong>
<html:errors/>
</strong> 
<p>&nbsp;</p> 
</layout:panel>

</td>
</tr>
</table>

</layout:html>

<%@ include file="/header_footer/footer_log.jsp"%>
