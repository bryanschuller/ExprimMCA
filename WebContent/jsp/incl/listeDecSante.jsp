<%@ include file="/declaration/taglibs.jsp"%>

<H1 id="TITREDOSSIER" >
	<div class="texteH">
		Mes décomptes santé
	</div>
	<div class="iconesH">
	<a href="<%=(String) request.getContextPath()%>/viewPaiements.do">Consultez
	l'historique de vos prestations</a>
		<a href="<%= (String)request.getContextPath()  %>/retourArriere.do<%= (null != (String)request.getAttribute("pileRequestReqParam")?(String)request.getAttribute("pileRequestReqParam"):"") %>"><i class="fa fa-arrow-left" data-toggle="tooltip" data-placement="bottom" data-original-title="Retour"></i></a>
	</div>
</H1>
<div class="clearfix"></div>


<div class="row">
	<div class="col-xs-12">
		<div class="box box-mca-yellow">
			<div class="box-body">
				<exged:listeDocExged name="docExgedDossier" userCode="USER_STD" loadCode="LOAD_00000000148"
				styleClass1="LIGNE_A" styleClass2="LIGNE_B">				
					<exged:paramSearchExged paramName="DOSSIER_ACTUELLE" />				
				</exged:listeDocExged>
			</div>
		</div>
	</div>			
</div>	

