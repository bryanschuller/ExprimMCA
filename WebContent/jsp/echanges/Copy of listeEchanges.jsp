<%@ include file="/declaration/taglibs.jsp"%>


<H1>
	Liste des échanges avec la mutuelle
</H1>
<br>

<logic:iterate name="lEchange" id="echange"  indexId="ind">
<div id="EXC_ECHANGES_1">
<layout:panel>
	<layout:row>
	    	<a href="<%= (String)request.getContextPath()%>/detailsEchange.do?id=<bean:write name="echange" property="index" />"> <layout:write name="echange" property="titre"  layout="false" /> </a>
	</layout:row>
	
	<logic:notEmpty name="echange" property="fin" >
	<layout:row>
	    Ouverture le  <layout:write name="echange" property="debut" layout="false" />
	  	jusqu'au  <layout:write  name="echange" property="fin" layout="false" />
	</layout:row>
	</logic:notEmpty>
	
	<logic:empty name="echange" property="fin">
	<layout:row>
	    Depuis le  <layout:write name="echange" property="debut" layout="false"/>
	  
	</layout:row>
	</logic:empty>
	
	<layout:row>
	
		Le <layout:write name="echange"  property="lastMsgDate"  layout="false"/>
	    
	    à <layout:write name="echange"  property="lastMsgHeure"  layout="false"/>
	  
	  	<logic:equal name="echange" property="lastMsgAuteur" value="*INT">
	    		Vous avez dit 
	 	</logic:equal>
	 	<logic:notEqual name="echange" property="lastMsgAuteur" value="*INT">
	    		La Mutuelle a dit 
	 	</logic:notEqual>
	</layout:row>
	
	<layout:row>
	
	    	<layout:write name="echange"  property="lastMsgLigne1"  layout="false" filter="false"/>...
	</layout:row>
<br>
</layout:panel>
</div>

<BR>
</logic:iterate>

