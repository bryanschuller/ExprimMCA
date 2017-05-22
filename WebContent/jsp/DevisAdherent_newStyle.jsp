
<%-- Calcul d'un devis MCA en ligne--%>


<%@ taglib uri="/WEB-INF/struts-layout.tld" prefix="layout" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-html.tld"	 prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld"	 prefix="bean" %>



<%@ include file="/declaration/taglibs.jsp"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
 <%
 String strContPath = (String) request.getContextPath();
 %>

<html>
<head>

 <base href="https://www.mc-alsace.fr<%=strContPath%>/jsp/DevisAdherent_newStyle.jsp">	
<%-- <base href="http://127.0.0.1:8080<%=strContPath%>/jsp/DevisAdherent_newStyle.jsp">	--%>

       <link rel="stylesheet" href="<%=strContPath%>/config/prospectiv.css" type="text/css" media="screen" />

 	<script language="Javascript" src="<%=strContPath%>/config/javascript.js"></script><script>var imgsrc="<%=strContPath%>/images/"; var scriptsrc="<%=strContPath%>/config/"; var langue="fr"; var contextPath="<%=strContPath%>";</script> 

<%-- <script language="Javascript" src="/ExprimWEB/config/javascript.js"></script><script>var imgsrc="/ExprimWEB/images/"; var scriptsrc="/ExprimWEB/config/"; var langue="fr"; var contextPath="/ExprimWEB";</script> --%>

</head>
<body>

<div>



<%-- ========================= --%>

<%-- FORM --%>
<layout:form 	action="/DevisEnLigne" reqCode="calcul" 
							 width="100%">

	<%-- Dans le cas de données invalides --%>
	<logic:messagesPresent>
												
<tr><td colspan="2">
		
			<p class="errors"><span class="s3">
			<bean:message key="devis.error.notValidOverall" arg0="<%=request.getContextPath()%>"/>
			</span></p>
			</td></tr>
												
<tr><td width="150"></td><td>
			<p class="errors"><html:errors/>
			</p>
		
		</td></tr>
	</logic:messagesPresent>

<%-- Affichage du montant : --%>	
						

	<%-- Niveau de garantie --%>
	<%-- Pas de garantie choisie--%>						
	<logic:equal name="devisEnLigneForm" property="garantie" value="">
		
<tr><td colspan="2">
			<p><b><bean:message key="devis.choose_guarantee"/></b></p>
</td></tr>		
		
	</logic:equal>

	<tr><td colspan="2">
			<p><span><bean:message key="devis.guarantee"/></span>
		
				<layout:select key="" property="garantie" 
											 onchange="select_removeComment(this);document.getElementsByName('reqCode')[0].value='afficher';devisEnLigneForm.submit();"
											 isRequired="true" 
											 style="text-align:left;" layout="false">
	
					<layout:options property="listeGaranties" labelProperty="listeGaranties"/>
				</layout:select>
			</p>
</td></tr>
					
	<%-- Une garantie est choisie --%>
	<logic:notEqual name="devisEnLigneForm" property="garantie" value="">
<tr><td colspan="2">

		<%-- Vous --%>
						<h2 id="vous"><span>Vous :</span></h2>
						<p><span><bean:message key="devis.birthdate"/></span>
						<layout:select key="devis.birthdate" property="jourNaissAdh" isRequired="true" onchange="select_removeComment(this)" layout="false">
							<layout:option key="devis.listDay" value="-"/>
							<layout:options property="days"/>
						</layout:select>
						<img name="jourNaissAdhrequired" src="<%=strContPath%>/images/ast.gif">
						
						<layout:select key="" property="moisNaissAdh" isRequired="true" onchange="select_removeComment(this)" layout="false">
							<layout:option key="devis.listMonth" value="-"/>
							<layout:options property="months"/>
						</layout:select>
						<img name="moisNaissAdhrequired" src="<%=strContPath%>/images/ast.gif">
									
						<layout:select key="" property="anneeNaissAdh" isRequired="true" onchange="select_removeComment(this)"  layout="false">
							<layout:option value="-" key="devis.listYear"/>
							<layout:options property="years"/> 
						</layout:select>
						<img name="anneeNaissAdhrequired" src="<%=strContPath%>/images/ast.gif">
						
	</p>
</td></tr>
												
<tr><td colspan="2">
								<p><span><bean:message key="devis.regime"/></span>
					<layout:select property="codeRoAdh" key="devis.regime" isRequired="true" onchange="select_removeComment(this)" layout="false">
						<layout:option value="-" key="devis.listChoice"/>
						<layout:optionsCollection property="listeRoAdh" label="libelle" value="code" />
					</layout:select>
					<img name="codeRoAdhrequired" src="<%=strContPath%>/images/ast.gif">
					
							</p>
