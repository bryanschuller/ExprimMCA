<%@ include file="/declaration/taglibs.jsp"%>

<H1 >Effectuer un paiement en ligne
	<div class="iconesH">
		<a href="<%= (String)request.getContextPath()  %>/retourArriere.do<%= (null != (String)request.getAttribute("pileRequestReqParam")?(String)request.getAttribute("pileRequestReqParam"):"") %>"><i class="fa fa-arrow-left" data-toggle="tooltip" data-placement="bottom" data-original-title="Retour"></i></a>
	</div>
</H1>
<br>

<div class="box box-mca-yellow">
	<div class="box-body">
		<layout:form action="telePaiement.do" focus="montant"> 
			<tr><td colspan="2">
				<table class="FORM_BEN" align="center">
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
					<layout:reset styleClass="btn btn-danger" value="R�tablir" /> 
					<layout:submit styleClass="btn btn-success" property="submit" value="Valider"/> 
				</layout:row>
			</layout:formActions> 
		</layout:form> 
	</div>
</div>