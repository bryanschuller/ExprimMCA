<%@ include file="/declaration/taglibs.jsp"%>

<H1>
	<div class="texteH">
	    D�comptes sant�
	</div>
	<div class="iconesH">
	</div>
</H1> 
<BR>

<layout:form action="/changementModeEnvoieDecomptes" styleClass="FORMULAIRE" width="80%" > 

<tr><td colspan="2" style="font-size:12px;">
	Vos d�comptes sont accessibles sur le site par le menu "Mes d�comptes sant�".<BR>
	Pour vos prochains d�comptes de prestations, simplifiez-vous la vie : fini le papier, les classements, ... <BR>
	Optez pour la d�mat�rialisation.<BR>
	Merci de nous indiquer votre pr�f�rence :<BR>&nbsp;
</td></tr>


<tr><td>
<table class="FORM_BEN" width="90%" align="center">
<tr><td colspan="2">
&nbsp; 
</td></tr>

<tr><td colspan="2">
	
	<table  align="center"><tr><td>
		<div id="EXC_PRESENT_DATA_1">
		
			<div style="text-align: left;">
				<layout:radios property="choix" layout="false" styleClass="FORM_BEN" value="<%= (String) session.getServletContext().getAttribute("selectChoixDecPapier") %>">
					<layout:options collection="listeChoixDecPapier" property="tabcod" labelProperty="tabdta" />
				</layout:radios>
			</div>
		
		</div>
	</td></tr></table>
	
</td></tr>
	

<tr><td colspan="2">
&nbsp; <html:errors/>
</td></tr>

</table>
</td></tr>

<tr><td colspan="4">&nbsp;</td></tr>


<layout:formActions> 
<layout:row>
<layout:submit styleClass="btn" property="submit" value="Valider" /> 
</layout:row>
</layout:formActions> 
</layout:form>

