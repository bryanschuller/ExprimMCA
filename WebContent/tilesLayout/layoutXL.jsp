
<%@ include file="/declaration/taglibs.jsp"%>


<%-- Layout component 
  parameters : title, header, menu, body, footer 
--%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% response.setContentType("application/vnd.ms-excel"); %> 
<layout:html layout="false">

			<p id="InfosAdherent">
				<em style="padding-left:4px;"><strong>DUPOND André, </strong></em>
 				vous consultez le dossier Adhérent N° <em><strong>25336</strong></em>
 				<em><strong>- Famille DUPOND</strong></em>
			</p>
			  				
			<tiles:insert attribute="body" />
	
		
</layout:html>
