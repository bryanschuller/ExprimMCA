<%@ include file="/declaration/taglibs.jsp"%>

<H2>
	<div class="texteH">
    	Mot de passe oublié 
	</div>
	<div class="iconesH">
		
	</div>
</H2> 

<div class="LOGIN_BACKG" align="center"> 
<br>
  



<html:errors property="org.apache.struts.action.GLOBAL_ERROR"/>

 



 <div align="center">
 <font color="#000099" size="2" face="Verdana, Arial, Helvetica, sans-serif">
 <p><strong>Retrouver votre mot de passe :</strong></p></font>
<br>
</div>

<%
String idInternaute = (String) request.getParameter("idInternaute");
if(null == idInternaute) {idInternaute = "";}
%>



<layout:form action="MotPasseForget.do" focus="idInternaute" styleClass="FORMULAIRE" width="550px" align="center"  > 
<tr><td colspan="2">
	<table class="FORM_BEN" align="center">
		<tr><td  align="center">
			<table>
				<tr>
					<th style="text-align:left;">
						<bean:message key="app.username"/>
						</th>
					<td style="text-align:left;">
						<layout:text key="" property="idInternaute" size="16" maxlength="11" isRequired="true" styleClass="LOGIN_LABEL" type="text" layout="false" value="<%= idInternaute %>"/>
						<img name="idInternauterequired" src="<%= (String)request.getContextPath()  %>/images/ast.gif">
						<span  class="ERROR" style="text-align:left;">
							<html:errors property="idInternaute" />
						</span> 
					</td>
				</tr><tr>
					<th style="text-align:left;">
						<bean:message key="app.mail.mail"/>
						</th>
					<td style="text-align:left;">
						<layout:text key="" property="mail" size="30" maxlength="80" style="width:300px;" type="text" styleClass="LOGIN_LABEL" isRequired="true" layout="false"/>
						<img name="mailrequired" src="<%= (String)request.getContextPath()  %>/images/ast.gif">
						<span  class="ERROR" style="text-align:left;">
							<html:errors property="mail" />
						</span> 
					</td>
				</tr>
			</table>
			
		</td></tr>
	</table>
</td></tr>

<%
String typeAcces = (String) request.getParameter("typeAcces");
if(null == typeAcces) {typeAcces = "";}
%>
<html:hidden property="acces" value="<%= typeAcces %>"/>

<layout:formActions>
<layout:row>
<layout:reset styleClass="btn btn-danger" value="Rétablir"/> 
<layout:submit styleClass="btn btn-success" property="submit" value="Valider"/> 
</layout:row>
</layout:formActions>
 
</layout:form> 





<BR><BR><BR>



<p><font size="1">Conformément aux dispositions de la loi du n°78-17 du 6 janvier 1978, vous disposez d'un droit d'accès, de rectification et d'opposition sur les données nominatives vous concernant.</font></p>  
</div>







