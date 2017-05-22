<%@ include file="/declaration/taglibs.jsp"%>
 

<html>
<head>
<title>MCA</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">

<link href="config/MCAExprim.css" rel="stylesheet" type="text/css"/>
<script language="Javascript" src="<%= (String)request.getContextPath()  %>/config/javascript.js"></script><script>var imgsrc="<%= (String)request.getContextPath()  %>/images/"; var scriptsrc="<%= (String)request.getContextPath()  %>/config/"; var langue="fr"; var contextPath="<%= (String)request.getContextPath()  %>";</script>

<script type="text/javascript">

function tdate(){

 if (document.getElementById)
 {
 
 deff =  document.getElementsByName("dateEffet")[0].value ;
 
 
  }
  else if (document.all)
  {
  deff = document.all['dateEffet'].value ;
  }
  
  return isDate(deff);
  
}

</script>
<script type="text/javascript" src="<%= (String)request.getContextPath()  %>/scripts/control/control.js"></script>
<script type="text/javascript" src="<%= (String)request.getContextPath()  %>/scripts/preview.js"></script>

</head> 
  
 <body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" >
 
<bean:define id="bool_action" name="MouvementForm" property="action"/>
<bean:define id="type" name="MouvementForm" property="typeMouvement" />
 
<%
String string_action="false";
String strtitle=(String)session.getAttribute("garantie") + " : ";
String defFocus=null;

if(bool_action.equals("Create")){
	strtitle = strtitle + "CREATION D'UN"; 
	string_action="true";	
} else if(bool_action.equals("Edit")){
	strtitle = strtitle + "MODIFICATION D'UN"; 	
} else if(bool_action.equals("View")){
	strtitle = strtitle + "VISUALISATION D'UN"; 	
}

if(type.equals("C")){
	strtitle = strtitle + " COMMENTAIRE";
	defFocus = "commentaire";
} else if(type.equals("E")){
	strtitle = strtitle + "E ENTREE";
	defFocus = "nomPrenom";
} else if(type.equals("S")){
	strtitle = strtitle + "E SORTIE";
	defFocus = "numAdh";
} else if(type.equals("D")){
	strtitle = strtitle + "E SAISIE LIBRE";
	defFocus = "nomPrenom";
	}
 pageContext.setAttribute("title",strtitle);
 
%>

 




 
<H2>
	<div class="texteH">
		<%= pageContext.findAttribute("title").toString() %>
	</div>
	<div class="iconesH"></div>
</H2>

<br>

<layout:form action="mouvement.do" styleClass="CORPS_MSG" width="100%" focus="<%= defFocus%>">
<layout:text key="" property="typeMouvement" size="2" mode="H,H,H" maxlength="2" styleClass="LABEL" isRequired="false"  />
	
	<layout:grid cols = "2" width = "100%" >
		<layout:column  width = "100%" >

  
 

<logic:equal name="MouvementForm" property="typeMouvement" value="C">

<logic:notEqual name="MouvementForm" property="action" value="View">
	<layout:text key="prompt.nomprenom"  property="nomPrenom" mode="H,H,H" size="50" maxlength="50"  isRequired="false"/>
	<layout:text key="prompt.numadh"  property="numAdh"  mode="H,H,H" size="7" maxlength="7"  isRequired="false"/>
	<layout:date key="prompt.date"  property="dateEffet" mode="H,H,H" patternKey="format.date" size="10" maxlength="10" isRequired="false" startYear="2008" endYear="2020" calendarTooltip="Sélectionner la date"  /> 
	<layout:text key="prompt.montantmouvement"  property="montantMvt"  mode="H,H,H" size="9" maxlength="9" isRequired="false"/>
	<layout:text key="prompt.montantda"  property="droitAd" size="5"  mode="H,H,H" maxlength="5" isRequired="false"/>
	<layout:text key="prompt.commentaire"  property="commentaire" size="56" maxlength="80" isRequired="true"/>
</logic:notEqual>
<logic:equal name="MouvementForm" property="action" value="View">
	<layout:text key="prompt.nomprenom"  property="nomPrenom" mode="H,H,H" size="50" maxlength="50" isRequired="false"/>
	<layout:text key="prompt.numadh"  property="numAdh"  mode="H,H,H" size="7" maxlength="7" isRequired="false"/>
	<layout:date key="prompt.date"  property="dateEffet" mode="H,H,H" patternKey="format.date" size="10" maxlength="10" isRequired="false" startYear="2008" endYear="2020" calendarTooltip="Sélectionner la date"  /> 
	<layout:text key="prompt.montantmouvement"  property="montantMvt"  mode="H,H,H" size="9" maxlength="9" isRequired="false"/>
	<layout:text key="prompt.montantda"  property="droitAd" size="5"  mode="H,H,H" maxlength="5" isRequired="false"/>
	<layout:text key="prompt.commentaire"  property="commentaire" size="56" mode="I,I,I" maxlength="80" isRequired="true"/>
</logic:equal>
</logic:equal>

