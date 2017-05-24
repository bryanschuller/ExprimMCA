
<%@ include file="/declaration/taglibs.jsp"%>

<form action="<%= (String) request.getContextPath() %>/authinterne.do" onsubmit="setTimeout('redirErr()',90000);">
	<div class="form-group">
		<label for="idinternaute"><bean:message key="app.idinternaute"/></label>
		<input type="text" name="idinternaute" size="16" maxlength="11" class="form-control" required>
	</div>
	<div class="form-group">
		<label for="motpasse"><bean:message key="app.motpasse"/></label>
		<input type="password" name="motpasse" size="16" maxlength="10" class="form-control" required>
	</div>
	<%
		String typeAcces = request.getParameter("typeAcces");
		if(null == typeAcces) {typeAcces = "";}
	%>
	<input type="hidden" name="typeAcces" value="<%= typeAcces %>">
	<%
		request.setAttribute("typeAcces" , typeAcces);
	%>

	<div class="form-group pull-right">
		<input type="reset" value="Rétablir" class="btn btn-danger">
		<input type="submit" name="submit" value="Valider" onclick="setTimeout('wait()',2000);" class="btn btn-success">
	</div>
	<div class="clearfix"></div>
</form>

<script language="javascript">		
	function redirErr(){
		parent.location.href = "<%= (String) request.getContextPath() %>/msgPrblTech.do";			
	}
	function wait() {
		document.getElementById('wait').style.display = 'block';
	}	
</script>