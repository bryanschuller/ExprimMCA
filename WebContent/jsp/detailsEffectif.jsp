<%@ include file="/declaration/taglibs.jsp"%>
<%@ page import="com.exprimweb.struts.form.*"%>
<%@ page import="com.except.struts.modele.*"%>
<%@ page import="java.util.Hashtable"%>


<H1 id="TITREDOSSIER" >
	<div class="texteH">
		Détail des effectifs
	</div>

	<div class="iconesH">
		<a href="<%= (String)request.getContextPath()  %>/csvDetailEffectifs.do"> Télécharger le détail des effectifs en .csv</a>
		<a href="<%= (String)request.getContextPath()  %>/retourArriere.do<%= (null != (String)request.getAttribute("pileRequestReqParam")?(String)request.getAttribute("pileRequestReqParam"):"") %>"><i class="fa fa-arrow-left" data-toggle="tooltip" data-placement="bottom" data-original-title="Retour"></i></a>
	</div>

</H1>
<div class="clearfix"></div>


<layout:form action="detailEffectifs.do" style="box box-mca-yellow" reqCode="sendForm">

	<tr><td>
		Sélectionnez les filtres du chargement :
		<table class="FORM_BEN" width="90%" align="center">
			<tr><td>
				<bean:define id="selEff" name="SelectFltCatPO" property="selectFltCatPO" />
				
				<layout:select property="catPO" layout="false" styleClass="FIELD">
					<layout:options collection="selEff" property="code" labelProperty="libelle"/>
				</layout:select>
			</td><td>
			
				<layout:date key="info.interloc.dateeffet" property="dateEffet" layout="false"
					patternKey="format.date" size="10" maxlength="10" 
					isRequired="true" startYear="2009" endYear="2015" 
					onblur="javascript:return isDate(this.value);"
					calendarTooltip="Sélectionner la date"  />
				<span class="ERROR">
		     		<html:errors property="dateEffet" />
		    	</span>
		     
			</td><td>
				<layout:checkbox property="avecBenef" value="O" maxlength="10" layout="false"  >
					Avec bénéficiaires
				</layout:checkbox>
		
			</td></tr>
		</table>
	</td></tr>
	
	
	<layout:formActions>
	
		<layout:row space="false">	
			<layout:reset styleClass="btn btn-danger" value="Rétablir" />
			<layout:submit styleClass="btn btn-success" property="submit" value="Valider" />	 
		</layout:row>
	
	</layout:formActions>

</layout:form>



<logic:notEmpty name="detailEffectifsEntreprise">

	<H2>
	<div class="texteH">
		<tr>
		
	<% DetailEffectifsForm def = (DetailEffectifsForm)session.getAttribute("filtresEffectifs");	
	Hashtable libelleCatPOHash = (Hashtable)session.getAttribute("libelleCatPOHash"); %>
		
		<td><%=(String)libelleCatPOHash.get(def.getCatPO()) %></td>
		
		<td> au <layout:write name="detailEffectifsForm" property="dateEffet"/></td>	
	<% 	if (def.getBenefResume()=="O") { %>	
		<td> avec bénéficiaires</td>
		<%} else {%>
		<td> sans bénéficiaires</td>
		<%} %>
		</tr>
	</div>
	</H2>
	
	
<div class="row">
	<div class="col-xs-12">
		<div class="box box-mca-yellow">
			<layout:panel  styleClass="EXC_NONE" key="" width="100%" align="center">
				<layout:pager linksLocation ="top" maxPageItems ="25"  styleClass="PAGER" > 
				
				
				
					<layout:collection name="detailEffectifsEntreprise" title="" styleClass="LIGNE_A" styleClass2="LIGNE_B" >
					
						<layout:collectionItem  title="N° Adh." property="numAdherent" style="text-align:right;" />
						<layout:collectionItem  title="Rang" property="rangBenef" type="rang" />
						<layout:collectionItem  title="Nom" property="nomPrenom" style="text-align:left;" />
						<layout:collectionItem  title="N° SS" property="numRO" type="numSS" />
						<layout:collectionItem  title="Date Nais." property="dateNaissance" type="dateYMD" />
						<layout:collectionItem  title="Rég." property="regOblig" />
						<layout:collectionItem  title="Effet Ctr." property="effetContrat" type="dateYMD" />
						<layout:collectionItem  title="Fin Ctr." property="finContrat" type="dateYMD" />
					
						
					</layout:collection>
				
				
					<logic:notEqual name="filtresEffectifs" property="benefResume" value="O">
					
						<layout:row> 
						    <layout:pagerStatus key="pager.status.pager" /> 
						    <layout:pagerStatus key="pager.status.items.chef"/> 
						</layout:row>
					 
					</logic:notEqual>
					
					<logic:equal name="filtresEffectifs" property="benefResume" value="O">
					
						<layout:row> 
						    <layout:pagerStatus key="pager.status.pager" /> 
						    <layout:pagerStatus key="pager.status.items.assure"/> 
						</layout:row>
					 
					</logic:equal>
				
				</layout:pager>
			</layout:panel>
	</div>

</logic:notEmpty>

<script type="text/javascript" src="<%= (String)request.getContextPath()  %>/scripts/control/control.js"></script>


