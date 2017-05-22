









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





<div id="menuFixe" class="pay_vis">

<ul id="menuLeft">

<li><a href="https://www.mc-alsace.fr/" onmouseover="masqueActeSubMenu();"><span id="verticalMiddleSpan">Accueil MCA</span></a></li>	

<logic:notPresent name="gestionnaire">

<% if (null != internaute ) { %>

<logic:greaterThan name="nbDossier" value="1">
	<li ><a href="<%=strContPath%>/listeDossiers.do" onmouseover="masqueActeSubMenu();"
	style="width:80px;">Changer de dossier</a></li>	
</logic:greaterThan>


<li ><a onmouseover="afficheSubMenu(this,'SUB_MENU_DOSSIER');"  onmouseout="startTimeMasqueSM('SUB_MENU_DOSSIER');"><span id="verticalMiddleSpan">Mon dossier</span></a></li>

<% if(null != typeD ){ %>		
	<li ><a onmouseover="afficheSubMenu(this,'SUB_MENU_SERVICES');"  onmouseout="startTimeMasqueSM('SUB_MENU_SERVICES');"
	style="width:80px;">Mes Services en ligne</a></li>
<% } %>		

	
<% if(null != typeD){ %>	
	
		<li ><a href="<%=strContPath%>/listeEchanges.do" onmouseover="masqueActeSubMenu();"><span id="verticalMiddleSpan">Mes Echanges</span></a></li>
		<li ><a href="<%=strContPath%>/listeDocuments.do" onmouseover="masqueActeSubMenu();"><span id="verticalMiddleSpan">Mes documents</span></a></li>
		
	<% if(typeD.equals("ADH") || typeD.equals("BEN")){ %>
		<li ><a href="<%=strContPath%>/listeDecSante.do" onmouseover="masqueActeSubMenu();" 
		style="background-image: none; background-color: #FF9999; border: 1px solid #FF0000;">Mes décomptes santé</a></li>
		
		<% if (!internaute.getModeAcces().equals("SUP")) { %>
		
		<logic:present name="AttDocDefListe" scope="session">
			<logic:notEmpty name="AttDocDefListe" property="listeDef" scope="session">
				<li ><a href="<%=strContPath%>/listeDocAdmin.do" onmouseover="masqueActeSubMenu();"><span id="verticalMiddleSpan">Administrateur</span></a></li>		
			</logic:notEmpty>
		</logic:present>
		<% } %>
		
	<% } %>
<% } %>

<% if (null != typeD) { %>
		
	<logic:equal name="dossierActuel" property="typeDossier" value="XXX">
	
		<li ><a href="<%=strContPath%>/listeDocumentsExged.do" onmouseover="masqueActeSubMenu();"><span id="verticalMiddleSpan">Télécharger Exged</span></a></li>
	
		<li ><a href="<%=strContPath%>/listeDocuments.do" >Documentation</a></li>
		<li ><a href="<%=strContPath%>/echangeMsg.do?action=initForm" >Envoyer Message</a></li>
		<li ><a href="<%=strContPath%>/uploadFile.do?action=initForm" >Uploader un fichier</a></li>
		<li ><a href="<%=strContPath%>/listeEchanges.do" >Liste des échanges</a></li>
		<li ><a href="<%=strContPath%>/contactInit.do" >Nous contacter</a></li>
		
		<li ><a href="<%=strContPath%>/jsp/messages/Assist.jsp" onmouseover="masqueActeSubMenu();">Incident technique</a></li>
		
	</logic:equal>
<%} %>	

<% } %>


 
<% if (null == typeD) { %>
	<ul id="menuVide"><li>&nbsp;</li></ul>
<% } %> 

</logic:notPresent>

<% if(null != internaute){ %>
	<li ><a href="<%=strContPath%>/deconnexion.do" onmouseover="masqueActeSubMenu();"><span id="verticalMiddleSpan">Déconnexion</span></a></li>
<% } %>

<% if (null != internaute && internaute.getModeAdmin().equals("ADM")) { %>
	<li ><a onmouseover="afficheSubMenu(this,'SUB_MENU_ADMIN');"  onmouseout="startTimeMasqueSM('SUB_MENU_ADMIN');">
		<span id="verticalMiddleSpan">Administration</span>
	</a></li>	
<% } %>
 	
</ul>

</div>