</td></tr>
												
<tr><td colspan="2">
	<p>&nbsp;</p>
		<%-- Votre conjoint --%>
				<h2 id="conjoint"><span>Votre conjoint :</span><layout:checkbox property="boolConjointEnable" key="" value="on" styleClass="sans" layout="false"></layout:checkbox></h2>

					<%-- remplace :<layout:row> --%>
								

<div id='ZoneConjoint'>
<p><span><bean:message key="devis.birthdate"/></span>
							<layout:select key="devis.birthdate" property="jourNaissConj"  onchange="select_removeComment(this)" isRequired="true" layout="false">
								<layout:option value="-" key="devis.listDay"/>
								<layout:options property="days"/>
							</layout:select>
							<img name="jourNaissConjrequired" src="<%=strContPath%>/images/ast.gif">
							<layout:select key="" property="moisNaissConj" onchange="select_removeComment(this)" isRequired="true" layout="false">
								<layout:option value="-" key="devis.listMonth"/>
								<layout:options property="months"/>
							</layout:select>
							<img name="moisNaissConjrequired" src="<%=strContPath%>/images/ast.gif">
							<layout:select key="" property="anneeNaissConj" onchange="select_removeComment(this)" isRequired="true" layout="false">
								<layout:option value="-" key="devis.listYear"/>
								<layout:options property="years"/> 
							</layout:select>
							<img name="anneeNaissConjrequired" src="<%=strContPath%>/images/ast.gif">
</p>

	<p><span><bean:message key="devis.regime"/></span>
						<layout:select property="codeRoConj" key="devis.regime" onchange="select_removeComment(this)" isRequired="true" layout="false">
							<layout:option value="-" key="devis.listChoice"/>
							<layout:optionsCollection property="listeRoConj" label="libelle" value="code" />
						</layout:select>
						<img name="codeRoConjrequired" src="<%=strContPath%>/images/ast.gif">
</p>
</div>
		</td></tr>
						
		<%--  remplace </layout:row --%>

						
		<%-- Enfant(s) --%>
	<%--		<layout:panel key="<div align='left'><b>&nbsp;<bean:message key="devis.child"/></b></div>"  styleClass="DEVIS_ENFANTS"> --%>

			<layout:panel key=""   styleClass="DEVIS_ENFANTS">
			<tr><td colspan="2">
				<h2 id="enfants"><span>Vos enfants :</span></h2>
				  <a href="javascript:ajouterEnfant()">	<img src="<%=strContPath%>/images/Prospectiv/bt_ajouterenfant.gif" class="BOUT1"/> </a>
							<p/>
				</td></tr>
												
<tr><td colspan="2">
				<layout:datagrid 	model="datagrid" property="listeEnfants" 
													multipleSelectionAllowed="false" selectionAllowed="false"
													styleClass="DEVIS2">
														
										
						<layout:datagridSelect title="" property="jourNaissance">
							<layout:option value="-"  key="-jour-"/>
							<layout:options property="days"/>
						</layout:datagridSelect>
										
						<layout:datagridSelect title="" property="moisNaissance">
							<layout:option value="-" key="-mois-"/>
							<layout:options property="months"/>
						</layout:datagridSelect>
										
						<layout:datagridSelect title="" property="anneeNaissance">
							<layout:option value="-" key="-année-"/>
							<layout:options property="years"/>
						</layout:datagridSelect>
										 
						<layout:datagridSelect title="" property="codeRegime">
							<layout:option value="-" key="devis.listChoice"/>
							<layout:optionsCollection property="listeRoEnf" label="libelle" value="code" />
						</layout:datagridSelect>
					</layout:datagrid>
					
			</layout:panel>

</td></tr>
				
				
				<%--  Soumission formulaire --%>

					
<!-- <bean:message key="devis.launchCalculation"/> -->
													
					<%-- Submit --%>
					<!-- 		<layout:submit styleClass="sans"  ></layout:submit><img src="<%=strContPath%>/images/Prospectiv/bt_afficher.gif"/> -->
					
					<logic:present name="montantCot" scope="request">
		
<tr><td colspan="2">
		<div id="aff_tarif">
				<h1><bean:message key="devis.vocot"/></h1>
				<h2><bean:message key="devis.estimated"/> <strong><layout:write name="montantCot" layout="false"/> &euro;</strong>*.</span>&nbsp;</h2>
		<br />
				<style>
				.taxe{
					FONT-SIZE: 9px;
					COLOR: #666;
    				}
				</style>
				<p><span class="s2">
					<layout:write name="msgTaxes" layout="false"/><BR>
			<%-- 		<logic:notEmpty name="devisTaxes" scope="request">
						<table>
							<layout:collection name="devisTaxes" id="devisTaxes" title="" styleClass="taxe">
								<layout:collectionItem title="" property="message"/>	
								<layout:collectionItem >
									<layout:write name="devisTaxes" property="montant" layout="false"/> &euro;
								</layout:collectionItem>											
							</layout:collection>
						</table>	
						<BR>
					</logic:notEmpty>     --%>
					<bean:message key="devis.alineaMontant"/>
				</span></p>
				
			<%-- Place la vue du navigateur en bas de page :--%>
	<%--		<script language="javascript">						
				// window.scrollTo(0,document.height);
			</script>
			</td></tr>
			<tr><td colspan="2">
			<p>&nbsp;</p>

