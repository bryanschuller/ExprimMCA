<%@ include file="/declaration/taglibs.jsp"%>
         
                       
<H1 >
	<div class="texteH">
		<layout:message key="appcot.titre"/>
	</div>
	<div class="iconesH">
		<a href="<%= (String)request.getContextPath()  %>/retourArriere.do<%= (null != (String)request.getAttribute("pileRequestReqParam")?(String)request.getAttribute("pileRequestReqParam"):"") %>"><html:img page="/images/RETURN.gif" alt="Retour" border="0"/></a>
	</div>
</H1>
<br>

<!-- <a href="javascript:window.print()"><html:img page="/images/PRINT.gif" alt="imprimer la page" border="0"/></td>
-->

<logic:present name="lstappelscot">
	
	<div id="EXC_PRESENT_DATA_1">
	
		<layout:panel  styleClass="EXC_NONE" key="" width="98%" align="center">
		
			<layout:pager linksLocation="top" maxPageItems="12"  styleClass="PAGER">
			
				<layout:collection  name="lstappelscot" id="lstapp" title="" styleClass="LIGNE_A" styleClass2="LIGNE_B" >
				 	
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
	
</logic:present>


<logic:notPresent name="lstappelscot">			
	<div id="EXC_MESSAGE_PRESTA">
		<strong>
			<html:errors/>
		</strong>     
	</div><br style="clear:both;"> 			
</logic:notPresent>



