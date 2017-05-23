<%@ include file="/declaration/taglibs.jsp"%>


<html>

<script language="javascript"> 

function mouvement1(){

window.showModalDialog("manageMvt.do?action=Create&id=<%=(String)request.getAttribute("idSuivi")%>&numPiece=<%=(String)request.getAttribute("numPiece")%>",'test','dialogWidth:560px; dialogHeight: 380px; center: Yes; help: No; resizable: no; status: No;' );

}

 
function mouvement(action, num){

if (document.getElementById)
 {
 
 typeMouv= document.getElementsByName("typeM")[0].value ; 
  }
 
  else if (document.all)
  {
   typeMouv = document.all['typeM'].value ;
  }


if(typeMouv == "Commentaire"){
	typeMouv = "C";
}else if(typeMouv == "Sortie"){
	typeMouv = "S";
}else if(typeMouv == "Entrée"){
	typeMouv = "E";
}else if(typeMouv == "Divers"){
	typeMouv = "D";
}

if(typeMouv == "E") {
	h = (action == "View")?280:310;
}else if(typeMouv == "S") {
	h= (action == "View")?230:300;
}else if(typeMouv == "D") {
h= (action == "View")?280:310;
}else{
	h= 180;
}
spop("<%=(String)request.getContextPath()%>/manageMvt.do?action=" + action +"&id=<%=(String)request.getAttribute("idSuivi")%>&numPiece=<%=(String)request.getAttribute("numPiece")%>&num=" + num + "&type=" + typeMouv + "&garantie=<%=(String)request.getAttribute("libContrat")%>",'Mouvement', 580, h );

}


</script>

<script language="javascript"> 
	// Utilisation: spop( 'monfichier.html', 'MaPopup', 100, 100, 'Mes options (Facultatif)' )
	// spop( fichier, nom, largeur, hauteur, options )
	function spop( fichier, nom, largeur, hauteur, options )
		{
			var id = Math.round( Math.random() * 100 );
			var gauche = ( screen.width - largeur ) / 2;
	  		var haut = ( screen.height - hauteur ) / 2;
			if ( options )
				{
					options = 'width=' + largeur + 'px, height=' + hauteur + 'px,  top=' + haut + ', left=' + gauche + ', ' + options;
				}
			else
				{
					options = 'width=' + largeur + 'px, height=' + hauteur + 'px,  top=' + haut + ', left=' + gauche;
				}
			document.open( fichier, nom , options );
		}
</script>





<% 
request.setAttribute("Numiterate", "0");
%>
    
  
     

 
<div>
	<div class="texteH">
    <logic:equal  name ="mode" value ="M" scope="request">
    	<layout:message key="appcot.mod.detail.titre"/> 
    </logic:equal>
 
    <logic:equal  name ="mode" value ="V" scope="request">
    	<layout:message key="appcot.visu.detail.titre"/> 
    </logic:equal>
    
    <%=(String)request.getAttribute("numPiece")%>  - Contrat N° <%=(String)request.getAttribute("numContrat")%> : <%=(String)request.getAttribute("libContrat")%> 
    </div>
    
    <div class="iconesH">
		<a href="<%= (String)request.getContextPath()  %>/retourArriere.do<%= (null != (String)request.getAttribute("pileRequestReqParam")?(String)request.getAttribute("pileRequestReqParam"):"") %>"><i class="fa fa-arrow-left" data-toggle="tooltip" data-placement="bottom" data-original-title="Retour"></i></a>	
	</div>
</div>
<div class="clearfix"></div>

<H2>
	<div class="texteH">
		<layout:message key="appcot.detail.appcot"/>
	</div>
</H2>


<div class="row">
	<div class="col-xs-12">
		<div class="box box-mca-yellow">
			<layout:panel  styleClass="EXC_NONE" key="" width="100%" align="center">
				<layout:pager linksLocation ="top" maxPageItems ="10" styleClass="PAGER" >
			  
				<layout:collection name="lstDetAppCotSui" id="lstapp" title="" styleClass="LIGNE_A" styleClass2="LIGNE_B" >
			 
					<logic:equal  name ="Numiterate" value ="0" scope="request">
						<layout:collectionItem title="appcot.nomprenom" />
						<layout:collectionItem title="appcot.adherent" />
						<layout:collectionItem title="appcot.vref"  />
						<layout:collectionItem title="appcot.conjoint"  />
						<layout:collectionItem title="appcot.enfant"  />
						<layout:collectionItem title="appcot.total"  />
						<layout:collectionItem title="appcot.regime"  />
						<layout:collectionItem title="appcot.periode"  />
						<layout:collectionItem title="appcot.type" />
						<layout:collectionItem title="appcot.taux" />
						<layout:collectionItem title="appcot.cotisation" width="80px" />
					</logic:equal>

					<logic:notEqual  name ="Numiterate" value ="0" scope="request">
						<layout:collectionItem title="appcot.nomprenom" property="WNOMPRENOM"/>
						<layout:collectionItem title="appcot.adherent" property="WAA" />
						<layout:collectionItem title="appcot.vref" property="WVREFERENCES"/>
						<layout:collectionItem title="appcot.conjoint" property="WNBCNJ" />
						<layout:collectionItem title="appcot.enfant" property="WNBENF" />
						<layout:collectionItem title="appcot.total" property="WNBTOT" />
						<layout:collectionItem title="appcot.regime" property="WARO" />
						<layout:collectionItem title="appcot.periode" property="WPCONCERNE" />
						<layout:collectionItem title="appcot.type" property="WTYPEPIECE" />
						<layout:collectionItem title="appcot.taux" property="WTAUX" style="text-align:right;" />
						<layout:collectionItem title="appcot.cotisation" property="WMONTANTREEL" type="money" style="text-align:right;"/>
					</logic:notEqual>

				<%
				request.setAttribute("Numiterate", "1");
				request.setAttribute("Numiterate2", "0");
				%>

				</layout:collection>
				<layout:row> 
			    	<layout:pagerStatus key="pager.status.pager" /> 
			    	<layout:pagerStatus key="pager.status.items"/> 
				</layout:row> 
				
				</layout:pager>
				</layout:panel>
			</layout:pagerStatus>
		</div>
	</div>
