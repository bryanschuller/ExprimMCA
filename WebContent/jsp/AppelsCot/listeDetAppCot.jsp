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
	<div class="iconesH">
		<div  class="pay_vis">
			<a href="<%= (String)request.getContextPath()  %>/getDetAppCotN.do?id=<%=(String)request.getParameter("id")%>&action=PDF" target = "blank" > <html:img page="/images/docpdf.gif" alt="Obtenir une copie au format pdf" border="0"/></a>
    		<a href="<%= (String)request.getContextPath()  %>/getDetAppCotN.do?id=<%=(String)request.getParameter("id")%>&action=MAIL" target = "blank" > <html:img page="/images/mail.gif" alt="Obtenir une copie par mail" border="0"/></a>
    		<a href="javascript:window.print()"><html:img page="/images/PRINT.gif" alt="imprimer la page" border="0"/></a>
			<a href="<%= (String)request.getContextPath()  %>/retourArriere.do<%= (null != (String)request.getAttribute("pileRequestReqParam")?(String)request.getAttribute("pileRequestReqParam"):"") %>"><html:img page="/images/RETURN.gif" alt="Retour" border="0"/></a>
		</div>
	</div>
</H1>
<br>
 
 <!-- 
<table  align="center" width="98%" class="ENTETE">
  <tr>
    <td width="1%" align="center" > </td>
    <td width="85%" height="18" align="left"> <layout:message key="appcot.detail.titre"/>  N° <%=(String)request.getAttribute("numpiece")%>  - Contrat N° <%=(String)request.getAttribute("numcontrat")%> </td>
    <td width="5%" align="center" ><a href="<%= (String)request.getContextPath()  %>/getDetAppCotN.do?numPiece=<%=(String)request.getAttribute("numpiece")%>&action=PDF" target = "blank" > <html:img page="/images/docpdf.gif" alt="Obtenir une copie au format pdf" border="0"/></a></td>
    <td width="5%" align="center" ><a href="<%= (String)request.getContextPath()  %>/getDetAppCotN.do?numPiece=<%=(String)request.getAttribute("numpiece")%>&action=MAIL" target = "blank" > <html:img page="/images/mail.gif" alt="Obtenir une copie par mail" border="0"/></a></td>
    <td width="5%" align="center" ><a href="javascript:window.print()"><html:img page="/images/PRINT.gif" alt="imprimer la page" border="0"/></td>
   <td width="5%" align="center" ><a href="<%= (String)request.getContextPath()  %>/listAppCot.do"><html:img page="/images/RETURN.gif" alt="retour à la liste" border="0"/></td>
  </tr>
</table>
 -->

<logic:present name="lstDetappelscot">
	
	<div id="EXC_PRESENT_DATA_1">
		<layout:panel  styleClass="EXC_NONE" key="" width="98%" align="center">
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

</logic:present>

<logic:notPresent name="lstDetappelscot">			
	<div id="EXC_MESSAGE_PRESTA">
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



