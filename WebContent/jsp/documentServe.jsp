<html>
<head>
<title>MCA</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>
<body>
Veuillez patienter pendant le chargement...

	<script language="javascript"> 
	<%-- le 27/12/07 par FG: 
				sur FF, la page s'affiche -> Firefox bloque l'ouverture d'une nouvelle popup par s�curit� et notifie l'utilisateur -> le self.close ferme la fen�tre
		window.open(" <%=(String)request.getContextPath()%>/PdfServlet"); 
		opener=self;self.close();
	--%>
		document.location.href = "<%=(String)request.getContextPath()%>/PdfServlet";	
	</script>
	
</body>
