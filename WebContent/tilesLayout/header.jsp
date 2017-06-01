
<%@ include file="/declaration/taglibs.jsp"%>
<%@ page import="java.util.Calendar" %>

<%
	Calendar cal=Calendar.getInstance();
	int mois = cal.get(Calendar.MONTH) + 1;
	String todayA = "Le " + cal.get(Calendar.DAY_OF_MONTH) + "/" + mois + "/" + cal.get(Calendar.YEAR);
%>

<div style="position:absolute; left:0;" class="pay_mask_imp">
	<table><tr><td>		
		<img border="0" align="left" alt="MCA Strasbourg" 
		height="100" width="321" 
		src="<%= (String)request.getContextPath()  %>/images/FromMCA/LOGOQ_RNM.bmp">
	</td><td>
		<logic:present name="internaute">
			<div style="margin-left:50px; width:350px;border: 1px solid black;padding: 10px;margin: 10px;">
				<table width="100%">
			  		<tr><td>Internaute N&deg; <layout:write name="internaute" property="idInternaute"/></td></tr>
			  		<logic:present name="dossierActuel">
				  		<tr><td>Dossier <layout:write name="dossierActuel" property="designation" /></td></tr>
				  		<logic:equal name="dossierActuel" property="typeDossier" value="ADH">
							<tr><td><layout:message key="info.adh.nro"/> : <layout:write name="adherent" property="numRO" /></td></tr>
						</logic:equal>
						<logic:equal name="dossierActuel" property="typeDossier" value="BEN">
							<tr><td><layout:message key="info.adh.nro"/> : <layout:write name="adherent" property="numRO" /></td></tr>
						</logic:equal>
						<tr><td>&nbsp;</td></tr>
					</logic:present>
					<tr><td align="right"><%= todayA %></td></tr>		  		
			    </table>
		    </div>
		</logic:present>
	</td></tr></table>
</div>

<header class="main-header">
	<a href="/extranet/" class="logo" ></a>
	<nav class="navbar navbar-static-top" role="navigation">
		<a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button">
		    <span class="sr-only">Toggle navigation</span>
		</a>
	    <div class="navbar-custom-menu">
	        <ul class="nav navbar-nav">
				<logic:present name="internaute">
					<li class="dropdown user user-menu">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
							<span class="hidden-xs">Internaute N&deg; <layout:write name="internaute" property="idInternaute"/></span>
						</a>
				  		<logic:present name="dossierActuel">
							<ul class="dropdown-menu">
								<li class="user-body">
									Dossier <layout:write name="dossierActuel" property="designation" />
								</li>
						  		<logic:equal name="dossierActuel" property="typeDossier" value="ADH">
									<li class="user-body">
										<layout:message key="info.adh.nro"/> : <layout:write name="adherent" property="numRO" />
									</li>
								</logic:equal>
								<logic:equal name="dossierActuel" property="typeDossier" value="BEN">
									<li class="user-body">
										<layout:message key="info.adh.nro"/> : <layout:write name="adherent" property="numRO" />
									</li>
								</logic:equal>
							</ul>
						</logic:present>
					</li>
				</logic:present>
	        </ul>
	    </div>
	</nav>
</header>