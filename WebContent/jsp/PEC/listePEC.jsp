<%@ include file="/declaration/taglibs.jsp"%>

<H1>
	<div class="texteH">
    	<layout:message key="info.tiers.pec"/> 
	</div>
	<div class="iconesH">
		<a href="<%= (String)request.getContextPath()  %>/retourArriere.do<%= (null != (String)request.getAttribute("pileRequestReqParam")?(String)request.getAttribute("pileRequestReqParam"):"") %>"><html:img page="/images/RETURN.gif" alt="Retour" border="0"/></a>
	</div>
</H1> 

<table><tr><td width="350px">

<logic:equal name="dossierActuel" property="codeGroupe" value="OPT">
	<br/>
		<a href="<%= (String) request.getContextPath() %>/creerPEC.do?type=OPT"><layout:message key="pec.libelle.creer.OPT" /></a>
	<br/>
	<BR>
		<a href="<%= (String) request.getContextPath() %>/creerPEC.do?type=AUD"><layout:message key="pec.libelle.creer.AUD" /></a>
	<br/>
</logic:equal>

<logic:equal name="dossierActuel" property="codeGroupe" value="AUD">
	<BR>
		<a href="<%= (String) request.getContextPath() %>/creerPEC.do?type=AUD"><layout:message key="pec.libelle.creer.AUD" /></a>
	<br/>
</logic:equal>

</td><td>
<div style="width:100%;">
	<H2>
		<div class="texteH">Documentation</div>
	</H2>
	<div id="EXC_PRESENT_DATA_1">		
	
	<exged:listeDocExged name="DocSaisiePOW" 
		userCode="USER_STD" loadCode="LOAD_00000000202"
		styleClass1="LIGNE_A" styleClass2="LIGNE_B">		
						
		<exged:paramSearchExged paramName="TYPE_TIERS_OK" />	
		
	</exged:listeDocExged>	
							
				
	</div>				
</div>	
</td></tr></table>	
			
<H2>
	<div class="texteH">
		<bean:message key="tiers.filtre.pec" />
	</div>
</H2>
<layout:form action="listePEC.do?action=filtre" focus="nomAdh" styleClass="FORMULAIRE" width="80%" > 

	<tr><td colspan="2">
		<table class="FORM_BEN" width="90%" align="center">
			<tr><td align="center">
				<table class="FORM_BEN_SUB_LEFT" style="min-width:300px;">
					<layout:field key="tiers.liste.pec.filtre.nom" property="nomAdh" size="30" maxlength="30" type="text" isRequired="false"/> 
					<tr><td colspan = '2'>
						<table><tr>
						<td><layout:checkbox property="stateOk" value="O" layout="false"/></td><th style="width:100px"><bean:message key="tiers.liste.pec.filtre.accepte" /></th>
						<td><layout:checkbox property="stateFac" value="O" layout="false"/></td><th style="width:100px"><bean:message key="tiers.liste.pec.filtre.facture" /></th>
						<td><layout:checkbox property="stateRej" value="O" layout="false"/></td><th style="width:100px"><bean:message key="tiers.liste.pec.filtre.rejete" /></th>
						</tr></table>
					</td></tr>					
				</table>
			</td></tr>
		</table>
	</td></tr>

	<layout:formActions>
		<layout:row>
			<layout:reset styleClass="BOUT1" value="Rétablir"/> 
			<layout:submit styleClass="BOUT1" property="submit" value="Filtrer"/> 
		</layout:row>	
	</layout:formActions> 

</layout:form> 

<br/>


<H2>
	<div class="texteH">
		<bean:message key="tiers.liste.pec" />
	</div>
</H2>

<%	boolean isBefore = false;	%>

<logic:notEmpty name="listePEC">

	<div id="EXC_PRESENT_DATA_1">
	
		<layout:panel  styleClass="EXC_NONE" key="" width="98%" align="center">	
		<layout:pager linksLocation ="top" maxPageItems ="25"  styleClass="PAGER">

		<layout:collection name="listePEC" property="lstPEC" id="pec" title="" styleClass="LIGNE_A" styleClass2="LIGNE_B" >
			<layout:collectionItem title="Date de création" property="dateCreation" type="dateYMD" sortable="true"/>
			<layout:collectionItem title="Type" property="typePEC" type="typePEC" sortable="true"/>
			<layout:collectionItem title="Adhérent" property="designationAdh" sortable="true"/>
			<layout:collectionItem title="Net TTC" property="mntFacture" type="money_euro" sortable="true"/>
			<layout:collectionItem title="PEC MCA" property="mntPrisEnCharge" type="money_euro" sortable="true"/>
			<layout:collectionItem title="Date d'état" property="dateEtat" type="dateYMD" sortable="true"/>
			<layout:collectionItem title="Etat" property="etatLib" sortable="true"/>
			<layout:collectionItem title="">
			<logic:equal name="pec" property="etat" value="">
				<a href="<%= (String) request.getContextPath() %>/annulerPEC.do?numPEC=<bean:write name="pec" property="numPEC"/>"><layout:message key="pec.libelle.annuler" /></a>
			</logic:equal>	
			<logic:notEqual name="pec" property="etat" value="">
				<%	isBefore = false;	%>
				<logic:equal name="pec" property="isAnnulable" value="O">
					<a href="<%= (String) request.getContextPath() %>/annulerPEC.do?numPEC=<bean:write name="pec" property="numPEC"/>"><layout:message key="pec.libelle.annuler" /></a>
					<%	isBefore = true;	%>
				</logic:equal>
				<logic:equal name="pec" property="isFacturable" value="O">
					<%	if (true == isBefore) { %> - <% } %>
					<a href="<%= (String) request.getContextPath() %>/facturerPEC.do?numPEC=<bean:write name="pec" property="numPEC"/>"><layout:message key="pec.libelle.facturer" /></a>
					<%	isBefore = true;	%>
				</logic:equal>
				<%	if (true == isBefore) { %> - <% } %>
				<a href="<%= (String) request.getContextPath() %>/detailPEC.do?numPEC=<bean:write name="pec" property="numPEC"/>"><layout:message key="pec.libelle.detail" /></a>
				<logic:notEqual name="pec" property="etat" value="R">
					 - <a href="<%= (String) request.getContextPath() %>/imprimerPEC.do?numPEC=<bean:write name="pec" property="numPEC"/>"><layout:message key="pec.libelle.imprimer" /></a>
				</logic:notEqual>	
			</logic:notEqual>
			</layout:collectionItem>
		</layout:collection>
	
		<layout:row> 
		    <layout:pagerStatus key="pager.status.pager"/> 
		    <layout:pagerStatus key="pager.status.items.pec"/> 
		</layout:row> 
		
		</layout:pager>
		</layout:panel>
	
	</div>

<br>
</logic:notEmpty>

<logic:empty name="listePEC">
	<div id="EXC_MESSAGE_PRESTA">
		<strong>
			Aucune prise en charge
		</strong> 
	</div><br style="clear:both;">
</logic:empty>

<% 
String prmInit = (String) request.getParameter("init");
if (null == prmInit) {
%>
<script>
	window.scrollTo(0, 550);
</script>
<% } %>

