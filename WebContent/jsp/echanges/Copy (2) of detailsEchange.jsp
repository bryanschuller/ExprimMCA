<%@ include file="/declaration/taglibs.jsp"%>


<H1>
	Détail d'un échange avec la mutuelle
</H1>
<br>


<div id="EXC_CONTENT_MIDDLE">

<div id="EXC_ECHANGES_1">
	<layout:panel>
		<form  name="repondreEchangeForm" method="POST" action="<%=(String) request.getContextPath() %>/repondreEchange.do" enctype="multipart/form-data">
		
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
		
			<div>			
			<table id="ECHANGE_REPONSE"><tr><td>
					Votre réponse :
		
					<input type="hidden" name="action" value="sendForm">
				</td></tr><tr><td>
		
					<textarea name="corps" cols="45" rows="8" onchange="checkValue(this, 'corps','TEXT',true);"></textarea><img name="corpsrequired" src="<%= (String)request.getContextPath()  %>/images/ast.gif">
				
				</td></tr><tr><td>
					<input type="file" name="fichier" accept="<%= (String) session.getAttribute("extentionsAutorise") %>" size="40" value="">					
					<input type="submit" name="submit" value="Joindre" onclick="this.form.elements['action'].value='uploadFile'" class="BOUT1">
				</td></tr><tr><td>
				<logic:present name="lFile" scope="session">
					<div id="EXC_PRESENT_DATA_1"><table>
					
						<layout:collection name="lFile" id="lFile" title=""
							styleClass="LIGNE_A" styleClass2="LIGNE_B" 
							selectProperty="index"	selectType="checkbox" selectName="selIndex">
						
							<layout:collectionItem title="" property="blanck"/>
							
							<layout:collectionItem title="Nom du Fichier" property="nomVisible"/>
						
						</layout:collection>
						</table>
						<input type="submit" name="submit" value="Supprimer"  onclick="this.form.elements['action'].value='deleteFile'" class="BOUT1"> 
					</div>
					<script>document.getElementById('ECHANGE_REPONSE').style.display = 'block';</script>
				</logic:present>
				
				<strong>
					<html:errors/>
				</strong> 
				
				<input type="reset" value="Rétablir" class="BOUT1"> 
				<input type="submit" name="submit" value="Envoyer"  onclick="this.form.elements['action'].value='sendForm'" class="BOUT1"> 
				</td></tr></table>
								
			</div>
			
		
		
			
			<logic:iterate name="echangeActuel" property="messages" id="message" >
			
				
				<div class="ECHANGE_MSG_HEADER">
				
				<layout:write name="message"  property="auteur"  layout="false" type="auteurEchange"/>,
				 	
					le <layout:write name="message"  property="date"  layout="false" type="dateYMD"/>
				    
				    à <layout:write name="message"  property="heure"  layout="false" type="heure"/> :
				  
				  	
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
										<a href="<%= (String)request.getContextPath()%>/telechargerPJ.do?id=<bean:write name="pj" property="index" />"> <layout:write name="pj" property="nomVisible" layout="false" /></a>								
									</li>					
								</logic:iterate>
							</ul>
						</td></tr>
					</table>
				</logic:notEmpty>
				<BR>
						
			</logic:iterate>
			
		</form>
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

	<logic:present name="listeDemandesDPD" scope="session">
		<%@ include file="/jsp/echanges/incl/incl_listeDemandesPredefinit.jsp"%>	
	</logic:present>

</div>



