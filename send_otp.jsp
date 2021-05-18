<%@page import="java.security.SecureRandom"%>
<%@page import="Network.Mailcon"%>
<%@page import="java.util.Random"%>
<%@ page import ="java.sql.*" %>
<%@page import="Network.DbConnection"%>
<%
{
                     Random RANDOM = new SecureRandom();
                     int PASSWORD_LENGTH = 10;
                     String letters = "ABCDEFGHJKMNPQRSTUVWXYZ123456789";
                     String key = "";
                for (int i=0; i<PASSWORD_LENGTH; i++)
                 {
                int index = (int)(RANDOM.nextDouble()*letters.length());
                key += letters.substring(index, index+1);
                 }
                String  name=(String)session.getAttribute("ssname");          
            String  email=(String)session.getAttribute("ssemail");         

            session.setAttribute( "Email", email );  
             String msg ="One Time Passowrd : "+key+ "\n\n\n\n\n\nNOTE:This is a System generated mail.Kinldy Do not reply to this mail as we are not monitoring it." ;
             session.setAttribute( "Key", key );  
             String sub="Secure OTP";
            Mailcon m = new Mailcon();
            m.secretMail(msg, name, email ,sub);
           
           String j = request.getQueryString();
           Connection con = DbConnection.getConnection();
           Statement st =con.createStatement();
           int i = st.executeUpdate("update register set otp = '"+key+"' where email = '" + email + "'");
           if (i != 0) {
            response.sendRedirect("client_otp.jsp?msg=sent_otp_to_your_mail");
            } else {
             response.sendRedirect("client.jsp?msg=Error");
             }  
           
               }
%>
