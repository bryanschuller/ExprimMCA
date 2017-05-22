<%@ include file="/declaration/taglibs.jsp"%>

<H1>
	<div class="texteH">
	<layout:message key="title.getmail.edit"/> 
	</div>
</H1>

<br>
<layout:form action="finaliseInfoInterlocuteur.do" styleClass="FORMULAIRE"
			focus="" width="80%" reqCode="sendForm" align="left">
			
			<tr><td colspan="2" style="font-size:12px;">
			Bonjour, <br/>
		<bean:message key="app.mail.not.set"/>
	
			</td></tr>
			

<tr><td colspan="2">
	<table class="FORM_BEN" width="90%" align="center">
<layout:field key="Nom" property="nomInterlocuteur" size="30" maxlength="80" isRequired="true" /> 
				<layout:field key="info.interloc.fonction" property="fonction" size="30" maxlength="80" isRequired="false"/> 
				<layout:field key="info.interloc.tel" property="telephone" size="20" maxlength="20" isRequired="false" /> 
				<layout:field key="info.interloc.mobile" property="telephonePortable" size="20" maxlength="20" isRequired="false"/>  
				<layout:field key="info.interloc.telpro" property="telephoneProfessionnel" size="20" maxlength="20" isRequired="false" />  
</table>
	</td></tr>
	<tr><td colspan="4">&nbsp;</td></tr>
	
			<layout:formActions>
				<layout:row>
					<layout:reset styleClass="BOUT1" value="Rétablir" />
					<layout:submit styleClass="BOUT1" property="submit" value="Valider" />
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