<%@ include file="/declaration/taglibs.jsp"%>

<H1>
	<div class="texteH">
		<bean:message key="libelle.contrat.detail" />
	</div>
	<div class="iconesH">
		<a href="<%= (String)request.getContextPath()  %>/retourArriere.do<%= (null != (String)request.getAttribute("pileRequestReqParam")?(String)request.getAttribute("pileRequestReqParam"):"") %>"><html:img page="/images/RETURN.gif" alt="Retour" border="0"/></a>
	</div>
</H1>
<br>

<%@ include file="/jsp/incl/libelleProd.jsp"%>

<%@ include file="/jsp/incl/contrat.jsp"%>

<%@ include file="/jsp/incl/remboursementPrestations.jsp"%>

<%-- 
<%@ include file="/jsp/incl/telechargementDocuments.jsp"%>

--%>

