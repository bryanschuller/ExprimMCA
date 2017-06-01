<%@ include file="/declaration/taglibs.jsp"%>
  
<H1 >
	<div class="texteH">
		<layout:message key="appcot.detail.titre"/> 
		<logic:present name="numpiece" scope="request">
			 N° <%=(String)request.getAttribute("numpiece")%>
		</logic:present>
		<logic:present name="numcontrat" scope="request">
			  - Contrat N° <%=(String)request.getAttribute("numcontrat")%>
		</logic:present>
	</div>
	<div class="iconesH hidden-print">
		<div  class="pay_vis">
			<a href="<%= (String)request.getContextPath()  %>/getDetAppCotN.do?id=<%=(String)request.getParameter("id")%>&action=PDF" target = "blank" > 
<i class="fa fa-file-pdf-o" data-toggle="tooltip" data-placement="bottom" data-original-title="Obtenir une copie au format PDF"></i></a>
    		<a href="<%= (String)request.getContextPath()  %>/getDetAppCotN.do?id=<%=(String)request.getParameter("id")%>&action=MAIL" target = "blank" ><i class="fa fa-envelope-o" data-toggle="tooltip" data-placement="bottom" data-original-title="Obtenir une copie par mail"></i></a>
    		<a href="javascript:window.print()"><i class="fa fa-print" data-toggle="tooltip" data-placement="bottom" data-original-title="Imprimer"></i></a>
			<a href="<%= (String)request.getContextPath()  %>/retourArriere.do<%= (null != (String)request.getAttribute("pileRequestReqParam")?(String)request.getAttribute("pileRequestReqParam"):"") %>"><i class="fa fa-arrow-left" data-toggle="tooltip" data-placement="bottom" data-original-title="Retour"></i></a>
		</div>
	</div>
</H1>
<br>

<logic:present name="lstDetappelscot">
	
<div class="row">
	<div class="col-xs-12">
		<div class="box box-mca-yellow">
			<layout:panel key="" width="98%" align="center">
				<layout:pager linksLocation ="top" maxPageItems ="12"  styleClass="PAGER">
				  
					<layout:collection name="lstDetappelscot" id="lstapp" title="" styleClass="LIGNE_A" styleClass2="LIGNE_B"  >
						<layout:collectionItem title="appcot.nomprenom" property="WNOMPRENOM"/>
						<layout:collectionItem title="appcot.adherent" property="WAA" />
						<layout:collectionItem title="appcot.periode" property="WPCONCERNE"/>
						<layout:collectionItem title="appcot.du" property="WDATEDU" />
						<layout:collectionItem title="appcot.au" property="WDATEAU" />
						<layout:collectionItem title="appcot.taux" property="WTAUX" />
						<layout:collectionItem title="appcot.montant" property="WMONTANTREEL" style="text-align:right;" />
						<layout:collectionItem title="appcot.regle" property="WDATERGLT" />
						<layout:collectionItem title="appcot.observation" property="WTYPEPIECE" />
					</layout:collection>
					
					<layout:row> 
					    <layout:pagerStatus key="pager.status.pager"/> 
					    <layout:pagerStatus key="pager.status.items"/> 
					</layout:row> 
				</layout:pager>
			</layout:panel>
		</div>
	</div>

</logic:present>

<logic:notPresent name="lstDetappelscot">			
	<div class="callout callout-info">
		<strong>
			<html:errors/>
		</strong>     
	</div><br style="clear:both;"> 			
</logic:notPresent>


<script language="javascript">

var height = 600;
var width = 800;
browserName=navigator.appName;
browserVer=parseInt(navigator.appVersion);
if ((browserVer >= 4 & browserName == "Netscape") | (browserVer >= 4 & browserName == "Microsoft Internet Explorer"))
    version="4";
else
    version="3";
if (version=="4") {
    width = screen.width;
    height = screen.height;
}

function previewdet()
{
    window.open("", "window", "toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=no,resizeable=yes,width=400,height=500,left=0,top=0");
}


function openWindowWithVariableSize(url, w, h)
{
    window.open(url, "", "width="+w+" height="+h);
}

</script>



