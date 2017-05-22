<%@ include file="/declaration/taglibs.jsp"%>
<%@ page import="com.exprimweb.struts.modele.Internaute"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date"%>

<H2>
	<div class="texteH">
		<bean:message key="info.ent.effectifs" />
	</div>
</H2>

<div id="EXC_PRESENT_DATA_1">



<layout:collection name="listeEffectifs" property="listeResumeEffectifs" id="effectifs" title="" styleClass="LIGNE_A" styleClass2="LIGNE_B" >

	<layout:collectionItem  title="Catégorie" property="codeCategorie"/>
	<layout:collectionItem  title="Libellé produit" property="libProduit"/>
	<layout:collectionItem  title="Du" property="periodeDu" type="dateYMD" width="90px"/>
	<layout:collectionItem  title="Au" property="periodeAu" type="dateYMD" width="90px"/>
	<layout:collectionItem  title="Nb Adh." property="nombreAdh"/>
	<layout:collectionItem  title="Nb Ben." property="nombreBen"/>
	<layout:collectionItem  title="Total" property="nombreTotal"/>
	
	<%
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");
		Date date = null;
		Date today = new Date();
		date = dateFormat.parse("20160101");
		
		Internaute internaute = (Internaute) session.getAttribute("internaute");
		
		if ((null != internaute && internaute.getModeAcces().equals("SUP")) || date.before(today)) {	
	%>
	
	<logic:equal name="docCtrExged" value="O">
		<logic:equal name="dossEntIsFicheProduit" value="O">
			<layout:collectionItem title="F. Gar.">
				<logic:notEqual name="effectifs" property="ficheProduit" value="">
					<a href="<%= (String)request.getContextPath()  %>/docCtrExged.do?code=docFicheGar&id=<bean:write name="effectifs" property="index"/>&userCode=USER_STD" target="_blank">
							<img src="<%= (String)request.getContextPath()  %>/images/docpdf.gif" height="14" width="14"></a>
				</logic:notEqual>
			</layout:collectionItem>		
		</logic:equal>
		
	</logic:equal>
	
	
		<%--
		<layout:collectionItem title="F. Gar.">
		<logic:notEqual name="effectifs" property="ficheProduit" value="">
		<a href="<%= (String)request.getContextPath()  %>/documentServe.do?code=docFicheGar&id=<bean:write name="effectifs" property="index"/>" target="_blank">
					<img src="<%= (String)request.getContextPath()  %>/images/docpdf.gif" height="14" width="14"></a>
		</logic:notEqual>
		</layout:collectionItem>
		
	
		<layout:collectionItem title="B. Adh.">
		<logic:notEqual name="effectifs" property="bulletinAdhesion" value="">
		<a href="<%= (String)request.getContextPath()  %>/documentServe.do?code=docAdhesion&id=<bean:write name="effectifs" property="index"/>" target="_blank">
					<img src="<%= (String)request.getContextPath()  %>/images/docpdf.gif" height="14" width="14"></a>
			</logic:notEqual>
		</layout:collectionItem>
		--%>
	
	<% } %>
	
	<layout:collectionItem title="&nbsp;">
	<a href="<%=(String) request.getContextPath()%>/detailEffectifs.do?action=initForm&catPO=<bean:write name="effectifs" property="codeCatProOpt" />"><layout:message key="libelle.detail" /></a>
	</layout:collectionItem>
	
	
</layout:collection>



</div>