<%@ page errorPage="/jsp/erreur/erreur.jsp" %>
<%@ page import="java.io.File"%>
<%@ include file="/declaration/taglibs.jsp"%>

<%
String grantFilePath = (String) request.getSession().getServletContext().getRealPath("/") + "TEMP/granted.ini";
System.out.println(grantFilePath);
boolean grantFile = (new File(grantFilePath)).exists();
if (!grantFile) {
	%>
    <jsp:forward page="/jsp/messages/pageMaintenance.jsp"/>
	<%
} %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<script src="https://adminlte.io/themes/AdminLTE/plugins/jQuery/jquery-3.1.1.min.js"></script>

<layout:html layout ="false">
	<div class="login-box">
		<div class="login-logo"></div>
		<div class="login-box-body">
			<p class="login-box-msg">
				Veuillez  saisir votre identifiant <br>
				et <br>
				votre code d'acc&egrave;s ou votre mot de passe personnalis&eacute; :
			</p>
			<tiles:insert attribute="body" />
 			<logic:notPresent name="LoginGestionnaireForm">
				<%
					String typeAcces = (String) request.getAttribute("typeAcces");
					if(null == typeAcces) {typeAcces = "";}
				%>
				<p>
					<font size="1">Si vous avez oublié votre mot de passe, <a href="<%= (String)request.getContextPath() %>/forgetPswd.do?typeAcces=<%= typeAcces %>">cliquez ici.</a></font><br/>
					<font size="1">
						Vous avez la possibilit&eacute; de personnaliser votre mot de passe si vous le souhaitez... (Option 'Mot de passe personnalis&eacute;' du menu).<br/>
						Le <strong>code d'acc&egrave;s</strong> qui vous est fourni lors de votre 
						inscription<strong> reste toujours valable</strong> :<br>
						Il figure sur la partie haute du porte-adresse de votre nouvelle carte 
						d'adh&eacute;rent ou en bas de page des d&eacute;comptes envoy&eacute;s.
					</font>
				</p>
			</logic:notPresent>
		</div>
	</div>

	<!-- Bootstrap 3.3.7 -->
	<script src="https://adminlte.io/themes/AdminLTE/bootstrap/js/bootstrap.min.js"></script>
	<!-- AdminLTE App -->
	<script src="https://adminlte.io/themes/AdminLTE/dist/js/adminlte.js"></script>

	<script type="text/javascript">
	    $(document).ready(function () {
	    	$('body').addClass('login-page');
	  	});
	</script>

</layout:html>