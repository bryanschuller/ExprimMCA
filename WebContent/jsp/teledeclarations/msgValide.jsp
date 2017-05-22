<%@ include file="/declaration/taglibs.jsp"%>



<H1>
	<div class="texteH">
	<html:img page="/images/info.gif" border="0"/>
	<layout:message key="title.msg.ent"/>
	</div>



	<div class="iconesH">
	<a href="<%= (String)request.getContextPath()  %>/retourArriere.do<%= (null != (String)request.getAttribute("pileRequestReqParam")?(String)request.getAttribute("pileRequestReqParam"):"") %>"><html:img page="/images/RETURN.gif" alt="Retour" border="0"/></a>
	</div>
</H1>

<p>&nbsp;</p>




<layout:panel   styleClass="CORPS_MSG" key="" width="60%" align="center">
<p>&nbsp;</p>
<strong>
<html:errors/>
</strong> 
<p>&nbsp;</p>
</layout:panel>

