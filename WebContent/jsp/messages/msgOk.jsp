<%@ include file="/declaration/taglibs.jsp"%>


<H1>
	<div class="texteH"></div>
	<div class="iconesH">
	<a href="<%= (String)request.getContextPath()  %>/retourArriere.do<%= (null != (String)request.getAttribute("pileRequestReqParam")?(String)request.getAttribute("pileRequestReqParam"):"") %>"><html:img page="/images/RETURN.gif" alt="Retour" border="0"/></a>
	
	</div>
</H1>
<br><br><br><br>

<div id="EXC_MESSAGE_INFO"><strong> <html:errors /> </strong></div>
