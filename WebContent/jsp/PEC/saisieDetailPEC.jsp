<%@ include file="/declaration/taglibs.jsp"%>

<div>
	<div class="texteH">
    	<layout:message key="info.tiers.pec.saisie.detail"/> 
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

function unValid(){
	var tousElements = document.getElementsByTagName("INPUT");
	for(var i= 0; i < tousElements.length; i++)
	{
	    if(tousElements[i].name == "validPEC") {
	    	tousElements[i].value = "";	    	
	    	break;
	    }
	}
	document.getElementById("msgValid").style.display = "none";
	(document.getElementsByName("submit"))[0].value = "Contrôler la saisie ...";
}
</script>

<br/>

<div id="EXC_PRESENT_DATA_COL_1" style="margin-top:20px;">
	<table >
		<tr><th>Adhérent</th><td><bean:write name="PECAdherent" property="nomPrenom"/></td></tr>
		<tr><th>N° S.S. de l'adhérent</th><td><layout:write name="PECAdherent" property="numRO" layout="false"/></td></tr>			
	</table>
</div>

<br/>

<%
String typePEC = (String) session.getAttribute("PECTypePEC");
if (null == typePEC){
	typePEC = "OPT";
}
%>

<layout:form action="valoriserPEC.do" focus="dateOrdonnance" styleClass="box" > 

	<tr><td colspan="2">
		<table class="FORM_BEN" width="90%" align="center">
			<tr><td align="center">
				<table class="FORM_BEN_SUB_LEFT" style="min-width:300px;">
					<tr>
						<th colspan="5" style="text-align:center;font-size:16px;">
							Prise en charge <layout:write name="PECTypePEC" type="typePEC" layout="false"/>
							<BR>&nbsp;
						</th>
					</tr>	
					<tr>
						<th style="text-align:left;">
							<bean:message key="tiers.pec.saisie.dateOrdonnance"/>
							<img name="dateOrdonnancerequired" src="<%= (String)request.getContextPath()  %>/images/clearpixel.gif">
						</th>
						<td colspan="2" style="text-align:left;">
							<layout:date key=""  name="PECForm" property="dateOrdonnance"  layout="false" 
								patternKey="format.date" size="10" maxlength="10" 
								isRequired="true" startYear="2013" endYear="2025"
								onblur="javascript:return isDate(this.value);" onchange="unValid();"
								calendarTooltip="Sélectionner la date" styleClass="dateEffetForm" />
								<script> firstCheckValue("dateOrdonnance");</script>
							<span class="ERROR" style="text-align:left;">
								<html:errors property="dateOrdonnance" />
							</span>
						</td>
					</tr>
							
					<tr>
						<th style="text-align:left;"></th>
						<th colspan="2" style="text-align:left;">Code LPP</th>
						<th colspan="2" style="text-align:left;">Mnt Net TTC (&euro;)</th>
					</tr>
						
						
					<tr>
						<th style="text-align:left;">
							<% if (typePEC.equals("OPT")) { %>
							<bean:message key="tiers.pec.OPT.saisie.nature.ligne1"/>
							<% } else { %>
							<bean:message key="tiers.pec.AUD.saisie.nature.ligne1"/>
							<% } %>
						</th>
						<td style="text-align:left;">
							<layout:text key="" name="PECForm" property="lppL1" size="10" maxlength="10" layout="false"  onchange="unValid();"/>
						</td>
						<td style="text-align:left;">
							<span class="ERROR" style="text-align:left;">
								<html:errors property="lppL1" />
							</span>
							<span style="text-align:left;">
								<bean:write name="PECLibLPP" property="libL1"/>
							</span>
						</td>
						<td style="text-align:left;">
							<layout:text key="" name="PECForm" property="mntL1" size="10" maxlength="10" layout="false"  onchange="unValid();"/>
						</td>
						<td style="text-align:left;">
							<span class="ERROR" style="text-align:left;">
								<html:errors property="mntL1" />
							</span>
						</td>
					</tr>
														
					<tr>
						<th style="text-align:left;">
							<% if (typePEC.equals("OPT")) { %>
							<bean:message key="tiers.pec.OPT.saisie.nature.ligne2"/>
							<% } else { %>
							<bean:message key="tiers.pec.AUD.saisie.nature.ligne2"/>
							<% } %>
						</th>
						<td style="text-align:left;">
							<layout:text key="" name="PECForm" property="lppL2" size="10" maxlength="10" layout="false"  onchange="unValid();"/>
						</td>
						<td style="text-align:left;">
							<span class="ERROR" style="text-align:left;">
								<html:errors property="lppL2" />
							</span>
							<span style="text-align:left;">
								<bean:write name="PECLibLPP" property="libL2"/>
							</span>
						</td>
						<td style="text-align:left;">
							<layout:text key="" name="PECForm" property="mntL2" size="10" maxlength="10" layout="false"  onchange="unValid();"/>
						</td>
						<td style="text-align:left;">
							<span class="ERROR" style="text-align:left;">
								<html:errors property="mntL2" />
							</span>
						</td>
					</tr>			
					
					<% if (typePEC.equals("OPT")) { %>
											
					<tr>
						<th style="text-align:left;">
							<bean:message key="tiers.pec.saisie.nature.ligne3"/>
						</th>
						<td style="text-align:left;">
							<layout:text key="" name="PECForm" property="lppL3" size="10" maxlength="10" layout="false"  onchange="unValid();"/>
						</td>
						<td style="text-align:left;">
							<span class="ERROR" style="text-align:left;">
								<html:errors property="lppL3" />
							</span>
							<span style="text-align:left;">
								<bean:write name="PECLibLPP" property="libL3"/>
							</span>
						</td>
						<td style="text-align:left;">
							<layout:text key="" name="PECForm" property="mntL3" size="10" maxlength="10" layout="false"  onchange="unValid();"/>
						</td>
						<td style="text-align:left;">
							<span class="ERROR" style="text-align:left;">
								<html:errors property="mntL3" />
							</span>
						</td>
					</tr>			
														
					<tr>
						<th style="text-align:left;">
							<bean:message key="tiers.pec.saisie.nature.ligne4"/>
						</th>
						<td style="text-align:left;">
							<layout:text key="" name="PECForm" property="lppL4" size="10" maxlength="10" layout="false"  onchange="unValid();"/>
						</td>
						<td style="text-align:left;">
							<span class="ERROR" style="text-align:left;">
								<html:errors property="lppL4" />
							</span>
							<span style="text-align:left;">
								<bean:write name="PECLibLPP" property="libL4"/>
							</span>
						</td>
						<td style="text-align:left;">
							<layout:text key="" name="PECForm" property="mntL4" size="10" maxlength="10" layout="false"  onchange="unValid();"/>
						</td>
						<td style="text-align:left;">
							<span class="ERROR" style="text-align:left;">
								<html:errors property="mntL4" />
							</span>
						</td>
					</tr>			
														
					<tr>
						<th style="text-align:left;">
							<bean:message key="tiers.pec.saisie.nature.ligne5"/>
						</th>
						<td style="text-align:left;">
							<layout:text key="" name="PECForm" property="lppL5" size="10" maxlength="10" layout="false"  onchange="unValid();"/>
						</td>
						<td style="text-align:left;">
							<span class="ERROR" style="text-align:left;">
								<html:errors property="lppL5" />
							</span>
							<span style="text-align:left;">
								<bean:write name="PECLibLPP" property="libL5"/>
							</span>
						</td>
						<td style="text-align:left;">
							<layout:text key="" name="PECForm" property="mntL5" size="10" maxlength="10" layout="false"  onchange="unValid();"/>
						</td>
						<td style="text-align:left;">
							<span class="ERROR" style="text-align:left;">
								<html:errors property="mntL5" />
							</span>
						</td>
					</tr>			
														
					<tr>
						<th style="text-align:left;">
							<bean:message key="tiers.pec.saisie.nature.ligne6"/>
						</th>
						<td colspan="2" style="text-align:left; border-bottom:thin dotted #A54A00;">
							&nbsp;	
						</td>						
						<td style="text-align:left;">
							<layout:text key="" name="PECForm" property="mntL6" size="10" maxlength="10" layout="false"  onchange="unValid();"/>
						</td>
						<td style="text-align:left;">
							<span class="ERROR" style="text-align:left;">
								<html:errors property="mntL6" />
							</span>
						</td>
					</tr>			
														
					<% } %>
											
					<tr>
						<th style="text-align:left;">
							<bean:message key="tiers.pec.saisie.nature.ligne7"/>
						</th>
						<td style="text-align:left;">
							<layout:text key="" name="PECForm" property="lppL7" size="10" maxlength="10" layout="false"  onchange="unValid();"/>
						</td>
						<td style="text-align:left;">
							<span class="ERROR" style="text-align:left;">
								<html:errors property="lppL7" />
							</span>
							<span style="text-align:left;">
								<bean:write name="PECLibLPP" property="libL7"/>
							</span>
						</td>
						<td style="text-align:left;">
							<layout:text key="" name="PECForm" property="mntL7" size="10" maxlength="10" layout="false"  onchange="unValid();"/>
						</td>
						<td style="text-align:left;">
							<span class="ERROR" style="text-align:left;">
								<html:errors property="mntL7" />
							</span>
						</td>
					</tr>			
														
					<tr>
						<th style="text-align:left;">
							<bean:message key="tiers.pec.saisie.nature.ligne8"/>
						</th>
						<td style="text-align:left;">
							<layout:text key="" name="PECForm" property="lppL8" size="10" maxlength="10" layout="false"  onchange="unValid();"/>
						</td>
						<td style="text-align:left;">
							<span class="ERROR" style="text-align:left;">
								<html:errors property="lppL8" />
							</span>
							<span style="text-align:left;">
								<bean:write name="PECLibLPP" property="libL8"/>
							</span>
						</td>
						<td style="text-align:left;">
							<layout:text key="" name="PECForm" property="mntL8" size="10" maxlength="10" layout="false"  onchange="unValid();"/>
						</td>
						<td style="text-align:left;">
							<span class="ERROR" style="text-align:left;">
								<html:errors property="mntL8" />
							</span>
						</td>
					</tr>			
					
					
					<tr><td colspan="5" style="text-align:center;">
						<span class="ERROR" style="text-align:left;">
							<html:errors property="general" />
						</span>
						<span id="msgValid" style="text-align:left;">
							<html:errors property="message" />
						</span>
					</td></tr>		
				</table>
			</td></tr>
		</table>
	</td></tr>

<html:hidden name="PECForm" property="validPEC"/>

	<layout:formActions>
		<layout:row>
			<layout:reset styleClass="btn btn-danger" value="Rétablir"/> 
			<logic:equal name="PECForm" property="validPEC" value="O">
				<layout:submit styleClass="btn" property="submit" value="Valoriser la prise en charge ..."/>
			</logic:equal> 
			<logic:notEqual name="PECForm" property="validPEC" value="O">
				<layout:submit styleClass="btn" property="submit" value="Contrôler la saisie ..."/>
			</logic:notEqual>
		</layout:row>	
	</layout:formActions> 

<script>
document.forms["PECForm"].elements["submit"].focus();
</script>

</layout:form> 


