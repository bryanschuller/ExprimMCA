<%@ include file="/declaration/taglibs.jsp"%>


<H1>
    	<layout:message key="title.envmsg.message"/> 
    	<div class="iconesH">
			<a href="<%= (String)request.getContextPath()  %>/retourArriere.do<%= (null != (String)request.getAttribute("pileRequestReqParam")?(String)request.getAttribute("pileRequestReqParam"):"") %>"><html:img page="/images/RETURN.gif" alt="Retour" border="0"/></a>
		</div>
</H1> 

<div id="EXC_FORM_ECHANGE">
<layout:form action="echangeMsg.do" focus="titre" width="60%" enctype="multipart/form-data"  reqCode="sendForm" > 



<tr><td colspan="2">

<logic:present name="saisieLocked" scope="session">
	<table class="FORM_CONTENT">
		<layout:text key="info.envmsg.titre" property="titre" 
		size="50" maxlength="30" isRequired="true" readonly="true"/>
	
		<layout:textarea key="info.envmsg.corps" property="corps" cols="50" rows="8"
		maxlength="1000" isRequired="true" readonly="true"/>
	</table>
</logic:present>

<logic:notPresent name="saisieLocked" scope="session">
	<table class="FORM_CONTENT">
		<html:hidden property="service" value=""/> 
		<layout:text key="info.envmsg.titre" property="titre" 
		size="50" maxlength="30" isRequired="true"/>
	
		<layout:textarea key="info.envmsg.corps" property="corps" cols="50" rows="8"
		maxlength="1000" isRequired="true"/>
	</table>
</logic:notPresent>

</td></tr>
<tr><td colspan="2">
	&nbsp;
</td></tr>





<logic:present name="lPiecesRequise" scope="session">

<bean:size id="size" name="lPiecesRequise" property="listePieces"/>
<logic:greaterThan name="size" value="0">

	<tr><td colspan="2">
		<table class="FORM_CONTENT">
			<tr><td>
				<layout:collection name="lPiecesRequise" property="listePieces" id="piece" title=""
					styleClass="LIGNE_A" styleClass2="LIGNE_B" >
					
					
					<layout:collectionItem title="Pièces requises" property="libelle"/>	
							
				</layout:collection>
			</td></tr>
		</table>
	</td></tr>
	<tr><td colspan="2">
		&nbsp;
	</td></tr>
	</logic:greaterThan>
</logic:present>




	
<tr><td colspan="2">
	<table class="FORM_CONTENT">
		<tr><td>
				<html:file size="40" property="fichier"	
						accept="<%= (String) session.getAttribute("extentionsAutorise") %>"/>
				
				</td><td>
			<table>
			<layout:submit styleClass="BOUT1" property="submit" 
				value="Joindre" reqCode="uploadFile"/>
			</table>				
		</td></tr>
	
<logic:present name="lFile" scope="session">
<bean:size name="lFile" id="size"/>
<logic:greaterThan name="size" value="0">
<tr><td colspan="2">
<table class="LISTE_PJ">
<tr><td><table>
		<layout:collection name="lFile" id="lFile" title=""
			styleClass="LIGNE_A" styleClass2="LIGNE_B" 
			selectProperty="index"	selectType="checkbox" selectName="selIndex" >
		
			<layout:collectionItem title="" property="blanck"/>
			
			<layout:collectionItem title="Fichiers joint" property="nomVisible"/>
		
		</layout:collection>
		</table></td><td><table>
		<layout:submit styleClass="BOUT1" property="submit" value="Supprimer les pièces sélectionnés" reqCode="deleteFile"/>
		</table></td></tr>
</table>
	</td></tr>
	</logic:greaterThan>
</logic:present>

</table>
	</td></tr>


<layout:row>		
	<strong>
	<html:errors/>
	</strong> 
</layout:row>

<tr><td colspan="2">
&nbsp; 
</td></tr>

<tr><td colspan="2">
<img name="corpsrequired" src="/ExprimWEB/images/ast.gif"><bean:message key="general.formulaire.obligatoire"/>
</td></tr>



<layout:formActions> 
<layout:reset styleClass="BOUT1" value="Rétablir"/> 
<layout:submit styleClass="BOUT1" property="submit" value="Envoyer" reqCode="sendForm"/> 
</layout:formActions> 
</layout:form>

</div>

