<%@ include file="/declaration/taglibs.jsp"%>


<H1>
	<div class="texteH">
    <layout:message key="info.adh.adresse.changement"/> 
	</div>
	<div class="iconesH">
<a href="<%= (String)request.getContextPath()  %>/retourArriere.do<%= (null != (String)request.getAttribute("pileRequestReqParam")?(String)request.getAttribute("pileRequestReqParam"):"") %>"><html:img page="/images/RETURN.gif" alt="Retour" border="0"/></a>
	</div>
</H1> 
<br/><br/>


<div class="LOGIN_BACKG" align="center">

<table width="100%" height="50%" border="0" cellspacing="0"
	cellpadding="0" class="LOGIN_BACKG" align="center">

	<tr>
		<td align="center" valign="top">
		
		<layout:form
			action="changementTelephone.do" styleClass="FORM_BEN" focus="telephone"
			width="60%" reqCode="sendForm">
			<layout:row>
				<layout:text key="info.interloc.tel" property="telephone" size="20"
					maxlength="20" onblur="formatTel(this);"/>
			</layout:row>
			<layout:row>
				<layout:text key="info.interloc.mobile"
					property="telephonePortable" size="20" maxlength="20" onblur="formatTel(this);" />
			</layout:row>
			<layout:row>
				<layout:text key="info.interloc.telpro"
					property="telephoneProfessionnel" size="20" maxlength="20" onblur="formatTel(this);" />
			</layout:row>
			<layout:formActions>
				<layout:row>
					<layout:reset styleClass="btn" value="Rétablir" />
					<layout:submit styleClass="btn" property="submit" value="Valider" />
				</layout:row>
			</layout:formActions>
		</layout:form></td>
	</tr>
</table>
</div>


<script>
function formatTel(el){
	
	var telform=el.value;
	telform=telform.replace(/^\+33/,"0");
	if (!telform.match(/\+/)) {
		
	telform=telform.replace(/[^\d|\+]/g,"");
	telform=telform.replace(/(\d{2})(?!$)/g,"$1 ");
	el.value=telform;
	}
	
	return el;

}


</script>
