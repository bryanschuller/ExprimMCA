<%@ include file="/declaration/taglibs.jsp"%>
<%@ page import="com.exprimweb.struts.modele.*" %>

<H2>
	<div class="texteH">
		<bean:message key="info.ent.interlocuteur" />
	</div>
</H2>

<div class="row">
	<div class="col-xs-12">
		<div class="box box-mca-yellow">

			<layout:collection name="listeInterlocuteurs" id="interlocuteur" title="" styleClass="LIGNE_A" styleClass2="LIGNE_B" >

				<layout:collectionItem  title="Nom" property="nom"/>
				<layout:collectionItem  title="Fonction" property="fonction"/>
				<layout:collectionItem  title="E-Mail" property="adresseMail"/>
				<layout:collectionItem title="&nbsp;">
					<logic:equal name="interlocuteur" property="numInterlocuteur" value="<%= String.valueOf((Integer) ((Interlocuteur) session.getAttribute("InfoInterloc")).getNumInterlocuteur()) %>">
						<a href="<%=(String) request.getContextPath()%>/modifierInfoInterlocuteur.do?action=initForm"><layout:message key="libelle.modifier" /></a>
					 </logic:equal>
				</layout:collectionItem>
				
			</layout:collection>
		</div>
	</div>
</div>



