<%@ include file="/declaration/taglibs.jsp"%>

<% 
request.setAttribute("Numiterate", "0");
%> 
 
     


<H1>
	<div class="texteH">
    <%=(String)request.getAttribute("titre")%>
	</div>
	<div class="iconesH">
    <logic:equal  name ="mode" value ="V" scope="request">
    	<a href="javascript:prevBor()" > <html:img page="/images/docpdf.gif" alt="Obtenir une copie au format pdf" border="0"/></a>
    	<a href="javascript:copyBor()" > <html:img page="/images/mail.gif" alt="Obtenir une copie par mail" border="0"/></a>
    </logic:equal>
<a href="<%= (String)request.getContextPath()  %>/retourArriere.do<%= (null != (String)request.getAttribute("pileRequestReqParam")?(String)request.getAttribute("pileRequestReqParam"):"") %>"><html:img page="/images/RETURN.gif" alt="Retour" border="0"/></a>	</div>
</H1>
<br/><br/>


<div id="EXC_PRESENT_DATA_1">
<layout:panel  styleClass="EXC_NONE" key="" width="98%" align="center">
<layout:pager linksLocation ="top" maxPageItems ="10"  styleClass="PAGER">

<layout:collection name="lstDetsuivi" width="100%" id="lstrecap" title="" styleClass="LIGNE_A" styleClass2="LIGNE_B"  >
 
<logic:equal  name ="Numiterate" value ="0" scope="request">
<layout:collectionItem title="suivi.option"  />
<layout:collectionItem title="appcot.numeroappel" />
<layout:collectionItem title="appcot.famille" />
<layout:collectionItem title="appcot.garantie"  />
<layout:collectionItem title="appcot.periode"  />
<layout:collectionItem title="appcot.montant"  />
<layout:collectionItem title="appcot.regularisation"  />
<layout:collectionItem title="appcot.total" width="75px" />
</logic:equal>

<logic:notEqual  name ="Numiterate" value ="0" scope="request">

<layout:collectionItem title="suivi.option" >

<logic:equal  name ="mode" value ="V" scope="request">
<a href="<%= (String)request.getContextPath()  %>/manageAppCot.do?id=<%=(String)request.getAttribute("idSuivi")%>&numPiece=<bean:write name="lstrecap" property="WB2APP"/>"> Visualiser </a>
</logic:equal>

<logic:equal  name ="mode" value ="M" scope="request">
<a href="<%= (String)request.getContextPath()  %>/manageAppCot.do?id=<%=(String)request.getAttribute("idSuivi")%>&numPiece=<bean:write name="lstrecap" property="WB2APP"/>"> Modifier </a>
</logic:equal>


</layout:collectionItem>


<layout:collectionItem title="appcot.numeroappel" property="WB2APP"/>
<layout:collectionItem title="appcot.famille" property="WB2FAM" />
<layout:collectionItem title="appcot.garantie" property="WB2GAR"/>
<layout:collectionItem title="appcot.periode" property="WLIBPER" />
<layout:collectionItem title="appcot.montant" property="WB2MNT" type="money" style="text-align:right;"/>
<layout:collectionItem title="appcot.regularisation" property="WB2REG" type="money" style="text-align:right;"/>
<layout:collectionItem title="appcot.total" property="WMNTNET" type="money" style="text-align:right;"/>

</logic:notEqual>

<%

request.setAttribute("Numiterate", "1");

%>

</layout:collection>

<layout:row> 
    <layout:pagerStatus key="pager.status.pager" /> 
    <layout:pagerStatus key="pager.status.items"/> 
</layout:row> 

</layout:pager>
</layout:panel>
</div>





<table class="CORPS_TOTAL"  height="78" width="200px" border="0" cellpadding="0" cellspacing="1" align = "right">

<tr><td height="18"><td></tr>

  <tr >
    <th>TOTAL ECHEANCE</th>
    <td width="60px"><%=(String)request.getAttribute("totecheance")%> &euro;</td>
  </tr>
  
  <td height="9px" colspan="2" class="ENTETE"></td>
  
  <tr>
    <th>TOTAL REGULARISATION</th>
    <td><%=(String)request.getAttribute("totregul")%> &euro;</td>
  </tr>
   <td height="9px" colspan="2" class="ENTETE"></td>
   <tr>
    <th  >SOLDE</th>
    <td><%=(String)request.getAttribute("solde")%> &euro;</td>
  </tr>
  <td height="18px" colspan="2" class="ENTETE"></td>

  <tr>
    <th>NET A PAYER</th>
    <td><%=(String)request.getAttribute("totnet")%> &euro;</td>
  </tr>

</table>


<layout:panel  styleClass="CORPS_DONNE" key="" width="530px" >



<td width="5px"> </td>


