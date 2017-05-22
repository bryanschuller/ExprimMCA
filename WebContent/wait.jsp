
<%@ include file="/declaration/taglibs.jsp"%>



<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>MCA</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">


<link rel="stylesheet" href="<%= (String)request.getContextPath()  %>/config/MCAExprim.css" type="text/css">


</head>

<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0"  onblur="window.focus()">

 
<script language = "javascript">

function doAction () {
document.location.href = "wait.do";
}


</script>
  
<table  align="center" width="100%"  border="0" cellpadding="1" cellspacing="1" valign ="center" >

<logic:equal name="INFOCMD"  property="flag" value= "false" >

<table  align="center" width="100%" class="ENTETE">
  <tr>
   
    <td  width="12" align="left" ><html:img page="/pictures/info.gif" alt="retour à la liste" border="0"/> </td>
    <td width="1%" align="center" > </td>
    <td width="85%" height="18" align="left"> <layout:message key="title.msg.ent"/> </td>
   <td width="5%" align="center" ></td>
  </tr>
</table>
<table  align="center" width="100%"  border="0" cellpadding="1" cellspacing="1" >
    <tr valign="middle">
   
    <td  width="100%" height="100" align="center" >
    
    <p>&nbsp;</p>
	<strong>
	
	Veuillez patienter SVP.....
	</strong> 
	<p>&nbsp;</p>

    </td>
  </tr>
  <tr><td align="center" ><html:img page="/pictures/wait.gif" border="0"/></td></tr>
</table>


<script language = "javascript">
window.focus();
setTimeout("doAction();",1000);
</script>

</logic:equal>


<logic:equal name="INFOCMD"  property="flag" value= "true" >

<logic:equal name="INFOCMD"  property="action" value= "redirect" >
<script language = "javascript">

window.open("<%=(String)request.getContextPath()%>/PdfServlet");

opener=self;self.close();

</script>
</logic:equal>

<logic:equal name="INFOCMD"  property="action" value= "message" >

<table  align="center"  width="100%" class="ENTETE">
  <tr>
   
    <td  width="12" align="left" ><html:img page="/pictures/info.gif" alt="retour à la liste" border="0"/> </td>
    <td width="1%" align="center" > </td>
    <td width="85%" height="18" align="left"> <layout:message key="title.msg.ent"/> </td>
   <td width="5%" align="center" ></td>
  </tr>
</table>

<table  align="center" width="100%"  border="0" cellpadding="1" cellspacing="1" >
    <tr valign="middle">
   
    <td  width="100%" height="100" align="center" >
    
    <p>&nbsp;</p>
	<strong>
    <layout:write name="INFOCMD" property="message" />
	</strong> 
	<p>&nbsp;</p>
    
    </td>
  </tr>
  
</table>


<script language = "javascript">

setTimeout("opener=self;self.close();",3000);

</script>
</logic:equal>


<logic:equal name="INFOCMD"  property="action" value= "error" >

<table  align="center"  width="100%" class="ENTETE">
  <tr>
   
    <td  width="12" align="left" ><html:img page="/pictures/info.gif" alt="retour à la liste" border="0"/> </td>
    <td width="1%" align="center" > </td>
    <td width="85%" height="18" align="left"> <layout:message key="title.msg.ent"/> </td>
   <td width="5%" align="center" ></td>
  </tr>
</table>

<table  align="center" width="100%"  border="0" cellpadding="1" cellspacing="1" >
    <tr valign="middle">
   
    <td  width="100%" height="100" align="center" >
    
    <p>&nbsp;</p>
	<strong>
    <html:errors/>
	</strong> 
	<p>&nbsp;</p>
    
    </td>
  </tr>
  
</table>


<script language = "javascript">

setTimeout("opener=self;self.close();",3000);

</script>
</logic:equal>



</logic:equal>

</table>

</body>
</HTML>



