<%@ include file="/declaration/taglibs.jsp"%>


<div>
	<div class="texteH">
		<layout:write name="pageTexte" property="titre" layout="false" filter="false"/>
	</div>
	<div class="iconesH">
		<div class="pay_vis">
			<a href="<%= (String)request.getContextPath()  %>/retourArriere.do<%= (null != (String)request.getAttribute("pileRequestReqParam")?(String)request.getAttribute("pileRequestReqParam"):"") %>"><i class="fa fa-arrow-left" data-toggle="tooltip" data-placement="bottom" data-original-title="Retour"></i></a>
		</div>
	</div>
</div>
<div class="clearfix"></div>

<div id="EXC_PAGE_TEXTE">
	<layout:write name="pageTexte" property="message" layout="false" filter="false"/>
</div>

