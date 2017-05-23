<%@ include file="/declaration/taglibs.jsp"%>


<H1>
<div class="texteH"><layout:message key="titre.change.interlocuteur" /></div>
<div class="iconesH"><a href="<%= (String)request.getContextPath()  %>/retourArriere.do<%= (null != (String)request.getAttribute("pileRequestReqParam")?(String)request.getAttribute("pileRequestReqParam"):"") %>"><i class="fa fa-arrow-left" data-toggle="tooltip" data-placement="bottom" data-original-title="Retour"></i></a>
</div>
</H1>
<br />
<br />

		<layout:form action="modifierInfoInterlocuteur.do" styleClass="FORMULAIRE"
			focus="" width="80%" reqCode="sendForm">
			

			<tr><td colspan="2">
				<table class="FORM_BEN" width="90%" align="center">
					<tr><td align="center">
						<table class="FORM_BEN_SUB_LEFT">
							<layout:field key="Nom" property="nomInterlocuteur" size="30" maxlength="80" isRequired="true" /> 
							<layout:field key="info.interloc.fonction" property="fonction" size="30" maxlength="80" isRequired="false"/> 
							<layout:field key="info.interloc.tel" property="telephone" size="20" maxlength="20" isRequired="false" /> 
							<layout:field key="info.interloc.mobile" property="telephonePortable" size="20" maxlength="20" isRequired="false"/>  
							<layout:field key="info.interloc.telpro" property="telephoneProfessionnel" size="20" maxlength="20" isRequired="false" />  
						</table>
					</td></tr>
				</table>
			</td></tr>
			<tr><td colspan="4">&nbsp;</td></tr>
	
			<layout:formActions>
				<layout:row>
					<layout:reset styleClass="btn" value="Rétablir" />
					<layout:submit styleClass="btn" property="submit" value="Valider" />
				</layout:row>
			</layout:formActions>
		</layout:form>
		
<script>
	function formatTel(el) {

		var telform = el.value;
		// if (telform.length > 10 && telform.length < 0) {
		if (telform.length >= 10) {
			telform = telform.replace(/^\+33/, "0");
			if (!telform.match(/\+/)) {

				telform = telform.replace(/[^\d|\+]/g, "");
				telform = telform.replace(/(\d{2})(?!$)/g, "$1 ");
				el.value = telform;
			}
		}
		// return el;

	}
</script>
	