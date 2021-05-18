<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.io.*,java.util.*" %>
<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="org.apache.commons.fileupload.disk.*" %>
<%@ page import="org.apache.commons.fileupload.servlet.*" %>
<%@ page import="pack.*" %>
<%@ page import="org.apache.commons.net.ftp.FTPClient" %>
         
<%
    FTPClient ftpClient = new FTPClient();
    String result=null;
    
    try {
        
        result="File has been succesfully uploaded to Cloud";
        String server = "ftp.drivehq.com";
        int port = 21;
        String user = "manojku4";
        String pass = "System@01";
        
        ftpClient.connect(server, port);
         ftpClient.login(user, pass);
         String filename1 = "new1";
        FileOutputStream fos = new FileOutputStream(filename1);
        response.setContentType("APPLICATION/OCTET-STREAM");
        response.setHeader("Content-Disposition", "attachment; filename=\"" +filename1 + "\"");
       
        ftpClient.retrieveFile("/data/" +filename1, fos);
        
        //response.sendRedirect("success.jsp");
    } catch (Exception e) {
        //response.sendRedirect("errorPage.jsp");
       result="Not able to upload the file";
    }
%>
<title>Uploading File:</title>

<h1><center><font color="blue">Status : </font></h1>
<b><center><font color="red" ><% out.println(result);%></b><br><br>
        <a href="download.jsp"><input type="button" value="CLOSE"></a>