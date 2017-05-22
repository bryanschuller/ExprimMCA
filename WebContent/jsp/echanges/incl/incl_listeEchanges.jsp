


	<logic:iterate name="lEchange" id="echange"  indexId="ind">
		<div id="EXC_ECHANGES_1">
			<layout:panel>
			
				<div class="texteH">
					<layout:write name="echange" property="titre"  layout="false" filter="false" />
					<a href="<%= (String)request.getContextPath()%>/detailsEchange.do?id=<bean:write name="echange" property="index" />">(détail)</a>
				</div>					
				<div class="iconesH">
					<logic:notEqual name="echange" property="fin" value="99999999">
					    Echange du  <layout:write name="echange" property="debut" layout="false" type="dateYMD"/>
					  	au  <layout:write  name="echange" property="fin" layout="false" type="dateYMD" />
					</logic:notEqual>
					
					<logic:equal name="echange" property="fin" value="99999999">
					     Echange ouvert le  <layout:write name="echange" property="debut" layout="false" type="dateYMD"/>	  
					</logic:equal>
				</div>
				
				
				
				<div class="ECHANGE_MSG_HEADER">
					<div class="texteH">
					
						<a href="<%= (String)request.getContextPath()%>/detailsEchange.do?id=<bean:write name="echange" property="index" />">
							<logic:notEqual name="echange" property="lastMsgFirstConsult" value="0">
						    	<img src="<%= (String)request.getContextPath()%>/images/echanges/icon-msg-read.gif"/>
							</logic:notEqual>
							<logic:equal name="echange" property="lastMsgFirstConsult" value="0">
						    	<img src="<%= (String)request.getContextPath()%>/images/echanges/icon-msg-unread.gif"/>
							</logic:equal>
						</a>
				
						
						Dernier message le <layout:write name="echange"  property="lastMsgDate"  layout="false" type="dateYMD"/>
					    
					    à <layout:write name="echange"  property="lastMsgHeure"  layout="false" type="heure"/>,
					  
					  	par <layout:write name="echange"  property="lastMsgAuteur"  layout="false" type="auteurEchange"/>.
				
				 	</div>					
					<div class="iconesH">
					 	<logic:equal name="echange" property="lastMsgPj" value="O">
					 		<img src="<%= (String)request.getContextPath()%>/images/echanges/tool-attach.gif"/>
						
					 	<!-- 	Avec pièces jointes   -->
					    </logic:equal>	 	
				 	</div>
				</div>
				
			<!-- 	<div class="ECHANGE_MSG_CORPS_LIMITED">				
			    	<layout:write name="echange"  property="lastMsgLigne1"  layout="false" filter="false"/>...
				</div>	-->
			</layout:panel>
		</div>
		
		<BR>
	</logic:iterate>


