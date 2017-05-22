<%@ include file="/declaration/taglibs.jsp"%>
<%@ page import="com.exprimweb.struts.modele.*"%>

<% Contrat ctr = (Contrat) request.getAttribute("contrat"); 
                if(!ctr.getDocFicheGar().equals("") || !ctr.getDocAdjonction().equals("") || !ctr.getDocRgltMut().equals("")){%>

<H2>
	<div class="texteH">
		Télécharger
	</div>	
			
</H2>
<div id="EXC_PRESENT_DATA_1" style="width:300px;margin-left:80px;">
		<p class="LIGNE_A"></p><table cellspacing="0" cellpadding="0" border="0" align="CENTER" class="LIGNE_A"><tr><td valign="top"><table cellspacing="1" cellpadding="1" border="0" width="100%">

	<tr valign="top">
		<th class="LIGNE_A" width="15%">&nbsp;</th>
		<th class="LIGNE_A" width="85%">&nbsp;</th>
	</tr>
	
	<logic:notEqual name="contrat" property="docFicheGar" value="">
		<tr>
			<td class="LIGNE_B"><a href="<%= (String)request.getContextPath()  %>/documentServe.do?code=docFicheGar" target="_blank">
				<img src="<%= (String)request.getContextPath()  %>/images/docpdf.gif" height="14" width="14"></a>
				</td>
			<td class="LIGNE_B" style="text-align:left;">Résumé de la garantie</td>
		</tr>
	</logic:notEqual>
	
	<logic:notEqual name="contrat" property="docRgltMut" value="">
		<tr>
			<td class="LIGNE_A"><a href="<%= (String)request.getContextPath()  %>/documentServe.do?code=docRgltMut" target="_blank">
				<img src="<%= (String)request.getContextPath()  %>/images/docpdf.gif" height="14" width="14"></a>
				</td>
			<td class="LIGNE_A" style="text-align:left;">Règlement mutualiste</td>
		</tr>
	</logic:notEqual>
	
	<logic:notEqual name="contrat" property="docAdjonction" value="">
		<tr>
			<td class="LIGNE_B"><a href="<%= (String)request.getContextPath()  %>/documentServe.do?code=docAdjonction" target="_blank">
				<img src="<%= (String)request.getContextPath()  %>/images/docpdf.gif" height="14" width="14"></a>
				</td>
			<td class="LIGNE_B" style="text-align:left;">Bulletin d'adjonction</td>
		</tr>
	</logic:notEqual>
	
	
	</table></td></tr></table>
</div>
<br>

<% } %>

