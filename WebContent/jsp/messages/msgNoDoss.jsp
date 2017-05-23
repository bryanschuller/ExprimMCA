<%@ include file="/declaration/taglibs.jsp"%>


<H1>
	<div class="texteH"></div>
	<div class="iconesH">
	<a href="<%= (String)request.getContextPath()  %>/retourArriere.do<%= (null != (String)request.getAttribute("pileRequestReqParam")?(String)request.getAttribute("pileRequestReqParam"):"") %>"><i class="fa fa-arrow-left" data-toggle="tooltip" data-placement="bottom" data-original-title="Retour"></i></a>
	
	</div>
</H1>
<br><br><br><br>

<div class="callout callout-info"><strong> <layout:message key="no.doss"/> </strong></div>