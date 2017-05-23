
<%@ include file="/declaration/taglibs.jsp"%>  
<%@ page import="javax.servlet.http.Cookie"%>
<%@ page import="java.io.*"%>





<layout:form action="authinterne.do" focus="idinternaute" styleClass="FORM_BEN"  onsubmit="setTimeout('redirErr()',90000);" style="width-min:250px;">  
		
 			<layout:field key="app.idinternaute" property="idinternaute" size="16" maxlength="10" isRequired="true" type="text"/> 
		
		
				<layout:field key="app.motpasse" property="motpasse" size="16" maxlength="10" isRequired="true" type="password" />
				<html:hidden property="typeAcces" value="GE"/> 
		   
				<%
					request.setAttribute("typeAcces" , "GE");
				%>
		   
	
		<layout:formActions>
			<layout:row>
				<layout:reset styleClass="btn btn-danger" value="Rétablir" /> 
				<layout:submit styleClass="btn btn-success" property="submit" value="Valider" onclick="setTimeout('wait()',2000);"/>  
			</layout:row>
		</layout:formActions> 
	</layout:form>
	
<script language="javascript">		
		function redirErr(){
			parent.location.href = "<%= (String) request.getContextPath() %>/msgPrblTech.do";			
		}
		function wait() {
			document.getElementById('wait').style.display = 'block';
			document.getElementById('wait_fond').style.display = 'block';
		}		
</script>