
<%@ include file="/declaration/taglibs.jsp"%>
<%@ page import="com.exprimweb.util.ControlPrealable" %>
<%


%>

<table width="100%" height="50%" border="0" cellspacing="0" cellpadding="0" class="LOGIN_BACKG" align="center">
   
  <tr> 
    <td align="center" valign="top" >
     <p align="center"><font color="#000099" size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong>Veuillez 
          saisir votre identifiant <br>
          et <br>
          votre code d'acc&egrave;s ou votre mot de passe personnalis&eacute; 
          :</strong></font></p> 
          
           
     <layout:form action="authinterne.do" focus="idinternaute" styleClass="FORM_BEN"  onsubmit="setTimeout('redirErr()',90000);" >  
		<layout:row>
 			<layout:field key="app.idinternaute" property="idinternaute" size="16" maxlength="7" isRequired="true" type="text"/> 
		</layout:row>
		<layout:row>
				<layout:field key="app.motpasse" property="motpasse" size="16" maxlength="10" isRequired="true" type="password" />
				<html:hidden property="typeAcces" value=""/> 
		</layout:row>   
	
		<layout:formActions>
			<layout:row>
				<layout:reset styleClass="BOUT1" value="Rétablir"/> 
				<layout:submit styleClass="BOUT1" property="submit" value="Valider"/>  
			</layout:row>
		</layout:formActions> 
	</layout:form>
          <p><font size="1">Si vous avez oublié votre mot de passe, <a href="ForgetPasswordAdhPage.jsp">cliquez ici.</a></font></p> 
    </td>
  </tr>
  
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

</table>

