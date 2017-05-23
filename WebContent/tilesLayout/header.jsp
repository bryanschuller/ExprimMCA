
<%@ include file="/declaration/taglibs.jsp"%>
<%@ page import="java.util.Calendar" %>

<!-- div style="position:absolute; left:-300px;" class="pay_vis">
	<img border="0" alt="MCA à Strasbourg" src="<%= (String)request.getContextPath()  %>/images/bandeau_site_MCA_v3.fw.png">
</div --> 

<%
	Calendar cal=Calendar.getInstance();
	// System.out.println(cal.get(Calendar.DAY_OF_YEAR));
	int mois = cal.get(Calendar.MONTH) + 1;
	String todayA = "Le " + cal.get(Calendar.DAY_OF_MONTH) + "/" + mois + "/" + cal.get(Calendar.YEAR);
%>

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
						<span class="hidden-xs">Internaute N° <layout:write name="internaute" property="idInternaute"/></span>
					</a>
			  		<logic:present name="dossierActuel">
						<ul class="dropdown-menu">
							<li>
								Dossier <layout:write name="dossierActuel" property="designation" />
							</li>
					  		<logic:equal name="dossierActuel" property="typeDossier" value="ADH">
								<li>
									<layout:message key="info.adh.nro"/> : <layout:write name="adherent" property="numRO" />
								</li>
							</logic:equal>
							<logic:equal name="dossierActuel" property="typeDossier" value="BEN">
								<li>
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
	
<div style="position:absolute; left:0;" class="pay_mask_imp">

	<table>
		<tr><td>		
			<img border="0" align="left" alt="MCA à Strasbourg" 
			height="100" width="321" 
			src="<%= (String)request.getContextPath()  %>/images/FromMCA/LOGOQ_RNM.bmp">
		</td><td>
	
	

	</td></tr></table>
	
</div> 