<script>
function MAJtot(){

if (document.getElementById)
 {
mmvt = document.getElementsByName("montantMvt")[0].value;
dad = document.getElementsByName("droitAd")[0].value;
ver11 = parseFloat(mmvt) + parseFloat(dad);
document.getElementsByName("totMvt")[0].value = ver11;
  }
  else if (document.all)
  {
   mmvt = document.all['montantMvt'].value ;
   dad = document.all['droitAd'].value ;
   ver11 = parseFloat(mmvt) + parseFloat(dad);
    document.all['totMvt'].value =  ver11;
  }
  
	
}
</script>


<logic:equal name="MouvementForm" property="typeMouvement" value="E">

<logic:notEqual name="MouvementForm" property="action" value="View">
    <layout:text key="prompt.nomprenom"  property="nomPrenom" size="50" maxlength="50" isRequired="true"/>
	<layout:text key="prompt.numadh"  property="numAdh" mode="H,H,H" size="7" maxlength="7" isRequired="false"/>
	<layout:date key="prompt.date"  property="dateEffet" patternKey="format.date" size="10" maxlength="10" isRequired="false" startYear="2008" endYear="2020" calendarTooltip="Sélectionner la date"  /> 
	<layout:text key="prompt.montantmouvement"  onkeyup="MAJtot();" property="montantMvt" size="10" style="text-align:right;" maxlength="9" type="money" isRequired="true"/>
	<layout:text key="prompt.montantda"  onkeyup="MAJtot();" property="droitAd" size="8" maxlength="5" style="text-align:right;" type="money" isRequired="true"/>
	<layout:text key="prompt.montantTotMvt"  property="totMvt" mode="D,D,D" size="10" maxlength="10"  style="text-align:right;" type="money" isRequired="true"/>
	<layout:text key="prompt.commentaire"  property="commentaire" size="56" maxlength="80"  isRequired="false"/>
</logic:notEqual>
<logic:equal name="MouvementForm" property="action" value="View">
    <layout:text key="prompt.nomprenom"  property="nomPrenom" mode="I,I,I" size="50" maxlength="50" isRequired="true"/>
	<layout:text key="prompt.numadh"  property="numAdh" mode="H,H,H" size="7" maxlength="7" isRequired="false"/>
	<layout:date key="prompt.date"  property="dateEffet" mode="I,I,I" patternKey="format.date" size="10" maxlength="10" isRequired="false" startYear="2008" endYear="2020" calendarTooltip="Sélectionner la date"  /> 
	<layout:text key="prompt.montantmouvement"  onkeyup="MAJtot();" mode="I,I,I" property="montantMvt" style="text-align:right;" size="10" maxlength="9" type="money" isRequired="true"/>
	<layout:text key="prompt.montantda"  onkeyup="MAJtot();" mode="I,I,I" property="droitAd" size="8" style="text-align:right;" maxlength="5" type="money" isRequired="true"/>
	<layout:text key="prompt.montantTotMvt"  property="totMvt" mode="I,I,I" size="10" maxlength="10" style="text-align:right;" type="money" isRequired="true"/>
	<layout:text key="prompt.commentaire"  property="commentaire" mode="I,I,I" size="56" maxlength="80" isRequired="false"/>
</logic:equal>
</logic:equal>





<logic:equal name="MouvementForm" property="typeMouvement" value="S">

<logic:notEqual name="MouvementForm" property="action" value="View">
	<layout:text key="prompt.nomprenom"  property="nomPrenom" mode="H,H,H" size="50" maxlength="50" isRequired="false"/>
	<layout:text key="prompt.numadh"  property="numAdh" mode="N,N,N" size="7" maxlength="7" isRequired="false"/>
	<layout:select key="prompt.nomprenom" property="numAdh" mode="E,E,E">
		<layout:options collection="lstNames" property="PNUMADH" 
				 labelProperty="PNOMADH" />
	</layout:select>
	<layout:date key="prompt.date" property="dateEffet" patternKey="format.date" size="10"  maxlength="10" isRequired="false" startYear="2008" endYear="2020" calendarTooltip="Sélectionner la date"  /> 
	<layout:text key="prompt.montantmouvement"  onkeyup="MAJtot();" property="montantMvt" style="text-align:right;" size="10" maxlength="9"  type="money" isRequired="true"/>
	<layout:text key="prompt.montantda"  onkeyup="MAJtot();" property="droitAd" mode="H,H,H" size="8" style="text-align:right;" maxlength="5"  type="money" isRequired="true"/>
	<layout:text key="prompt.montantTotMvt"  property="totMvt" mode="H,H,H" size="10" style="text-align:right;" maxlength="10"  type="money" isRequired="true"/>
	<layout:text key="prompt.commentaire.motif.sortie"  property="commentaire" size="56" maxlength="80"  isRequired="false"/>
