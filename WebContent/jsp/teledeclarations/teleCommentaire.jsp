<%@ include file="/declaration/taglibs.jsp"%>
 

<html>
<head>
<title>MCA</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">

<link href="config/MCAExprim.css" rel="stylesheet" type="text/css"/>

<script type="text/javascript">
function supcomm() 
{
	valide = confirm('Supprimer ce commentaire ?');
	
if(valide){
	
if (document.getElementById)
 {

 document.getElementsByName("action")[0].value = "delete";
  }
  else if (document.all)
  {
   document.all['action'].value="delete";
  }
			
		return true;
	}else{
		return false;
	}
} 
</script>
</head>
 

 
 <body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" >
 
<H2>
	<div class="texteH">
		<layout:message key="appcot.titre.telecommentaire.declaration"/>
	</div>
</H2>

<br>


<layout:form action="setTeleCommentaire.do" focus="commentaire" styleClass="CORPS_MSG" width="100%" >
<layout:text key="" property="action" size="10" maxlength="20"  isRequired="false" mode="H,H,H"/>
<layout:text key="" property="idSuivi" size="10" maxlength="20"  isRequired="false" mode="H,H,H"/>
<layout:textarea key="" rows="4" property="commentaire" size="56" maxlength="1024" isRequired="false" mode="E,E,E" /> 


<tr height="25"></tr>

<layout:formActions align="center"> 
<layout:row>
<layout:submit styleClass="btn" value="Supprimer" onclick="return supcomm();" />
<layout:button styleClass="btn" value="Fermer" onclick="window.close();" />
<layout:reset styleClass="btn btn-danger" value="Rétablir" /> 
<layout:submit styleClass="btn btn-success" property="submit" value="Valider" /> 

<tr height="25"></tr>

</layout:row>

</layout:formActions> 

</layout:form>



</body>




</html>

