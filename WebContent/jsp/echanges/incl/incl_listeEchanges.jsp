<logic:iterate name="lEchange" id="echange"  indexId="ind">
	<div class="box box-mca-yellow">
		<div class="box-header with-border">
			<h3 class="box-title">
				<layout:write name="echange" property="titre"  layout="false" filter="false" />
				<a href="<%= (String)request.getContextPath()%>/detailsEchange.do?id=<bean:write name="echange" property="index" />">(détail)</a>
			</h3>

		 	<logic:equal name="echange" property="lastMsgPj" value="O">
 				<div class="box-tools pull-right">
		 			<img src="<%= (String)request.getContextPath()%>/images/echanges/tool-attach.gif"/>
				</div>
		    </logic:equal>	 	

			<logic:notEqual name="echange" property="fin" value="99999999">
			    Echange du  <layout:write name="echange" property="debut" layout="false" type="dateYMD"/>
			  	au  <layout:write  name="echange" property="fin" layout="false" type="dateYMD" />
			</logic:notEqual>
			
			<logic:equal name="echange" property="fin" value="99999999">
			     Echange ouvert le  <layout:write name="echange" property="debut" layout="false" type="dateYMD"/>	  
			</logic:equal>
		</div>
		<div class="box-body">
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

	</div>
</logic:iterate>