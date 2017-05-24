
<%@ include file="/declaration/taglibs.jsp"%>

<%@ page import="java.text.*,java.util.*"%>
<% DateFormat fmt = new SimpleDateFormat("dd/MM/yyyy");
	String now = fmt.format(new Date());%>
	
<logic:present name="solde" scope="request">
	<logic:equal name="solde" property="soldeAAppeler" value="OUI">
		<div class="box box-mca-yellow">
			<div class="box-header with-border">
				<h3 class="box-title">
					<bean:message key="libelle.compte.cotisant" />
				</h3>
				<div class="box-tools pull-right" data-toggle="tooltip" title data-original-title="<bean:message key="libelle.paiement.ligne" />">
					<div class="btn-group">
						<a href="<%=(String) request.getContextPath()%>/telePaiementInit.do" class="btn btn-flat btn-sm btn-default"><span class="hidden-sm hidden-xs"><bean:message key="libelle.paiement.ligne" /></span></a>
					</div>
				</div>
			</div>
			<div class="box-body">
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
					<layout:write name="solde" property="solde" layout="false" type="money" /> &euro;
				</logic:notEqual>
			</div>
		</div>
	</logic:equal>

	<logic:present name="listeEcheancesPrel">
		<div class="box box-mca-yellow">
			<logic:notEqual name="solde" property="soldeAAppeler" value="OUI">
				<div class="box-header with-border">
					<h3 class="box-title">
						<bean:message key="libelle.compte.cotisant" />
					</h3>
				</div>
			</logic:notEqual>

			<div class="box-body">
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
		</div>
	</logic:present>

	<logic:present name="listeEcheancesCheque" scope="session">
		<div class="box box-mca-yellow">
			<logic:notEqual name="solde" property="soldeAAppeler" value="OUI">
				<logic:notPresent name="listeEcheancesPrel">
					<div class="box-header with-border">
						<h3 class="box-title">
							<bean:message key="libelle.compte.cotisant" />
						</h3>
					</div>
				</logic:notPresent>
			</logic:notEqual>
			<div class="box-body">
				<H3><bean:message key="libelle.compte.cotisant.echeancier.cheque" /></H3>
				<div>
					<layout:collection name="listeEcheancesCheque" id="lEcheancesCheque" title="" styleClass="LIGNE_A" styleClass2="LIGNE_B">
						<layout:collectionItem title="Date d'échéance" property="dateEcheance" type="dateYMD" />
						<layout:collectionItem title="Montant (en &euro;)" property="montantEcheance" type="money" />
					</layout:collection>
				</div>
			</div>
		</div>
	</logic:present> 
</logic:present>