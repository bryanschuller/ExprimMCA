<%@ include file="/declaration/taglibs.jsp"%>
<%@ page import="com.exprimweb.struts.modele.Internaute"%>

<H1>
	<div class="texteH">
    	<layout:message key="info.tiers.pec.saisie.adherent"/> 
	</div>
	<div class="iconesH">
		<a href="<%= (String)request.getContextPath()  %>/retourArriere.do<%= (null != (String)request.getAttribute("pileRequestReqParam")?(String)request.getAttribute("pileRequestReqParam"):"") %>"><html:img page="/images/RETURN.gif" alt="Retour" border="0"/></a>
	</div>
</H1> 


<%

Internaute internaute = (Internaute) session.getAttribute("internaute");

if (null != internaute && internaute.getModeAcces().equals("SUP")) {

%>

<script>

function firstCheckValue(fieldName){
	var tousElements = document.getElementsByTagName("INPUT");
	for(var i= 0; i < tousElements.length; i++)
	{
	    if(tousElements[i].name == fieldName) {
	    	checkValue(tousElements[i], fieldName,'TEXT',true);	    	
	    	break;
	    }
	}
}

</script>


<br/><br/>

<layout:form action="saisirPEC.do" focus="numAdherent" styleClass="FORMULAIRE" width="80%" > 

	<tr><td colspan="2">
		<table class="FORM_BEN" width="90%" align="center">
			<tr><td align="center">
				<table class="FORM_BEN_SUB_LEFT" style="min-width:300px;">
					<tr>
						<th style="text-align:left;">
							<bean:message key="tiers.pec.saisie.numAdherent"/>
							<img name="numAdherentrequired" src="<%= (String)request.getContextPath()  %>/images/clearpixel.gif">
						</th>
						<td style="text-align:left;">
							<layout:text key="" name="PECAdherentForm" property="numAdherent" 
								size="10" maxlength="7" isRequired="true" layout="false" />
								<script> firstCheckValue("numAdherent");</script>
							<span class="ERROR" style="text-align:left;">
								<html:errors property="numAdherent" />
							</span>
						</td>
					</tr>
					
					
					<tr>
						<th style="text-align:left;">
							<bean:message key="tiers.pec.saisie.numRO"/>
							<img name="numROrequired" src="<%= (String)request.getContextPath()  %>/images/clearpixel.gif">
						</th>
						<td style="text-align:left;">
							<layout:text key="" name="PECAdherentForm" property="numRO" 
								size="15" maxlength="13" isRequired="true" layout="false" />
								<script> firstCheckValue("numRO");</script>
							<span class="ERROR" style="text-align:left;">
								<html:errors property="numRO" />
							</span>
						</td>
					</tr>
					
					<logic:equal name="PECSaisiePrenom" value="O">					
						<tr>
							<th style="text-align:left;">
								<bean:message key="tiers.pec.saisie.prenom"/>
								<img name="prenomrequired" src="<%= (String)request.getContextPath()  %>/images/clearpixel.gif">
							</th>
							<td style="text-align:left;">
								<layout:text key="" name="PECAdherentForm" property="prenom" 
									size="25" maxlength="20" isRequired="true" layout="false" />
									<script> firstCheckValue("prenom");</script>
								<span class="ERROR" style="text-align:left;">
									<html:errors property="prenom" />
								</span>
							</td>
						</tr>
					</logic:equal>	
					<tr>
					<th>&nbsp;</th>
						<td class="obligatoire" style="text-align:left;">
							<img src="<%=(String) request.getContextPath() %>/images/ast.gif"><bean:message key="general.formulaire.obligatoire"/>
						</td>
					</tr>	
					<tr>
						<td colspan="2" style="text-align:center;">
							<span class="ERROR" style="text-align:center;">
								<html:errors property="adherent" />
							</span>
						</td>
					</tr>							
				</table>
			</td></tr>
		</table>
	</td></tr>

	<layout:formActions>
		<layout:row>
			<layout:submit styleClass="BOUT1" property="submit" value="Continuer ..."/> 
		</layout:row>	
	</layout:formActions> 

</layout:form> 


<script type="text/javascript" src="<%= (String)request.getContextPath()  %>/scripts/control/control.js"></script>

<logic:equal name="PECSaisiePrenom" value="O">					
<script type="text/javascript" language="JavaScript">
  <!--
  var focusControl = document.forms["PECAdherentForm"].elements["prenom"];

  if (focusControl.type != "hidden" && !focusControl.disabled) {
     focusControl.focus();
  }
  // -->
</script>					
</logic:equal>


<% } else { %>

<br>
	<div id="EXC_MESSAGE_INFO"><strong>
		Suite � un incident technique, la saisie des prises en charge n'est pas disponible. Elle sera r�activ�e dans les plus brefs d�lais.
	</strong></div>
<br>

<% } %>

