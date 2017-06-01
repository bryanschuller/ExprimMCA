<%@ include file="/declaration/taglibs.jsp"%>


<div>
	<div class="texteH">Liste des échanges avec la mutuelle</div>
	<div class="iconesH">
		<a href="<%= (String)request.getContextPath()  %>/retourArriere.do<%= (null != (String)request.getAttribute("pileRequestReqParam")?(String)request.getAttribute("pileRequestReqParam"):"") %>"><i class="fa fa-arrow-left" data-toggle="tooltip" data-placement="bottom" data-original-title="Retour"></i></a>
	</div>
</div>
<div class="clearfix"></div>

<div class="box box-mca-yellow">
	<div class="box-header with-border">
		<h3 class="box-title">
			Actions
		</h3>
	</div>
	<div class="box-body">
		<a href="<%= (String) request.getContextPath() %>/echangeMsg.do?action=initForm">Ouvrir un echange</a>
	</div>
	<logic:present name="listeDemandes" scope="session">
		<div class="box-footer">
			<%@ include file="/jsp/echanges/incl/incl_listeDemandesPredefinit.jsp"%>		
		</div>
	</logic:present>
</div>

<logic:present name="lEchange" scope="request">
	<%@ include file="/jsp/echanges/incl/incl_listeEchanges.jsp"%>
</logic:present>

<logic:notPresent name="lEchange" scope="request">
	<div class="row">
		<div class="callout callout-info">
			<strong>
				Il n'y a aucun échange
			</strong>     
		</div><br style="clear:both;">
	</div>
</logic:notPresent>