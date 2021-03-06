<%@ include file="/declaration/taglibs.jsp"%>

<bean:size name="lEmails" id="tailleListe"/>

<div>
	<div class="texteH">
		<logic:equal name="tailleListe" value="1">		
	    	<layout:message key="title.change.one.mail"/>	    	
		</logic:equal>		
		<logic:greaterThan name="tailleListe" value="1">	
	    	<layout:message key="title.change.all.mails"/>	    	
		</logic:greaterThan>
	</div>
	<div class="iconesH">
		<a href="<%= (String)request.getContextPath()  %>/retourArriere.do<%= (null != (String)request.getAttribute("pileRequestReqParam")?(String)request.getAttribute("pileRequestReqParam"):"") %>"><i class="fa fa-arrow-left" data-toggle="tooltip" data-placement="bottom" data-original-title="Retour"></i></a>
	</div>
</div>
<div class="clearfix"></div>

<div class="box box-mca-yellow">
	<div class="box-body">
		<layout:form action="/changementAllEmails" focus="newEmail" styleId="emailForm" onsubmit="return validateModEmailForm(this)"> 
			<%@ include file="/jsp/formulaires/incl/eMailForm.jsp"%>

			<layout:formActions> 
				<layout:row>
					<layout:reset styleClass="btn btn-danger" value="R�tablir"/> 
					<layout:submit styleClass="btn btn-success" property="submit" value="Valider" /> 
				</layout:row>
			</layout:formActions> 
		</layout:form>				
	</div>
</div>

<html:javascript formName="modEmailForm" />

<style type="text/css">
	/* Small devices (tablets, 768px and up) */
	@media (min-width: 767px) { 
		#emailForm > table:first-child
		{
			width: 100%;
		}
	}

	/* Medium devices (desktops, 992px and up) */
	@media (min-width: 991px) {
		#emailForm > table:first-child
		{
			width: 70%;
		} 
	 }

	/* Large devices (large desktops, 1200px and up) */
	@media (min-width: 1199) { 
		#emailForm > table:first-child
		{
			width: 50%;
		} 
	 }
</style>