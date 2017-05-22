<%@ include file="/declaration/taglibs.jsp"%>


<H1>
	Détail d'un échange avec la mutuelle
</H1>
<br>


<div id="EXC_CONTENT_MIDDLE">

<div id="EXC_ECHANGES_1">
	<layout:panel>
	
		<layout:form action="repondreEchange.do" focus="corps"  enctype="multipart/form-data"  reqCode="sendForm" >
		
			<div class="texteH">
				<layout:write name="echangeActuel" property="titre"  layout="false" />
			</div>					
			<div class="iconesH">
				<logic:notEqual name="echangeActuel" property="fin" value="99999999">
				    Echange du  <layout:write name="echangeActuel" property="debut" layout="false" type="dateYMD"/>
				  	au  <layout:write  name="echangeActuel" property="fin" layout="false"  type="dateYMD"/>
				</logic:notEqual>
				
				<logic:equal name="echangeActuel" property="fin" value="99999999">
				     Echange ouvert le  <layout:write name="echangeActuel" property="debut" layout="false" type="dateYMD"/>	  
				</logic:equal>
			</div>
		
			<div id="ECHANGE_REPONSE">
			Votre réponse :
		
			<textarea name="corps" cols="45" rows="8" onchange="checkValue(this, 'corps','TEXT',true);"></textarea><img name="corpsrequired" src="<%= (String)request.getContextPath()  %>/images/ast.gif">
				
				
								<input type="file" name="fichier" accept="txt, csv, pdf, doc, xls" size="40" value="">
								
								<input type="submit" name="submit" value="Joindre" onclick="alert('Non implémenté en version de démonstration');return false;" class="BOUT1">
				
				<input type="reset" value="Rétablir" class="BOUT1"> 
				<input type="submit" name="submit" value="Envoyer"  onclick="alert('Non implémenté en version de démonstration');return false;" class="BOUT1"> 
				
				<br><br>
			
			</div>
			<br> 
		
		
			
			<logic:iterate name="echangeActuel" property="messages" id="message" >
			
				
				<div class="ECHANGE_MSG_HEADER">
				
					Le <layout:write name="message"  property="date"  layout="false" type="dateYMD"/>
				    
				    à <layout:write name="message"  property="heure"  layout="false" type="heure"/>,
				  
				  	<logic:equal name="message" property="auteur" value="*INT">
				    		vous avez dit :
				 	</logic:equal>
				 	<logic:notEqual name="message" property="auteur" value="*INT">
				    		la Mutuelle a dit :
				 	</logic:notEqual>
				</div>
				
				<div class="ECHANGE_MSG_CORPS">
			    	<layout:write name="message"  property="message"  layout="false" filter="false"/>
				</div>
				
			
				<logic:notEmpty name="message" property="piecesJointe" >
					<table class="LISTE_PJ" cellspacing="0" cellpadding="0">
						<tr><th>
							Pièces jointes :
						</th><td>
							<ul>
								<logic:iterate name="message" property="piecesJointe" id="pj" >
									<li>
										<a href="<%= (String)request.getContextPath()%>/telechargerPJ.do?id=<bean:write name="pj" property="nomFichier" />"> <layout:write name="pj" property="nomVisible" layout="false" /></a>								
									</li>					
								</logic:iterate>
							</ul>
						</td></tr>
					</table>
				</logic:notEmpty>
				<BR>
						
			</logic:iterate>
			
		
		</layout:form>
	</layout:panel>
</div>
<br>
</div>


<div id="EXC_CONTENT_RIGHT">

<div style="margin-left: 40px">
<h2>Actions</h2>
</div>

<ul>
	<li><a href="<%= (String) request.getContextPath() %>/echangeMsg.do?action=initForm">Ouvrir un echange</a></li>
	<logic:equal name="echangeActuel" property="fin" value="99999999">
		<li><a href="" onclick="document.getElementById('ECHANGE_REPONSE').style.display = 'block';return false;">Envoyer une réponse</a></li>
	</logic:equal>
</ul>


</div>



