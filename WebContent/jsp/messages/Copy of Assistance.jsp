<%@ include file="/declaration/taglibs.jsp"%>

<H1>
	<div class="texteH">Probl�mes techniques : questions-r�ponses</div>
	<div class="iconesH">
		<a href="<%= (String)request.getContextPath()  %>/retourArriere.do<%= (null != (String)request.getAttribute("pileRequestReqParam")?(String)request.getAttribute("pileRequestReqParam"):"") %>"><html:img page="/images/RETURN.gif" alt="Retour" border="0"/></a>
		
	</div>
</H1>



 <br/><br/>
 <ul>
  <li><a href="#IE8_COMPAT">J'utilise Internet Explorer 8, le menu en haut de mon espace securis� ne r�ponds plus</a></li>
  <li><a href="#javascript">Apr�s avoir saisi mon identifiant et mon mot de passe, je n'ai aucun menu en haut</a></li>
  <li><a href="#cookies">Je n'arrive pas � avoir acc�s aux menus "Mon dossier" ou "Services en ligne". Je suis automatiquement redirig� sur la page de saisie de mon identifiant/mot de passe</a></li>
 </ul>
 <br/>
 <br/>
 
  

 
  
  
 <!-- Compatibilit�e IE8 -->


<div>
 <div id="EXC_MESSAGE_INFO_ASSISTANCE">

J'utilise Internet Explorer 8, le menu en haut de mon espace securis� ne r�ponds plus

</div>


<div id="EXC_MESSAGE_INFO">

 Il est n�cessaire d'activer &laquo;l'affichage de compatibilit�&raquo;<br/>
 <img src="../images/Assistance/IE8_Compatib.png"/>
 <br/>
 Vous pouvez trouver plus d'informations sur <a href="http://support.microsoft.com/gp/pc_ie_methodb2100/fr">http://support.microsoft.com/gp/pc_ie_methodb2100/fr</a><br/>
 
 
</div>
</div>
 <br/>
 
 
 
 
 

 
<div>
<div id="EXC_MESSAGE_INFO_ASSISTANCE">
 
Apr�s avoir saisi mon identifiant et mon mot de passe, je n'ai aucun menu en haut.

</div>
    

<div id="EXC_MESSAGE_INFO">
 


 <!-- Activation javascript -->
 
 Normalement, un menu doit �tre pr�sent en haut pour acc�der aux diff�rentes pages de votre espace.<br/>
<br/>
 <a href="../images/Assistance/menupresent.png"><img src="../images/Assistance/menupresent.png" width="281" height="130"/></a><br/>
 S'il n'apparait pas, il est possible que Javascript ne soit pas activ� sur votre navigateur.<br/>
 <br/>
 Vous trouverez la proc�dure � suivre pour l'activer sur la page <a href="http://www.maboite.qc.ca/activation_js.html">http://www.maboite.qc.ca/activation_js.html</a>.<br/>
 <br/>
 
 

</div>
</div>
 <br/>
 
 


<div>
<div id="EXC_MESSAGE_INFO_ASSISTANCE"> 
 <a name="cookies"></a>
Je n'arrive pas � avoir acc�s aux menus "Mon dossier" ou "Services en ligne". Je suis automatiquement redirig� sur la page de saisie de mon identifiant/mots de passe.
    
</div>

 
 <!-- Accepter Cookies -->
 
 <div id="EXC_MESSAGE_INFO">
 
 Le probl�me de connexion � votre Espace peut �tre d� � votre navigateur qui n'accepterait pas les cookies.<br/>
 Vous trouverez sur cette page les instructions pour les activer : <a href="http://www.sdl.com/fr/Legal/cookie-instructions.asp">http://www.sdl.com/fr/Legal/cookie-instructions.asp</a><br/>
 <br/>
 Par exemple, pour Internet Explorer 6 :<br/>
 &nbsp; Dans le menu d'Internet Explorer, en haut, choisir �Outils�, puis �Options Internet� :<br/>
 &nbsp;    <a href="../images/Assistance/AccepterJavascript/Outils.jpg"><img src="../images/Assistance/AccepterJavascript/Outils.jpg" width="527px" height="279px"></a><br/>
 <br/>
 &nbsp; Une fen�tre avec onglets s'affiche, choisir l'onglet �Confidentialit� :<br/>
 &nbsp;    <img src="../images/Assistance/AccepterJavascript/Onglets.jpg"><br/>
 <br/>
 &nbsp;	Puis cliquer sur le bouton &laquo;Par d&eacute;faut&raquo; :<br/>
 &nbsp;    <img src="../images/Assistance/AccepterJavascript/BoutonDefaut.jpg"><br/>
 <br/>
 &nbsp;	Et pour que ces modifications soient prises en compte. Cliquer sur le bouton en bas &laquo;Appliquer&raquo;, puis &laquo;OK&raquo; :<br/>
 &nbsp;    <img src="../images/Assistance/AccepterJavascript/Valider.jpg"><br/>
 <br/>
 &nbsp; Il ne reste plus qu'� fermer puis rouvrir votre navigateur pour que la mise � jour soit prise en compte.<br/>
 
</div>
</div>
 <br/>
 

