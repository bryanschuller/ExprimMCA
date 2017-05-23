<%@ include file="/declaration/taglibs.jsp"%>

<div>
	<div class="texteH">
		Décomptes santé
	</div>
	<div class="iconesH">
	</div>
</div>
<div class="clearfix"></div>

<div class="row">
	<div class="col-xs-12">
		<div class="box box-mca-yellow">
			<div class="box-body">
				<div class="bg-warning bg-lg" style="font-size:12px;">
					Vos décomptes sont accessibles sur le site par le menu "Mes décomptes santé".<BR>
					Pour vos prochains décomptes de prestations, simplifiez-vous la vie : fini le papier, les classements, ... <BR>
					Optez pour la dématérialisation.<BR>
					Merci de nous indiquer votre préférence :<BR>
				</div>
				<layout:form action="/changementModeEnvoieDecomptes"> 
					<div>
						<layout:radios property="choix" layout="false" value="<%= (String) session.getServletContext().getAttribute("selectChoixDecPapier") %>">
							<layout:options collection="listeChoixDecPapier" property="tabcod" labelProperty="tabdta" />
						</layout:radios>
					</div>
					<div>
						<html:errors/>
					</div>
					<div>
						<layout:formActions> 
							<layout:row>
								<layout:submit styleClass="btn btn-success" property="submit" value="Valider" /> 
							</layout:row>
						</layout:formActions> 
					</div>
				</layout:form>
			</div>
		</div>
	</div>
</div>
