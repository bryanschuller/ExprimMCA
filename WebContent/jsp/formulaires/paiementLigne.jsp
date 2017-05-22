<%@ include file="/declaration/taglibs.jsp"%>

<H1 >Effectuer un paiement en ligne
	<div class="iconesH">
		<a href="<%= (String)request.getContextPath()  %>/retourArriere.do<%= (null != (String)request.getAttribute("pileRequestReqParam")?(String)request.getAttribute("pileRequestReqParam"):"") %>"><html:img page="/images/RETURN.gif" alt="Retour" border="0"/></a>
	</div>
</H1>
<br>

<layout:form action="telePaiement.do" focus="montant" styleClass="FORMULAIRE"  width="80%"> 

	<tr><td colspan="2">
		<table class="FORM_BEN" width="90%" align="center">
			<tr><td align="center">
				<table class="FORM_BEN_SUB_LEFT">
				
					<%-- <layout:field key="paiement.montant" property="montant" size="10" maxlength="10" isRequired="true" type="text" editType="money" /> --%>
					<layout:text key="paiement.montant" property="montant" size="10"
						maxlength="10" isRequired="true"  editType="money"/>
				</table>
			</td></tr>
		</table>
	</td></tr> 
	
		
	<layout:formActions> 
		<layout:row>
			<layout:reset styleClass="BOUT1" value="Rétablir" /> 
			<layout:submit styleClass="BOUT1" property="submit" value="Valider"/> 
		</layout:row>
	</layout:formActions> 
	
</layout:form> 

