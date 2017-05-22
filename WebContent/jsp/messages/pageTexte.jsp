<%@ include file="/declaration/taglibs.jsp"%>


<H1>
	<div class="texteH">
		<layout:write name="pageTexte" property="titre" layout="false" filter="false"/>
	</div>
	<div class="iconesH">
		<div class="pay_vis">
			<a href="<%= (String)request.getContextPath()  %>/retourArriere.do<%= (null != (String)request.getAttribute("pileRequestReqParam")?(String)request.getAttribute("pileRequestReqParam"):"") %>"><html:img page="/images/RETURN.gif" alt="Retour" border="0"/></a>
		</div>
	</div>
</H1>
<br>

<div id="EXC_PAGE_TEXTE">
	<layout:write name="pageTexte" property="message" layout="false" filter="false"/>
</div>

