<%@ include file="/declaration/taglibs.jsp"%>
<%@ page import="com.exprimweb.struts.modele.*"%>

<%	
	String strContPath = (String) request.getContextPath();
	Dossier dossAct = (Dossier) session.getAttribute("dossierActuel");
	// System.out.println("dossact:" + dossAct);
	String typeD = null;
	if(null != dossAct){
		typeD = (String) dossAct.getTypeDossier();
	}
	// System.out.println("typedoss:" + typeD);
	Internaute internaute = (Internaute) session.getAttribute("internaute");
	// System.out.println("internaute:" + internaute);
%>

<!-- sidebar: style can be found in sidebar.less -->
<section class="sidebar">
	<!-- Sidebar Menu -->
	<ul class="sidebar-menu" data-widget="tree">
		<li class="active">
			<a href="https://www.mc-alsace.fr/">
				<i class="fa fa-home"></i><span>Accueil MCA</span>
			</a>
		</li>

		<% if (null != internaute ) { %>
			<logic:greaterThan name="nbDossier" value="1">
				<li>
					<a href="<%=strContPath%>/listeDossiers.do">
                     	<i class="fa fa-folder-open"></i>
                     	<span>Changer de dossier</span>
					</a>
				</li>
			</logic:greaterThan>

		    <li>
		    	<a href="<%=strContPath%>/deconnexion.do">
		    		<i class="text-danger fa fa-times-circle"></i><span>Déconnexion</span>
		    	</a>
		    </li>
		<% } %>
	</ul>
</section>