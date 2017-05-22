<%@ include file="/declaration/taglibs.jsp"%>


<H1 id="TITREDOSSIER">
	<div class="texteH">
		Documents Exged
	</div>
	<div class="iconesH">
		<a href="<%= (String)request.getContextPath()  %>/retourArriere.do<%= (null != (String)request.getAttribute("pileRequestReqParam")?(String)request.getAttribute("pileRequestReqParam"):"") %>"><html:img page="/images/RETURN.gif" alt="Retour" border="0"/></a>
	</div>
</H1>
<br>


<%@ include file="/jsp/Exged/incl/documentsExgedDossier.jsp"%>
	

