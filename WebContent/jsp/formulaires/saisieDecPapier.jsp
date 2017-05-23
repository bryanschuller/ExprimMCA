<%@ include file="/declaration/taglibs.jsp"%>

<div>
	<div class="texteH">
		D�comptes sant�
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
					Vos d�comptes sont accessibles sur le site par le menu "Mes d�comptes sant�".<BR>
					Pour vos prochains d�comptes de prestations, simplifiez-vous la vie : fini le papier, les classements, ... <BR>
					Optez pour la d�mat�rialisation.<BR>
					Merci de nous indiquer votre pr�f�rence :<BR>
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
