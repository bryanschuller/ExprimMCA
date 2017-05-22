

<br>
<div style="margin-left: 40px">
	<h2>Demandes prédéfinies</h2>
</div>		
<ul>
	<logic:iterate name="listeDemandes" property="listeDemandes" id="demande" >
	
		<li><a href="<%= (String) request.getContextPath() %>/echangeMsg.do?action=initFormDemPre&indDem=<bean:write name="demande" property="index" />" ><layout:write name="demande" property="titre" layout="false"/></a></li>
	
	</logic:iterate>
</ul>
		
		