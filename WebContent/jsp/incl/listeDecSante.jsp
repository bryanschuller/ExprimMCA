<%@ include file="/declaration/taglibs.jsp"%>

<H1 id="TITREDOSSIER" >
	<div class="texteH">
		Mes décomptes santé
	</div>
	<div class="iconesH">
	<a href="<%=(String) request.getContextPath()%>/viewPaiements.do">Consultez
	l'historique de vos prestations</a>
		<a href="<%= (String)request.getContextPath()  %>/retourArriere.do<%= (null != (String)request.getAttribute("pileRequestReqParam")?(String)request.getAttribute("pileRequestReqParam"):"") %>"><html:img page="/images/RETURN.gif" alt="Retour" border="0"/></a>
	</div>
</H1>
<br><br>


<div id="EXC_PRESENT_DATA_1">		
	<exged:listeDocExged name="docExgedDossier" userCode="USER_STD" loadCode="LOAD_00000000148"
	styleClass1="LIGNE_A" styleClass2="LIGNE_B">				
		<exged:paramSearchExged paramName="DOSSIER_ACTUELLE" />				
	</exged:listeDocExged>			
</div>	

