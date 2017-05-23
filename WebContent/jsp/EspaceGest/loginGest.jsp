
<%@ include file="/declaration/taglibs.jsp"%>


	
           
<layout:form action="authGest.do" focus="idGestionnaire" styleClass="FORM_BEN"  onsubmit="setTimeout('redirErr()',90000);">  
 	

 	<layout:field key="gestionnaire.identifiant" property="idGestionnaire" size="16" maxlength="50" isRequired="true"  type="text"/> 
	<layout:field key="gestionnaire.mdp" property="mdpGestionnaire" size="16" maxlength="25" type="password"  isRequired="true"/>
	<layout:field key="gestionnaire.dossier.souhaite" property="idDossier" size="16" maxlength="7" type="number" isRequired="true"/>	 
	<html:hidden property="typeDossier" value="ADH"/> 	    
	<layout:formActions>
		<layout:reset styleClass="btn btn-danger" value="Rétablir"/> 
		<layout:submit styleClass="btn btn-success" property="submit" value="Valider"/>  
	</layout:formActions> 
</layout:form>
<font color="red"><html:errors property="gestionnaire"/></font>
         
<script language="javascript">		
		function redirErr(){
			parent.location.href = "<%= (String) request.getContextPath() %>/msgPrblTech.do";			
		}	
</script>

