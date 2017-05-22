<%@ include file="/declaration/taglibs.jsp"%>

<H1 id="TITREDOSSIER" >
	<div class="texteH">
		Détail de <bean:write name="adherent" property="nomPrenom"/>
	</div>
	<div class="iconesH">
		<a href="<%= (String)request.getContextPath()  %>/retourArriere.do<%= (null != (String)request.getAttribute("pileRequestReqParam")?(String)request.getAttribute("pileRequestReqParam"):"") %>"><html:img page="/images/RETURN.gif" alt="Retour" border="0"/></a>
	</div>
</H1>
<br>


<%@ include file="/jsp/incl/infosAdherent.jsp"%>
 



<%@ include file="/jsp/incl/listeContratDetailADH.jsp"%>




<%@ include file="/jsp/incl/listeAdressesADH.jsp"%>


<%@ include file="/jsp/incl/listeBanques.jsp"%>


