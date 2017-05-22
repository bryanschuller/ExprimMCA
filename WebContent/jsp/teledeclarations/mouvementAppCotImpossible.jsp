<%@ include file="/declaration/taglibs.jsp"%>

<layout:html>
 
<H2>
	<div class="texteH">
		<layout:message key="title.action.impossible"/>
	</div>
</H2>


<layout:panel styleClass="CORPS_MSG" width="100%">

<br><br>
<div align="center">

<strong><html:errors/></strong>

</div>

<br><br><br>
<div align="center">
<layout:button styleClass="btn" value="Fermer" onclick="window.close();" />
</div>

<tr height="50"/>
<br><br><br>

</layout:panel>

</layout:html>