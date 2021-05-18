<%-- 
    Document   : send_key
    Created on : May 8, 2020, 9:55:22 PM
    Author     : Admin
--%>

<%@page import="Network.Mailcon"%>
<%@page import="Network.DbConnection"%>
<%@ page import ="java.sql.*" %>
<%
{
        String id=request.getParameter("id");
        //int id=Integer.parseInt(request.getQueryString());
        session.setAttribute( "theSid", id );
        System.out.println("id session id set successfully"+id);
      
            Connection conn = DbConnection.getConnection();
           
            String sql = "Select *  from request where id = '" + id + "' ";
            PreparedStatement statement = conn.prepareStatement(sql);
            ResultSet result = statement.executeQuery();
            if(result.next()) {
              String name =result.getString("name");   
             String key =result.getString("secretkey");
              String Algo =result.getString("algo");
            String email =result.getString("mail");
            session.setAttribute( "ssEmail", email );  
             String msg ="Secret Key : "+key+"\n\nAlgorithm :"+Algo+"\n\n\n\n\n\nNOTE:This is a System generated mail.Kinldy Do not reply to this mail as we are not monitoring it." ;
             session.setAttribute( "Key", key );  
            String sub="Secret-Key";          
            Mailcon m = new Mailcon();
            m.secretMail(msg, name, email, sub);

            response.sendRedirect("update_request.jsp?id="+id);
     }else{
            out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
            out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
            out.println("<script>");
            out.println("$(document).ready(function(){");
            out.println("swal(\"\", \"Unable to Sent Mail ...\", \"error\");})");
            out.println("</script>");
            RequestDispatcher rd=request.getRequestDispatcher("audirequest.jsp");  
            rd.include(request,response); 
     }
     }
%>