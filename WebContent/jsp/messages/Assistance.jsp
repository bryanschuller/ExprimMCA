<%@ include file="/declaration/taglibs.jsp"%>

<H1>
	<div class="texteH">Problèmes techniques : questions-réponses</div>
	<div class="iconesH">
		<a href="<%= (String)request.getContextPath()  %>/retourArriere.do<%= (null != (String)request.getAttribute("pileRequestReqParam")?(String)request.getAttribute("pileRequestReqParam"):"") %>"><i class="fa fa-arrow-left" data-toggle="tooltip" data-placement="bottom" data-original-title="Retour"></i></a>		
	</div>
</H1>
<br/><br/>

<%--
<ul>
	<li><a href="#IE8_COMPAT">J'utilise Internet Explorer 8 et certaines fonctionnalités ne répondent pas</a></li>
	<li><a href="#javascript">Après avoir saisi mon identifiant et mon mot de passe, certaines fonctionnalités ne répondent pas</a></li>
	<li><a href="#cookies">Lorsque je clique sur un lien, je suis automatiquement redirigé sur la page de saisie de mon identifiant/mot de passe</a></li>
</ul>
<br/>
<br/>
--%>

<!-- Compatibilitée IE8 -->
<div>
	<H2>
		<div class="texteH">
			<a name="IE8_COMPAT"></a>
			J'utilise Internet Explorer 8 et certaines fonctionnalités ne répondent pas
		</div>
	</H2><br>
	<div class="callout callout-info">
		Il est nécessaire d'activer &laquo;l'affichage de compatibilité&raquo;<br/>
		<%-- <img src="<%= (String)request.getContextPath()  %>/images/Assistance/IE8_Compatib.png"/>	--%>
		<br/>
		Vous pouvez trouver plus d'informations sur <a href="http://support.microsoft.com/gp/pc_ie_methodb2100/fr">http://support.microsoft.com/gp/pc_ie_methodb2100/fr</a><br/>
	</div>
</div>
<br/>
 
 
<!-- Activation javascript --> 
<div>
	<H2>
		<div class="texteH">
			<a name="javascript"></a>
			Après avoir saisi mon identifiant et mon mot de passe, certaines fonctionnalités ne répondent pas
		</div>
	</H2><br>
    <div class="callout callout-info">
		<%-- <a href="<%= (String)request.getContextPath()  %>/images/Assistance/menupresent.png"><img src="<%= (String)request.getContextPath()  %>/images/Assistance/menupresent.png" width="281" height="130"/></a><br/>	--%>
		Il est possible que Javascript ne soit pas activé sur votre navigateur.<br/>
		<br/>
		Vous trouverez la procèdure à suivre pour l'activer sur la page <a href="http://www.maboite.qc.ca/activation_js.html">http://www.maboite.qc.ca/activation_js.html</a>.<br/>
		<br/>
	</div>
</div>
<br/>
 

<!-- Accepter Cookies -->
<div>
	<H2> 
		<div class="texteH">
			<a name="cookies"></a>
			Lorsque je clique sur un lien, je suis automatiquement redirigé sur la page de saisie de mon identifiant/mot de passe.
		</div>
	</H2><br>
	<div class="callout callout-info">
		Le problème de connexion à votre Espace peut être dû à votre navigateur qui n'accepterait pas les cookies.<br/>
		Vous trouverez sur cette page les instructions pour les activer : <a href="http://www.sdl.com/fr/Legal/cookie-instructions.asp">http://www.sdl.com/fr/Legal/cookie-instructions.asp</a><br/>
		<br/>
		Par exemple, pour Internet Explorer 6 :<br/>
		Dans le menu d'Internet Explorer, en haut, choisir «Outils», puis «Options Internet» :<br/>
		<%-- <a href="<%= (String)request.getContextPath()  %>/images/Assistance/AccepterJavascript/Outils.jpg"><img src="<%= (String)request.getContextPath()  %>/images/Assistance/AccepterJavascript/Outils.jpg" width="527px" height="279px"></a><br/>	--%>
		<br/>
		Une fenêtre avec onglets s'affiche, choisir l'onglet «Confidentialité» :<br/>
		<img src="<%= (String)request.getContextPath()  %>/images/Assistance/AccepterJavascript/Onglets.jpg"><br/>
		<br/>
		Puis cliquer sur le bouton &laquo;Par d&eacute;faut&raquo; :<br/>
		<img src="<%= (String)request.getContextPath()  %>/images/Assistance/AccepterJavascript/BoutonDefaut.jpg"><br/>
		<br/>
		Et pour que ces modifications soient prises en compte. Cliquer sur le bouton en bas &laquo;Appliquer&raquo;, puis &laquo;OK&raquo; :<br/>
		<img src="<%= (String)request.getContextPath()  %>/images/Assistance/AccepterJavascript/Valider.jpg"><br/>
		<br/>
		Il ne reste plus qu'à fermer puis rouvrir votre navigateur pour que la mise à jour soit prise en compte.<br/>
	</div>
</div>
<br/>
 

