<%@ include file="/declaration/taglibs.jsp"%>

<H1 id="TITREDOSSIER">
	<div class="texteH">
	 <layout:message key="paiement.titre"/> 
	</div>
</H1>
<br>

<H2>
	<div class="texteH">
	 	<layout:write name="SIPSTitle" filter="false"/> 
	</div>
</H2>

<br><br><br><br><br><br><br>
<div align="center">
							<layout:write name="SIPSReturn" filter="false"/>
</div>



