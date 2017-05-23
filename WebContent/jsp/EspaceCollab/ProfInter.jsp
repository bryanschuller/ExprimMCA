<%@ include file="/header_footer/header_Collab_1.jsp"%>
<layout:html layout="false">
<%@ include file="/header_footer/header_Collab_2.jsp"%>

<td class="LOGIN_BACKG">
  
<p></p>
<table align="center" width="100%"><tr><td>

<table  width="98%" class="ENTETE" align="center">
  <tr>
    <td width="1%" align="center" > </td>
    <td width="85%" height="18" align="left"> <layout:message key="adherent.dossier.modif"/> </td>
    <td width="5%" align="center" ><a href="javascript:window.print()"><i class="fa fa-print" data-toggle="tooltip" data-placement="bottom" data-original-title="Imprimer"></i></td>
	 
  </tr>
</table>
<layout:panel   styleClass="CORPS_DONNE" key="" width="98%" align="center">
 
<tr><td style="font-size:11px;color:#ff0000">
	<html:errors/>
</td></tr>

<tr><td>
 <table class="CORPS_ADRESSE" width="100%" height="100%" >
 <tr><td style="font-size:12px;color:#000000">
<p>Veuillez renseigner les zones que vous souhaitez modifier ou compléter. <br>
Votre demande sera prise en compte après verification par nos services...</p>
</td></tr>
 
 
<layout:form action="envoiProfInterCollab.do" focus="nom" width="100%" styleClass="LOGIN_FORM" > 

<tr><td colspan="2">

<table class="CORPS_ADRESSE" align="center" >
<tr><th width="150px">
	<bean:message key="info.interloc.nom"/>
</th><td width="200px">
	<layout:write name="InfoInterloc" property="nom"  layout="false"/>
</td><td>
	<layout:text key="" property="nom" size="30" maxlength="80" type="text" styleClass="LOGIN_LABEL" layout="false"/> 
</td></tr><tr><th>
	<bean:message key="info.interloc.fonction"/>
</th><td>
	<layout:write name="InfoInterloc" property="fonction"  layout="false"/>
</td><td>
	<layout:text key="" property="fonction" size="30" maxlength="80" type="text" styleClass="LOGIN_LABEL" layout="false"/> 
</td></tr><tr><th>
	<bean:message key="info.interloc.tel"/>
</th><td>
	<layout:write name="InfoInterloc" property="tel"  layout="false"/>
</td><td>
	<layout:text key="" property="tel" size="30" maxlength="80" type="text" styleClass="LOGIN_LABEL" layout="false"/> 
</td></tr><tr><th>
	<bean:message key="info.interloc.mobile"/>
</th><td>
	<layout:write name="InfoInterloc" property="mobile"  layout="false"/>
</td><td>
	<layout:text key="" property="mobile" size="30" maxlength="80" type="text" styleClass="LOGIN_LABEL" layout="false"/> 
</td></tr><tr><th>
	<bean:message key="info.interloc.mail"/>
</th><td>
	<layout:write name="InfoInterloc" property="mail"  layout="false"/>
</td><td>
	<layout:text key="" property="mail" size="30" maxlength="80" type="text" styleClass="LOGIN_LABEL" layout="false"/> 
</td></tr><tr><th>
	<bean:message key="info.interloc.fax"/>
</th><td>
	<layout:write name="InfoInterloc" property="fax"  layout="false"/>
</td><td>
	<layout:text key="" property="fax" size="30" maxlength="80" type="text" styleClass="LOGIN_LABEL" layout="false"/>  
</td></tr><tr><th>
	<bean:message key="info.interloc.dateeffet"/>
</th><td></td><td>
	<layout:text key="" property="dateeffet" size="10" maxlength="10" isRequired="true" styleClass="LOGIN_LABEL" layout="false"/>
	<font size="1" color="#ff0000">(champ obligatoire)</font>
</td></tr></table>

</td></tr>

<layout:formActions>
<layout:reset styleClass="btn btn-danger" value="Rétablir"/> 
 <layout:submit styleClass="btn btn-success" property="submit" value="Valider" /> 
</layout:formActions> 
</layout:form> 

<tr>
<td>
<font size="1">Conformément aux dispositions de la loi du n°78-17 du 6 janvier 1978, vous disposez d'un droit d'accès, de rectification et d'opposition sur les données nominatives vous concernant.</font>
</td>
</tr>
</table>
 

</td>
</tr>

</layout:panel>

</td>
</tr>
</table>

</layout:html>


<%@ include file="/header_footer/footer_Collab.jsp"%>
