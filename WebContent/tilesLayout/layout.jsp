<%@ page errorPage="/jsp/erreur/erreur.jsp" %>
<%@ page import="java.io.File"%>
<%@ page import="com.exprimweb.struts.modele.*"%>

<%@ include file="/declaration/taglibs.jsp"%>


<%-- Executer les controls préalables :
			- Site en maintenance
			- Internaute authentifié --%>

<%

String grantFilePath = (String) request.getSession().getServletContext().getRealPath("/") + "TEMP/granted.ini";
System.out.println(grantFilePath);
	boolean grantFile = (new File(grantFilePath)).exists();
if (!grantFile) {
	%>
    <jsp:forward page="/jsp/messages/pageMaintenance.jsp"/>
<%
}

Internaute internaute = (Internaute) session.getAttribute("internaute");
if(null == internaute){ 
	%>
    <jsp:forward page="/jsp/formulaires/pageLogin.jsp"/>
<%
}

%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<layout:html layout="false">

<!--[if lte IE 7]><link rel="stylesheet" href="<%= (String)request.getContextPath()  %>/config/MCAExprim_IE.css" type="text/css"><![endif]-->
<!--[if IE 8]><link rel="stylesheet" href="<%= (String)request.getContextPath()  %>/config/MCAExprim_IE_8.css" type="text/css"><![endif]-->


<div id="container" class="wrapper">
	<header class="main-header">
		<tiles:insert attribute="header" />
	</header>
	
  <!-- Left side column. contains the logo and sidebar -->
  <aside class="main-sidebar">
    <tiles:insert attribute="menu"/>
  </aside>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <!-- 
    <section class="content-header">
      <h1>
        Titre de la page
        <small>Petit texte</small>
      </h1>
    </section>
    -->

    <!-- Main content -->
    <section class="content">
      <tiles:insert attribute="body" />
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->

  <tiles:insert attribute="footer" />
</div>

<div  id="wait" class="wait_mask" ></div>
<div  id="wait_fond" class="wait_mask_fond"></div> 


<!-- jQuery 3.1.1 -->
<script src="https://adminlte.io/themes/AdminLTE/plugins/jQuery/jquery-3.1.1.min.js"></script>
<!-- Bootstrap 3.3.7 -->
<script src="https://adminlte.io/themes/AdminLTE/bootstrap/js/bootstrap.min.js"></script>
<!-- AdminLTE App -->
<script src="https://adminlte.io/themes/AdminLTE/dist/js/adminlte.js"></script>

<script type="text/javascript">
    $(document).ready(function () {
      // ajout du thème CSS MCA
      $('body').addClass('skin-red-light skin-mca fixed sidebar-mini');

      // ajout des lignes sur les tableaux via bootstrap
      $('table.LIGNE_A').each(function(){
        $(this).find('table:first').addClass('table table-striped');
      });
    });
</script>

</layout:html>
