<%@ include file="/declaration/taglibs.jsp"%>

<div class="login-box">
	<div class="login-box-body">
		<p class="login-box-msg">
			<h3>Mot de passe oubli&eacute;</h3>
			Retrouver votre mot de passe :
		</p>

		<html:errors property="org.apache.struts.action.GLOBAL_ERROR"/>

		<%
		String idInternaute = (String) request.getParameter("idInternaute");
		if(null == idInternaute) {idInternaute = "";}
		%>

		<layout:form action="MotPasseForget.do" focus="idInternaute" align="center">

			<div class="form-group">
				<label for="idinternaute"><bean:message key="app.username"/></label>
				<input type="text" name="idInternaute" size="16" maxlength="11" class="form-control" value="<%= idInternaute %>" required>
				<span  class="ERROR" style="text-align:left;">
					<html:errors property="idInternaute" />
				</span> 
			</div>
			<div class="form-group">
				<label for="mail"><bean:message key="app.mail.mail"/></label>
				<input type="text" name="mail" size="30" maxlength="80" class="form-control" required>
				<span  class="ERROR" style="text-align:left;">
					<html:errors property="mail" />
				</span> 
			</div>

			<%
			String typeAcces = (String) request.getParameter("typeAcces");
			if(null == typeAcces) {typeAcces = "";}
			%>
			<html:hidden property="acces" value="<%= typeAcces %>"/>

			<layout:formActions>
				<layout:row>
					<layout:reset styleClass="btn btn-danger" value="Rétablir"/> 
					<layout:submit styleClass="btn btn-success" property="submit" value="Valider"/> 
				</layout:row>
			</layout:formActions>
		</layout:form> 

		<font size="1">
			Conformément aux dispositions de la loi du n°78-17 du 6 janvier 1978, vous disposez d'un droit d'accès, de rectification et d'opposition sur les données nominatives vous concernant.
		</font>
</div>

<!-- jQuery 3.1.1 -->
<script src="<%= (String)request.getContextPath()  %>/scripts/new_theme/jquery-3.1.1.min.js"></script>

<script type="text/javascript">
    $(document).ready(function () {
      $('body').addClass('login-page');
    });
</script>

<style>
	.main-footer {
		margin-left: 0px; 
	}
</style>