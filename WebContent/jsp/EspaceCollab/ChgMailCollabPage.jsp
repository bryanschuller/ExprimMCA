<%@ include file="/header_footer/header_Collab_1.jsp"%>
<layout:html layout="false">
<%@ include file="/header_footer/header_Collab_2.jsp"%>

<td class="BACKG" align="center">
      
 <p>&nbsp;</p>
<p>&nbsp;</p>
  
  <table border="0" cellspacing="0" width="60%" cellpadding="0"><tr><td>

<table  align="center" width="100%" class="ENTETE">
  	<tr>
	    <td width="1%" align="center" > </td>
	    <td width="85%" height="18" align="left"> 
	    	<layout:message key="title.changemail.edit"/> 
	    </td>
<!--
	    <td width="5%" align="center" ><a href="javascript:preview(7)"><html:img page="/images/PREVIEW.gif" alt="prévisualiser la page" border="0"/></td>
	    <td width="5%" align="center" ><a href="javascript:window.print()"><html:img page="/images/PRINT.gif" alt="imprimer la page" border="0"/></td>
-->
	</tr>
</table> 
</td></tr>

<layout:form action="ChgMailCollab.do" focus="mail" styleClass="CORPS_ADRESSE" width="60%"> 

<tr><td colspan="2">
	<table class="CORPS_MSG" width="90%" align="center">
		<tr><th width="41%"><span class="LOGIN_LABEL">
			<bean:message key="app.mail.current"/>
		</span></th><td>
			<layout:write name="infoA" property="mail" styleClass="LOGIN_LABEL" layout="false"/> 
		</td></tr>
	</table>
</td></tr>

<tr><td colspan="2">
<table class="CORPS_MSG" width="90%" align="center">
		<layout:text key="app.mail.new" property="mail" size="30" maxlength="80" styleClass="LOGIN_LABEL" isRequired="true"/> 
		<layout:text key="app.mail.confirm" property="confmail" size="30" maxlength="80" styleClass="LOGIN_LABEL" isRequired="true"/>  
</table>
</td></tr>

<html:hidden property="acces" value="Collaborateur"/> 

<layout:formActions> 
<layout:reset styleClass="BOUT1" value="Rétablir"/> 
<layout:submit styleClass="BOUT1" property="submit" value="Valider"/> 
</layout:formActions> 
</layout:form>
 
</td> 
</tr>
</table>

</td> 
</tr>
</table>

</layout:html>

<%@ include file="/header_footer/footer_Collab.jsp"%>