</div>

<table border="0" width="100%">
	<tr align="right">
		<td width="85%"><strong><layout:message key="appcot.total.appel"/></strong></td>
		<td width="15%"><strong><%=(String)request.getAttribute("totAppCot")%> &euro; </strong></td>
	</tr>
</table>



<H2>
	<div class="texteH">
		<layout:message key="appcot.regularisation"/>
	</div>
</H2>



<logic:equal  name ="nbmvts" value ="0" scope="request">
	<div class="EXC_TEXTE" id="EXC_PRESENT_DATA_COL_1" style="margin-top: 20px;"
			align="left">
		<layout:message key="appcot.aucune.regul"/>
	</div>
	<br>
	<logic:equal  name ="mode" value ="M" scope="request">
 		<layout:select key="" property="typeM" name="selectMvt" mode="E,E,E" layout="false" styleClass="LABEL" >
		<layout:options collection="LstMvt" property="WCODETMVT" labelProperty="WLIBTMVT" />
		</layout:select>
		<input type="button" value="Ajouter" onclick="javascript:mouvement('Create', 0);" class="BOUT1">
	</logic:equal>

	<table border="0" width="100%">
		<tr align="right">
		    <td width="85%"><strong><layout:message key="appcot.total.regularisation"/></strong></td>
		    <td width="15%"><strong><%=(String)request.getAttribute("totMvts")%> &euro; </strong></td>
	  	</tr>
	</table>
</logic:equal>



<logic:notEqual  name ="nbmvts" value ="0" scope="request">
	<div class="row">
		<div class="col-xs-12">
			<div class="box box-mca-yellow">
				<layout:panel  styleClass="EXC_NONE" key="" width="100%" align="center">
			<%-- <layout:pager linksLocation ="top" maxPageItems ="10"  styleClass="PAGER"> --%>

				<layout:collection name="lstDetMvtsSui" id="lstapp2" title="" styleClass="LIGNE_A" styleClass2="LIGNE_B" >
			 
					<layout:collectionItem title="suivi.options">
						<logic:equal  name ="mode" value ="M" scope="request">
							<a href="javascript:mouvement('Edit',<bean:write name="lstapp2" property="WB3MVT"/>,'<bean:write name="lstapp2" property="WLIBMVT"/>')"><html:img page="/images/edit.gif" alt="modifier la ligne" border="0"/></a>
							<a href="javascript:mouvement('Delete',<bean:write name="lstapp2" property="WB3MVT"/>,'')" onclick="return confirm('Supprimer cette régularisation ?');"  ><html:img page="/images/delete.gif" alt="supprimer la ligne" border="0"/></a>
						</logic:equal>

						<logic:equal  name ="mode" value ="V" scope="request">
							<layout:text mode="H,H,H" property="typeM" value="E" />
							<a href="javascript:mouvement('View',<bean:write name="lstapp2" property="WB3MVT"/>,'<bean:write name="lstapp2" property="WLIBMVT"/>')"><html:img page="/images/view.gif" alt="visualiser la ligne" border="0"/></a>
						</logic:equal>
					</layout:collectionItem>
					<layout:collectionItem title="appcot.nomprenom" property="WB3NOM"/>
					<layout:collectionItem title="appcot.adherent" property="WB3A" />
					<layout:collectionItem title="appcot.typeregul" property="WLIBMVT"/>
					<layout:collectionItem title="appcot.effet" property="WEFFETREGUL" />
					<layout:collectionItem title="appcot.commentaire" property="WB3TXT" />
					<layout:collectionItem title="appcot.da" property="WB3DA" type="money" style="text-align:right;"/>
					<layout:collectionItem title="appcot.montantregul" property="WB3REG" type="money" style="text-align:right;"  />

				</layout:collection>
				
			<%-- 	<layout:row> 
			    	<layout:pagerStatus key="pager.status.pager" /> 
			    	<layout:pagerStatus key="pager.status.items"/> 
				</layout:row> 

				</layout:pager> --%>
				</layout:panel>

				<logic:equal  name ="mode" value ="M" scope="request">
					<layout:select key="" property="typeM" name="selectMvt" mode="E,E,E" layout="false" styleClass="LABEL" >
					<layout:options collection="LstMvt" property="WCODETMVT" labelProperty="WLIBTMVT" />
					</layout:select>
					<input type="button" value="Ajouter" onclick="javascript:mouvement('Create', 0);" class="BOUT1">
				</logic:equal>

				<table border="0" width="100%">
					<tr align="right">
				    <td width="85%"><strong><layout:message key="appcot.total.regularisation"/></strong></td>
				    <td width="15%"><strong><%=(String)request.getAttribute("totMvts")%> &euro; </strong></td>
				  	</tr>
				</table>
			</div>
		</div>
	</div>
</logic:notEqual>

<br>

<table border="0" width="100%">
	<tr align="right">
    <td width="85%"><strong><layout:message key="appcot.totnet"/></strong></td>
    <td width="15%"><strong><%=(String)request.getAttribute("netAPayer")%> &euro; </strong></td>
    </tr>
</table>


<html:img page="/images/info.gif" border="0"/> <font color="#000000" size="1"><layout:message key="libelle.pop.up"/></font>

</html>


