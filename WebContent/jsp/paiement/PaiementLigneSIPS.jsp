<%@ include file="/declaration/taglibs.jsp"%>

<H1 id="TITREDOSSIER">
	<div class="texteH">
	 <layout:message key="paiement.titre"/> 
	</div>
</H1>

<div class="clearfix"></div>

<H2>
	<div class="texteH">
	 	<layout:write name="SIPSTitle" filter="false"/> 
	</div>
</H2>

<div class="clearfix"></div>

<div align="center">
	<layout:write name="SIPSReturn" filter="false"/>
</div>