--%>

			</div>
</td></tr>		
						</logic:present>
						
<%--code a remplacer ------------------------------------------------------------------------------------------ 
						
					<tr><td colspan="2">
							<input value="Calculer" class="sans" type="image" src="<%= (String)request.getContextPath()  %>/images/Prospectiv/bt_afficher.gif">
					</td></tr>
					
-------------------------------------------------------------------------------------------------------------------%>
				
						
<%--nouveau code ------------------------------------------------------------------------------------------%>					
			<tr>
			<%--	<td align="center">		--%>
				<td colspan="2">
							<input value="Calculer" class="sans" type="image" src="<%= (String)request.getContextPath()  %>/images/Prospectiv/bt_afficher.gif">
		<%--		</td>
				
				<td align="center">		--%>
					<logic:present name="montantCot" scope="request">
		
							<a href="http://www.mc-alsace.fr/Nous-contacter.html" title="Je suis interess&eacute;" target="_top"><img alt="Je suis interess&eacute;" class="sans" src="<%= (String)request.getContextPath()  %>/images/Prospectiv/bt_interesse.gif" border="0" /></a>
					</logic:present>
								
				</td>

			</tr>
<%--------------------------------------------------------------------------------------------------------------------%>					
						  

			</logic:notEqual>			  
<%--
	  	<logic:present name="ErreurBas" scope="request">
					<img name="info" src="<%= (String)request.getContextPath()  %>/images/ast.gif"/>&nbsp;<font  style="color:#FF3333;text-align:right;size:1;"><layout:write name="ErreurBas"/></font><br>

			</logic:present>
--%>
		</layout:form>

		<%-- Pour DEBUG :		  		<layout:write name="devisEnLigneForm" property="debug" /> --%>


<%-- javascript --%>
<script language="javascript" src="<%= request.getContextPath()+ "/scripts/DevisAdherent_newStyle.js" %>" ></script>

<script language="javascript">	

<%-- Si tout les champs sont affichés : --%>
<logic:notEqual name="devisEnLigneForm" property="garantie" value="">

	document.getElementsByName("boolConjointEnable")[0].onclick = function() {
  	set_divConjoint();
  }

   
  // ============
  // INIT (pour le régime déjà spécifié) :
  //
  // Pour le test de validité sur les champs vous et conjoint :
  
  
 	isSelectboxValide(document.getElementsByName('jourNaissAdh')[0]);
 	isSelectboxValide(document.getElementsByName('moisNaissAdh')[0]);
 	isSelectboxValide(document.getElementsByName('anneeNaissAdh')[0]);
 	isSelectboxValide(document.getElementsByName('codeRoAdh')[0]);;
 	isSelectboxValide(document.getElementsByName('jourNaissConj')[0]);
 	isSelectboxValide(document.getElementsByName('moisNaissConj')[0]);
 	isSelectboxValide(document.getElementsByName('anneeNaissConj')[0]);
 	isSelectboxValide(document.getElementsByName('codeRoConj')[0]);
 	
 	// POur mettre le commentaire de la selectbox à disable :
 	select_disableComment(document.getElementsByName('jourNaissAdh')[0]);
	select_disableComment(document.getElementsByName('moisNaissAdh')[0]);
 	select_disableComment(document.getElementsByName('anneeNaissAdh')[0]);
 	select_disableComment(document.getElementsByName('codeRoAdh')[0]);;
 	select_disableComment(document.getElementsByName('jourNaissConj')[0]);
 	select_disableComment(document.getElementsByName('moisNaissConj')[0]);
 	select_disableComment(document.getElementsByName('anneeNaissConj')[0]);
 	select_disableComment(document.getElementsByName('codeRoConj')[0]);
	
	// enable/disable:
  set_divConjoint();
  
  // initialise la datagrid de la zone enfants :
	Enfant_INIT();
	 
</logic:notEqual>
<%-- Aucune garantie n'est encore choisie--%>
<logic:equal name="devisEnLigneForm" property="garantie" value="">
    document.getElementsByName("garantie")[0].selectedIndex = -1;
</logic:equal>

</script>
<%-- fin javascript--%>


<%-- 
</logic:present>
--%>
</div>

</body>

</html>


