 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>MCA</title>

</head>

<body onLoad="javascript:  openWindowWithVariableSize('<%=(String)request.getAttribute("target")%>',800,600); ">

</body>
</html> 

 

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

function commentaire()
{
    window.open("teleCommentaire.jsp", "bigwindow", "toolbar=no,location=no,directories=no,status=no,menubar=yes,scrollbars=no,resizeable=yes,width=400,height=500,left=0,top=0");
}


function openWindowWithVariableSize(url, w, h)
{
    window.open(url, "" ," scrollbars=yes,resizeable=yes ,width="+w+" , height="+h);
}

</script>
