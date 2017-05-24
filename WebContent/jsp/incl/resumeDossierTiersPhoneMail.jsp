<%@ include file="/declaration/taglibs.jsp"%>

<logic:present name="InfoInterloc" scope="session">
	<div class="box box-mca-yellow">
		<div class="box-header with-border">
			<h3 class="box-title">
				<bean:message key="tiers.principale.phone.mail" />
			</h3>
		</div>
		<div class="box-body">
			<div class="row">
				<div class="col-xs-12">
					<div class="row">
						<div class="col-xs-12 col-md-4">
							<label><bean:message key="tiers.interloc.tel" /></label>
						</div>
						<div class="col-xs-12 col-md-4">
							<layout:write name="InfoInterloc" property="telephone" layout="false"  type="numPhone"/>
						</div>
						<div class="col-xs-12 col-md-4">
							<a href="<%=(String) request.getContextPath()%>/modifierInfoInterlocuteur.do?action=initForm"><layout:message key="libelle.modifier" /></a>
						</div>
					</div>
					<div class="row">
						<div class="col-xs-12 col-md-4">
							<label><bean:message key="tiers.interloc.mobile" /></label>
						</div>
						<div class="col-xs-12 col-md-4">
							<layout:write name="InfoInterloc" property="telephonePortable" layout="false" type="numPhone"/>
						</div>
						<div class="col-xs-12 col-md-4">
						</div>
					</div>
					<div class="row">
						<div class="col-xs-12 col-md-4">
							<label><bean:message key="tiers.interloc.telpro" /></label>
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
							<a href="<%=(String) request.getContextPath()%>/loadAllEmails.do?type=Change"><layout:message key="libelle.modifier" /></a>
						</div>
					</div>
					<logic:equal name="nftActive" value="O">
						<div class="row">
							<div class="col-xs-12 col-md-4">
								<label><bean:message key="info.adh.mail.notification" /></label>
							</div>
							<div class="col-xs-12 col-md-4">
								<logic:equal name="InfoInterloc" property="notifMail" value="INEXISTS">
									Ind�fini
								</logic:equal>
								<logic:notEqual name="InfoInterloc" property="notifMail" value="INEXISTS">
									<logic:equal name="InfoInterloc" property="notifMail" value="VALIDE">
										Notifications acc�pt�es
									</logic:equal>
									<logic:notEqual name="InfoInterloc" property="notifMail" value="VALIDE">
										Notifications refus�es
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
	</div>
</logic:present>