<td><H3>COMMENTAIRE</H3></td>

<tr >
<td width="5px"  > </td>
<td >

<logic:equal  name ="mode" value ="M" scope="request">
<layout:textarea key="" name="detail" layout="false" property="commentaire" styleClass="COMMENTAPPEL" maxlength="1024" isRequired="false" mode="R,R,R" onclick="javascript:changeCommentaire();"/> 
</logic:equal>
<logic:notEqual name ="mode" value ="M" scope="request">
<layout:textarea key="" name="detail" layout="false" property="commentaire" size="52" maxlength="1024" isRequired="false" mode="R,R,R" /> 
</logic:notEqual>

</td>
</tr>
<tr>
<td width="5px"  > </td>
<td><H3>TYPE DE REGLEMENT</H3></td>
</tr><tr>
<td width="5px"  > </td>
<td >
<logic:equal  name ="mode" value ="V" scope="request">
<layout:select key="" property="typereg" name="detail" layout="false" mode="D,D,D" >
<layout:options collection="lstmdp" property="WCMDP" labelProperty="WLIBMDP"/>
</layout:select>
</logic:equal>

<logic:equal  name ="mode" value ="M" scope="request">

<logic:equal  name ="rgltlck" value ="O" scope="request">
<layout:select key="" property="typereg" name="detail" layout="false" mode="D,D,D" >
<layout:options collection="lstmdp" property="WCMDP" labelProperty="WLIBMDP"/>
</layout:select>
</logic:equal>

<logic:notEqual  name ="rgltlck"  value ="O" scope="request">
<layout:select key="" property="typereg" name="detail" layout="false" mode="E,E,E" >
<layout:options collection="lstmdp" property="WCMDP" labelProperty="WLIBMDP"/>
</layout:select>
</logic:notEqual>

</logic:equal>
</td>
</tr>

</layout:panel>
<layout:panel  styleClass="CORPS_DONNE" key="" width="100%" >
<div>

  <tr >
    <td width="100%" height="14" align="left" class="INFOLINE_MDP">
    <strong>
  Net à payer : <%=(String)request.getAttribute("totnet")%> &euro;
  	</strong>
    </td>
  </tr>
  
<% if ((String)request.getAttribute("libPrelevemnt")!= null) {
%>
    <tr >
    <td width="100%" height="14" align="left" class="INFOLINE_MDP"> 
    <%=(String)request.getAttribute("libPrelevemnt")%>
    </td>   
  </tr>
<%
}
%>
 <% if ((String)request.getAttribute("libcompte")  != null) {
%>

   <tr>
      <td width="100%" height="14" align="left" class="INFOLINE_MDP"> 
    <%=(String)request.getAttribute("libcompte")%>
    </td>
    </tr>
<%
  }
%>




  <tr heigth = "24">
    
    <td width="60%" height="18" align="left" class="INFOLINE_LOGIN"> 
    
    <logic:equal  name ="mode" value ="V" scope="request">
    Cette télé-déclaration ne peut être modifiée...
    </logic:equal>   
    </td>   

    <logic:equal  name ="mode" value ="M" scope="request">
     <td  align="center" >
     <input type="button" value="Aperçu avant envoi" onclick="javascript:prevBor();" class="BOUT1"/>
     </td>
     <td  align="center" >
     <input type="button" value="Valider" onclick="javascript:mailBor();" class="BOUT1"/>
    </td>
    </logic:equal>  
  </tr>
  
</div>




<div>
  <tr> 
    <td width="5%" height="27"><html:img page="/images/info.gif" border="0"/>  Les fenêtres pop-pup doivent êtres autorisées sur le site</td>
  </tr>
</div>
  
</layout:panel>





<script language="javascript"> 

function prevBor(){

	document.open( "<%= (String)request.getContextPath()  %>/previewBordereau.do?idSuivi=<%=(String)request.getAttribute("idSuivi")%>", "Preview" , "" );
}
function mailBor(){

	
	
 if (document.getElementById)
 {
 typer = document.getElementsByName("typereg")[0].value;
  }
  else if (document.all)
  {
   typer = document.all['typereg'].value ;
  }
	
	
document.location.href="<%= (String)request.getContextPath()  %>/mailBordereau.do?idSuivi=<%=(String)request.getAttribute("idSuivi")%>&TypeR=" + typer;
}
function copyBor(){
	document.open( "<%= (String)request.getContextPath()  %>/copyBordereau.do?idSuivi=<%=(String)request.getAttribute("idSuivi")%>", "copy", "");
}

function changeCommentaire(){
spop("<%= (String)request.getContextPath()  %>/getTeleCommentaire.do?id=<%=(String)request.getAttribute("idSuivi")%>",'Mouvement', 490, 270 );

}
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

