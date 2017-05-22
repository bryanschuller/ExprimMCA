<%@ include file="/declaration/taglibs.jsp"%>


<H1>
	<div class="texteH">Liste des échanges avec la mutuelle</div>
	<div class="iconesH">
		<a href="<%= (String)request.getContextPath()  %>/retourArriere.do<%= (null != (String)request.getAttribute("pileRequestReqParam")?(String)request.getAttribute("pileRequestReqParam"):"") %>"><html:img page="/images/RETURN.gif" alt="Retour" border="0"/></a>
	</div>
</H1>
<br>

<logic:present name="lEchange" scope="request">
	<div id="EXC_CONTENT_MIDDLE">
		<%@ include file="/jsp/echanges/incl/incl_listeEchanges.jsp"%>
	</div>
</logic:present>

<logic:notPresent name="lEchange" scope="request">
	<div id="EXC_CONTENT_MIDDLE">
		<div id="EXC_MESSAGE">
			<strong>
				Il n'y a aucun échange
			</strong>     
		</div><br style="clear:both;">
	</div>
</logic:notPresent>

<div id="EXC_CONTENT_RIGHT">

	<div style="margin-left: 40px">
		<h2>Actions</h2>
	</div>
	
	<ul><li><a href="<%= (String) request.getContextPath() %>/echangeMsg.do?action=initForm">Ouvrir un echange</a></li></ul>
	
	<logic:present name="listeDemandes" scope="session">
		<%@ include file="/jsp/echanges/incl/incl_listeDemandesPredefinit.jsp"%>		
	</logic:present>
</div>


