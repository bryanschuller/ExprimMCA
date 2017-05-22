<%@ include file="/declaration/taglibs.jsp"%>


<%@ page import="java.util.Enumeration" %>

<H1 id="TITREDOSSIER">
	<div class="texteH">
	 <layout:message key="docWord.titre"/> 
	</div>
</H1>

<br>

<H2>
	<div class="texteH">
	 <layout:message key="docWord.prompt.liste.titre"/> 
	</div>
</H2>
 
<br>
	    
<!--
	    <td width="5%" align="center" ><a href="javascript:preview(7)"><html:img page="/images/PREVIEW.gif" alt="prévisualiser la page" border="0"/></td>
	    <td width="5%" align="center" ><a href="javascript:window.print()"><html:img page="/images/PRINT.gif" alt="imprimer la page" border="0"/></td>
-->

   
<%

request.setAttribute("indVar", "0");
 
%>
 
<html:errors property="org.apache.struts.action.GLOBAL_ERROR"/>



<layout:form action="sendVarDoc.do" focus="var_1" styleClass="FORMULAIRE" width="55%" > 
	<input type="hidden" name="nextStep" value="1">
			
	

		<table class="FORM_BEN" align="center" width="500px">
	

		

		<logic:iterate id="lstVar" name="lstVarInDoc">
		
	
<bean:define id='visVar' name="lstVar" property="WVISIBLE"/>
		
  	<%
if(visVar == "oui"){
int indVar = Integer.parseInt((String)request.getAttribute("indVar"));
indVar++;
request.setAttribute("indVar", Integer.toString(indVar));



%>
	
  		<bean:define id='lngVar' name="lstVar" property="WLNG"/>
		<bean:define id='nomVar' name="lstVar" property="WVAR"/>
		<bean:define id='libVar' name="lstVar" property="WLIB"/>
		<bean:define id='valVar' name="lstVar" property="WVAL"/>
		
		<tr><th><span>
  		
			<bean:write name="lstVar" property="WLIB"/> :
			
			
		</span></th><td>
		
			<input type="text" name="val_<%= (String)request.getAttribute("indVar") %>" maxlength="<%= lngVar %>"  value="<%= valVar %>" style="width:300px;">
		
		
		
		</td></tr>
		

<%
}
%>

</logic:iterate>
</table>

<br><br>
	
	
	
	
	
	<layout:formActions> 
		

		<input type="button" value="Annuler" onclick="location.href='<%= (String)request.getContextPath()  %>/listeDocWord.do'" class="BOUT1"/>
    
	<layout:reset styleClass="BOUT1" value="Rétablir"/> 
	<bean:define id='pStep' name="pStep"/>
	<bean:define id='nStep' name="nStep"/>
	<%

	if(!((String)request.getAttribute("pStep")).equals("0")){
	%>
	<input type="submit" name="submit" value="Précédent" onclick="document.getElementsByName('nextStep')[0].value='<%= pStep %>';" class="BOUT1">
	
	<%}%>
	
	<input type="submit" name="submit" value="Suivant" onclick="document.getElementsByName('nextStep')[0].value='<%= nStep %>';" class="BOUT1">

		
	</layout:formActions> 
</layout:form> 









