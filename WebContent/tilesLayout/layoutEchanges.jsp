<%@ include file="/declaration/taglibs.jsp"%>


<H1>
	
</H1>
<br>

<tiles:insert attribute="middelBody" />

<div id="EXC_CONTENT_RIGHT">

	<div style="margin-left: 40px">
		<h2>Actions</h2>
	</div>
	
	<ul><li><a href="<%= (String) request.getContextPath() %>/echangeMsg.do?action=initForm">Ouvrir un echange</a></li></ul>
	
	<logic:present name="listeDemandes" scope="session">
		<%@ include file="/jsp/echanges/incl/incl_listeDemandesPredefinit.jsp"%>		
	</logic:present>
</div>


