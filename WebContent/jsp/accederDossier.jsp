<%@ include file="/declaration/taglibs.jsp"%>
<%@ page import="com.exprimweb.struts.modele.*"%>


<%	
	Dossier dossAct = (Dossier) session.getAttribute("dossierActuel");
	String typeD = null;
	if(null != dossAct){
		typeD = (String) dossAct.getTypeDossier();
	}
%>

<H1 id="TITREDOSSIER">
	<div class="texteH">
<% if(typeD.equals("ADH")){ %>	
	Adhérent N°	
	<layout:write name="adherent"
		property="numAdherent" layout="false" /><logic:notEqual
		name="adherent" property="rangBenef" value="0">/ <layout:write
			name="adherent" property="rangBenef" layout="false" />
	</logic:notEqual>, dossier <layout:write name="adherent" property="nomPrenom"
		layout="false" /> 
		<logic:present name="gestionnaire" scope="session">
		<font color="red"> ( <bean:write name="gestionnaire" property="nom"/> - Gestionnaire )</font>
		</logic:present>
<% }else if(typeD.equals("BEN")){ %>	
	Bénéficiaire N°	
	<layout:write name="adherent"
		property="numAdherent" layout="false" /><logic:notEqual
		name="adherent" property="rangBenef" value="0">/ <layout:write
			name="adherent" property="rangBenef" layout="false" />
	</logic:notEqual>, dossier <layout:write name="adherent" property="nomPrenom"
		layout="false" />
<% }else if(typeD.equals("ENT")){ %>
	Entreprise N°
	<layout:write name="entreprise"
		property="numEntreprise" layout="false" /> - <layout:write name="entreprise"
		property="raisonSociale" layout="false" />
<% }else if(typeD.equals("TIE")){ %>
	Tiers N°
		<layout:write name="tiers"
		property="numOff" layout="false" /> - <layout:write name="tiers"
		property="nom1" layout="false" />
<% } else if (typeD.equals("COL")) {%>
	Collaborateur
<%} %>

	</div>
	<div class="iconesH">
		<a href="<%= (String)request.getContextPath()  %>/retourArriere.do<%= (null != (String)request.getAttribute("pileRequestReqParam")?(String)request.getAttribute("pileRequestReqParam"):"") %>"><i class="fa fa-arrow-left" data-toggle="tooltip" data-placement="bottom" data-original-title="Retour"></i></a>
	</div>
</H1>
<div class="clearfix"></div>

<logic:notPresent name="gestionnaire" scope="session">
	<logic:present name="listeMessagesMSG" scope="session">
		<div class="callout callout-info">
			<logic:iterate name="listeMessagesMSG" property="listeMessages"
				id="message">
				<layout:write name="message" property="message" layout="false"
					filter="false" /><BR>
			</logic:iterate>
		</div>
		<br>
	</logic:present>

	<logic:present name="lEchange" scope="request">
		<H2>
			<% if(((Vector) request.getAttribute("lEchange")).size() == 1){ %>
				<div class="texteH">Vous avez un message non lu</div>
			<% }else{ %>
				<div class="texteH">Vous avez des messages non lus</div>
			<% } %>
			<div class="iconesH">
				<a href="<%= (String) request.getContextPath() %>/listeEchanges.do" >Voir tous les échanges</a>
			</div>
		</H2>
		<div class="clearfix"></div>
		<%@ include file="/jsp/echanges/incl/incl_listeEchanges.jsp"%>	
	</logic:present>
</logic:notPresent>

<% if(typeD.equals("ADH") || typeD.equals("BEN")){ %>
	<logic:notPresent name="gestionnaire" scope="session">
		<%@ include file="/jsp/incl/listeContratsADH.jsp"%>
		<%@ include file="/jsp/incl/adresse.jsp"%>
		<%@ include file="/jsp/incl/infosINTERLOC.jsp"%>
	</logic:notPresent>
	<%@ include file="/jsp/incl/infosSOLDE.jsp"%>
	<logic:notPresent name="gestionnaire" scope="session">
		<%@  include file="/jsp/incl/prestas.jsp"%>	
	</logic:notPresent>
<% }else if(typeD.equals("ENT")){ %>
	
	<div class="row">
		<div class="col-md-6">
			<%@ include file="/jsp/incl/apeEtSiret.jsp"%>
		</div>
		<div class="col-md-6">
			<%@ include file="/jsp/incl/adresse.jsp"%>		
		</div>
	</div>
	<%@ include file="/jsp/incl/listeInterlocuteurs.jsp"%>
	<%@ include file="/jsp/incl/resumeEffectifs.jsp"%>
	<%@ include file="/jsp/incl/appCot.jsp"%>	
<% }else if(typeD.equals("TIE") || typeD.equals("COL")) { %>
	<div class="row">
		<div class="col-md-6">
			<%@ include file="/jsp/incl/resumeDossierTiersInfosInterloc.jsp"%>
		</div>
		<div class="col-md-6">
			<%@ include file="/jsp/incl/adresse.jsp"%>
		</div>
	</div>
	<%@ include file="/jsp/incl/resumeDossierTiersPhoneMail.jsp"%>
	<% if (typeD.equals("TIE")) {%>
		<%@ include file="/jsp/incl/resumeDossierTiersBanque.jsp"%>
	<%} %>
<% } %>

