<%@ include file="/declaration/taglibs.jsp"%>
<%@ page import="com.exprimweb.struts.modele.*"%>

<script type="text/javascript" src="<%= (String)request.getContextPath()  %>/scripts/gest_onglet.js"></script>

<%	
	Dossier dossAct = (Dossier) session.getAttribute("dossierActuel");
	String typeD = null;
	if(null != dossAct){
		typeD = (String) dossAct.getTypeDossier();
	}
	
	
	ListeDocumentsDossier ldd = (ListeDocumentsDossier) session.getAttribute("listeDocDoss");
	boolean isForm = false, isDoc = false, isMadelin = false, isDSN = false, isDecColl = false;
	
	if(null != ldd.getListeFormus()){
		isForm = true;
	}
	if(null != ldd.getListeDocuments()){
		isDoc = true;
	}
	if(null != typeD && (typeD.equals("ADH") || typeD.equals("BEN"))){
		isMadelin = true;
	}
	if(null != typeD && typeD.equals("ENT")){
	
	
		isDecColl = true;
		
		
		
		AttributDossier attDs0 = (AttributDossier) session.getAttribute("ATT_DS0");
		if (null == attDs0 || !attDs0.getValeur().equals("EXCLUE")) {
			String checkSiret = (String) session.getServletContext().getAttribute("DoCheckSiret");
			if (null != checkSiret && checkSiret.equals("O")) {
				isDSN = true;
			}
		}
	}
%>




<H1>
	<div class="texteH">Mes Documents</div>
	<div class="iconesH">
		<a href="<%= (String)request.getContextPath()  %>/retourArriere.do<%= (null != (String)request.getAttribute("pileRequestReqParam")?(String)request.getAttribute("pileRequestReqParam"):"") %>"><html:img page="/images/RETURN.gif" alt="Retour" border="0"/></a>
	</div>
</H1>



<br>

<div id="EXC_PRESENT_ONGLET_TETE_COL_1">
	
	<ul id="EXC_PRESENT_ONGLET_TETE_COL_1_LIST">
	
		<% if (isForm) { %>
		<li><a href="<%= (String)request.getContextPath()  %>/listeDocuments.do?tab=1" 
		id="tete_ongl_1" title="Formulaires" onClick="view_tab(1);return false;">Formulaires</a></li>
		<%} if (isDoc) {%>	
		<li><a href="<%= (String)request.getContextPath()  %>/listeDocuments.do?tab=2" 
		id="tete_ongl_2" title="Documents informatifs" onClick="view_tab(2);return false;">Documents informatifs</a></li>
		<%} if (isMadelin) { %>
		<li><a href="<%= (String)request.getContextPath()  %>/listeDocuments.do?tab=3" 
		id="tete_ongl_3" title="Attestations" onClick="view_tab(3);return false;">Attestations</a></li>
		<%} if (isDSN) { %>
		<li><a href="<%= (String)request.getContextPath()  %>/listeDocuments.do?tab=4" 
		id="tete_ongl_4" title="DSN" onClick="view_tab(4);return false;">DSN</a></li>
		<%} if (isDecColl) { %>
		<li><a href="<%= (String)request.getContextPath()  %>/listeDocuments.do?tab=5" 
		id="tete_ongl_5" title="Décomptes collectifs" onClick="view_tab(5);return false;">Décomptes collectifs</a></li>
		<%}%>
	

	</ul>

</div>

<div id="EXC_PRESENT_ONGLET_CORP_COL_1">


	<%if (isForm) { %>
	<div id="ongl_1" style="display:none; float:left; width:100%;">		
		<H2>
			<div class="texteH">Liste des formulaires</div>
		</H2>		
		<div id="EXC_PRESENT_DATA_1">
		
			<bean:define id="listeFormus" name="listeDocDoss" property="listeFormus" />
			<layout:collection name="listeFormus" id="formulaire" title=""
			styleClass="LIGNE_A" styleClass2="LIGNE_B" >
			
				<layout:collectionItem title="&nbsp;">
					<a href="<%= (String)request.getContextPath()  %>/documentDossServe.do?code=formus&indexDoc=<bean:write name="formulaire" property="index"/>" target="_blank" ><img src="<%= (String)request.getContextPath()  %>/images/docpdf.gif" height="14" width="14"></a>
				</layout:collectionItem>
			
				<layout:collectionItem title="Document" property="libelleDocument"/>			
				
				
			</layout:collection>
		</div>	
	</div>
	
	<%} if (isDoc) { %>

	<div id="ongl_2" style="display:none; float:left; width:100%;">		
		<H2>
			<div class="texteH">Liste des documents informatifs</div>
		</H2>	
		<div id="EXC_PRESENT_DATA_1">
		
			<bean:define id="listeDocuments" name="listeDocDoss" property="listeDocuments" />
			<layout:collection name="listeDocuments" id="docu" title=""
			styleClass="LIGNE_A" styleClass2="LIGNE_B" >
			
				<layout:collectionItem title="&nbsp;">
					<a href="<%= (String)request.getContextPath()  %>/documentDossServe.do?code=documents&indexDoc=<bean:write name="docu" property="index"/>" target="_blank"><img src="<%= (String)request.getContextPath()  %>/images/docpdf.gif" height="14" width="14"></a>
				</layout:collectionItem>
			
				<layout:collectionItem title="Document" property="libelleDocument"/>			
				
				
			</layout:collection>
		</div>	
	</div>
	
	<%} if (isMadelin) {%>

	<div id="ongl_3" style="display:none; float:left; width:100%;">
		<H2>
			<div class="texteH">Liste des Attestations</div>
		</H2>		

		<div id="EXC_PRESENT_DATA_1">		
		
			<exged:listeDocExged name="docExged_Attestations"
					userCode="USER_STD" loadCode="LOAD_00000000205"
					styleClass1="LIGNE_A" styleClass2="LIGNE_B">		
					<exged:paramSearchExged paramName="DOSSIER_ACTUELLE" />	
			</exged:listeDocExged>	
			
		</div>
	</div>

	<%} if (isDSN) {%>
	
	<div id="ongl_4" style="display:none; float:left; width:100%;">
		<H2>
			<div class="texteH">DSN</div>
		</H2>		
	
		<div id="EXC_PRESENT_DATA_1">		
		
			<exged:listeDocExged name="docExged_DSN" saveConsult="O"
					userCode="USER_STD" loadCode="LOAD_00000000210"
					styleClass1="LIGNE_A" styleClass2="LIGNE_B">		
					<exged:paramSearchExged paramName="DOSSIER_ACTUELLE" />	
			</exged:listeDocExged>	
			
		</div>
	</div>
	<%} if (isDecColl) {%>
	
	<div id="ongl_5" style="display:none; float:left; width:100%;">
		<H2>
			<div class="texteH">Décomptes collectifs</div>
		</H2>		
	
		<div id="EXC_PRESENT_DATA_1">		
		
			<exged:listeDocExged name="docExged_DecColl"
					userCode="USER_STD" loadCode="LOAD_00000000234"
					styleClass1="LIGNE_A" styleClass2="LIGNE_B">		
					<exged:paramSearchExged paramName="DOSSIER_ACTUELLE" />	
			</exged:listeDocExged>	
			
		</div>
	</div>
	
	<%} %>
		
		
</div>





<script>

ongl_bg_col_unsel = '#FFFFFF';
ongl_txt_col_unsel = '#231F20';
ongl_bg_col_sel = '#000000';
 
view_tab(<%= (String)request.getAttribute("tab")  %>);

</script>

