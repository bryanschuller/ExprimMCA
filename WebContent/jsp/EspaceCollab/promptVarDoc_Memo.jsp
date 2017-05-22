<%@ include file="/header_footer/header_Collab_1.jsp"%>
<layout:html layout="false">
<%@ include file="/header_footer/header_Collab_2.jsp"%>
<%@ page import="com.except.docWord.exprim.WBT011.StructLSM_VAR" %>
<%@ page import="java.util.Enumeration" %>

<td class="BACKG" align="center">
      
 <p>&nbsp;</p>
<p>&nbsp;</p>
  
  <table border="0" cellspacing="0" width="60%" cellpadding="0"><tr><td>

<table  align="center" width="100%" class="ENTETE">
  	<tr>
	    <td width="1%" align="center" > </td>
	    <td width="85%" height="18" align="left"> 
	    	<layout:message key="title.changepassword.edit"/> 
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



<layout:form action="sendVarDoc.do" focus="var_1" styleClass="CORPS_ADRESSE"  width="60%"> 
	
	
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
  		<bean:define id='lngVar' name="lstVar" property="TP3LON"/>
		<bean:define id='nomVar' name="lstVar" property="TP3VAR"/>
		<tr><td>
  		
  		</td><th width="41%"><span class="LOGIN_LABEL">
			<bean:write name="lstVar" property="TP3LIB"/> :
			
<input type="hidden" name="var_<%= (String)request.getAttribute("indVar") %>" value="<%= nomVar %>">

		</span></th><td>
		
		<%--	
		<%= (String)request.getAttribute("indVar") %>
		
		<%= (String)((com.except.docWord.exprim.WBT011.StructLSM_VAR)session.getAttribute("lstVar")).getTP3VAR() %>
			--%>
			<input type="text" name="val_<%= (String)request.getAttribute("indVar") %>" maxlength="<%= lngVar %>" size="80" value="" class="LOGIN_LABEL">
		
		
		
		</td></tr>
	</layout:collectionItem>
		
		
<layout:collectionItem title="" property="TP3VAR" />
<layout:collectionItem title="" property="TP3LIB" />
<layout:collectionItem title="" property="TP3LON" />
	
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
