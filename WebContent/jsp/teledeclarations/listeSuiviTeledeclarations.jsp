<%@ include file="/declaration/taglibs.jsp"%>


<% 
request.setAttribute("Numiterate", "0");
%>


 
  <H1>
	<div class="texteH">
    <layout:message key="appcot.suivi.titre"/>
	</div>
	<div class="iconesH">
    <a href="<%= (String)request.getContextPath()  %>/retourArriere.do<%= (null != (String)request.getAttribute("pileRequestReqParam")?(String)request.getAttribute("pileRequestReqParam"):"") %>"><i class="fa fa-arrow-left" data-toggle="tooltip" data-placement="bottom" data-original-title="Retour"></i></a> 
	</div>
  </H1>
<br/>

<logic:notPresent name="lstsuivi">

	<div class="callout callout-info">
			<strong>
				<html:errors/>
			</strong>     
	</div><br style="clear:both;"> 		

</logic:notPresent>

<logic:present name="lstsuivi">
<div class="row">
	<div class="col-xs-12">
		<div class="box box-mca-yellow">
			<layout:panel  styleClass="EXC_NONE" key="" width="98%" align="center">
			<layout:pager linksLocation ="top" maxPageItems ="12"  styleClass="PAGER">

			<layout:collection name="lstsuivi" id="lstsuivitele" title="" styleClass="LIGNE_A" styleClass2="LIGNE_B" >

			<logic:equal  name ="Numiterate" value ="0" scope="request">

			<layout:collectionItem title="appcot.appel" />
			<layout:collectionItem title="suivi.net" />
			<layout:collectionItem title="suivi.Datelimite" />
			<layout:collectionItem title="suivi.etat"  />
			<layout:collectionItem title="suivi.option" />
			</logic:equal>

			<logic:notEqual  name ="Numiterate" value ="0" scope="request">
			<layout:collectionItem title="appcot.appel" property="WDATEECH" />
			<layout:collectionItem title="suivi.net" property="WNETAPAYER" type="money" style="text-align:right;"/>
			<layout:collectionItem title="suivi.Datelimite" property="WLIMITERGLT"/>
			<layout:collectionItem title="suivi.etat" property="WOBSETAT" />

			<layout:collectionItem title="suivi.option" >

			 <logic:equal name="lstsuivitele"  property="WB1ETA" value="AF" >

			 <a href="<%= (String)request.getContextPath()  %>/teledeclaration.do?id=<bean:write name="lstsuivitele" property="WB1ID"/>"> Effectuer la télé-déclaration </a>
			 </logic:equal>

			 <logic:equal name="lstsuivitele"  property="WB1ETA" value="EC" >

			 <a href="<%= (String)request.getContextPath()  %>/teledeclaration.do?id=<bean:write name="lstsuivitele" property="WB1ID"/>" > Modifier/Valider la télé-déclaration </a>
			 </logic:equal>

			 <logic:equal name="lstsuivitele"  property="WB1ETA" value="LT" >

			 <a href="<%= (String)request.getContextPath()  %>/teledeclaration.do?id=<bean:write name="lstsuivitele" property="WB1ID"/>" > Visualiser la télé-déclaration </a>
			 </logic:equal>

			 <logic:equal name="lstsuivitele"  property="WB1ETA" value="PA" >

			 <a href="<%= (String)request.getContextPath()  %>/teledeclaration.do?id=<bean:write name="lstsuivitele" property="WB1ID"/>" > Visualiser la télé-déclaration </a>
			 </logic:equal>

			 <logic:equal name="lstsuivitele"  property="WB1ETA" value="RC" >
			 <a href="<%= (String)request.getContextPath()  %>/teledeclaration.do?id=<bean:write name="lstsuivitele" property="WB1ID"/>" > Visualiser la télé-déclaration </a>
			 </logic:equal>

			 <logic:equal name="lstsuivitele"  property="WB1ETA" value="RR" >
			 <a href="<%= (String)request.getContextPath()  %>/teledeclaration.do?id=<bean:write name="lstsuivitele" property="WB1ID"/>" > Visualiser la télé-déclaration </a>
			 </logic:equal>

			 <logic:equal name="lstsuivitele"  property="WB1ETA" value="TR" >
			 <a href="<%= (String)request.getContextPath()  %>/teledeclaration.do?id=<bean:write name="lstsuivitele" property="WB1ID"/>" > Visualiser la télé-déclaration </a>
			 </logic:equal>

			 </layout:collectionItem>

			 </logic:notEqual>

			<% 
			request.setAttribute("Numiterate", "1");
			%>

			</layout:collection>

			<layout:row> 
			    <layout:pagerStatus key="pager.status.pager"/> 
			    <layout:pagerStatus key="pager.status.items"/> 
			</layout:row> 

			</layout:pager>
			</layout:panel>
		</div>
	</div>
</div>
</logic:present>




