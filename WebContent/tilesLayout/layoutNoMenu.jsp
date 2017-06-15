<%@ page errorPage="/jsp/erreur/erreur.jsp" %>
<%@ include file="/declaration/taglibs.jsp"%>

<%-- Layout component 
  parameters : title, header, menu, body, footer 
--%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<layout:html layout ="false">
	<div id="container"> 
		<div class="content">
			<div>
			    <noscript>
					<span class="NO_JS">
	    				<layout:message key="general.info.noscript" /> &nbsp;&nbsp;
	    			</span>
	    				<a href="<%= (String)request.getContextPath() %>/Commun/Assistance.jsp"><layout:message key="general.info.resoudre" /></a> 
	  			</noscript>
	  				
				<div class="LOGIN_BACKG" align="center">  
					<tiles:insert attribute="body" />
				</div>
			</div> 	  
		</div> 
	</div>
	<div>
	    <tiles:insert attribute="footer" />
	</div>
</layout:html>
