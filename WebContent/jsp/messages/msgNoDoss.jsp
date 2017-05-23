<%@ include file="/declaration/taglibs.jsp"%>


<div>
	<div class="texteH"></div>
	<div class="iconesH">
	<a href="<%= (String)request.getContextPath()  %>/retourArriere.do<%= (null != (String)request.getAttribute("pileRequestReqParam")?(String)request.getAttribute("pileRequestReqParam"):"") %>"><i class="fa fa-arrow-left" data-toggle="tooltip" data-placement="bottom" data-original-title="Retour"></i></a>
	
	</div>
</div>
<div class="clearfix"></div>

<div class="callout callout-info"><strong> <layout:message key="no.doss"/> </strong></div>