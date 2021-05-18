
<%@page import="Algorithms.CaesarCipher"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="Network.DbConnection"%>
<%
    String j = request.getQueryString();
                Connection con = DbConnection.getConnection();
                Statement st =con.createStatement();
//int id=Integer.parseInt(request.getQueryString());
                
int IDS=1;
  String  Client=(String)session.getAttribute("ssname");
  Object Session_Time = session.getAttribute("Session_Time");
   Object DES_secret_key = session.getAttribute("Session_DES");
   System.out.println("Session_DES Two Variable get"+DES_secret_key+Session_Time+Client);
 String CaesarCipher = new CaesarCipher().encrypt(DES_secret_key.toString(), IDS);
 System.out.println("CEASER"+CaesarCipher);
    int i = st.executeUpdate("update uploads set secretkey = '" + CaesarCipher + "', cname = '" + Client + "' where date = '" + Session_Time + "'");
    if (i != 0) {
        
        out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
        out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
        out.println("<script>");
        out.println("$(document).ready(function(){");
        out.println("swal(\"\", \"File has been Uploaded to Cloud Succesfully..!\", \"success\");})");
        out.println("</script>");
        RequestDispatcher rd = request.getRequestDispatcher("file_upload.jsp");
        rd.include(request,response);

        } else {
        out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
        out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
        out.println("<script>");
        out.println("$(document).ready(function(){");
        out.println("swal(\"\", \"File Upload Failed..!Try again.\", \"error\");})");
        out.println("</script>");
                        
        RequestDispatcher rd = request.getRequestDispatcher("upload_tdes.jsp");
        rd.include(request,response);
        }
%>
