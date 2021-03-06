<%@ include file="/declaration/taglibs.jsp"%>
<%@ page import="com.exprimweb.struts.modele.*" %>
<%@ page import="java.util.Vector" %>






<div>
	<div class="texteH">
    	<layout:message key="title.envmsg.message"/>
    </div> 
   	<div class="iconesH">
		<a href="<%= (String)request.getContextPath()  %>/retourArriere.do<%= (null != (String)request.getAttribute("pileRequestReqParam")?(String)request.getAttribute("pileRequestReqParam"):"") %>"><i class="fa fa-arrow-left" data-toggle="tooltip" data-placement="bottom" data-original-title="Retour"></i></a>
	</div>
</div>
<div class="clearfix"></div>

<logic:present name="annotation" scope="request">
	<div class="callout callout-info">
		<layout:write name="annotation" filter="false"></layout:write>
	</div>
</logic:present>

<div class="box box-mca-yellow">
	<div class="box-body">
		<layout:form action="echangeMsg.do" focus="titre" enctype="multipart/form-data"  reqCode="sendForm" > 
			<tr><td colspan="2">

			<logic:present name="saisieLocked" scope="session">
				<table class="FORM_BEN" align="center">
					<layout:text key="info.envmsg.titre" property="titre" 
					size="50" maxlength="30" isRequired="true" readonly="true"/>
				
					<layout:textarea key="info.envmsg.corps" property="corps" cols="50" rows="8"
					maxlength="1000" isRequired="true" readonly="true"/>
				</table>
			</logic:present>

			<logic:notPresent name="saisieLocked" scope="session">
				<table class="FORM_BEN" align="center">
				<%-- 	<html:hidden property="service" value=""/> --%>
					<layout:text key="info.envmsg.titre" property="titre" 
					size="50" maxlength="30" isRequired="true"/>
				
					<layout:textarea key="info.envmsg.corps" property="corps" cols="50" rows="8"
					maxlength="1000" isRequired="true"/>
				</table>
			</logic:notPresent>

			</td></tr>
			<tr><td colspan="2">
				&nbsp;
			</td></tr>

			<logic:present name="lPiecesRequise" scope="session">

			<bean:size id="size" name="lPiecesRequise" property="listePieces"/>
			<logic:greaterThan name="size" value="0">

				<tr><td colspan="2">
					<table class="FORM_BEN" align="center">
						<tr><td>
							<layout:collection name="lPiecesRequise" property="listePieces" id="piece" title=""
								styleClass="LIGNE_A" styleClass2="LIGNE_B" >
								
								
								<layout:collectionItem title="Pi�ces requises" property="libelle"/>	
										
							</layout:collection>
						</td></tr>
					</table>
				</td></tr>
				<tr><td colspan="2">
					&nbsp;
				</td></tr>
				</logic:greaterThan>
			</logic:present>


			<script>
			function msg_Joindre(el){
				if (el.value != "") {
					el.form.elements['action'].value='uploadFile';
					document.getElementById("MSG_JOINDRE").style.display="block";
					el.form.submit();
				}
			}
			</script>

				
			<tr><td colspan="2">
				<table class="FORM_BEN" align="center">
				

			<%	ParametrageEchange paramEchange = (ParametrageEchange) getServletContext().getAttribute("paramEchange");  
				Vector lFile = (Vector) session.getAttribute("lFile");  
				if (lFile == null || lFile.size() < paramEchange.getNbrMaxPj()) {%>


					<tr>
					
					<td>

							<html:file size="40" property="fichier" onchange="msg_Joindre(this);" />
							
				<!--	</td>
							
					<td>
					 	<table>
						<layout:submit styleClass="btn" property="sJoin" 
							value="Joindre" reqCode="uploadFile"/>
						</table> -->				
					</td></tr>
					<tr><td colspan="2">
						<div id="MSG_JOINDRE" style="display:none;font-size:10px;color:red;">Envoie du document en cour ...</div>				
					</td></tr>
						
			<%} 
				
				else{ %>
				
				<tr>
					
					<td colspan="2">
					
							<strong><bean:message key="envoyer.piece.jointe.nbrmax.pj"/></strong>
							
					</td>
							
					</tr>
				
				
			<%	} %>
					

				
			<logic:present name="lFile" scope="session">
			 <bean:size name="lFile" id="size"/>
				<logic:greaterThan name="size" value="0">
				
					<tr><td colspan="2">
					<table class="LISTE_PJ">
					<tr><td><table>
							<layout:collection name="lFile" id="lFile" title=""
								styleClass="LIGNE_A" styleClass2="LIGNE_B" 
								selectProperty="index"	selectType="checkbox" selectName="selIndex" >
							
								<layout:collectionItem title="" property="blanck"/>
								
								<logic:equal name="size" value="1">
									<layout:collectionItem title="Fichier joint" property="nomVisible"/>
								</logic:equal>
								<logic:greaterThan name="size" value="1">
									<layout:collectionItem title="Fichiers joints" property="nomVisible"/>
								</logic:greaterThan>
							
							</layout:collection>
							</table></td><td><table>
							<layout:submit styleClass="btn" property="sDel" value="Supprimer les pi�ces s�lectionn�es" reqCode="deleteFile"/>
							</table></td></tr>
					</table>
					</td></tr>
				</logic:greaterThan>
			</logic:present>

			</table>
				</td></tr>
				
				<tr><td colspan="2">
				&nbsp;
			</td></tr>

			<tr><td colspan="2">


			<table align="center" >
				<logic:notPresent name="saisieLocked" scope="session">
				 	<logic:present name="listeServicesEchanges" scope="session"> 
						<layout:message key="info.echange.concerne"/>
					<bean:define id="lse" name="listeServicesEchanges" property="listeServicesEchanges" />
					<tr><td align="left">	
					<layout:radios property="service" layout="false">
						<layout:options collection="lse" property="code" labelProperty="libelle" />
					</layout:radios>
					</td></tr>
					</logic:present> 
				</logic:notPresent>
			</table>

			</td></tr>

			<layout:row>		
				<tr><td><strong>
				<html:errors/>
				</strong></td></tr>
			</layout:row>

			<tr><td colspan="2">
			&nbsp; 
			</td></tr>
			<tr><td colspan="2">
				<img name="corpsrequired" src="<%= (String)request.getContextPath()  %>/images/ast.gif"> <bean:message key="general.formulaire.obligatoire"/>
			</td></tr>

			<layout:formActions> 
			<layout:reset styleClass="btn btn-danger" value="R�tablir"/> 
			<layout:submit styleClass="btn btn-success" property="sAll" value="Envoyer" reqCode="sendForm"/> 
			</layout:formActions> 
		</layout:form>
	</div>
</div>