<%@ include file="/declaration/taglibs.jsp"%>


<H1>
    	<layout:message key="title.getmail.edit"/> 
</H1> 
<BR>

<layout:form action="/changementFinaliseEmails" focus="newEmail" styleClass="FORMULAIRE" width="80%" onsubmit="return validateModEmailForm(this)"> 

<tr><td colspan="2" style="font-size:12px;">
	Bonjour, <br/>
	<bean:message key="app.mail.not.set"/>
	
</td></tr>

<%@ include file="/jsp/formulaires/incl/eMailForm.jsp"%>


<layout:formActions> 
<layout:reset styleClass="btn" value="R�tablir"/> 
<layout:submit styleClass="btn" property="submit" value="Valider" /> 
</layout:formActions> 
</layout:form>

<html:javascript formName="modEmailForm" />


