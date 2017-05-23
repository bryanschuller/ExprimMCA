<%@ include file="/declaration/taglibs.jsp"%>
<%@ page import="com.exprimweb.struts.modele.*" %>
<%@ page import="java.util.Vector" %>


<H1>
    	<layout:message key="title.envmsg.message"/> 
</H1> 

<layout:row>
	    	<layout:write name="echangeActuel" property="titre"  layout="false" /> 
	</layout:row>
	
<layout:form action="repondreEchange.do" focus="corps" styleClass="FORMULAIRE" width="60%" enctype="multipart/form-data"  reqCode="sendForm"> 



<layout:row>
	<layout:textarea key="info.envmsg.corps" property="corps" size="50" 
	maxlength="30" isRequired="true" />
</layout:row>

<%	ParametrageEchange paramEchange = (ParametrageEchange) getServletContext().getAttribute("paramEchange");  
	Vector lFile = (Vector) session.getAttribute("lFile");  
	if (lFile == null || lFile.size() < paramEchange.getNbrMaxPj()) {%>

<layout:row>	
		
	<html:file size="80" property="fichier" />
			
	<layout:submit styleClass="btn" property="submit" value="Joindre" reqCode="uploadFile"/>
	
</layout:row>

<%} 
	
	else{ %>
	
	
		<strong><bean:message key="envoyer.piece.jointe.nbrmax.pj"/></strong>
	
	
<%	} %>
	
<logic:present name="lFile" scope="session">
	<layout:row>
		<layout:collection name="lFile" id="lFile" title=""
			styleClass="DONNE_100p100" styleClass2="DONNE_INTER_100p100" 
			selectProperty="index"	selectType="checkbox" selectName="selIndex" >
		
			<layout:collectionItem title="" property="blanck"/>
			
			<layout:collectionItem title="Nom du Fichier" property="nomVisible"/>
		
		</layout:collection>
		
		<layout:submit styleClass="btn" property="submit" value="Supprimer" reqCode="deleteFile"/>
		
	</layout:row>
</logic:present>

<layout:row>		
	<tr><td><strong>
	<html:errors/>
	</strong></td></tr>
</layout:row>

<tr><td colspan="2">
&nbsp; 
</td></tr>

<tr><td colspan="2">
<bean:message key="general.formulaire.obligatoire"/>
</td></tr>



<layout:formActions> 
<layout:reset styleClass="btn btn-danger" value="Rétablir"/> 
<layout:submit styleClass="btn" property="submit" value="Envoyer" reqCode="sendForm"/> 
</layout:formActions> 
</layout:form>


<logic:iterate name="echangeActuel" property="messages" id="message" >

	
	<layout:row>
	
		Le <layout:write name="message"  property="date"  layout="false"/>
	    
	    à <layout:write name="message"  property="heure"  layout="false"/>
	  
	  	<logic:equal name="message" property="auteur" value="*INT">
	    		Vous avez a dit 
	 	</logic:equal>
	 	<logic:notEqual name="message" property="auteur" value="*INT">
	    		La Mutuelle a dit 
	 	</logic:notEqual>
	</layout:row>
	
	<layout:row>	
	    	<layout:write name="message"  property="message"  layout="false" filter="false"/>
	</layout:row>
	

	
	<logic:iterate name="message" property="piecesJointe" id="pj" >
	
		<layout:row>
			<a href="<%= (String)request.getContextPath()%>/telechargerPJ.do?id=<bean:write name="pj" property="nomFichier" />"> <layout:write name="pj" property="nomVisible" layout="false" /></a>
				
		</layout:row>
	
	</logic:iterate>
			
	<BR>
			
</logic:iterate>
