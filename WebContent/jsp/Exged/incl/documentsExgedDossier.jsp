
<%@ include file="/declaration/taglibs.jsp"%>


<H2>
	<div class="texteH">Documents du dossier
	</div>
	<div class="iconesH">				
	</div>
</H2>






<div class="row">
	<div class="col-xs-12">
		<div class="box box-mca-yellow">
			<exged:listeDocExged name="test" userCode="USER_STD" loadCode="LOAD_00000000100"
			styleClass1="LIGNE_A" styleClass2="LIGNE_B">
	
	
		<%-- 
			<exged:paramSearchExged paramName="ADHERENT" paramValue="LAVALUE in('A 11820', 'A 700715')" paramType=""></exged:paramSearchExged>
			<exged:paramSearchExged paramName="TXT_SDOIDU" paramValue="LAVALUE='Z000239'" paramType=""></exged:paramSearchExged>
			paramValue="LAVALUE ='<%=  (String) dossAct.toString() %>'" 
			
			--%>
			
				<exged:paramSearchExged paramName="DOSSIER_ACTUELLE" />
		
		
	</exged:listeDocExged>
</div>
<br>

