<%@ include file="/declaration/taglibs.jsp"%>
<%@ page import="java.util.Vector" %>

<%@ page import="com.exgedweb.struts.modele.ListeDocExged" %>
<%@ page import="com.exgedweb.struts.modele.EnregDocExged" %>
<%@ page import="com.exgedweb.struts.dtb.DbChargement1PARAM" %>

<%@ page import="org.apache.log4j.Logger" %>

<%-- Layout component 
  parameters : title, header, menu, body, footer 
--%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<layout:html layout ="false">

<div id="container">

	<div id="header">
		<tiles:insert page="/tilesLayout/header.jsp"/>
	</div>
  
	<div class="content">
		<div id="panneauCentre"> <!-- pour compatibilité avec footer_incl_commun  -->
		    
		    
		    <%
		    
		    DbChargement1PARAM dbc1p = new DbChargement1PARAM();
			String paramValue = dbc1p.Get1PARAM("GENERAL", "EXGED_PATH");
			session.setAttribute("EXGED_PATH", paramValue);
		    
		    
		    ListeDocExged lde = (ListeDocExged) session.getAttribute("docExged_TEST");
		    EnregDocExged ede;
		    if (null == lde){
		    	lde = new ListeDocExged();
		       
		   		ede = new EnregDocExged();
		    	Vector<EnregDocExged> vlde = new Vector();
		    
		    	ede.setDocIndex(1);
		    	ede.setDocNum(63120);
		    	
		    	vlde.add(ede);
		    	lde.setListeEnreg(vlde);
		    
		    	session.setAttribute("docExged_TEST", lde);
		    }
			
		    %>
  				
			<div class="LOGIN_BACKG" align="center">  
			
				
				<br/><br/><br/><br/><br/><br/>
				
				<div id="EXC_MESSAGE_INFO_ERREUR_RED">
				
				<strong><%= (String) session.getAttribute("EXGED_PATH") %></strong><BR>
				
				<strong><%= (String) ((ListeDocExged) session.getAttribute("docExged_TEST")).toString() %></strong><BR>
				<strong>Document EXGED de test ==> </strong><a href="<%= (String)request.getContextPath()  %>/telechargerDocExged.do?name=TEST&indexDoc=1&userCode=USER_STD">Télécharger !</a>
				
				
				</div>

			</div>
		 
		</div> <!-- Fin "PANNEAUPRINCIPAL" du header -->
	
		<div id="footerMCA">
		    <tiles:insert page="/tilesLayout/footer.jsp"/>
		</div>
	  
	</div> <!-- Fin "content" du header -->
</div> <!-- Fin "container" du header -->


		
</layout:html>
