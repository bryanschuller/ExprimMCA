<%@ include file="/declaration/taglibs.jsp"%>
<%@ page import="org.apache.log4j.Logger" %>

<% Logger loggerExprim = Logger.getLogger("com.exprimweb.erreur.noAction");
	loggerExprim.warn("Action ExprimWeb Inexistante"); %>

<div class="callout callout-danger">				
				
	<strong>ACTION INEXISTANTE</strong>				
				
</div>