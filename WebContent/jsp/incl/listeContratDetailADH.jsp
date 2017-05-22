<%@ include file="/declaration/taglibs.jsp"%>
<%@ page import="com.exprimweb.struts.modele.Internaute"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date"%>

<H2><div class="texteH">
	<logic:greaterThan name="nbContrat" value="1">
		<bean:message key="adherent.titre.contrats" />
	</logic:greaterThan>
	<logic:equal name="nbContrat" value="1">
		<bean:message key="adherent.titre.contrat" />
	</logic:equal>
	</div>
</H2>

<div class="row">
	<div class="col-xs-12">
		<div class="box box-mca-yellow">
			<layout:collection name="lContratAdherent" id="contrat" title=""
						styleClass="LIGNE_A" styleClass2="LIGNE_B" >
							
			 	<layout:collectionItem title="Béneficiaire" style="text-align:left;">
				   <bean:write name="contrat" property="designation"/>
				</layout:collectionItem>
					
				<layout:collectionItem title="Produit" property="libProduit" style="text-align:left;">
				    <bean:write name="contrat" property="libProduit"/> <a href="<%= (String)request.getContextPath() %>/detailContrat.do?id=<bean:write name="contrat" property="index"/>">(détail)</a>
				</layout:collectionItem>
				
				<layout:collectionItem title="Du" property="effetPeriode" type="dateYMD" width="90px"/>
				<layout:collectionItem title="Au" property="finPeriode" type="dateYMD" width="90px"/>
				
				<%
				
					SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");
					Date date = null;
					Date today = new Date();
					date = dateFormat.parse("20160101");
					
					Internaute internaute = (Internaute) session.getAttribute("internaute");
					
					if ((null != internaute && internaute.getModeAcces().equals("SUP")) || date.before(today)) {	
				%>	
								
					<logic:equal name="docCtrExged" value="O">
						<logic:equal name="dossAdhDetailIsFicheProduit" value="O">
							<layout:collectionItem title="F. Gar.">
								<logic:notEqual name="contrat" property="docFicheGar" value="">
									<a href="<%= (String)request.getContextPath()  %>/docCtrExged.do?code=docFicheGar&id=<bean:write name="contrat" property="index"/>&userCode=USER_STD" target="_blank">
											<img src="<%= (String)request.getContextPath()  %>/images/docpdf.gif" height="14" width="14"></a>
								</logic:notEqual>
							</layout:collectionItem>		
						</logic:equal>
						
					</logic:equal>			
						
				<% } %>
							
			</layout:collection>
		</div>
	</div>
</div>
<br>

