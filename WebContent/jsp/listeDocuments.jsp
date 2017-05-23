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

<div>
	<div class="texteH">Mes Documents</div>
	<div class="iconesH">
		<a href="<%= (String)request.getContextPath()  %>/retourArriere.do<%= (null != (String)request.getAttribute("pileRequestReqParam")?(String)request.getAttribute("pileRequestReqParam"):"") %>"><i class="fa fa-arrow-left" data-toggle="tooltip" data-placement="bottom" data-original-title="Retour"></i></a>
	</div>
</div>
<div class="clearfix"></div>

<div class="nav-tabs-custom">
	<ul class="nav nav-tabs">
		<% if (isForm) { %>
			<li><a href="#tab_1" data-toggle="tab">Formulaires</a></li>
		<%} if (isDoc) {%>	
			<li><a href="#tab_2" data-toggle="tab">Documents informatifs</a></li>
		<%} if (isMadelin) { %>
			<li><a href="#tab_3" data-toggle="tab">Attestations</a></li>
		<%} if (isDSN) { %>
			<li><a href="#tab_4" data-toggle="tab">DSN</a></li>
		<%} if (isDecColl) { %>
			<li><a href="#tab_5" data-toggle="tab">Décomptes collectifs</a></li>
		<%} %>
	</ul>
	<div class="tab-content">
		<% if (isForm) { %>
			<div class="tab-pane" id="tab_1">
				<bean:define id="listeFormus" name="listeDocDoss" property="listeFormus" />
				<layout:collection name="listeFormus" id="formulaire" title=""
				styleClass="LIGNE_A" styleClass2="LIGNE_B" >
				
					<layout:collectionItem title="&nbsp;">
						<a href="<%= (String)request.getContextPath()  %>/documentDossServe.do?code=formus&indexDoc=<bean:write name="formulaire" property="index"/>" target="_blank" ><img src="<%= (String)request.getContextPath()  %>/images/docpdf.gif" height="14" width="14"></a>
					</layout:collectionItem>
				
					<layout:collectionItem title="Document" property="libelleDocument"/>			
					
					
				</layout:collection>
			</div>
		<%} if (isDoc) { %>
			<div class="tab-pane" id="tab_2">
				<bean:define id="listeDocuments" name="listeDocDoss" property="listeDocuments" />
				<layout:collection name="listeDocuments" id="docu" title=""
				styleClass="LIGNE_A" styleClass2="LIGNE_B" >
				
					<layout:collectionItem title="&nbsp;">
						<a href="<%= (String)request.getContextPath()  %>/documentDossServe.do?code=documents&indexDoc=<bean:write name="docu" property="index"/>" target="_blank"><img src="<%= (String)request.getContextPath()  %>/images/docpdf.gif" height="14" width="14"></a>
					</layout:collectionItem>
				
					<layout:collectionItem title="Document" property="libelleDocument"/>			
					
					
				</layout:collection>
			</div>
		<%} if (isMadelin) { %>
			<div class="tab-pane" id="tab_3">
				<exged:listeDocExged name="docExged_Attestations"
						userCode="USER_STD" loadCode="LOAD_00000000205"
						styleClass1="LIGNE_A" styleClass2="LIGNE_B">		
						<exged:paramSearchExged paramName="DOSSIER_ACTUELLE" />	
				</exged:listeDocExged>	
			</div>
		<%} if (isDSN) { %>
			<div class="tab-pane" id="tab_4">
				<exged:listeDocExged name="docExged_DSN" saveConsult="O"
						userCode="USER_STD" loadCode="LOAD_00000000210"
						styleClass1="LIGNE_A" styleClass2="LIGNE_B">		
						<exged:paramSearchExged paramName="DOSSIER_ACTUELLE" />	
				</exged:listeDocExged>	
			</div>
		<%} if (isDecColl) { %>
			<div class="tab-pane" id="tab_5">
				<exged:listeDocExged name="docExged_DecColl"
						userCode="USER_STD" loadCode="LOAD_00000000234"
						styleClass1="LIGNE_A" styleClass2="LIGNE_B">		
						<exged:paramSearchExged paramName="DOSSIER_ACTUELLE" />	
				</exged:listeDocExged>	
			</div>
		<%} %>
	</div>
</div>

<script type="text/javascript">
	$('.nav-tabs a:first').tab('show')
</script>