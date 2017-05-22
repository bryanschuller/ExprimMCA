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
	    	<layout:message key="title.changepassword.edit"/> 
	    </td>
<!--
	    <td width="5%" align="center" ><a href="javascript:preview(7)"><html:img page="/images/PREVIEW.gif" alt="prévisualiser la page" border="0"/></td>
	    <td width="5%" align="center" ><a href="javascript:window.print()"><html:img page="/images/PRINT.gif" alt="imprimer la page" border="0"/></td>
-->
	</tr>
</table>   
</td></tr> 
   
   
 

<html:errors property="org.apache.struts.action.GLOBAL_ERROR"/></font> 



<layout:form action="ChgPswdCollab.do" focus="password" styleClass="CORPS_ADRESSE"  width="60%"> 
	
	
	<tr><td colspan="2">
		<table class="CORPS_MSG" width="90%" align="center">
	<tr><td>
			<layout:field key="app.password.current" property="password" size="16" maxlength="10" type="password" styleClass="LOGIN_LABEL" isRequired="true"/>
			</td></tr>
		<tr><td colspan = '2' >
	(Code d'accès si vous n'avez jamais personnalisé votre mot de passe)
		</td></tr>
	</table>
	</td></tr>
	
	
	<tr><td colspan="2">
	<table class="CORPS_MSG" width="90%" align="center">
	<tr><td>
			<layout:field key="app.password.new" property="newpassword" size="16" maxlength="10" type="password" styleClass="LOGIN_LABEL" isRequired="true"/> 
			<layout:field key="app.password.confirm" property="confirmpassword" size="16" maxlength="10" type="password" styleClass="LOGIN_LABEL" isRequired="true"/>  
		</td></tr>		
		<tr><td colspan = '2' >
	Saisir un mot de passe de 5 caractères minimum...
		</td></tr>
		</table>
	</td></tr>
	
	
	<%--
	<layout:field key="app.password.current" property="password" size="16" maxlength="10" type="password" styleClass="LOGIN_LABEL" isRequired="true"/>
	<layout:field key="app.password.new" property="newpassword" size="16" maxlength="10" type="password" styleClass="LOGIN_LABEL" isRequired="true"/> 
	<layout:field key="app.password.confirm" property="confirmpassword" size="16" maxlength="10" type="password" styleClass="LOGIN_LABEL" isRequired="true"/>  
	
	
	<layout:text key="app.password.current" property="password" size="16" maxlength="10" type="password" styleClass="LOGIN_LABEL" isRequired="true"/> 
	<layout:text key="app.password.new" property="newpassword" size="16" maxlength="10" type="password" styleClass="LOGIN_LABEL" isRequired="true"/> 
	<layout:text key="app.password.confirm" property="confirmpassword" size="16" maxlength="10" type="password" styleClass="LOGIN_LABEL" isRequired="true"/>  
	
	--%>
	
	<html:hidden property="acces" value="Collaborateur"/> 
	 
	<layout:formActions> 
	<layout:reset styleClass="btn" value="Rétablir"/> 
	<layout:submit styleClass="btn" property="submit" value="Valider"/> 
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
