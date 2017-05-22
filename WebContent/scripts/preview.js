function preview( intOLEcmd, intOLEparam ) { 
 var WebBrowser = '<OBJECT ID="WebBrowser1" WIDTH=0 HEIGHT=0 CLASSID="CLSID:8856F961-340A-11D0-A96B-00C04FD705A2"></OBJECT>'; 
 document.body.insertAdjacentHTML('beforeEnd', WebBrowser); 
 if (!intOLEparam || intOLEparam < -1 || intOLEparam > 1 ) { 
 intOLEparam = 1; 
 } 
 WebBrowser1.ExecWB( intOLEcmd, intOLEparam ); 
 WebBrowser1.outerHTML = ""; 
}; 



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
    window.open("teleCommentaire.jsp", "bigwindow", "toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=no,resizeable=yes,width=400,height=500,left=0,top=0");
}






function openWindowWithVariableSize(url, w, h)
{
    window.open(url, "", "width="+w+" height="+h);
}


// Open window 
function HC_openWin(newURL, newName, newFeatures, orgName) { 
    var newWin = open(newURL, newName, newFeatures); 
    if (newWin.opener == null) newWin.opener = window; 
    newWin.opener.name = orgName; 
    return newWin 
} 
// Open centered remote 
function HC_doOpenRemote(aURL, newName, aHEIGHT, aWIDTH, aFeatures, orgName){ 
    if (aHEIGHT == "*"){ aHEIGHT = (screen.availHeight - 80) }; 
    if (aWIDTH == "*"){ aWIDTH = (screen.availWidth - 30) }; 
    var newFeatures = "height=" + aHEIGHT + ",innerHeight=" + aHEIGHT; 
    newFeatures += ",width=" + aWIDTH + ",innerWidth=" + aWIDTH; 
    if (window.screen){ var ah = (screen.availHeight - 30); 
    var aw = (screen.availWidth - 10); 
    var xc = (( aw - aWIDTH ) / 2); 
    var yc = (( ah - aHEIGHT ) / 2); 
    newFeatures += ",left=" + xc + ",screenX=" + xc; 
    newFeatures += ",top=" + yc + ",screenY=" + yc;
    newFeatures += "," + aFeatures }; 
    var newWin = HC_openWin(aURL, newName, newFeatures, orgName); newWin.focus();
    return newWin 
}

 
function documentServe(name){
	window.open("/MCA/documentServe.do?name=" + name , "Document" , "menubar=no, status=no, scrollbars=no"); 
}

