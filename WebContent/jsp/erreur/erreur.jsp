<%@ page isErrorPage="true"  %>
<%@ page import="org.apache.log4j.Logger" %>

<% Logger loggerExprim = Logger.getLogger("com.exprimweb.erreur.jsp");
	loggerExprim.fatal("Exception", exception); %>
	
<%String execContext = getServletContext().getInitParameter("NiveauExec");

if (execContext.equals("dev")) { %>

<strong>Nom de l'exception : </strong><br>
<%= exception.toString() %> <br><br><br>

<strong>Message de l'exception : </strong><br>
<%= exception.getMessage() %> <br><br><br>

<strong>Trace :</strong><br>
    <% 
	 java.io.PrintWriter outstream = new java.io.PrintWriter(out);
     exception.printStackTrace(outstream); %>
<%} else  {%>  
		<div class="callout callout-danger">
			<strong>Une erreur est survenue...</strong>
		</div>
<% } %>