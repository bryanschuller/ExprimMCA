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

<div class="box box-mca-yellow" id="EXC_CONTENT_ECHANGE_REPONSE2" style="display: none;">
	<div class="box-body">
		<layout:form action="repondreEchange.do" focus="corps" enctype="multipart/form-data"  reqCode="sendForm"> 
			<tr><td colspan="2">
				<table class="FORM_BEN" align="center">
					<layout:textarea key="info.envmsg.corps" property="corps" cols="50" rows="8"
					maxlength="1000" isRequired="true"/>
				</table>
			</td></tr>
			<tr><td colspan="2">
				&nbsp;
			</td></tr>

			<tr>
				<td colspan="2">	
					<table class="FORM_BEN" align="center">
					
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
				</td>
			</tr>
				
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
			</logic:present>

			<logic:present name="repError" scope="request">
				<script>document.getElementById('EXC_CONTENT_ECHANGE_REPONSE2').style.display = 'block';</script>
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
					<layout:reset styleClass="btn btn-danger" value="Rétablir"/> 
					<layout:submit styleClass="btn" property="submit" value="Envoyer" reqCode="sendForm"/> 
				</layout:row>
			</layout:formActions> 
		</layout:form>
	</div>
</div>

<div class="box box-mca-yellow">
	<div class="box-header with-border">
		<h3 class="box-title"><layout:write name="echangeActuel" property="titre"  layout="false" filter="false" /></h3>
	</div>
	<div class="box-body">
		<layout:panel>
				<logic:iterate name="echangeActuel" property="messages" id="message" >
					<div>
						<layout:write name="message"  property="auteur"  layout="false" type="auteurEchange"/>,
							le <layout:write name="message"  property="date"  layout="false" type="dateYMD"/>
						    à <layout:write name="message"  property="heure"  layout="false" type="heure"/> :
					</div>
					
					<blockquote>
				    	<layout:write name="message"  property="message"  layout="false" filter="false"/>
					</blockquote>
				
					<logic:notEmpty name="message" property="piecesJointe" >
						<table class="LISTE_PJ" cellspacing="0" cellpadding="0">
							<tr><th>
								Pièces jointes :
							</th><td>
								<ul class="list-group">
									<logic:iterate name="message" property="piecesJointe" id="pj" >
										<li class="list-group-item">
											<a href="<%= (String)request.getContextPath()%>/telechargerPJ.do?id=<bean:write name="pj" property="index" />"> <layout:write name="pj" property="nomVisible" layout="false" /></a>								
										</li>					
									</logic:iterate>
								</ul>
							</td></tr>
						</table>
					</logic:notEmpty>
				</logic:iterate>
		</layout:panel>
	</div>
	<div class="box-footer">
		<logic:notEqual name="echangeActuel" property="fin" value="99999999">
			Echange du  <layout:write name="echangeActuel" property="debut" layout="false" type="dateYMD"/>
			au  <layout:write  name="echangeActuel" property="fin" layout="false"  type="dateYMD"/>
		</logic:notEqual>

		<logic:equal name="echangeActuel" property="fin" value="99999999">
			Echange ouvert le  <layout:write name="echangeActuel" property="debut" layout="false" type="dateYMD"/>	
		</logic:equal>
	</div>
</div>

<div class="box box-mca-yellow">
	<div class="box-header with-border">
		<h3 class="box-title">
			Actions
		</h3>
	</div>
	<div class="box-body">
		<ul class="list-group">
			<li class="list-group-item"><a href="<%= (String) request.getContextPath() %>/echangeMsg.do?action=initForm">Ouvrir un echange</a></li>
			<logic:equal name="echangeActuel" property="fin" value="99999999">
				<li class="list-group-item"><a href="<%= (String) request.getContextPath() %>/repondreEchange.do?action=initForm" 
			onclick="document.getElementById('EXC_CONTENT_ECHANGE_REPONSE2').style.display = 'block';return false;">Envoyer une réponse</a></li>
			</logic:equal>
		</ul>
	</div>
		<logic:present name="listeDemandes" scope="session">
			<div class="box-footer">
				<%@ include file="/jsp/echanges/incl/incl_listeDemandesPredefinit.jsp"%>	
			</div>
		</logic:present>
</div>
