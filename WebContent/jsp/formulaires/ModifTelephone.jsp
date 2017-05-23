<%@ include file="/declaration/taglibs.jsp"%>


<H1>
<div class="texteH"><layout:message key="titre.change.tel" /></div>
<div class="iconesH"><a href="<%= (String)request.getContextPath()  %>/retourArriere.do<%= (null != (String)request.getAttribute("pileRequestReqParam")?(String)request.getAttribute("pileRequestReqParam"):"") %>"><i class="fa fa-arrow-left" data-toggle="tooltip" data-placement="bottom" data-original-title="Retour"></i></a>
</div>
</H1>
<br />
<br />

		<layout:form action="changementTelephone.do" styleClass="FORMULAIRE"
			focus="telephone" width="80%" reqCode="sendForm">

			<tr><td colspan="2">
				<table class="FORM_BEN" width="90%" align="center">
					<tr><td align="center">
						<table class="FORM_BEN_SUB_LEFT">
						
							<layout:text key="info.interloc.tel" property="telephone" size="20"
								maxlength="20" onblur="formatTel(this);"  editType="numPhone"/>
				
							<layout:text key="info.interloc.mobile" property="telephonePortable"
								size="20" maxlength="20" onblur="formatTel(this);"  editType="numPhone"/>
				
							<layout:text key="info.interloc.telpro"
								property="telephoneProfessionnel" size="20" maxlength="20"
								onblur="formatTel(this);"  editType="numPhone" />
						</table>
					</td></tr>
				</table>
			</td></tr>
			<tr><td colspan="4"><span style="font-size:11px">La MCA s'engage à ne pas divulguer les informations vous concernant.</span></td></tr>
	
			<layout:formActions>
				<layout:row>
					<layout:reset styleClass="btn btn-danger" value="Rétablir" />
					<layout:submit styleClass="btn btn-success" property="submit" value="Valider" />
				</layout:row>
			</layout:formActions>
		</layout:form>


<script>
	function formatTel(el) {

		var telform = el.value;
		// if (telform.length > 10 && telform.length < 0) {
		if (telform.length >= 10) {
			telform = telform.replace(/^\+\s*33/, "0");
			if (!telform.match(/\+/)) {

				telform = telform.replace(/[^\d|\+]/g, "");
				telform = telform.replace(/(\d{2})(?!$)/g, "$1 ");
				el.value = telform;
			}
		}
		// return el;

	}
</script>
