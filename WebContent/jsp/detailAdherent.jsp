<%@ include file="/declaration/taglibs.jsp"%>

<H1 id="TITREDOSSIER" >
	<div class="texteH">
		Détail de <bean:write name="adherent" property="nomPrenom"/>
	</div>
	<div class="iconesH">
		<a href="<%= (String)request.getContextPath()  %>/retourArriere.do<%= (null != (String)request.getAttribute("pileRequestReqParam")?(String)request.getAttribute("pileRequestReqParam"):"") %>"><i class="fa fa-arrow-left" data-toggle="tooltip" data-placement="bottom" data-original-title="Retour"></i></a>
	</div>
</H1>
<br>


<%@ include file="/jsp/incl/infosAdherent.jsp"%>
 



<%@ include file="/jsp/incl/listeContratDetailADH.jsp"%>




<%@ include file="/jsp/incl/listeAdressesADH.jsp"%>


<%@ include file="/jsp/incl/listeBanques.jsp"%>


