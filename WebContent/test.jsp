<%@ page import="java.io.File"%>

<%
String cheminGrantedWin = session.getServletContext().getInitParameter("CheminGrantedWin"); 
String cheminGrantedLinux = session.getServletContext().getInitParameter("CheminGrantedLinux"); 

boolean grantExistsWin = (new File(cheminGrantedWin)).exists();
boolean grantExistsLinux = (new File(cheminGrantedLinux)).exists();

%>

<BR>

Chemin Win : <%= cheminGrantedWin %><BR>

<% if(grantExistsWin){ %>
	grantExistsWin
<% }else{ %>
	grantExistsWin n'existe pas
<% } %>

<BR>
<BR>

Chemin Linux : <%= cheminGrantedLinux %><BR>

<% if(grantExistsLinux){ %>
	grantExistsLinux
<% }else{ %>
	grantExistsLinux n'existe pas
<% } %>

