
<%@ include file="/declaration/taglibs.jsp"%>
<%@ page import="java.util.Calendar" %>

<!-- div style="position:absolute; left:-300px;" class="pay_vis">
	<img border="0" alt="MCA � Strasbourg" src="<%= (String)request.getContextPath()  %>/images/bandeau_site_MCA_v3.fw.png">
</div --> 

<%
	Calendar cal=Calendar.getInstance();
	// System.out.println(cal.get(Calendar.DAY_OF_YEAR));
	int mois = cal.get(Calendar.MONTH) + 1;
	String todayA = "Le " + cal.get(Calendar.DAY_OF_MONTH) + "/" + mois + "/" + cal.get(Calendar.YEAR);
%>

<a href="/extranet/" class="logo" ></a>
<nav class="navbar navbar-static-top" role="navigation">
	<a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
	    <span class="sr-only">Toggle navigation</span>
	</a>
	<p class="navbar-text">
	<!--
		<logic:present name="internaute">
			<div id="EXC_MESSAGE_INFO" style="margin-left:50px; width:350px;">
				<table width="100%" align="center" border="0" cellpadding="0" cellspacing="0" class="pay_mask_imp">
			  		<tr><td>Internaute N� <layout:write name="internaute" property="idInternaute"/></td></tr>
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
	-->
        <small class="page-subtitle"></small>
    </p>

    <div class="navbar-custom-menu">
        <ul class="nav navbar-nav"></ul>
    </div>
</nav>
	
<div style="position:absolute; left:0;" class="pay_mask_imp">

	<table>
		<tr><td>		
			<img border="0" align="left" alt="MCA � Strasbourg" 
			height="100" width="321" 
			src="<%= (String)request.getContextPath()  %>/images/FromMCA/LOGOQ_RNM.bmp">
		</td><td>
	
	

	</td></tr></table>
	
</div> 

