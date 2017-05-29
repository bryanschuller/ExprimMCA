<%@ include file="/declaration/taglibs.jsp"%>

<H1>S�lection du dossier</H1>

<div class="row">
	<div class="col-xs-12">
		<div class="box box-mca-yellow">
			<div class="box-header">
				<h3>Choisissez le dossier que vous souhaitez consulter</h3>
			</div>
			<div class="box-body">
				<layout:collection name="lDossier" id="dossier" styleClass="LIGNE_A" styleClass2="LIGNE_B">
					<layout:collectionItem>
						<a href="<%= (String)request.getContextPath()  %>/accederDossier.do?id=<bean:write name="dossier" property="index"/>" onclick="setTimeout('wait()',2000);">
					 		<bean:write name="dossier" property="designation"/>
					 	</a>
					</layout:collectionItem>
				</layout:collection>
			</div>
		</div>
	</div>
</div>

<script language="javascript">		
		function wait() {
			document.getElementById('wait').style.display = 'block';
			document.getElementById('wait_fond').style.display = 'block';
<%--		document.getElementById('wait').style.marginTop = '-30%';
			document.getElementById('wait').style.marginLeft = '33%';--%>
		}
</script>