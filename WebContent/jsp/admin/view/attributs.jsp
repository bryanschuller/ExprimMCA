<%@ page import="java.util.Enumeration"%>

<BR>

<table>
	<tr><th>Attribut Nom</th><th>Attribut Valeur</th></tr>
	<%
	for(Enumeration<String> e = request.getAttributeNames() ; e.hasMoreElements() ; ) {
		String attName = (String) e.nextElement();
		String attValue = request.getAttribute(attName).toString();
		%>
		<tr><td><%= (String) attName %></td><td><%= (String) attValue %></td></tr>
		<%
	}				
	%>
</table>
		