</logic:notEqual>
<logic:equal name="MouvementForm" property="action" value="View">
	<layout:text key="prompt.nomprenom"  property="nomPrenom"  mode="I,I,I" size="50" maxlength="50" isRequired="false"/>
	<layout:text key="prompt.numadh"  property="numAdh" mode="N,N,N" size="7" maxlength="7" isRequired="false"/>
	
	<layout:date key="prompt.date" property="dateEffet" mode="I,I,I" patternKey="format.date" size="10"  maxlength="10" isRequired="false" startYear="2008" endYear="2020" calendarTooltip="Sélectionner la date"  /> 
	<layout:text key="prompt.montantmouvement"  onkeyup="MAJtot();" mode="I,I,I" style="text-align:right;" property="montantMvt" size="10" maxlength="9"  type="money" isRequired="true"/>
	<layout:text key="prompt.montantda"  onkeyup="MAJtot();" mode="H,H,H" style="text-align:right;" property="droitAd" size="8" maxlength="5"  type="money" isRequired="true"/>
	<layout:text key="prompt.montantTotMvt"  property="totMvt" mode="H,H,H" style="text-align:right;" size="10" maxlength="10" type="money" isRequired="true"/>
	<layout:text key="prompt.commentaire.motif.sortie"  property="commentaire" mode="I,I,I" size="56" maxlength="80" isRequired="false"/>
</logic:equal>
</logic:equal>


<logic:equal name="MouvementForm" property="typeMouvement" value="D">

<logic:notEqual name="MouvementForm" property="action" value="View">
    <layout:text key="prompt.nomprenom"  property="nomPrenom" size="50" maxlength="50" isRequired="true"/>
	<layout:text key="prompt.numadh"  property="numAdh" mode="H,H,H" size="7" maxlength="7" isRequired="false"/>
	<layout:date key="prompt.date"  property="dateEffet" patternKey="format.date" size="10" maxlength="10" isRequired="false" startYear="2008" endYear="2020" calendarTooltip="Sélectionner la date"  /> 
	<layout:text key="prompt.montantmouvement"  onkeyup="MAJtot();" property="montantMvt" size="10" style="text-align:right;" maxlength="9" type="money" isRequired="true"/>
	<layout:text key="prompt.montantda"  onkeyup="MAJtot();" property="droitAd" mode="H,H,H" size="8" style="text-align:right;" maxlength="5"  type="money" isRequired="true"/>
	<layout:text key="prompt.montantTotMvt"  property="totMvt" mode="D,D,D" size="10" maxlength="10"  style="text-align:right;" type="money" isRequired="true"/>
	<layout:text key="prompt.commentaire"  property="commentaire" size="56" maxlength="80"  isRequired="false"/>
</logic:notEqual>

<logic:equal name="MouvementForm" property="action" value="View">
    <layout:text key="prompt.nomprenom"  property="nomPrenom" mode="I,I,I" size="50" maxlength="50" isRequired="true"/>
	<layout:text key="prompt.numadh"  property="numAdh" mode="H,H,H" size="7" maxlength="7" isRequired="false"/>
	<layout:date key="prompt.date"  property="dateEffet" mode="I,I,I" patternKey="format.date" size="10" maxlength="10" isRequired="false" startYear="2008" endYear="2020" calendarTooltip="Sélectionner la date"  /> 
	<layout:text key="prompt.montantmouvement"  onkeyup="MAJtot();" mode="I,I,I" property="montantMvt" style="text-align:right;" size="10" maxlength="9" type="money" isRequired="true"/>
	<layout:text key="prompt.montantda"  onkeyup="MAJtot();" property="droitAd" mode="H,H,H" size="8" style="text-align:right;" maxlength="5"  type="money" isRequired="true"/>
	<layout:text key="prompt.montantTotMvt"  property="totMvt" mode="I,I,I" size="10" maxlength="10" style="text-align:right;" type="money" isRequired="true"/>
	<layout:text key="prompt.commentaire"  property="commentaire" mode="I,I,I" size="56" maxlength="80" isRequired="false"/>
</logic:equal>

</logic:equal>




<tr height="50"></tr>






<layout:text key="" property="action" size="10" maxlength="20" isRequired="false" mode="H,H,H" />
<layout:text key="" property="numPiece" size="20" maxlength="20" isRequired="false" mode="H,H,H" />
<layout:text key="" property="numMvt" size="20" maxlength="20" isRequired="false" mode="H,H,H" />
<layout:text key="" property="idSuivi" size="20" maxlength="20" isRequired="false" mode="H,H,H" />

</layout:column>

</layout:grid>



<layout:formActions align="center"> 
<layout:button styleClass="btn" value="Fermer" onclick="window.close();" />
<logic:notEqual name="MouvementForm" property="action" value="View">
<layout:reset styleClass="btn" value="Rétablir" /> 
<layout:submit styleClass="btn" property="submit" value="Valider" onclick="javascript:tdate();"/> 
</logic:notEqual>
</layout:formActions> 

</layout:form>

<logic:notEqual name="MouvementForm" property="typeMouvement" value="C">
<logic:equal name="MouvementForm" property="action" value="Create">

	<script type="text/javascript">
	
	if (document.getElementById) {
		document.getElementsByName("dateEffet")[0].value = ""; 
	} else if (document.all) {
		document.all['dateEffet'].value = "";
	}
	  
	</script>

</logic:equal>
</logic:notEqual>

</body>

 


</html>


