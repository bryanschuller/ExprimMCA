<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<%@ page import="org.apache.commons.fileupload.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<table border="1" cellpadding="5" width="100%" align="center">
<tr><td colspan="2" bgcolor="#0066cc"><font color="#FFFFCC" size="+1" align="center">Files Uploaded</font></td></tr>
<tr  bgcolor="#ffff00"><td><nobr>File Name</nobr></td>
	<td align="right"><nobr>File size</nobr></td></tr>
<%
	/*
	 * This is a sample jsp script that demonstrates handling file uploads using
	 * jsp. It is provided free of charge and with no warranty.
	 * In order to make use of this JSP you need to have the commons file upload
	 * library installed.
	 */

		int i=0;

		/*
		 * Use a pathname that the servlet container has write permissions as
		 * your save path. 
		 */
		String savePath="";
		String parentPath=request.getParameter("userfile_parent");

        try {

			System.out.println(	"CONTENT-LENGHT" +	request.getContentLength());
			System.out.println("session id = " + session.getId());

            DiskFileUpload fu = new DiskFileUpload();
            // maximum size before a FileUploadException will be thrown
            fu.setSizeMax(5000000);
            // maximum size that will be stored in memory
            fu.setSizeThreshold(4096);
            // the location for saving data that is larger than getSizeThreshold()
            fu.setRepositoryPath("/tmp");

            List fileItems = fu.parseRequest(request);
            Iterator item = fileItems.iterator();
		    while(item.hasNext())
			{
				FileItem fi = (FileItem) item.next();
				if(fi.isFormField())
				{
					continue;
				}

			    String[] parts = fi.getName().split("/");
				String fileName = parts[parts.length-1];

				if(fileName != null && !fileName.equals(""))
				{
					if( (i %2)==1)
				    {
						out.print("<tr  bgcolor='#FFFF99'>");
				    }
					else
					{
						out.print("<tr>");
					}
					out.println("<td>"+ fileName +"</td><td>" + fi.getSize() +"</td></tr>");
					i++;

					if(! savePath.equals(""))
					{
						File f = new File(savePath + fileName);
						System.out.println("f = " + f.getAbsolutePath());
						fi.write(f);
					}
				}
			}
        }
        catch (Exception ex) {
         //   ex.printStackTrace();
        }

%>


</table>
<p>&nbsp;</p>

<p style="text-align:center;">Sample JSP Upload handler provided by
 <a href="http://www.radinks.com/?dn">Rad Inks</a></p>
 <p>&nbsp;</p>
<p style="text-align:center;">have you seen our <a href="http://www.radinks.com/sftp/?dn">Secure FTP Applet</a> or &nbsp;
our <a href="http://www.radinks.com/mms/?dn">Multimedia Messaging Solution</a>?</p>

</body>

</html>