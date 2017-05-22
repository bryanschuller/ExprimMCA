<%@ include file="/declaration/taglibs.jsp"%>

<H1 id="TITREDOSSIER">
	<div class="texteH">
	 <layout:message key="paiement.titre"/> 
	</div>
</H1>
<br>

<br><br><br><br>

			 
			 
<layout:form action="telePaiement.do" focus="montant" width="600px" styleClass="FORMULAIRE"> 
	
	<tr><td colspan="2">
		<table class="FORM_BEN" align="center" width="475px">
			<tr><td>
				 <layout:message key="paiement.message"/> 
			</td></tr>
			<tr><td>
				&nbsp;
			</td></tr>
			<tr><td align="center">
				<table class="FORM_BEN_SUB_LEFT">
				
					<layout:text key="paiement.montant" property="montant" size="10" maxlength="10" isRequired="true"/>
				</table>
			</td></tr>
		</table>
	</td></tr>

	<layout:formActions>
		<layout:row>
			<layout:reset styleClass="BOUT1" value="Rétablir"/> 
			<layout:submit styleClass="BOUT1" property="submit" value="Valider" /> 
		</layout:row>
	</layout:formActions> 
</layout:form> 



