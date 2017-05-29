<%@ include file="/declaration/taglibs.jsp"%>
<%@ page import="com.exprimweb.struts.modele.Internaute"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date"%>

<div class="box box-mca-yellow">
	<div class="box-header with-border">
		<h3 class="box-title">
			<bean:message key="libelle.contrat" />
		</h3>
	</div>
	<div class="box-body">
		<div class="row">
            <div class="col-xs-12">
                <div class="row">
                    <div class="col-xs-12 col-md-6"><label>Bénéficiaire</label></div>
                    <div class="col-xs-12 col-md-6"><bean:write name="contrat" property="designation"/></div>
                </div>
                <div class="row">
                    <div class="col-xs-12 col-md-6"><label>Produit</label></div>
                    <div class="col-xs-12 col-md-6"><bean:write name="contrat" property="libProduit"/></div>
                </div>
                <div class="row">
                    <div class="col-xs-12 col-md-6"><label>Du</label></div>
                    <div class="col-xs-12 col-md-6"><layout:write name="contrat" property="effetPeriode" type="dateYMD" layout="false"/></div>
                </div>
                <div class="row">
                    <div class="col-xs-12 col-md-6"><label>Au</label></div>
                    <div class="col-xs-12 col-md-6"><layout:write name="contrat" property="finPeriode" type="dateYMD" layout="false"/></div>
                </div>

				<%
					SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");
					Date date = null;
					Date today = new Date();
					date = dateFormat.parse("20160101");
					Internaute internaute = (Internaute) session.getAttribute("internaute");

					if ((null != internaute && internaute.getModeAcces().equals("SUP")) || date.before(today)) {
					%>	
						<logic:equal name="docCtrExged" value="O">
							<logic:notEqual name="contrat" property="docFicheGar" value="">
				                <div class="row">
				                    <div class="col-xs-12 col-md-6"><label>Fiche garantie</label></div>
				                    <div class="col-xs-12 col-md-6">
										<a href="<%= (String)request.getContextPath()  %>/docCtrExged.do?code=docFicheGar&id=<bean:write name="contrat" property="index"/>&userCode=USER_STD" target="_blank">
										<i class="fa fa-file-pdf-o" data-toggle="tooltip" data-placement="bottom" data-original-title="Obtenir une copie au format PDF"></i> (Télécharger la fiche)</a>
				                    </div>
				                </div>
							</logic:notEqual>
						</logic:equal>			
					<% } %>
            </div>
        </div>
	</div>
	<div>
		<font size="1" color="#3476B0"><html:errors/></font>
	</div>
</div>