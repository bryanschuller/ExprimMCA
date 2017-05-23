<%@ include file="/declaration/taglibs.jsp"%>

<H1>
	<div class="texteH">
		<bean:message key="libelle.contrat.detail" />
	</div>
	<div class="iconesH">
		<a href="<%= (String)request.getContextPath()  %>/retourArriere.do<%= (null != (String)request.getAttribute("pileRequestReqParam")?(String)request.getAttribute("pileRequestReqParam"):"") %>"><i class="fa fa-arrow-left" data-toggle="tooltip" data-placement="bottom" data-original-title="Retour"></i></a>
	</div>
</H1>
<br>

<%@ include file="/jsp/incl/libelleProd.jsp"%>

<%@ include file="/jsp/incl/contrat.jsp"%>

<%@ include file="/jsp/incl/remboursementPrestations.jsp"%>

<%-- 
<%@ include file="/jsp/incl/telechargementDocuments.jsp"%>

--%>

