<%@ page errorPage="/jsp/erreur/erreur.jsp" %>

<%@ page import="java.io.File"%>

<%@ include file="/declaration/taglibs.jsp"%>



<%
String grantFilePath = (String) request.getSession().getServletContext().getRealPath("/") + "TEMP/granted.ini";
System.out.println(grantFilePath);
	boolean grantFile = (new File(grantFilePath)).exists();
if (!grantFile) {
	%>
    <jsp:forward page="/jsp/messages/pageMaintenance.jsp"/>
<%
} %>



<%-- Layout component 
  parameters : title, header, menu, body, footer 
--%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<layout:html layout ="false">

<!--[if lte IE 7]><link rel="stylesheet" href="<%= (String)request.getContextPath()  %>/config/MCAExprim_IE.css" type="text/css"><![endif]-->
<!--[if IE 8]><link rel="stylesheet" href="<%= (String)request.getContextPath()  %>/config/MCAExprim_IE_8.css" type="text/css"><![endif]-->


<div id="container">

	<div id="header">
		<tiles:insert attribute="header" />
	</div>
  
	<div class="content">
		<div > <!-- pour compatibilité avec footer_incl_commun  -->
		    	
		    <H2>
			    <div class="texteH">Connexion à l'espace sécurisé</div>
				<div class="iconesH">
					<a href="https://www.mc-alsace.fr">Retour au site institutionnel de la MCA</a>
				</div>
			</H2>
      		<noscript>
				<span class="NO_JS">
    				<layout:message key="general.info.noscript" /> &nbsp;&nbsp;
    			</span>
    				<a href="<%= (String)request.getContextPath() %>/Commun/Assistance.jsp"><layout:message key="general.info.resoudre" /></a> 
  			</noscript>
  				
			
			<div class="LOGIN_BACKG" align="center">  
			
			
			<table width="100%" height="50%" border="0" cellspacing="0" cellpadding="0" class="LOGIN_BACKG" align="center" >

  <tr> 
    <td align="center" valign="top" >
           <div id="wait" class="wait_mask" ></div>
     <p align="center"><font color="#000099" size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong>Veuillez 
          saisir votre identifiant <br>
          et <br>
          votre code d'acc&egrave;s ou votre mot de passe personnalis&eacute; 
          :</strong></font></p> 
          
           
<tiles:insert attribute="body" />

		

		<logic:notPresent name="LoginGestionnaireForm">
		<%
			String typeAcces = (String) request.getAttribute("typeAcces");
			if(null == typeAcces) {typeAcces = "";}
		%>
			<p><font size="1">Si vous avez oublié votre mot de passe, <a href="<%= (String)request.getContextPath() %>/forgetPswd.do?typeAcces=<%= typeAcces %>">cliquez ici.</a></font></p>
			
		</logic:notPresent> 
    </td>
  </tr>
  
<logic:notPresent name="LoginGestionnaireForm">  
  
<tr>

<td align="center">

<table  width="80%" class="FORMULAIRE" style="text-align:center; margin-top:20px;">
  <tr class="pay_vis" > 
    <td colspan="2"> 
      <blockquote>

		<p align="center"><font color="#000099" size="2" face="Verdana, Arial, Helvetica, sans-serif">Vous 
          avez la possibilit&eacute; de personnaliser votre mot de passe si vous 
          le souhaitez...</font><br> <font color="#000099" face="Verdana, Arial, Helvetica, sans-serif" >(Option 'Mot de passe personnalis&eacute;' du menu).</font> </p>
       
        <p align="center"><font color="#000099"  size="2" face="Verdana, Arial, Helvetica, sans-serif">Le 
          <strong>code d'acc&egrave;s</strong> qui vous est fourni lors de votre 
          inscription<strong> reste toujours valable</strong> :<strong><br>
          </strong><br>
          Il figure sur la partie haute du porte-adresse de votre nouvelle carte 
          d'adh&eacute;rent ou en bas de page des d&eacute;comptes envoy&eacute;s.</font></p>
       
      </blockquote>
    </td>
  </tr>
</table>
</td>
</tr>

</logic:notPresent>

</table>
			
		
			
			
			
			
			
				
			</div>
		 
		</div> <!-- Fin "PANNEAUPRINCIPAL" du header -->
	
		<div id="footerMCA">
		    <tiles:insert attribute="footer" />
		</div>
	  
	</div> <!-- Fin "content" du header -->
</div> <!-- Fin "container" du header -->

<div  id="wait" class="wait_mask" ></div>
<div  id="wait_fond" class="wait_mask_fond"></div> 
		
</layout:html>
