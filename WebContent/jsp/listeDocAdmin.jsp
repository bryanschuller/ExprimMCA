<%@ include file="/declaration/taglibs.jsp"%>
<%@ page import="com.exprimweb.struts.modele.*"%>

<%	
	Dossier dossAct = (Dossier) session.getAttribute("dossierActuel");
	String typeD = null;
	if(null != dossAct){
		typeD = (String) dossAct.getTypeDossier();
	}
%>

<div>
	<div class="texteH">Administrateur MCA</div>
	<div class="iconesH">
		<a href="<%= (String)request.getContextPath()  %>/retourArriere.do<%= (null != (String)request.getAttribute("pileRequestReqParam")?(String)request.getAttribute("pileRequestReqParam"):"") %>"><i class="fa fa-arrow-left" data-toggle="tooltip" data-placement="bottom" data-original-title="Retour"></i></a>
	</div>
</div>
<div class="clearfix"></div>

<% int indexAttDef = 1; %>

<div class="nav-tabs-custom">
	<ul class="nav nav-tabs">
		<logic:present name="AttDocDefListe" scope="session">
			<logic:notEmpty name="AttDocDefListe" property="listeDef" scope="session">
				<logic:iterate name="AttDocDefListe" property="listeDef" id="attDocDef">		
					<% 
					String classTab = "";
					if(indexAttDef == 1)
					{
						classTab += "active";
					}
					%>
					<li class="<%= classTab %>"><a href="#tab_<%= indexAttDef %>" data-toggle="tab"><bean:write name="attDocDef" property="libelle"/></a></li>			
					<% indexAttDef++; %>
				</logic:iterate>
			</logic:notEmpty>
		</logic:present>
	</ul>

	<% indexAttDef = 1; %>
	<div class="tab-content">
		<logic:present name="AttDocDefListe" scope="session">
			<logic:notEmpty name="AttDocDefListe" scope="session">
				<logic:iterate name="AttDocDefListe" property="listeDef" id="attDocDef">
					<% 
					String classTab = "tab-pane";
					if(indexAttDef == 1)
					{
						classTab += " active";
					}
					%>
					<div class="<%= classTab %>" id="tab_<%= indexAttDef %>">
						<logic:empty name="attDocDef" property="lstBranches">	
							<div id="ongl_<%= indexAttDef %>_sub_1">
								<div id="EXC_PRESENT_DATA_1">		
									<exged:listeDocExged name="docExgedAtt_" 
									userCode="USER_ADMIN" loadCode="REF:attDocDef"
									styleClass1="LIGNE_A" styleClass2="LIGNE_B">		
										<logic:equal name="attDocDef" property="filtreDossier" value="O">
											<exged:paramSearchExged paramName="DOSSIER_ACTUELLE" />	
										</logic:equal>				
									</exged:listeDocExged>	
								</div>		
								<div id="tete_ongl_<%= indexAttDef %>_sub_1"></div>
							</div>
						</logic:empty>		
						
						<logic:notEmpty name="attDocDef" property="lstBranches">
							<div class="nav-tabs-custom">
								<ul class="nav nav-tabs">
									<% 
										int indexAttDefSub = 1;
									%>
									<logic:iterate name="attDocDef" property="lstBranches" id="attDocDefSub">
										<%
											classTab = "";
											if(indexAttDefSub == 1)
											{
												classTab = "active";
											}
										%>

										<li class="<%= classTab %>"><a href="#subtab_<%= indexAttDefSub %>" data-toggle="tab"><bean:write name="attDocDefSub" property="libelle"/></a></li>				
										<% indexAttDefSub++; %>
									</logic:iterate>
								</ul>
							</div>

							<% indexAttDefSub = 1; %>
							<div class="tab-content">
								<logic:iterate name="attDocDef" property="lstBranches" id="attDocDefSub">
								<% 
								classTab = "tab-pane";
								if(indexAttDefSub == 1)
								{
									classTab += " active";
								}
								%>
									<div class="<%= classTab %>" id="subtab_<%= indexAttDefSub %>">
										<exged:listeDocExged name="docExgedAtt_" 
										userCode="USER_ADMIN" loadCode="REF:attDocDef:indexAttDefSub"
										styleClass1="LIGNE_A" styleClass2="LIGNE_B">		
											<logic:equal name="attDocDef" property="filtreDossier" value="O">
												<exged:paramSearchExged paramName="DOSSIER_ACTUELLE" />	
											</logic:equal>				
											<exged:paramSearchExged paramName="PLANLIBC" paramValue="REF:attDocDefSub" paramType="*PLANC"/>	
										</exged:listeDocExged>
									</div>
									<% indexAttDefSub++; %>
								</logic:iterate>
							</div>
						</logic:notEmpty>
					</div>
					<% indexAttDef++; %>
				</logic:iterate>		
			</logic:notEmpty>
		</logic:present>
	</div>
</div>