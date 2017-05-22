
<%@ include file="/declaration/taglibs.jsp"%>


<% if(null != typeD && typeD.equals("ENT")) { %>


	<H2>
	<div class="texteH">Vos appels de cotisations</div>

	</H2>
	<div style="margin: 20px 50px 0px 50px;">
	<div><a
		href="<%=(String) request.getContextPath()%>/viewAppCot.do">Consultez
	vos appels de cotisations. </a></div>
	<br>
	</div>

<% } %>
