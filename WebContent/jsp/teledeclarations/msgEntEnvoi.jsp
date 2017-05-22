
<td class="BACKG"> 

<p>&nbsp;</p>
<p>&nbsp;</p>
<table  align="center" width="80%" class="ENTETE">
  <tr>
      
    <td  width="12" align="left" ><html:img page="/images/info.gif" border="0"/> </td>
    <td width="1%" align="center" > </td>
    <td width="85%" height="18" align="left"> 
    
<%if((session.getAttribute("logtype")!=null) && (session.getAttribute("logtype").equals("E"))){%>
<layout:message key="title.msg.ent"/>
<%}else{%>
<layout:message key="title.msg.grp"/>
<%}%>

</td>
<td width="5%" align="center" ></td>
</tr>
</table>
<layout:panel   styleClass="CORPS_ADRESSE" key="" width="80%" align="center">
<p>&nbsp;</p>
<strong>
<html:errors/>
</strong> 
<p>&nbsp;</p>
</layout:panel>

</td>
</tr>
</table>

<