<%@ include file="/declaration/taglibs.jsp"%>
<%@ page import="com.exprimweb.struts.modele.*" %>
<%@ page import="java.util.Vector" %>

<div>
	<div class="texteH">
		Détail d'un échange avec la mutuelle
	</div>
	<div class="iconesH">
		<a href="<%= (String)request.getContextPath()  %>/retourArriere.do<%= (null != (String)request.getAttribute("pileRequestReqParam")?(String)request.getAttribute("pileRequestReqParam"):"") %>"><i class="fa fa-arrow-left" data-toggle="tooltip" data-placement="bottom" data-original-title="Retour"></i></a>
	</div>
</div>
<div class="clearfix"></div>


<div id="EXC_CONTENT_ECHANGE_REPONSE">


<layout:form action="repondreEchange.do" focus="corps" style="box box-mca-yellow" enctype="multipart/form-data"  reqCode="sendForm"> 



<tr><td colspan="2">

	<table class="FORM_BEN" width="90%" align="center">
		<layout:textarea key="info.envmsg.corps" property="corps" cols="50" rows="8"
		maxlength="1000" isRequired="true"/>
	</table>
	
</td></tr>
<tr><td colspan="2">
	&nbsp;
</td></tr>



<tr><td colspan="2">	
	<table class="FORM_BEN" width="90%" align="center">
	
	<%	ParametrageEchange paramEchange = (ParametrageEchange) getServletContext().getAttribute("paramEchange");  
	Vector lFile = (Vector) session.getAttribute("lFile");  
	if (lFile == null || lFile.size() < paramEchange.getNbrMaxPj()) {%>
	
	
	
		<tr><td>
			<html:file size="40" property="fichier"	/>		
		</td><td>
			<table>
			<layout:submit styleClass="btn" property="submit" 
				value="Joindre" reqCode="uploadFile"/>
			</table>				
		</td></tr>
		
		<%} 
	
	else{ %>
	
		<tr>
			<td>
				<strong><bean:message key="envoyer.piece.jointe.nbrmax.pj"/></strong>
			</td>
		</tr>
<%	} %>
		
		
		
		
		
	</table>
</td></tr>
	
<logic:present name="lFile" scope="session">
	<bean:size name="lFile" id="size"/>
	<logic:greaterThan name="size" value="0">
		<tr><td colspan="2">
			<layout:collection name="lFile" id="lFile" title=""
				styleClass="DONNE_100p100" styleClass2="DONNE_INTER_100p100" 
				selectProperty="index"	selectType="checkbox" selectName="selIndex" >
			
				<layout:collectionItem title="" property="blanck"/>
				
				<layout:collectionItem title="Nom du Fichier" property="nomVisible"/>
			
			</layout:collection>
			
			<layout:submit styleClass="btn" property="submit" value="Supprimer" reqCode="deleteFile"/>
			
		</td></tr>
	</logic:greaterThan>	
	<script>document.getElementById('EXC_CONTENT_ECHANGE_REPONSE').style.display = 'block';</script>			
</logic:present>

<logic:present name="repError" scope="request">
	<script>document.getElementById('EXC_CONTENT_ECHANGE_REPONSE').style.display = 'block';</script>
</logic:present>

<layout:row>
<tr><td>		
	<strong>
	<html:errors/>
	</strong> 
</td></tr>
</layout:row>

<tr><td colspan="2">
&nbsp; 
</td></tr>

<tr><td colspan="2">
	<img name="corpsrequired" src="<%= (String)request.getContextPath()  %>/images/ast.gif"> <bean:message key="general.formulaire.obligatoire"/>
</td></tr>



<layout:formActions> 
<layout:row>
<layout:reset styleClass="btn" value="Rétablir"/> 
<layout:submit styleClass="btn" property="submit" value="Envoyer" reqCode="sendForm"/> 
</layout:row>
</layout:formActions> 
</layout:form>

</div>

<div id="EXC_CONTENT_MIDDLE">

<div id="EXC_ECHANGES_1">
	<layout:panel>
		
			<div class="texteH">
				<layout:write name="echangeActuel" property="titre"  layout="false" filter="false" />
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
			<li><a href="<%= (String) request.getContextPath() %>/repondreEchange.do?action=initForm" 
			onclick="document.getElementById('EXC_CONTENT_ECHANGE_REPONSE').style.display = 'block';return false;">Envoyer une réponse</a></li>
		</logic:equal>
	</ul>

	<logic:present name="listeDemandes" scope="session">
		<%@ include file="/jsp/echanges/incl/incl_listeDemandesPredefinit.jsp"%>	
	</logic:present>

</div>

