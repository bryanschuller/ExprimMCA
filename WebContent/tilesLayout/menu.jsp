<%@ include file="/declaration/taglibs.jsp"%>
<%@ page import="com.exprimweb.struts.modele.*"%>


<script type="text/javascript" src="<%= (String)request.getContextPath()  %>/scripts/subMenu.js"></script>

<%	String strContPath = (String) request.getContextPath();

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
	<logic:notPresent name="gestionnaire">
		<% if (null != internaute ) { %>
			<logic:greaterThan name="nbDossier" value="1">
				<li id="messages-item" class="  ">
                	<a href="<%=strContPath%>/listeDossiers.do">
                     	<i class="fa fa-folder-open"></i>
                     	<span>Changer de dossier</span>
                    </a>
                </li>
			</logic:greaterThan>

		    <li class="treeview">
		      <a href="#"><i class="fa fa-folder-open"></i> <span>Mon dossier</span>
		        <span class="pull-right-container">
		            <i class="fa fa-angle-left pull-right"></i>
		          </span>
		      </a>
		      <ul class="treeview-menu">
		        <li><a href="<%=strContPath%>/presenterResumeDossier.do">Résumé du dossier</a></li>
		        <li><a href="<%=strContPath%>/changementMotPasse.do">Mot de passe personnalisé</a></li>
		        <li><a href="<%=strContPath%>/loadAllEmails.do?type=Change">Changer d'e-mail</a></li>
		      </ul>
		    </li>

			<% if(null != typeD ){ %>	
			    <li class="treeview">
			      <a href="#"><i class="fa fa-link"></i> <span>Mes Services en ligne</span>
			        <span class="pull-right-container">
			            <i class="fa fa-angle-left pull-right"></i>
			          </span>
			      </a>

			      <ul class="treeview-menu">
      				<% if(null != typeD && (typeD.equals("ADH") || typeD.equals("BEN"))){ %>
				        <li><a href="<%=strContPath%>/viewPaiements.do">Liste des remboursements</a></li>
			        	<li><a href="<%=(String) request.getContextPath()%>/telePaiementInit.do"><bean:message key="libelle.paiement.ligne.menu" /></a></li>
					<% } %>

					<% if(null != typeD && typeD.equals("ENT")){ %>
				        <li><a href="<%=strContPath%>/viewSuiviTele.do">Suivi des télé-déclarations</a></li>
				        <li><a href="<%=strContPath%>/detailEffectifs.do?action=initForm">Détails des effectifs</a></li>
				        <li><a href="<%=(String) request.getContextPath()%>/viewAppCot.do">Liste des appels de cotisations</a></li>
					<% } %>

					<% if(null != typeD && typeD.equals("TIE")){ %>
					    <li><a href="<%=strContPath%>/viewPaiementsDossierTiers.do">Liste des remboursements</a></li>
						<% 
						String typeTiers = dossAct.getCodeGroupe();
						
						if(null != typeTiers && (typeTiers.equals("OPT") || typeTiers.equals("AUD"))){ %>
					    	<li><a href="<%=strContPath%>/listePEC.do?init=O">Liste des prises en charge</a></li>
						<% } %>	

						<% if(null != typeTiers && (typeTiers.equals("OPT") || typeTiers.equals("AUD"))){ %>
					    	<li><a href="<%=strContPath%>/creerPEC.do?type=AUD"><layout:message key="pec.libelle.creer.AUD" /></a></li>
						<% } %>	
						<% if(null != typeTiers && typeTiers.equals("OPT")){ %>
					    	<li><a href="<%=strContPath%>/creerPEC.do?type=OPT"><layout:message key="pec.libelle.creer.OPT" /></a></li>
						<% } %>				
					<% } %>

					<%if (null != typeD && typeD.equals("COL")) { %>
				    	<li><a href="<%=strContPath%>/listeDocWord.do">Générer un document</a></li>
					<%} %>
			      </ul>
			    </li>
			<% } %>		
				
			<% if(null != typeD){ %>	
					<li ><a href="<%=strContPath%>/listeEchanges.do" ><i class="fa fa-circle-o"></i><span>Mes Echanges</span></a></li>
					<li ><a href="<%=strContPath%>/listeDocuments.do" ><i class="fa fa-circle-o"></i><span>Mes documents</span></a></li>
				<% if(typeD.equals("ADH") || typeD.equals("BEN")){ %>
					<li ><a href="<%=strContPath%>/listeDecSante.do"><i class="fa fa-circle-o"></i><span>Mes décomptes santé</span></a></li>
					
					<% if (!internaute.getModeAcces().equals("SUP")) { %>
					
					<logic:present name="AttDocDefListe" scope="session">
						<logic:notEmpty name="AttDocDefListe" property="listeDef" scope="session">
							<li ><a href="<%=strContPath%>/listeDocAdmin.do" ><i class="fa fa-circle-o"></i><span>Administrateur</span></a></li>		
						</logic:notEmpty>
					</logic:present>
					<% } %>
				<% } %>
			<% } %>

			<% if (null != typeD) { %>
				<logic:equal name="dossierActuel" property="typeDossier" value="XXX">
					<li ><a href="<%=strContPath%>/listeDocumentsExged.do" ><i class="fa fa-circle-o"></i><span>Télécharger Exged</span></a></li>
				
					<li ><a href="<%=strContPath%>/listeDocuments.do" ><i class="fa fa-circle-o"></i><span>Documentation</span></a></li>
					<li ><a href="<%=strContPath%>/echangeMsg.do?action=initForm" ><i class="fa fa-circle-o"></i><span>Envoyer Message</span></a></li>
					<li ><a href="<%=strContPath%>/uploadFile.do?action=initForm" ><i class="fa fa-circle-o"></i><span>Uploader un fichier</span></a></li>
					<li ><a href="<%=strContPath%>/listeEchanges.do" ><i class="fa fa-circle-o"></i><span>Liste des échanges</span></a></li>
					<li ><a href="<%=strContPath%>/contactInit.do" ><i class="fa fa-circle-o"></i><span>Nous contacter</span></a></li>
					
					<li ><a href="<%=strContPath%>/jsp/messages/Assist.jsp" ><i class="fa fa-circle-o"></i><span>Incident technique</span></a></li>
				</logic:equal>
			<%} %>	
		<% } %>
	</logic:notPresent>

	<% if(null != internaute){ %>
	    <li >
	    	<a href="<%=strContPath%>/deconnexion.do">
	    		<i class="text-danger fa fa-times-circle"></i><span>Déconnexion</span>
	    	</a>
	    </li>
	<% } %>

	<% if (null != internaute && internaute.getModeAdmin().equals("ADM")) { %>
	    <li class="treeview">
	      <a href="#"><i class="fa fa-link"></i> <span>Administration</span>
	        <span class="pull-right-container">
	            <i class="fa fa-angle-left pull-right"></i>
	          </span>
	      </a>
	      <ul class="treeview-menu">
	        <li><a href="<%=strContPath%>/admin/refreshChargementsGlobaux.do"><i class="fa fa-circle-o"></i><span>Rechargement global</span></a></li>
	      </ul>
	    </li>
	<% } %>
  </ul>
  <!-- /.sidebar-menu -->
</section>
<!-- /.sidebar -->