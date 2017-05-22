<%@ include file="/declaration/taglibs.jsp"%>


          
                       



<H1 id="TITREDOSSIER">
	<div class="texteH">
	 <layout:message key="docWord.titre"/> 
	</div>
</H1>

<br>

<H2>
	<div class="texteH">
	 <layout:message key="docWord.liste.titre"/> 
	</div>
</H2>

<div class="row">
	<div class="col-xs-12">
		<div class="box box-mca-yellow">
    
			<layout:collection name="lstDocWord" id="lstDoc" title="" styleClass="LIGNE_A" styleClass2="LIGNE_B"  >
			  
			  <layout:collectionItem title="docWord.colonne.démarrer" style="width:50px;">
			  <a href="<%= (String)request.getContextPath()  %>/listeVarInDoc.do?idDoc=<bean:write name="lstDoc" property="WTXTID"/>" > <html:img page="/pictures/oeil.gif" alt="Démarrer la génération ..." border="0"/> </a>
			 </layout:collectionItem>
				
			<layout:collectionItem title="docWord.colonne.libelle" property="WTXTTXT" style="text-align:left;"/>
				
			</layout:collection>
    
</div>






