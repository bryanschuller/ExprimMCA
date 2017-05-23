<%@ include file="/declaration/taglibs.jsp"%>


<H1>
    	<layout:message key="title.envmsg.message"/> 
</H1> 


<layout:form action="uploadFile.do" focus="titre" styleClass="FORMULAIRE" width="60%" enctype="multipart/form-data" reqCode="sendForm"> 




<layout:row>
	


</layout:row>

<table><tr><td colspan="2">
	<layout:panel key=""   styleClass="DEVIS_ENFANTS">
		
		<layout:text key="info.envmsg.titre" property="fichier" 
	size="100" isRequired="true" />
			
		
	</layout:panel>
</td></tr>
</table>
		


<tr><td colspan="2">
&nbsp; 
</td></tr>

<tr><td colspan="2">
<bean:message key="general.formulaire.obligatoire"/>
</td></tr>



<layout:formActions> 
<layout:reset styleClass="btn btn-danger" value="Rétablir"/> 
<layout:submit styleClass="btn btn-success" property="submit" value="Valider"/> 
</layout:formActions> 
</layout:form>


