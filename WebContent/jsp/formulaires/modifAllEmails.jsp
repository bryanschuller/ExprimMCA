<%@ include file="/declaration/taglibs.jsp"%>

<bean:size name="lEmails" id="tailleListe"/>

<H1>
	<div class="texteH">
		<logic:equal name="tailleListe" value="1">		
	    	<layout:message key="title.change.one.mail"/>	    	
		</logic:equal>		
		<logic:greaterThan name="tailleListe" value="1">	
	    	<layout:message key="title.change.all.mails"/>	    	
		</logic:greaterThan>
	</div>
	<div class="iconesH">
		<a href="<%= (String)request.getContextPath()  %>/retourArriere.do<%= (null != (String)request.getAttribute("pileRequestReqParam")?(String)request.getAttribute("pileRequestReqParam"):"") %>"><html:img page="/images/RETURN.gif" alt="Retour" border="0"/></a>
	</div>
</H1> 
<BR>

<layout:form action="/changementAllEmails" focus="newEmail" styleClass="FORMULAIRE" width="80%" onsubmit="return validateModEmailForm(this)"> 

<tr><td colspan="2" style="font-size:12px;">






	
</td></tr>

<%@ include file="/jsp/formulaires/incl/eMailForm.jsp"%>


<layout:formActions> 
<layout:row>
<layout:reset styleClass="BOUT1" value="Rétablir"/> 
<layout:submit styleClass="BOUT1" property="submit" value="Valider" /> 
</layout:row>
</layout:formActions> 
</layout:form>

<html:javascript formName="modEmailForm" />

