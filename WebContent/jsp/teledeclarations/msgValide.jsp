<%@ include file="/declaration/taglibs.jsp"%>



<div>
	<div class="texteH">
		<html:img page="/images/info.gif" border="0"/>
		<layout:message key="title.msg.ent"/>
	</div>



	<div class="iconesH">
		<a href="<%= (String)request.getContextPath()  %>/retourArriere.do<%= (null != (String)request.getAttribute("pileRequestReqParam")?(String)request.getAttribute("pileRequestReqParam"):"") %>"><i class="fa fa-arrow-left" data-toggle="tooltip" data-placement="bottom" data-original-title="Retour"></i></a>
	</div>
</div>
<div class="clearfix"></div>

<layout:panel   styleClass="CORPS_MSG" key="" width="60%" align="center">
<p>&nbsp;</p>
<strong>
<html:errors/>
</strong> 
<p>&nbsp;</p>
</layout:panel>

