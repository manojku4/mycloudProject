
<%@page import="Network.Mailcon"%>
<%@page import="Network.DbConnection"%>
<%@page import="java.security.SecureRandom"%>
<%@page import="java.util.Random"%>
<%@ page import ="java.sql.*" %>
<%
{
        String id=request.getParameter("id");
        //int id=Integer.parseInt(request.getQueryString());
        System.out.println("id get successfully"+id);
        session.setAttribute( "Sid", id );
            Connection conn = DbConnection.getConnection();
           
            
            String sql = "Select *  from register where id = '" + id + "' ";
            PreparedStatement statement = conn.prepareStatement(sql);
            ResultSet result = statement.executeQuery();
            if(result.next()) {
                
                  
             String name =result.getString("username");
             session.setAttribute( "ssName", name );  
            String email =result.getString("email");
            session.setAttribute( "ssEmail", email );  
            String pwd =result.getString("password");
            session.setAttribute( "ssPwd", pwd ); 
            String sub="USER Login Credentials";
            Mailcon m = new Mailcon();
            String msg ="USERNAME: "+name+ "\nPASSWORD :" + pwd +"\n\n\n\n\n\nNOTE:This is a System generated mail.Kinldy Do not reply to this mail as we are not monitoring it." ;
            m.secretMail(msg, name, email ,sub);
                      
response.sendRedirect("update_auth.jsp?id="+id);  
     }else{
out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
out.println("<script>");
out.println("$(document).ready(function(){");
out.println("swal(\"\", \"Unable to Sent Mail ...\", \"error\");})");
out.println("</script>");
RequestDispatcher rd=request.getRequestDispatcher("cspauth.jsp");  
rd.include(request,response); 
     }
     }
%>