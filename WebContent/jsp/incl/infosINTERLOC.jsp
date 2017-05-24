
<%@ include file="/declaration/taglibs.jsp"%>

<logic:present name="InfoInterloc" scope="session">
	<div class="box box-mca-yellow">
		<div class="box-header with-border">
			<h3 class="box-title">
				<i class="fa fa-envelope-square"></i>
				<bean:message key="adherent.principale.interlo" />
			</h3>
		</div>
		<div class="box-body">
			<div class="row">
				<div class="col-xs-12">
					<div class="row">
						<div class="col-xs-12 col-md-4">
							<label><bean:message key="info.interloc.tel" /></label>
						</div>
						<div class="col-xs-12 col-md-4">
							<layout:write name="InfoInterloc" property="telephone" layout="false"  type="numPhone"/>
						</div>
						<div class="col-xs-12 col-md-4">
							<a href="<%=(String) request.getContextPath()%>/changementTelephone.do?action=initForm"><layout:message key="libelle.modifier" /></a>
						</div>
					</div>
					<div class="row">
						<div class="col-xs-12 col-md-4">
							<label><bean:message key="info.interloc.mobile" /></label>
						</div>
						<div class="col-xs-12 col-md-4">
							<layout:write name="InfoInterloc" property="telephonePortable" layout="false" type="numPhone"/>
						</div>
						<div class="col-xs-12 col-md-4">
						</div>
					</div>
					<div class="row">
						<div class="col-xs-12 col-md-4">
							<label><bean:message key="info.interloc.telpro" /></label>
						</div>
						<div class="col-xs-12 col-md-4">
							<layout:write name="InfoInterloc" property="telephoneProfessionnel" layout="false"  type="numPhone"/>
						</div>
						<div class="col-xs-12 col-md-4">
						</div>
					</div>
					<div class="row">
						<div class="col-xs-12 col-md-4">
							<label><bean:message key="info.adh.mail" /></label>
						</div>
						<div class="col-xs-12 col-md-4">
							<layout:write name="InfoInterloc" property="adresseMail" layout="false" />
						</div>
						<div class="col-xs-12 col-md-4">
							<logic:notEqual name="nftActive" value="O">
								<a href="<%=(String) request.getContextPath()%>/loadAllEmails.do?type=Change">
								<layout:message key="libelle.modifier" /> </a>
							</logic:notEqual>
							<logic:equal name="nftActive" value="O">
								<a href="<%=(String) request.getContextPath()%>/loadAllEmails.do?type=Change">
								<layout:message key="libelle.modifier" /> </a>
							</logic:equal>
						</div>
					</div>
					<logic:equal name="nftActive" value="O">
						<div class="row">
							<div class="col-xs-12 col-md-4">
								<label><bean:message key="info.adh.mail.notification" /></label>
							</div>
							<div class="col-xs-12 col-md-4">
								<logic:equal name="InfoInterloc" property="notifMail" value="INEXISTS">
									Indéfini
								</logic:equal>
								<logic:notEqual name="InfoInterloc" property="notifMail" value="INEXISTS">
									<logic:equal name="InfoInterloc" property="notifMail" value="VALIDE">
										Notifications accéptées
									</logic:equal>
									<logic:notEqual name="InfoInterloc" property="notifMail" value="VALIDE">
										Notifications refusées
									</logic:notEqual>
								</logic:notEqual>
							</div>
							<div class="col-xs-12 col-md-4">
							</div>
						</div>
					</logic:equal>
				</div>
			</div>
		</div>
		<div class="box-footer">
			La MCA s'engage à ne pas divulguer les informations vous concernant.
		</div>
	</div>
</logic:present>