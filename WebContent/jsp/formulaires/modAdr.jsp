<%@ include file="/declaration/taglibs.jsp"%>

<div>
	<div class="texteH">
    <layout:message key="info.adh.adresse.changement"/> 
	</div>
	<div class="iconesH">
<a href="<%= (String)request.getContextPath()  %>/retourArriere.do<%= (null != (String)request.getAttribute("pileRequestReqParam")?(String)request.getAttribute("pileRequestReqParam"):"") %>"><i class="fa fa-arrow-left" data-toggle="tooltip" data-placement="bottom" data-original-title="Retour"></i></a>
	</div>
</div>
<div class="clearfix"></div>

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

<br/>
<div class="box box-mca-yellow">
	<div class="box-body">
		<layout:form action="updateadr.do" focus="adr1"> 

		<tr><td colspan="2">
			<table class="FORM_BEN" width="90%" align="center">
				<tr><td  align="center">
					<table>
			
						<tr>
							<th style="text-align:left;">
								<bean:message key="info.adh.adresse"/>
								<img name="adr1required" src="<%= (String)request.getContextPath()  %>/images/clearpixel.gif">
							</th>
							<td style="text-align:left;">
								<layout:text key="" name="adressForm" property="adr1" 
									size="50" maxlength="30" isRequired="true" onchange="up_text(this);" layout="false" />
									<script> firstCheckValue("adr1");</script>
								<span  class="ERROR" style="text-align:left;">
									<html:errors property="adr1" />
								</span>
							</td>
						</tr>
						<tr>
							<th style="text-align:left;"></th>
							<td style="text-align:left;">
								<layout:text key="" name="adressForm" property="adr2" 
									size="50" maxlength="30" isRequired="true" onchange="up_text(this);" layout="false" />
							</td>
						</tr>
						<tr>
							<th style="text-align:left;"></th>
							<td style="text-align:left;">
								<layout:text key="" name="adressForm" property="adr3" 
									size="50" maxlength="30" isRequired="true" onchange="up_text(this);" layout="false" />						
							</td>
						</tr>
							
						<tr>
							<th style="text-align:left;">
								<bean:message key="info.adh.cp"/>
								<img name="adrcprequired" src="<%= (String)request.getContextPath()  %>/images/clearpixel.gif">
							</th>
							<td style="text-align:left;width:130px;">
								<layout:text key="" name="adressForm" property="adrcp" 
									size="8" maxlength="5" isRequired="true" onchange="up_text(this);" layout="false" />
									<script> firstCheckValue("adrcp");</script>
								<span  class="ERROR" style="text-align:left;">
									<html:errors property="adrcp" />
								</span> 
							</td>
						</tr>
							
						<tr>
							<th style="text-align:left;">
								<bean:message key="info.adh.ville"/>
								<img name="adrvirequired" src="<%= (String)request.getContextPath()  %>/images/clearpixel.gif">
							</th>
							<td style="text-align:left;">
								<layout:text key="" name="adressForm" property="adrvi" 
									size="20" maxlength="30" isRequired="true"  onchange="up_text(this);" layout="false" />
									<script> firstCheckValue("adrvi");</script>
								<span  class="ERROR" style="text-align:left;">
									<html:errors property="adrvi" />
								</span>  
							</td>
						</tr>
								
						<tr>
							<th style="text-align:left;">
								<bean:message key="info.interloc.dateeffet"/>
								<img name="dateEffetrequired" src="<%= (String)request.getContextPath()  %>/images/clearpixel.gif">
							</th>
							<td style="text-align:left;">
								<layout:date key=""  name="adressForm" property="dateEffet"  layout="false" 
									patternKey="format.date" size="10" maxlength="10" 
									isRequired="true" startYear="2013" endYear="2025"
									onblur="javascript:return isDate(this.value);" 
									calendarTooltip="Sélectionner la date" styleClass="dateEffetForm" />
									<script> firstCheckValue("dateEffet");</script>
								<span  class="ERROR" style="text-align:left;">
									<html:errors property="dateEffet" />
								</span>  
							</td>
						</tr>
								
						
						<tr>
							<th>&nbsp;</th>
							<td class="obligatoire" style="text-align:left;">
								<img src="<%=(String) request.getContextPath() %>/images/ast.gif"><bean:message key="general.formulaire.obligatoire"/>
							</td>
						</tr>
					</table>
					
				</td></tr>
			</table>
		</td></tr>
			
			
		<tr><td colspan="4">&nbsp;</td></tr>


		<html:hidden name="adressForm" property="adrg"/> 
		<html:hidden name="adressForm" property="adre"/> 
		<html:hidden name="adressForm" property="adrc"/> 
		<html:hidden name="adressForm" property="adra"/> 
		<html:hidden name="adressForm" property="adrb"/>
		<html:hidden name="adressForm" property="adrnu"/>  

		<layout:formActions>
		<layout:row>
			<layout:reset styleClass="btn btn-danger" value="Rétablir"/> 
			<layout:submit styleClass="btn" property="submit" value="Envoyer le changement d'adresse"/> 
		</layout:row>

		</layout:formActions> 

		</layout:form> 
	</div>
</div>

<script>
function up_text(el){
	el.value = el.value.toUpperCase();
}
</script>

<script type="text/javascript" src="<%= (String)request.getContextPath()  %>/scripts/control/control.js"></script>

