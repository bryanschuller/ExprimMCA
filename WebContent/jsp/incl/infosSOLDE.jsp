
<%@ include file="/declaration/taglibs.jsp"%>

<%@ page import="java.text.*,java.util.*"%>
<% DateFormat fmt = new SimpleDateFormat("dd/MM/yyyy");
	String now = fmt.format(new Date());%>
	

<logic:present name="solde" scope="request">
	<logic:equal name="solde" property="soldeAAppeler" value="OUI">
		<H2>
		<div class="texteH"><bean:message key="libelle.compte.cotisant" />
		</div>
			<div class="iconesH">
		<%--	<a href="<%=(String) request.getContextPath()%>/listeDocuments.do?tab=3">Télécharger
				vos appels de cotisation</a>  --%>
				<a href="<%=(String) request.getContextPath()%>/telePaiementInit.do">
				<bean:message key="libelle.paiement.ligne" /> </a> 
			</div>
		</H2>
		<div class="EXC_TEXTE" id="EXC_PRESENT_DATA_COL_1" style="margin-top: 20px;"
			align="left">
			<logic:equal name="solde" property="solde"
			value="0">
			<bean:message key="libelle.compte.cotisant.solde.zero" />
			</logic:equal> 
		<logic:notEqual name="solde" property="solde" value="0">
			<logic:greaterThan name="solde" property="solde" value="0">
				<bean:message key="libelle.compte.cotisant.solde.positif" />
			</logic:greaterThan>
			<logic:lessThan name="solde" property="solde" value="0">
				<bean:message key="libelle.compte.cotisant.solde.negatif" />
			</logic:lessThan>
			<%=now%> :
			<layout:write name="solde" property="solde" layout="false"
				type="money" /> &euro;
		</logic:notEqual></div>
		</logic:equal>
		
		
		
	
		
		
		<logic:present name="listeEcheancesPrel">
			<logic:notEqual name="solde" property="soldeAAppeler" value="OUI">
				<H2>
					<div class="texteH"><bean:message key="libelle.compte.cotisant" />
					</div>
				</H2>	
			
			</logic:notEqual>
			
			<div style="margin: 20px 50px 0px 50px;">
				<H3>
					<div class="texteH"><bean:message key="libelle.compte.cotisant.echeancier.prelevement" />
					</div>
				</H3>
		
		
			<logic:iterate name="listeEcheancesPrel" id="listeEcheanciers">
			
				<div id="EXC_PRESENT_DATA_1" style="width:240px;">
				
					<layout:collection name="listeEcheanciers" id="lEcheancesPrel" property="listeEcheances" title="" styleClass="LIGNE_A" styleClass2="LIGNE_B">
						<layout:collectionItem title="Date d'échéance" property="dateEcheance" type="dateYMD" />
						<layout:collectionItem title="Montant (en &euro;)" property="montantEcheance" type="money" />
					</layout:collection>
					
				</div>
				
			
			</logic:iterate>
			
			</div>
		
		</logic:present>
		
		
<%-- 	<logic:notEmpty name="listeEcheancesPrel" scope="session">
			<div style="margin: 20px 50px 0px 50px;">
				<H3>
					<div class="texteH"><bean:message key="libelle.compte.cotisant.echeancier.prelevement" />
					</div>
				</H3>
			

			<div id="EXC_PRESENT_DATA_1" style="width:240px;">
			
				
				<layout:collection name="listeEcheancesPrel" id="lEcheancesPrel" title="" styleClass="LIGNE_A" styleClass2="LIGNE_B">
					
					<layout:collectionItem title="Date d'échéance" property="dateEcheance" type="dateYMD" />
	 
					<layout:collectionItem title="Montant (en &euro;)" property="montantEcheance" type="money" />
					
	
				</layout:collection>
	
	
	
			</div>
			</div>
		</logic:notEmpty> --%>	
		<br>
		
		<logic:present name="listeEcheancesCheque" scope="session">
		
			<logic:notEqual name="solde" property="soldeAAppeler" value="OUI">
			<logic:notPresent name="listeEcheancesPrel">
				<H2>
					<div class="texteH"><bean:message key="libelle.compte.cotisant" />
					</div>
				</H2>	
			</logic:notPresent>
			</logic:notEqual>
		
			<div style="margin: 20px 50px 0px 50px;">
				<H3>
					<div class="texteH"><bean:message key="libelle.compte.cotisant.echeancier.cheque" />
					</div>
				</H3>


		<div id="EXC_PRESENT_DATA_1" style="width:240px;">
		
			<layout:collection name="listeEcheancesCheque" id="lEcheancesCheque" title="" styleClass="LIGNE_A" styleClass2="LIGNE_B">
				
				<layout:collectionItem title="Date d'échéance" property="dateEcheance" type="dateYMD" />
 
				<layout:collectionItem title="Montant (en &euro;)" property="montantEcheance" type="money" />

			</layout:collection>
		</div>
		</div>
		</logic:present> 
		


	
</logic:present>

<br><br>