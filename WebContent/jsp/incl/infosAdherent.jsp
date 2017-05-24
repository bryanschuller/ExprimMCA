<%@ include file="/declaration/taglibs.jsp"%>

<div class="box box-mca-yellow">
	<div class="box-header with-border">
		<h3 class="box-title">
			<logic:equal name="adherent" property="rangBenef" value="0">
				Adh�rent
			</logic:equal>
			<logic:greaterThan name="adherent" property="rangBenef" value="0">
				B�n�ficiaire
			</logic:greaterThan>
		</h3>
	</div>
	<div class="box-body">
		<div class="row">
            <div class="col-xs-12">
                <div class="row">
                    <div class="col-xs-12 col-md-6"><label>Nom</label></div>
                    <div class="col-xs-12 col-md-6"><bean:write name="adherent" property="nomPrenom"/></div>
                </div>
                <div class="row">
                    <div class="col-xs-12 col-md-6"><label>N� le</label></div>
                    <div class="col-xs-12 col-md-6"><layout:write name="adherent" property="dateNaissance" type="dateYMD" layout="false"/></div>
                </div>
                <div class="row">
                    <div class="col-xs-12 col-md-6"><label>N� S�curit� Sociale</label></div>
                    <div class="col-xs-12 col-md-6"><layout:write name="adherent" property="numRO" type="numSS" layout="false"/></div>
                </div>
                <div class="row">
                    <div class="col-xs-12 col-md-6"><label>R�gime obligatoire</label></div>
                    <div class="col-xs-12 col-md-6"><bean:write name="adherent" property="regObligA"/></div>
                </div>
                <div class="row">
                    <div class="col-xs-12 col-md-6"><label>T�l�transmission</label></div>
                    <div class="col-xs-12 col-md-6"><bean:write name="adherent" property="libCPAM"/></div>
                </div>
            </div>
        </div>
	</div>
</div>