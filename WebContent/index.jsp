<%@ page import="java.io.File"%>
<%@ include file="/declaration/taglibs.jsp"%>

<% String grantFilePath = (String) request.getSession().getServletContext().getRealPath("/") + "TEMP/granted.ini";
System.out.println(grantFilePath);
	boolean grantFile = (new File(grantFilePath)).exists();
if (!grantFile) {
	%>
    <jsp:forward page="/jsp/messages/pageMaintenance.jsp"/>
<%
} %>





<tiles:insert definition="pageLogin" />

    