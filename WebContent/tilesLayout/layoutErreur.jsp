<%@ page isErrorPage="true"  %>
<%@ include file="/declaration/taglibs.jsp"%>

<%-- Layout component 
  parameters : title, header, menu, body, footer 
--%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<layout:html layout="false">


<div id="container">

	<div id="header">
		<tiles:insert attribute="header" />
	</div>
  
	<div class="menu">
		<tiles:insert attribute="menu"/>
	</div>
	
	<div class="content">
				
		<div  id="panneauCentreALeft">
			<noscript>
				<span class="NO_JS">
	   				<layout:message key="general.info.noscript" /> &nbsp;&nbsp;
	   			</span>
   				<a href="<%= (String)request.getContextPath() %>/Commun/Assistance.jsp"><layout:message key="general.info.resoudre" /></a> 
			</noscript>
			<tiles:insert attribute="body" />
		</div>
		
		
			<tiles:insert attribute="footer" />
		</div>
		  
	</div> <!-- Fin "content" du header -->
</div> <!-- Fin "container" du header -->


		
</layout:html>

<style>
	.main-footer {
		margin-left: 0px; 
	}
</style>