<%@ include file="/declaration/taglibs.jsp"%>


<H1 id="TITREDOSSIER">
	<div class="texteH">
		Documents Exged
	</div>
	<div class="iconesH">
		<a href="<%= (String)request.getContextPath()  %>/retourArriere.do<%= (null != (String)request.getAttribute("pileRequestReqParam")?(String)request.getAttribute("pileRequestReqParam"):"") %>"><i class="fa fa-arrow-left" data-toggle="tooltip" data-placement="bottom" data-original-title="Retour"></i></a>
	</div>
</H1>
<div class="clearfix"></div>


<%@ include file="/jsp/Exged/incl/documentsExgedDossier.jsp"%>
	

