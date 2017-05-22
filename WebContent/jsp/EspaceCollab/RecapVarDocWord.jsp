<%@ include file="/declaration/taglibs.jsp"%>
          
                       
<H1 id="TITREDOSSIER">
	<div class="texteH">
	 <layout:message key="docWord.titre"/> 
	</div>
</H1>

<br>

<H2>
	<div class="texteH">
	 <layout:message key="docWord.recap.liste.titre"/> 
	</div>
</H2>

<br>

<div id="EXC_PRESENT_DATA_COL_1">


	<table>   
		<logic:iterate id="lstVar" name="lstVarInDoc">
			<tr>
				<th><layout:write name="lstVar" property="WLIB" layout="false"/></th>
				<td><layout:write name="lstVar" property="WVAL" layout="false"/></td>
			</tr>	
		</logic:iterate>
	</table>

</div>
<br>

<div style="margin-left:200px">

    <bean:define id='pStep' name="pStep"/>
	
    <input type="button" value="Annuler" onclick="location.href='<%= (String)request.getContextPath()  %>/listeDocWord.do'" class="BOUT1"/>
    
    <input type="button" value="Précédent" onclick="location.href='<%= (String)request.getContextPath()  %>/backVarDoc.do?step=<%= pStep %>'" class="BOUT1"/>
    <input type="button" value="Générer le document" onclick="location.href='<%= (String)request.getContextPath()  %>/genDocWord.do'" class="BOUT1"/>
     
</div>









