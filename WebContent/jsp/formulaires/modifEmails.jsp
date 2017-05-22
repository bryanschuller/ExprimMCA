<%@ include file="/declaration/taglibs.jsp"%>


<H1>
    	<layout:message key="title.getmail.edit"/> 
</H1> 
<BR>

<layout:form action="/changementEmails" focus="newEmail" styleClass="FORMULAIRE" width="60%" reqCode="sendForm"> 

<tr><td colspan="2" style="font-size:12px;">
	Bonjour, <br/>
	<bean:message key="app.mail.not.set"/>
	
</td></tr>

<tr><td colspan="2">
	<layout:panel key=""   styleClass="DEVIS_ENFANTS">
	
		<layout:collection name="lEmails" id="lEmails" title=""
			styleClass="DONNE_100p100" styleClass2="DONNE_INTER_100p100" 
			selectProperty="index"	selectType="checkbox" selectName="selIndex" >
			
			<layout:collectionItem title="" property="blanck"/>
			
			<layout:collectionItem title="Designation" property="designation"/>
			<layout:collectionItem title="e-mail" property="email"/>
			
	</layout:collection>
	
	</layout:panel>
</td></tr>
		
<tr><td colspan="2">
		<layout:text key="app.mail.mail2" property="newEmail" size="30" maxlength="80"  isRequired="true" styleClass="LOGIN_LABEL" /> 
</td></tr>

<tr><td colspan="2">
&nbsp; 
</td></tr>

<tr><td colspan="2">
<img src="<%=(String) request.getContextPath() %>/images/ast.gif"><bean:message key="general.formulaire.obligatoire"/>
</td></tr>



<layout:formActions> 
<layout:reset styleClass="BOUT1" value="Rétablir"/> 
<layout:submit styleClass="BOUT1" property="submit" value="Valider" /> 
</layout:formActions> 
</layout:form>
