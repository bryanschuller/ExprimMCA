<%@ include file="/declaration/taglibs.jsp"%>

<H1 >Sélection du dossier</H1>
<br>

<div id="EXC_PRESENT_DATA_1">
	<layout:collection name="lDossier" title="" id="dossier" 
		styleClass="LIGNE_A" styleClass2="LIGNE_B">

			<layout:collectionItem title="Choisissez le dossier que vous souhaitez consulter" >
				<a href="<%= (String)request.getContextPath()  %>
				/accederDossier.do?id=<bean:write name="dossier" property="index"/>" onclick="setTimeout('wait()',2000);">
				 <bean:write name="dossier" property="designation"/> </a>
 	 		
			</layout:collectionItem>
	
	</layout:collection>
</div>

<script language="javascript">		
		function wait() {
			document.getElementById('wait').style.display = 'block';
			document.getElementById('wait_fond').style.display = 'block';
<%--		document.getElementById('wait').style.marginTop = '-30%';
			document.getElementById('wait').style.marginLeft = '33%';--%>
		}		
</script>