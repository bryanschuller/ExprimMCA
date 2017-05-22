<%@ include file="/declaration/taglibs.jsp"%>


          
                       
<td class="BACKG">

   

<p><br></p>

<table align="center" width="98%" class="ENTETE">
  <tr>
    <td width="1%" align="center" > </td>
    <td width="85%" height="18" align="left"> <layout:message key="docWord.liste.titre"/> </td>
    </tr>
</table>

<layout:panel   styleClass="CORPS_DONNE" key="" width="98%" align="center">
<table width="100%" border="0" valign="top" align="center" cellspacing="0" >



<tr>
    <td>
    
<layout:collection name="lstVarInDoc" id="lstVar" title="" styleClass="DONNE_100p100" styleClass2="DONNE_INTER_100p100"  >
  
<layout:collectionItem title="docWord.colonne.libelle" property="TP3VAR"  width="15%"/>
<layout:collectionItem title="docWord.colonne.libelle" property="TP3LIB"  width="35%"/>
<layout:collectionItem title="docWord.colonne.libelle" property="TP3LON"  width="10%"/>
<layout:collectionItem title="docWord.colonne.libelle" property="TP3PGM"  width="10%"/>
<layout:collectionItem title="docWord.colonne.libelle" property="TP3CAT"  width="10%"/>
<layout:collectionItem title="docWord.colonne.libelle" property="TP3RAN"  width="10%"/>
<layout:collectionItem title="docWord.colonne.libelle" property="TP3TRI"  width="10%"/>
	
</layout:collection>
    
	</td>
</tr>

</table>

</layout:panel>

</td>





