<%@ include file="/declaration/taglibs.jsp"%>


<tr><td>
<table class="FORM_BEN" width="90%" align="center">
<tr><td colspan="2">
	
	<div id="EXC_PRESENT_DATA_1">
		<layout:collection name="lEmails" id="lEmails" title=""
			styleClass="LIGNE_A" styleClass2="LIGNE_B" >
				
				<layout:collectionItem title="Designation" property="designation" width="400px"/>
				<layout:collectionItem title="e-mail" property="email" width="150px"/>
				
		</layout:collection>
	</div>
	
</td></tr>
		
<tr><td colspan="2">
		<layout:text key="app.mail.mail2" style="width:300px;" property="newEmail"  isRequired="true" styleClass="LOGIN_LABEL" /><html:errors property="newEmail"/> 
</td></tr>

<logic:equal name="nftActive" value="O">
	<tr><td colspan="2">
		<layout:checkbox property="notifOk" value="O" maxlength="10" layout="false"  >
			J'accepte de recevoir des notifications � cette adresse.
		</layout:checkbox>
	</td></tr>
</logic:equal>

<tr><td colspan="2">
&nbsp; <html:errors/>
</td></tr>

<tr><td colspan="2">
<img src="<%=(String) request.getContextPath() %>/images/ast.gif"><bean:message key="general.formulaire.obligatoire"/>
</td></tr>

</table>
</td></tr>

<tr><td colspan="4"><span style="font-size:11px">La MCA s'engage � ne pas divulguer les informations vous concernant.</span></td></tr>

