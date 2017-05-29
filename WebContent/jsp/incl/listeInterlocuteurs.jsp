<%@ include file="/declaration/taglibs.jsp"%>
<%@ page import="com.exprimweb.struts.modele.*" %>

<div class="row">
	<div class="col-xs-12">
		<div class="box box-mca-yellow">
			<div class="box-header with-border">
				<h3 class="box-title">
					<bean:message key="info.ent.interlocuteurs" />
				</h3>
			</div>

			<div class="box-body">
				<layout:collection name="listeInterlocuteurs" id="interlocuteur" title="" styleClass="LIGNE_A" styleClass2="LIGNE_B" >
					<layout:collectionItem title="Nom" property="nom"/>
					<layout:collectionItem title="Fonction" property="fonction"/>
					<layout:collectionItem title="E-Mail" property="adresseMail"/>
					<layout:collectionItem title="&nbsp;">
						<logic:equal name="interlocuteur" property="numInterlocuteur" value="<%= String.valueOf((Integer) ((Interlocuteur) session.getAttribute("InfoInterloc")).getNumInterlocuteur()) %>">
							<div class="btn-group">
								<a href="<%=(String) request.getContextPath()%>/modifierInfoInterlocuteur.do?action=initForm" class="btn btn-flat btn-sm btn-default"><i class="fa fa-pencil"></i><span class="hidden-sm hidden-xs"><layout:message key="libelle.modifier" /></span></a>
							</div>
						</logic:equal>
					</layout:collectionItem>
				</layout:collection>
			</div>
		</div>
	</div>
</div>



