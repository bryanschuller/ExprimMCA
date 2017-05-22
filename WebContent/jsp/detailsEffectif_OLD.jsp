<%@ include file="/declaration/taglibs.jsp"%>


<layout:form action="detailsEffectif.do"   styleClass="FORM_BEN"  style="margin-left:20px;" reqCode="sendForm">

<tr>
<td>
<bean:define id="idEfForm" name="detailsEffectifForm" property="listeCategorie" />
<layout:select property="categorie" layout="false" styleClass="FIELD">				
  <layout:options name="idEfForm" />
</layout:select>
</td>
<td>
<bean:define id="idEfForm" name="detailsEffectifForm" property="listeProduit" />
<layout:select property="produit" layout="false" styleClass="FIELD">				
  <layout:options name="idEfForm" />
</layout:select>
</td>
<td>

	<layout:date key="info.interloc.dateeffet" name="detailsEffectifForm" property="dateEffet" layout="false" 
		patternKey="format.date" size="10" maxlength="10" 
		isRequired="true" startYear="2009" endYear="2015" 
		onblur="javascript:return isDate(this.value);"
		calendarTooltip="Sélectionner la date"  styleClass="dateEffetForm" />
		<span class="ERROR">
     <html:errors property="dateEffet" />
     </span>
</td>
<td>

<layout:checkbox  name="detailsEffectifForm"  property="avecBenef" value="true" maxlength="10" layout="false"  >

</layout:checkbox>
</td>
</tr>

<layout:formActions>

<layout:row space="false">

<layout:reset styleClass="btn" value="Rétablir" />
<layout:submit styleClass="btn" property="submit" value="Envoyer" /> 
 
</layout:row>

</layout:formActions>

</layout:form>


<script type="text/javascript" src="<%= (String)request.getContextPath()  %>/scripts/control/control.js"></script>


