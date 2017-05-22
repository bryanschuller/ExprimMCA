

<%@ include file="/declaration/taglibs.jsp"%>


<layout:form action="authinterne.do" focus="idinternaute" styleClass="FORM_BEN"  onsubmit="setTimeout('redirErr()',90000);" style="width-min:250px;">  
		
 			<layout:field key="app.idinternaute" property="idinternaute" size="16" maxlength="7" isRequired="true" type="text"/> 
		
		
				<layout:field key="app.motpasse" property="motpasse" size="16" maxlength="10" isRequired="true" type="password" />
				<html:hidden property="typeAcces" value="TIE"/> 
		   
				<%
					request.setAttribute("typeAcces" , "TIE");
				%>
		   
	
		<layout:formActions>
			<layout:row>
				<layout:reset styleClass="btn" value="Rétablir" /> 
				<layout:submit styleClass="btn" property="submit" value="Valider" onclick="setTimeout('wait()',2000);"/>  
			</layout:row>
		</layout:formActions> 
	</layout:form>
	
	
<script language="javascript">		
		function redirErr(){
			parent.location.href = "<%= (String) request.getContextPath() %>/msgPrblTech.do";			
		}
		function wait() {
			document.getElementById('wait').style.display = 'block';
			document.getElementById('wait').style.marginTop = '-35%';
		}		
</script>