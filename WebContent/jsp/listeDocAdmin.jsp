<%@ include file="/declaration/taglibs.jsp"%>
<%@ page import="com.exprimweb.struts.modele.*"%>

<script type="text/javascript" src="<%= (String)request.getContextPath()  %>/scripts/gest_onglet.js"></script>

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

<br>

<div id="EXC_PRESENT_ONGLET_TETE_COL_1">
	
	<ul id="EXC_PRESENT_ONGLET_TETE_COL_1_LIST">
		<logic:present name="AttDocDefListe" scope="session">
			<logic:notEmpty name="AttDocDefListe" property="listeDef" scope="session">
				<logic:iterate name="AttDocDefListe" property="listeDef" id="attDocDef">
					<li><a href="<%= (String)request.getContextPath()  %>/listeDocAdmin.do?tab=<%= indexAttDef %>" 
					id="tete_ongl_<%= indexAttDef %>" title="<bean:write name="attDocDef" property="libelle"/>" 
					onClick="view_tab_sub(<%= indexAttDef %>, 1);return false;"><bean:write name="attDocDef" property="libelle"/></a></li>				
					<% indexAttDef++; %>
				</logic:iterate>
			</logic:notEmpty>
		</logic:present>
	</ul>
</div>

	
<div id="EXC_PRESENT_ONGLET_CORP_COL_1">

<% indexAttDef = 1; %>
	
	<logic:present name="AttDocDefListe" scope="session">
		<logic:notEmpty name="AttDocDefListe" scope="session">
			<logic:iterate name="AttDocDefListe" property="listeDef" id="attDocDef">
			<div id="ongl_<%= indexAttDef %>" style="display:none; width:100%;">
				<H2>
					<div class="texteH"><bean:write name="attDocDef" property="libelle"/></div>
				</H2>
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
					<BR>
					<% int indexAttDefSub = 1; %>	
					<div id="EXC_PRESENT_ONGLET_TETE_COL_2">
	
						<ul id="EXC_PRESENT_ONGLET_TETE_COL_2_LIST">
						
							<logic:iterate name="attDocDef" property="lstBranches" id="attDocDefSub">
								<li><a href="<%= (String)request.getContextPath()  %>/listeDocAdmin.do?tab=<%= indexAttDef %>&sub=<%= indexAttDefSub %>" 
								id="tete_ongl_<%= indexAttDef %>_sub_<%= indexAttDefSub %>" title="<bean:write name="attDocDefSub" property="libelle"/>" 
								onClick="view_tab_sub(<%= indexAttDef %>, <%= indexAttDefSub %>);return false;"><bean:write name="attDocDefSub" property="libelle"/></a></li>				
								<% indexAttDefSub++; %>
							</logic:iterate>
						</ul>
					</div>
					
					<% indexAttDefSub = 1; %>
					<div id="EXC_PRESENT_ONGLET_CORP_COL_2">
					
						<logic:iterate name="attDocDef" property="lstBranches" id="attDocDefSub">				
				
							<div id="ongl_<%= indexAttDef %>_sub_<%= indexAttDefSub %>" style="display:none; width:100%;">
								<H2>
									<div class="texteH"><bean:write name="attDocDefSub" property="libelle"/></div>
								</H2>	
								<div id="EXC_PRESENT_DATA_1">		
									<%
										pageContext.setAttribute("indexAttDefSub", String.valueOf(indexAttDefSub));
									%>
									<exged:listeDocExged name="docExgedAtt_" 
									userCode="USER_ADMIN" loadCode="REF:attDocDef:indexAttDefSub"
									styleClass1="LIGNE_A" styleClass2="LIGNE_B">		
										<logic:equal name="attDocDef" property="filtreDossier" value="O">
											<exged:paramSearchExged paramName="DOSSIER_ACTUELLE" />	
										</logic:equal>				
										<exged:paramSearchExged paramName="PLANLIBC" paramValue="REF:attDocDefSub" paramType="*PLANC"/>	
									</exged:listeDocExged>
									
								</div>	
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

<script>
	ongl_bg_col_unsel = '#FFFFFF';
	ongl_txt_col_unsel = '#231F20';
	ongl_bg_col_sel = '#000000';

	ongl_sub_bg_col_unsel = '#FFFFFF';
	ongl_sub_txt_col_unsel = '#231F20';
	ongl_sub_bg_col_sel = '#000000';
	 
	view_tab_sub(<%= (String)request.getAttribute("tab")  %>, <%= (String)request.getAttribute("sub")  %>);
</script>

