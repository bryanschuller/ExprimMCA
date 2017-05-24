<%@ include file="/declaration/taglibs.jsp"%>

<% if(null != typeD && (typeD.equals("ADH") || typeD.equals("BEN"))) { %>
	<div class="box box-mca-yellow">
		<div class="box-header with-border">
			<h3 class="box-title">
				Vos remboursements de prestations
			</h3>
		</div>
		<div class="box-footer">
			<div class="btn-group">
				<a href="<%=(String) request.getContextPath()%>/viewPaiements.do">Consultez l'historique de vos prestations. </a>
			</div>
		</div>
	</div>
<% } %>
