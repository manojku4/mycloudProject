<%-- 
    Document   : update_request
    Created on : May 8, 2020, 10:27:29 PM
    Author     : Admin
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="Network.DbConnection"%>
<%

                Connection con = DbConnection.getConnection();
                Statement st =con.createStatement();

         String Status = "Yes";
         String id=request.getParameter("id");
    //int id=(Integer.parseInt)session.getAttribute(theSid);
    //int  id=(Integer)session.getAttribute("theSid");
     //System.out.println("session id is geted"+id);
    int i = st.executeUpdate("update request set status='" + Status + "' where id = '" + id + "'");
    if (i != 0) {
                   out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
                   out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
                   out.println("<script>");
                   out.println("$(document).ready(function(){");
                   out.println("swal(\"\", \"Secret Key Sent via Mail...!\", \"success\");})");
                   out.println("</script>");
                   RequestDispatcher rd=request.getRequestDispatcher("audirequest.jsp");  
                   rd.include(request,response); 
        } else {
                   out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
                   out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
                   out.println("<script>");
                   out.println("$(document).ready(function(){");
                   out.println("swal(\"\", \"Unable to Sent Mail ...\", \"error\");})");
                   out.println("</script>");
                   RequestDispatcher rd=request.getRequestDispatcher("audirequest.jsp");  
                   rd.include(request,response);         
                }
%>
