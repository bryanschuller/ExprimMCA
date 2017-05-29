<%@ include file="/declaration/taglibs.jsp"%>


<H1>
    	<layout:message key="title.getmail.edit"/> 
</H1> 
<BR>

<div class="box box-mca-yellow">
	<div class="box-body">
		<layout:form action="/changementFinaliseEmails" focus="newEmail"  onsubmit="return validateModEmailForm(this)"> 

			<tr><td colspan="2" style="font-size:12px;">
				Bonjour, <br/>
				<bean:message key="app.mail.not.set"/>
				
			</td></tr>

			<%@ include file="/jsp/formulaires/incl/eMailForm.jsp"%>


			<layout:formActions> 
			<layout:reset styleClass="btn btn-danger" value="Rétablir"/> 
			<layout:submit styleClass="btn btn-success" property="submit" value="Valider" /> 
			</layout:formActions> 
		</layout:form>
	</div>
</div>

<html:javascript formName="modEmailForm" />


