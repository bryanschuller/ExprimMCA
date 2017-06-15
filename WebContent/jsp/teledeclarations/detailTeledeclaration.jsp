<%@ include file="/declaration/taglibs.jsp"%>

<% 
request.setAttribute("Numiterate", "0");
%> 
 
     


<div>
	<div class="texteH">
    <%=(String)request.getAttribute("titre")%>
	</div>
	<div class="iconesH">
    <logic:equal  name ="mode" value ="V" scope="request">
    	<a href="javascript:prevBor()" > <i class="fa fa-file-pdf-o" data-toggle="tooltip" data-placement="bottom" data-original-title="Obtenir une copie au format PDF"></i></a>
    	<a href="javascript:copyBor()" > <i class="fa fa-envelope-o" data-toggle="tooltip" data-placement="bottom" data-original-title="Obtenir une copie par mail"></i></a>
    </logic:equal>
<a href="<%= (String)request.getContextPath()  %>/retourArriere.do<%= (null != (String)request.getAttribute("pileRequestReqParam")?(String)request.getAttribute("pileRequestReqParam"):"") %>"><i class="fa fa-arrow-left" data-toggle="tooltip" data-placement="bottom" data-original-title="Retour"></i></a>	</div>
</div>
<div class="clearfix"></div>


<div class="row">
  <div class="col-xs-12">
    <div class="box box-mca-yellow">
      <layout:panel styleClass="EXC_NONE" key="" width="98%" align="center">
        <layout:pager linksLocation ="top" maxPageItems ="10"  styleClass="PAGER">
          <layout:collection name="lstDetsuivi" width="100%" id="lstrecap" title="" styleClass="LIGNE_A" styleClass2="LIGNE_B"  >
            <logic:equal name ="Numiterate" value ="0" scope="request">
              <tr>
                <th class="LIGNE_A"><bean:message key="suivi.option"/></th>
                <th class="LIGNE_A"><bean:message key="appcot.numeroappel"/></th>
                <th class="LIGNE_A"><bean:message key="appcot.famille"/></th>
                <th class="LIGNE_A"><bean:message key="appcot.garantie"/></th>
                <th class="LIGNE_A"><bean:message key="appcot.periode"/></th>
                <th class="LIGNE_A" style="text-align:right;"><bean:message key="appcot.montant"/></th>
                <th class="LIGNE_A" style="text-align:right;"><bean:message key="appcot.regularisation"/></th>
                <th width="75" class="LIGNE_A" style="text-align:right; "><bean:message key="appcot.total"/></th>
              </tr>
            </logic:equal>

            <logic:notEqual  name ="Numiterate" value ="0" scope="request">
              <layout:collectionItem title="suivi.option" >
                <logic:equal  name ="mode" value ="V" scope="request">
                  <a href="<%= (String)request.getContextPath()  %>/manageAppCot.do?id=<%=(String)request.getAttribute("idSuivi")%>&numPiece=<bean:write name="lstrecap" property="WB2APP"/>"> Visualiser </a>
                </logic:equal>

                <logic:equal  name ="mode" value ="M" scope="request">
                  <div class="btn-group">
                    <a href="<%= (String)request.getContextPath()  %>/manageAppCot.do?id=<%=(String)request.getAttribute("idSuivi")%>&numPiece=<bean:write name="lstrecap" property="WB2APP"/>" class="btn btn-flat btn-sm btn-default"><i class="fa fa-pencil"></i><span class="hidden-sm hidden-xs"><layout:message key="libelle.modifier" /></span></a>
                  </div>
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
  </div>
</div>


<div class="row">
  <div class="col-xs-12 col-md-8">
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
    <layout:select key="" property="typereg" name="detail" layout="false" mode="D,D,D" styleClass="form-control" >
    <layout:options collection="lstmdp" property="WCMDP" labelProperty="WLIBMDP"/>
    </layout:select>
    </logic:equal>

    <logic:equal  name ="mode" value ="M" scope="request">

    <logic:equal  name ="rgltlck" value ="O" scope="request">
    <layout:select key="" property="typereg" name="detail" layout="false" mode="D,D,D"  styleClass="form-control">
    <layout:options collection="lstmdp" property="WCMDP" labelProperty="WLIBMDP"/>
    </layout:select>
    </logic:equal>

    <logic:notEqual  name ="rgltlck"  value ="O" scope="request">
    <layout:select key="" property="typereg" name="detail" layout="false" mode="E,E,E"  styleClass="form-control">
    <layout:options collection="lstmdp" property="WCMDP" labelProperty="WLIBMDP"/>
    </layout:select>
    </logic:notEqual>

    </logic:equal>
    </td>
    </tr>

    </layout:panel>
  </div>
  <div class="col-xs-12 col-md-4">
    <div class="box box-mca-yellow">
      <div class="box-body">
        <table style="width: 100%;">
          <tr>
            <th>TOTAL ECHEANCE</th>
            <td width="10"></td>
            <td style="text-align: right;"><%=(String)request.getAttribute("totecheance")%> &euro;</td>
          </tr>

          <tr>
            <th>TOTAL REGULARISATION</th>
            <td></td>
            <td style="text-align: right;"><%=(String)request.getAttribute("totregul")%> &euro;</td>
          </tr>

          <tr>
            <th>SOLDE</th>
            <td></td>
            <td style="text-align: right;"><%=(String)request.getAttribute("solde")%> &euro;</td>
          </tr>

          <tr>
            <th>NET A PAYER</th>
            <td></td>
            <td style="text-align: right;"><%=(String)request.getAttribute("totnet")%> &euro;</td>
          </tr>
        </table>
      </div>
    </div>
  </div>
</div>

<div class="row">
  <div class="col-xs-12">
    <layout:panel  styleClass="CORPS_DONNE" key="" width="100%" >
      <div>

        <tr >
          <td width="100%" height="14" align="left" class="INFOLINE_MDP">
            <H3>Net à payer : <%=(String)request.getAttribute("totnet")%> &euro;</H3>
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
           <input type="button" class="btn btn-warning" value="Aperçu avant envoi" onclick="javascript:prevBor();" class="BOUT1"/>
           </td>
           <td  align="center" >
           <input type="button" class="btn btn-success" value="Valider" onclick="javascript:mailBor();" class="BOUT1"/>
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
  </div>
</div>





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

