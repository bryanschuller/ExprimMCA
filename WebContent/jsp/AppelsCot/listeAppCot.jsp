<%@ include file="/declaration/taglibs.jsp"%>
         
                       
<H1>
	<div class="texteH">
		<layout:message key="appcot.titre"/>
	</div>
	<div class="iconesH">
		<a href="<%= (String)request.getContextPath()  %>/retourArriere.do<%= (null != (String)request.getAttribute("pileRequestReqParam")?(String)request.getAttribute("pileRequestReqParam"):"") %>"><i class="fa fa-arrow-left" data-toggle="tooltip" data-placement="bottom" data-original-title="Retour"></i></a>
	</div>
</H1>
<div class="clearfix"></div>

<logic:present name="lstappelscot">
	<div class="row">
		<div class="col-xs-12">
			<div class="box box-mca-yellow">
				<layout:panel  styleClass="EXC_NONE" key="" width="98%" align="center">
					<layout:pager linksLocation="top" maxPageItems="12"  styleClass="PAGER">
						<layout:collection  name="lstappelscot" id="lstapp" title="" styleClass="LIGNE_A" styleClass2="LIGNE_B" styleId="cotisationsList">
						 	
							<layout:collectionItem title="appcot.detail" >
								<logic:equal name="lstapp"  property="WTYPE" value="N" >
									<a href="<%= (String)request.getContextPath()  %>/viewDetAppCotN.do?id=<bean:write name="lstapp" property="indexAppCot"/>" > <html:img page="/pictures/oeil.gif" alt="voir le détail" border="0"/> </a>
								</logic:equal>
							</layout:collectionItem>
							
							<layout:collectionItem title="appcot.numeroappel" property="WNUMPIECE" />
							<layout:collectionItem title="appcot.echeance" property="WECHEANCE" />
							<layout:collectionItem title="appcot.type" property="WTYPE" />
							<layout:collectionItem title="appcot.mdp" property="WMODE" />
							<layout:collectionItem title="appcot.tot" property="WTOTHS" style="text-align:right;"/>
							<layout:collectionItem title="appcot.totnet" property="WTOTNET" style="text-align:right;"/>
						</layout:collection>
						<layout:row> 
						    <layout:pagerStatus key="pager.status.pager"/> 
						    <layout:pagerStatus key="pager.status.items"/> 
						</layout:row> 
					</layout:pager>
				</layout:panel>
			</div>
		</div>
	</div>
	<script type="text/javascript">
	    $(document).ready(function () {
			$($('#cotisationsList').find('tr:first').find("th")[5]).css({'text-align':'right'})
			$($('#cotisationsList').find('tr:first').find("th")[6]).css({'text-align':'right'})
	    });
	</script>
</logic:present>

<logic:notPresent name="lstappelscot">			
	<div class="callout callout-info">
		<strong>
			<html:errors/>
		</strong>     
	</div>
</logic:notPresent>



