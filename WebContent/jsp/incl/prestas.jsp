
<%@ include file="/declaration/taglibs.jsp"%>
<!--   page import="com.exprimweb.struts.modele.*"-->

 <!--   	String strContPath = (String) request.getContextPath();

	Dossier dossAct = (Dossier) session.getAttribute("dossierActuel");
	// System.out.println("dossact:" + dossAct);
	String typeD = null;
	if(null != dossAct){
		typeD = (String) dossAct.getTypeDossier();
	}
	// System.out.println("typedoss:" + typeD);
	Internaute internaute = (Internaute) session.getAttribute("internaute");
	// System.out.println("internaute:" + internaute);
--> 



<% if(null != typeD && (typeD.equals("ADH") || typeD.equals("BEN"))) { %>


	<H2>
	<div class="texteH">Vos remboursements de prestations</div>
<%-- 	<div class="iconesH"><a
		href="<%=(String) request.getContextPath()%>/listeDocuments.do?tab=4">Télécharger
	vos décomptes de prestations</a></div> --%>
	</H2>
	<div style="margin: 20px 50px 0px 50px;">
	<div><a
		href="<%=(String) request.getContextPath()%>/viewPaiements.do">Consultez
	l'historique de vos prestations. </a></div>
	<br>
	</div>

<% } %>