<logic:notPresent name="gestionnaire">
		
	<% if (null != internaute ) { %>
		
		<div id="SUB_MENU_DOSSIER" class="subMenu" onmouseout="startTimeMasqueSM('SUB_MENU_DOSSIER');" onmouseover="stopTimeMasqueSM();">
			<table width="220" border="0" cellspacing="1" cellpadding="0" bgcolor="#FFFFFF">
			<% if(null != typeD ){ %>
				<tr>
					<td height="25" align="center" valign="middle" bgcolor="#FEE9B4"><table width="205" border="0" cellspacing="0" cellpadding="0">
						<tr align="left" valign="middle">
						
							<td width="15"><img src="<%=strContPath%>/pictures/sous-menu-fleche.gif" width="5" height="8" alt="fl&egrave;che" /></td>
							<td><a href="<%=strContPath%>/presenterResumeDossier.do" class="SOUS-MENU">Résumé du dossier</a></td>
						</tr>
					</table></td>
				</tr>
			<% } %>
				<tr>
					<td height="25" align="center" valign="middle" bgcolor="#FEE9B4"><table width="205" border="0" cellspacing="0" cellpadding="0">
						<tr align="left" valign="middle">
						
							<td width="15"><img src="<%=strContPath%>/pictures/sous-menu-fleche.gif" width="5" height="8" alt="fl&egrave;che" /></td>
							<td><a href="<%=strContPath%>/changementMotPasse.do" class="SOUS-MENU">Mot de passe personnalisé</a></td>
						</tr>
					</table></td>
				</tr><tr>
					<td height="25" align="center" valign="middle" bgcolor="#FEE9B4"><table width="205" border="0" cellspacing="0" cellpadding="0">
						<tr align="left" valign="middle">
						
							<td width="15"><img src="<%=strContPath%>/pictures/sous-menu-fleche.gif" width="5" height="8" alt="fl&egrave;che" /></td>
							<td><a href="<%=strContPath%>/loadAllEmails.do?type=Change" class="SOUS-MENU">Changer d'e-mail</a></td>
						</tr>
					</table></td>
				</tr>
			</table>
		</div>
		
		<% if(null != typeD ){ %>
		<div id="SUB_MENU_SERVICES" class="subMenu" onmouseout="startTimeMasqueSM('SUB_MENU_SERVICES');" onmouseover="stopTimeMasqueSM();">
			<table width="300" border="0" cellspacing="1" cellpadding="0" bgcolor="#FFFFFF">
			
			<% if(null != typeD && (typeD.equals("ADH") || typeD.equals("BEN"))){ %>
				<tr>
					<td height="25" align="center" valign="middle" bgcolor="#FEE9B4"><table width="285" border="0" cellspacing="0" cellpadding="0">
						<tr align="left" valign="middle">
						
							<td width="15"><img src="<%=strContPath%>/pictures/sous-menu-fleche.gif" width="5" height="8" alt="fl&egrave;che" /></td>
							<td><a href="<%=strContPath%>/viewPaiements.do" class="SOUS-MENU">Liste des remboursements</a></td>
						</tr>
					</table></td>
				</tr><tr>
					<td height="25" align="center" valign="middle" bgcolor="#FEE9B4"><table width="285" border="0" cellspacing="0" cellpadding="0">
						<tr align="left" valign="middle">
						
							<td width="15"><img src="<%=strContPath%>/pictures/sous-menu-fleche.gif" width="5" height="8" alt="fl&egrave;che" /></td>
							<td><a href="<%=(String) request.getContextPath()%>/telePaiementInit.do" class="SOUS-MENU">
									<bean:message key="libelle.paiement.ligne.menu" /> </a></td>
						</tr>
					</table></td>
				</tr>
			<% } %>

			<% if(null != typeD && typeD.equals("ENT")){ %>
				<tr>
					<td height="25" align="center" valign="middle" bgcolor="#FEE9B4"><table width="285" border="0" cellspacing="0" cellpadding="0">
						<tr align="left" valign="middle">
						
							<td width="15"><img src="<%=strContPath%>/pictures/sous-menu-fleche.gif" width="5" height="8" alt="fl&egrave;che" /></td>
							<td><a href="<%=strContPath%>/viewSuiviTele.do" class="SOUS-MENU">Suivi des télé-déclarations</a></td>
						</tr>
					</table></td>
				</tr><tr>
					<td height="25" align="center" valign="middle" bgcolor="#FEE9B4"><table width="285" border="0" cellspacing="0" cellpadding="0">
						<tr align="left" valign="middle">
						
							<td width="15"><img src="<%=strContPath%>/pictures/sous-menu-fleche.gif" width="5" height="8" alt="fl&egrave;che" /></td>
							<td><a href="<%=strContPath%>/detailEffectifs.do?action=initForm" class="SOUS-MENU">Détails des effectifs</a></td>
						</tr>
					</table></td>
				</tr><tr>
					<td height="25" align="center" valign="middle" bgcolor="#FEE9B4"><table width="285" border="0" cellspacing="0" cellpadding="0">
						<tr align="left" valign="middle">
						
							<td width="15"><img src="<%=strContPath%>/pictures/sous-menu-fleche.gif" width="5" height="8" alt="fl&egrave;che" /></td>
							<td><a href="<%=(String) request.getContextPath()%>/viewAppCot.do" class="SOUS-MENU">Liste des appels de cotisations.</a></td>
						</tr>
					</table></td>
				</tr>	
			<% } %>

			<% if(null != typeD && typeD.equals("TIE")){ %>
				<tr>
					<td height="25" align="center" valign="middle" bgcolor="#FEE9B4"><table width="285" border="0" cellspacing="0" cellpadding="0">
						<tr align="left" valign="middle">						
							<td width="15"><img src="<%=strContPath%>/pictures/sous-menu-fleche.gif" width="5" height="8" alt="fl&egrave;che" /></td>
							<td><a href="<%=strContPath%>/viewPaiementsDossierTiers.do" class="SOUS-MENU">Liste des remboursements</a></td>
						</tr>
					</table></td>
				</tr>
				<% 
				String typeTiers = dossAct.getCodeGroupe();
				
				if(null != typeTiers && (typeTiers.equals("OPT") || typeTiers.equals("AUD"))){ %>
					<tr>
						<td height="25" align="center" valign="middle" bgcolor="#FEE9B4"><table width="285" border="0" cellspacing="0" cellpadding="0">
							<tr align="left" valign="middle">						
								<td width="15"><img src="<%=strContPath%>/pictures/sous-menu-fleche.gif" width="5" height="8" alt="fl&egrave;che" /></td>
								<td><a href="<%=strContPath%>/listePEC.do?init=O" class="SOUS-MENU">Liste des prises en charge</a></td>
							</tr>
						</table></td>
					</tr>
				<% } %>	
				<% if(null != typeTiers && (typeTiers.equals("OPT") || typeTiers.equals("AUD"))){ %>
					<tr>
						<td height="25" align="center" valign="middle" bgcolor="#FEE9B4"><table width="285" border="0" cellspacing="0" cellpadding="0">
							<tr align="left" valign="middle">						
								<td width="15"><img src="<%=strContPath%>/pictures/sous-menu-fleche.gif" width="5" height="8" alt="fl&egrave;che" /></td>
								<td><a href="<%=strContPath%>/creerPEC.do?type=AUD" class="SOUS-MENU"><layout:message key="pec.libelle.creer.AUD" /></a></td>
							</tr>
						</table></td>
					</tr>
				<% } %>	
				<% if(null != typeTiers && typeTiers.equals("OPT")){ %>
					<tr>
						<td height="25" align="center" valign="middle" bgcolor="#FEE9B4"><table width="285" border="0" cellspacing="0" cellpadding="0">
							<tr align="left" valign="middle">						
								<td width="15"><img src="<%=strContPath%>/pictures/sous-menu-fleche.gif" width="5" height="8" alt="fl&egrave;che" /></td>
								<td><a href="<%=strContPath%>/creerPEC.do?type=OPT" class="SOUS-MENU"><layout:message key="pec.libelle.creer.OPT" /></a></td>
							</tr>
						</table></td>
					</tr>
				<% } %>				
			<% } %>
			
			<%if (null != typeD && typeD.equals("COL")) { %>
				<tr>
					<td height="25" align="center" valign="middle" bgcolor="#FEE9B4"><table width="285" border="0" cellspacing="0" cellpadding="0">
						<tr align="left" valign="middle">
						
							<td width="15"><img src="<%=strContPath%>/pictures/sous-menu-fleche.gif" width="5" height="8" alt="fl&egrave;che" /></td>
							<td><a href="<%=strContPath%>/listeDocWord.do" class="SOUS-MENU">Générer un document</a></td>
						</tr>
					</table></td>
				</tr>
			<%} %>

			</table>
		</div>
        
     <% 	}
		} %>
        
</logic:notPresent>
        
        
<% if (null != internaute && internaute.getModeAdmin().equals("ADM")) { %>
	<div id="SUB_MENU_ADMIN" class="subMenu" onmouseout="startTimeMasqueSM('SUB_MENU_ADMIN');" onmouseover="stopTimeMasqueSM();">
		<table width="220" border="0" cellspacing="1" cellpadding="0" bgcolor="#FFFFFF">

			<tr>
				<td height="25" align="center" valign="middle" bgcolor="#FEE9B4"><table width="205" border="0" cellspacing="0" cellpadding="0">
					<tr align="left" valign="middle">
					
						<td width="15"><img src="<%=strContPath%>/pictures/sous-menu-fleche.gif" width="5" height="8" alt="fl&egrave;che" /></td>
						<td><a href="<%=strContPath%>/admin/refreshChargementsGlobaux.do" class="SOUS-MENU">Rechargement global</a></td>
					</tr>
				</table></td>
			</tr>

		</table>
	</div>
<% } %>



        
        