<%@ include file="/declaration/taglibs.jsp"%>
<%@ page import="com.exprimweb.struts.modele.*"%>



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


<div id="menuFixe" class="pay_vis">

<ul id="menuLeft">

<li><a href="https://www.mc-alsace.fr/" onmouseover="masqueActeSubMenu();"><span id="verticalMiddleSpan">Accueil MCA</span></a></li>	

<% if (null != internaute ) { %>

<logic:greaterThan name="nbDossier" value="1">
	<li ><a href="<%=strContPath%>/listeDossiers.do" onmouseover="masqueActeSubMenu();"
	style="width:80px;">Changer de dossier</a></li>	
</logic:greaterThan>

<% } %>
	<ul id="menuVide"><li>&nbsp;</li></ul>


<% if(null != internaute){ %>
	<li ><a href="<%=strContPath%>/deconnexion.do" onmouseover="masqueActeSubMenu();"><span id="verticalMiddleSpan">Déconnexion</span></a></li>
<% } %>

</ul>

</div>

        
        
        