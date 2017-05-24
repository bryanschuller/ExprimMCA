
<%@ include file="/declaration/taglibs.jsp"%>


<% if(null != typeD && typeD.equals("ENT")) { %>
	<div class="box box-mca-yellow">
		<div class="box-header with-border">
			<h3 class="box-title">Vos appels de cotisations</h3>
		</div>
		<div class="box-body">
			<div class="row">
				<div class="col-xs-12">
					<a href="<%=(String) request.getContextPath()%>/viewAppCot.do">Consultez vos appels de cotisations.</a>
				</div>
			</div>
		</div>
	</div>
<% } %>
