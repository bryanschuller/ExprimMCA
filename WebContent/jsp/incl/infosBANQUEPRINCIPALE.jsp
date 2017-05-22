
<%@ include file="/declaration/taglibs.jsp"%>

<logic:present name="banquePrincipal" scope="session">
	<H3 id="RIBPRESTATITRE" class="SOUSTITRE2">
	<div class="texteH"><bean:message key="adherent.principale.rib" />
	</div>
	<div class="iconesH">
	<logic:notEqual name="banquePrincipal" property="dateModifDemande" value="0">
		<span class="EXC_TEXTE_MODIF_DEMANDE">(Modification demandée au : <layout:write name="banque" property="dateModifDemande" type="dateYMD" />)</span>
	</logic:notEqual>	
	<a href="<%=(String) request.getContextPath()%>/semiModifBanque.do?id=<bean:write name="banquePrincipal" property="index"/>">
	<layout:message key="adherent.principale.modifRib" /> </a></div>
	</H3>
	<div id="RIBPRESTA" style="margin-top: 20px;">
	<table width="450px" class="CORPS_RIB">
	
		<logic:notEqual name="sepaAffWeb" value="IBAN">
			<tr>
				<th>Banque</th>
				<th>Guichet</th>
				<th>N° Compte</th>
				<th>Domiciliation</th>
				<th>Titulaire</th>
			</tr>
			<tr>
				<td><layout:text key="" property="codeBanque" mode="I,I,I"
					name="banquePrincipal" size="5" maxlength="5" isRequired="true"
					layout="false" /></td>
				<td><layout:text key="" property="codeGuichet" mode="I,I,I"
					name="banquePrincipal" size="5" maxlength="5" isRequired="true"
					layout="false" /></td>
				<td><layout:text key="" property="numCompte" mode="I,I,I"
					name="banquePrincipal" size="11" maxlength="11" isRequired="true"
					layout="false" /></td>
				<td><layout:text key="" property="domiciliation" mode="I,I,I"
					name="banquePrincipal" size="24" maxlength="24" isRequired="true"
					layout="false" /></td>
				<td><layout:text key="" property="titulaire" mode="I,I,I"
					name="banquePrincipal" size="24" maxlength="24" isRequired="true"
					layout="false" /></td>
			</tr>
		</logic:notEqual>
		
		<logic:equal name="sepaAffWeb" value="IBAN">
			<tr>
				<th>Compte IBAN</th>
				<logic:equal name="sepaAffBIC" value="O">
					<th>Code BIC</th>
				</logic:equal>
				<th>Titulaire</th>
			</tr>
			<tr>
				<td><layout:text key="" property="compteIBAN" mode="I,I,I"
					name="banquePrincipal" size="34" maxlength="34" isRequired="true"
					layout="false" type="compteIBAN" /></td>
				<logic:equal name="sepaAffBIC" value="O">
					<td><layout:text key="" property="codeBIC" mode="I,I,I"
						name="banquePrincipal" size="11" maxlength="11" isRequired="true"
						layout="false" /></td>
				</logic:equal>
				<td><layout:text key="" property="titulaireLong" mode="I,I,I"
					name="banquePrincipal" size="70" maxlength="70" isRequired="true"
					layout="false" /></td>				
			</tr>
		</logic:equal>
			
	</table>

	</div>
	<br>
</logic:present>