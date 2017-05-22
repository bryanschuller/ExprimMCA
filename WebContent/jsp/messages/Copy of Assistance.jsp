<%@ include file="/declaration/taglibs.jsp"%>

<H1>
	<div class="texteH">Problèmes techniques : questions-réponses</div>
	<div class="iconesH">
		<a href="<%= (String)request.getContextPath()  %>/retourArriere.do<%= (null != (String)request.getAttribute("pileRequestReqParam")?(String)request.getAttribute("pileRequestReqParam"):"") %>"><html:img page="/images/RETURN.gif" alt="Retour" border="0"/></a>
		
	</div>
</H1>



 <br/><br/>
 <ul>
  <li><a href="#IE8_COMPAT">J'utilise Internet Explorer 8, le menu en haut de mon espace securisé ne réponds plus</a></li>
  <li><a href="#javascript">Après avoir saisi mon identifiant et mon mot de passe, je n'ai aucun menu en haut</a></li>
  <li><a href="#cookies">Je n'arrive pas à avoir accès aux menus "Mon dossier" ou "Services en ligne". Je suis automatiquement redirigé sur la page de saisie de mon identifiant/mot de passe</a></li>
 </ul>
 <br/>
 <br/>
 
  

 
  
  
 <!-- Compatibilitée IE8 -->


<div>
 <div id="EXC_MESSAGE_INFO_ASSISTANCE">

J'utilise Internet Explorer 8, le menu en haut de mon espace securisé ne réponds plus

</div>


<div id="EXC_MESSAGE_INFO">

 Il est nécessaire d'activer &laquo;l'affichage de compatibilité&raquo;<br/>
 <img src="../images/Assistance/IE8_Compatib.png"/>
 <br/>
 Vous pouvez trouver plus d'informations sur <a href="http://support.microsoft.com/gp/pc_ie_methodb2100/fr">http://support.microsoft.com/gp/pc_ie_methodb2100/fr</a><br/>
 
 
</div>
</div>
 <br/>
 
 
 
 
 

 
<div>
<div id="EXC_MESSAGE_INFO_ASSISTANCE">
 
Après avoir saisi mon identifiant et mon mot de passe, je n'ai aucun menu en haut.

</div>
    

<div id="EXC_MESSAGE_INFO">
 


 <!-- Activation javascript -->
 
 Normalement, un menu doit être présent en haut pour accéder aux différentes pages de votre espace.<br/>
<br/>
 <a href="../images/Assistance/menupresent.png"><img src="../images/Assistance/menupresent.png" width="281" height="130"/></a><br/>
 S'il n'apparait pas, il est possible que Javascript ne soit pas activé sur votre navigateur.<br/>
 <br/>
 Vous trouverez la procèdure à suivre pour l'activer sur la page <a href="http://www.maboite.qc.ca/activation_js.html">http://www.maboite.qc.ca/activation_js.html</a>.<br/>
 <br/>
 
 

</div>
</div>
 <br/>
 
 


<div>
<div id="EXC_MESSAGE_INFO_ASSISTANCE"> 
 <a name="cookies"></a>
Je n'arrive pas à avoir accès aux menus "Mon dossier" ou "Services en ligne". Je suis automatiquement redirigé sur la page de saisie de mon identifiant/mots de passe.
    
</div>

 
 <!-- Accepter Cookies -->
 
 <div id="EXC_MESSAGE_INFO">
 
 Le problème de connexion à votre Espace peut être dû à votre navigateur qui n'accepterait pas les cookies.<br/>
 Vous trouverez sur cette page les instructions pour les activer : <a href="http://www.sdl.com/fr/Legal/cookie-instructions.asp">http://www.sdl.com/fr/Legal/cookie-instructions.asp</a><br/>
 <br/>
 Par exemple, pour Internet Explorer 6 :<br/>
 &nbsp; Dans le menu d'Internet Explorer, en haut, choisir «Outils», puis «Options Internet» :<br/>
 &nbsp;    <a href="../images/Assistance/AccepterJavascript/Outils.jpg"><img src="../images/Assistance/AccepterJavascript/Outils.jpg" width="527px" height="279px"></a><br/>
 <br/>
 &nbsp; Une fenêtre avec onglets s'affiche, choisir l'onglet «Confidentialité» :<br/>
 &nbsp;    <img src="../images/Assistance/AccepterJavascript/Onglets.jpg"><br/>
 <br/>
 &nbsp;	Puis cliquer sur le bouton &laquo;Par d&eacute;faut&raquo; :<br/>
 &nbsp;    <img src="../images/Assistance/AccepterJavascript/BoutonDefaut.jpg"><br/>
 <br/>
 &nbsp;	Et pour que ces modifications soient prises en compte. Cliquer sur le bouton en bas &laquo;Appliquer&raquo;, puis &laquo;OK&raquo; :<br/>
 &nbsp;    <img src="../images/Assistance/AccepterJavascript/Valider.jpg"><br/>
 <br/>
 &nbsp; Il ne reste plus qu'à fermer puis rouvrir votre navigateur pour que la mise à jour soit prise en compte.<br/>
 
</div>
</div>
 <br/>
 

