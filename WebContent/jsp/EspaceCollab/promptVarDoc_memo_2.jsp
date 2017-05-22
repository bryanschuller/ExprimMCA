<%@ include file="/header_footer/header_Collab_1.jsp"%>
<layout:html layout="false">
<%@ include file="/header_footer/header_Collab_2.jsp"%>
<%@ page import="java.util.Enumeration" %>

<td class="BACKG" align="center">
      
 <p>&nbsp;</p>
<p>&nbsp;</p>
  
  <table border="0" cellspacing="0" width="90%" cellpadding="0"><tr><td>

<table  align="center" width="100%" class="ENTETE">
  	<tr>
	    <td width="1%" align="center" > </td>
	    <td width="85%" height="18" align="left"> 
	    	<layout:message key="docWord.prompt.liste.titre"/> 
	    </td>
<!--
	    <td width="5%" align="center" ><a href="javascript:preview(7)"><html:img page="/images/PREVIEW.gif" alt="prévisualiser la page" border="0"/></td>
	    <td width="5%" align="center" ><a href="javascript:window.print()"><html:img page="/images/PRINT.gif" alt="imprimer la page" border="0"/></td>
-->
	</tr>
</table>   
</td></tr> 
   
<%

request.setAttribute("indVar", "-1");
 
%>
 
<html:errors property="org.apache.struts.action.GLOBAL_ERROR"/></font> 



<layout:form action="sendVarDoc.do" focus="var_1" styleClass="CORPS_ADRESSE"  width="90%"> 
	
	
	<tr><td colspan="2">
		<table class="CORPS_MSG" width="90%" align="center">
	
		<tr><td colspan = '2' >
		
		
	<layout:collection name="lstVarInDoc" id="lstVar" title="" styleClass="DONNE_100p100" styleClass2="DONNE_INTER_100p100"  >
  	<%

int indVar = Integer.parseInt((String)request.getAttribute("indVar"));
indVar++;
request.setAttribute("indVar", Integer.toString(indVar));



%>
		
  <layout:collectionItem>
  		
  		<bean:define id='lngVar' name="lstVar" property="WLNG"/>
		<bean:define id='nomVar' name="lstVar" property="WVAR"/>
		<bean:define id='libVar' name="lstVar" property="WLIB"/>
		<bean:define id='valVar' name="lstVar" property="WVAL"/>
		
		<tr><th><span class="LOGIN_LABEL">
  		
			<bean:write name="lstVar" property="WLIB"/> :
			
			<input type="hidden" name="var_<%= (String)request.getAttribute("indVar") %>" value="<%= nomVar %>">
			<input type="hidden" name="lib_<%= (String)request.getAttribute("indVar") %>" value="<%= libVar %>">
			
		</span></th><td>
		
		<%--	
		<%= (String)request.getAttribute("indVar") %>
		
		<%= (String)((com.except.docWord.exprim.WBT011.StructLSM_VAR)session.getAttribute("lstVar")).getTP3VAR() %>
			--%>
			<input type="text" name="val_<%= (String)request.getAttribute("indVar") %>" maxlength="<%= lngVar %>" size="60" value="<%= ValVar %>" class="LOGIN_LABEL">
		
		
		
		</td></tr>
	</layout:collectionItem>
	
	
</layout:collection>


		</td></tr>
	</table>
	</td></tr>
	
	
	
	
	<layout:formActions> 
	<layout:reset styleClass="BOUT1" value="Rétablir"/> 
	<layout:submit styleClass="BOUT1" property="submit" value="Suivant"/> 
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
