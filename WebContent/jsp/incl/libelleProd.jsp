<%@ include file="/declaration/taglibs.jsp"%>
<%@ page import="com.exprimweb.struts.modele.Internaute"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date"%>

<H2>
	<div class="texteH">
		<bean:message key="libelle.contrat" />
	</div>
</H2>
<div id="EXC_PRESENT_DATA_COL_1" style="margin-top:20px;">
	<table>
		<tr><th>Bénéficiaire</th><td><bean:write name="contrat" property="designation"/></td></tr>
		<tr><th>Produit</th><td><bean:write name="contrat" property="libProduit"/></td></tr>
		<tr><th>Du</th><td><layout:write name="contrat" property="effetPeriode" type="dateYMD" layout="false"/></td></tr>
		<tr><th>Au</th><td><layout:write name="contrat" property="finPeriode" type="dateYMD" layout="false"/></td></tr>
		
		<%

			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");
			Date date = null;
			Date today = new Date();
			date = dateFormat.parse("20160101");
			
			Internaute internaute = (Internaute) session.getAttribute("internaute");
			
			if ((null != internaute && internaute.getModeAcces().equals("SUP")) || date.before(today)) {	
		%>	
						
			<logic:equal name="docCtrExged" value="O">
				<logic:notEqual name="contrat" property="docFicheGar" value="">
					<tr><th>Fiche garantie</th><td>
						<a href="<%= (String)request.getContextPath()  %>/docCtrExged.do?code=docFicheGar&id=<bean:write name="contrat" property="index"/>&userCode=USER_STD" target="_blank">
							<img src="<%= (String)request.getContextPath()  %>/images/docpdf.gif" height="14" width="14"> (Télécharger la fiche)</a>
					</td></tr>
				</logic:notEqual>
			</logic:equal>			
				
		<% } %>
		
		
		<%-- 
		<tr><th>Carence</th><td>
			<logic:equal name="contrat" property="carence" value="OUI">
				<bean:message key="msg.oui.carence"/>
			</logic:equal>
			<logic:notEqual name="contrat" property="carence" value="">
				<logic:notEqual name="contrat" property="carence" value="OUI">
					<logic:equal name="contrat" property="carence" value="NON">
						<bean:write name="contrat" property="carence"/>
					</logic:equal>
					<logic:notEqual name="contrat" property="carence" value="NON">
						<bean:message key="msg.oui.carence"/>
					</logic:notEqual>
				</logic:notEqual>
			</logic:notEqual>
		</td></tr>
		--%>
	</table>
	<br>
	<font size="1" color="#3476B0"><html:errors/></font>
</div>

