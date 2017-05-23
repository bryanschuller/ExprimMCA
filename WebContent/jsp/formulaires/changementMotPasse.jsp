<%@ include file="/declaration/taglibs.jsp"%>

<div>
	<div class="texteH">Personnaliser votre mot de passe</div>
	<div class="iconesH">
		<a href="<%= (String)request.getContextPath()  %>/retourArriere.do<%= (null != (String)request.getAttribute("pileRequestReqParam")?(String)request.getAttribute("pileRequestReqParam"):"") %>"><i class="fa fa-arrow-left" data-toggle="tooltip" data-placement="bottom" data-original-title="Retour"></i></a>
	</div>
</div>
<div class="clearfix"></div>

<layout:form action="changerMotPasse.do" focus="ancienMotpasse" style="box box-mca-yellow"> 

	<tr><td colspan="2">
		<table class="FORMULAIRE" width="90%" align="center">
			<tr><td align="center">
				<table class="FORM_BEN_SUB_LEFT" style="min-width:300px;">
					<layout:field key="app.idinternaute" property="idInternaute" size="16" maxlength="11" isRequired="true" type="text" /> 
				
					<layout:field key="app.password.current" property="ancienMotpasse" size="16" maxlength="10" type="password"  isRequired="true"/>
					
					<tr><td colspan = '2' style="font-size:9px;">
						(Code d'accès ou mot de passe personnalisé)
					</td></tr>
				</table>
			</td></tr>
		</table>
	</td></tr>
	
	<tr><td colspan="2">
		<table class="FORM_BEN" width="90%" align="center">
			<tr><td align="center">
				<table class="FORM_BEN_SUB_LEFT" style="min-width:300px;">
					<layout:field key="app.password.new" property="nouveauMotpasse" size="16" maxlength="10" type="password" isRequired="true"/> 
					<layout:field key="app.password.confirm" property="confirmeMotpasse" size="16" maxlength="10" type="password" isRequired="true"/>  
					
					<tr><td colspan = '2' style="font-size:9px;">
						Saisir un mot de passe de 5 caractères minimum...
					</td></tr>
				</table>
			</td></tr>
		</table>
	</td></tr>
	
	
	
	<html:hidden property="acces" value="Adherent"/> 
	 
	<layout:formActions> 
	<layout:row>
	<layout:reset styleClass="btn btn-danger" value="Rétablir" /> 
	<layout:submit styleClass="btn btn-success" property="submit" value="Valider"/> 
	</layout:row>
	</layout:formActions> 
</layout:form> 

