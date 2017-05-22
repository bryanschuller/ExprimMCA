<%@ include file="/declaration/taglibs.jsp"%>


<logic:notEmpty name="lAdresse">
<H2>
	<div class="texteH">
		<bean:message key="adherent.principale.coord" />
	</div>
</H2>


<div id="EXC_PRESENT_DATA_1">



<layout:collection name="lAdresse" id="adresse" title=""
			styleClass="LIGNE_A" styleClass2="LIGNE_B" >

			<layout:collectionItem title="Adresse">
				<bean:write name="adresse" property="adresse1"/>
				<logic:notEmpty name="adresse" property="adresse2">
					<br>
					<bean:write name="adresse" property="adresse2"/>
				</logic:notEmpty>
				<logic:notEmpty name="adresse" property="adresse3">
					<br>
					<bean:write name="adresse" property="adresse3"/>
				</logic:notEmpty>
			</layout:collectionItem> 
			
			<layout:collectionItem title="Code Postal" property="codePostal"/>
			<layout:collectionItem title="Ville" property="ville"/>
			<layout:collectionItem title="Du" property="effetAdresse" type="dateYMD" width="90px"/>
			<layout:collectionItem title="Au" property="finAdresse" type="dateYMD" width="90px"/>
			
			
			<layout:collectionItem title="&nbsp;">
				<logic:equal name="adresse" property="adrTop" value="OUI">
				<a href="<%= (String)request.getContextPath()  %>/semiModifAdresse.do?id=<bean:write name="adresse" property="index"/>"><layout:message key="libelle.modifier" /></a>
					<logic:notEqual name="adresse" property="dateModifDemande" value="0">
						<br>
						<span class="EXC_TEXTE_MODIF_DEMANDE">(Dem. au : <layout:write name="adresse" property="dateModifDemande" type="dateYMD" />)</span>
					
					</logic:notEqual>
				</logic:equal>
			</layout:collectionItem>
			
			
</layout:collection>


</div>


<br>
</logic:notEmpty>


