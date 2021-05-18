<%-- 
    Document   : loigaction
    Created on : May 9, 2020, 5:33:38 PM
    Author     : java4
--%>

<%@page import="java.security.SecureRandom"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="Network.DbConnection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.Random"%>


<%
    Connection con = null;
    Statement st = null;
    ResultSet rs = null;
    String name = request.getParameter("username");
     String State = request.getParameter("state");
      String country = request.getParameter("country");
    String pass = request.getParameter("password");
    String ausername = request.getParameter("ausername");
    String apassword = request.getParameter("apassword");
    int status = Integer.parseInt(request.getParameter("status"));
    String email = request.getParameter("email");
    String dob = request.getParameter("date");
    String gen = request.getParameter("gender");
    String role = request.getParameter("role");
    String user = request.getParameter("username");
    String phone = request.getParameter("phone");
    String sk = request.getParameter("secretkey");
    String otp = request.getParameter("otp");
    //String algo = request.getParameter("Ceaser");
    
 
     Random RANDOM = new SecureRandom();
                     int PASSWORD_LENGTH = 9;
                     String letters = "qwertyuioplkjhgfdsazxcvbnm";
                     String key = "";
                    
                     for (int i=0; i<PASSWORD_LENGTH; i++)
                 {
                int index = (int)(RANDOM.nextDouble()*letters.length());
                key += letters.substring(index, index+1);
                 }
   System.out.println(sk);
   System.out.println(status);

    try {
        con = DbConnection.getConnection();
        st = con.createStatement();
        switch (status) {
            case 1:
                try {
                    rs = st.executeQuery("select * from register where username='" + name + "' AND password='" + pass + "'");
                    if (rs.next()) {
                        session.setAttribute("ssid", rs.getString("id"));
                        session.setAttribute("sscountry", rs.getString("country"));
                        session.setAttribute("ssemail", rs.getString("email"));
                        session.setAttribute("ssname", rs.getString("username"));
                        session.setAttribute("ssstate", rs.getString("state"));
                        
                        response.sendRedirect("send_otp.jsp");
                   
                    } else {
                        out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
                        out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
                        out.println("<script>");
                        out.println("$(document).ready(function(){");
                        out.println("swal(\"Oops...\", \"Level 1 - Login Failed..!\", \"error\");})");
                        out.println("</script>");

                         RequestDispatcher rd=request.getRequestDispatcher("client.jsp");  
                         rd.include(request,response); 
                    }
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
                break;
                           
            case 2:
                try {
                    if (ausername.equalsIgnoreCase("auditor") && apassword.equalsIgnoreCase("auditor")) {
                        session.setAttribute("user","auditor");
                    out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
                        out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
                        out.println("<script>");
                        out.println("$(document).ready(function(){");
                        out.println("swal(\"Yaay...\", \"Login Succesfull..!\", \"success\");})");
                        out.println("</script>");

                         RequestDispatcher rd=request.getRequestDispatcher("audihome.jsp");  
                         rd.include(request,response); 
                        
                    } else {
                        out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
                        out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
                        out.println("<script>");
                        out.println("$(document).ready(function(){");
                        out.println("swal(\"Oops...\", \"Login Failed..!\", \"error\");})");
                        out.println("</script>");

                         RequestDispatcher rd=request.getRequestDispatcher("auditor.jsp");  
                         rd.include(request,response); 
                    }
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
                break;
                 
                 case 3:
                try {
                    if (ausername.equalsIgnoreCase("csp") && apassword.equalsIgnoreCase("csp")) {
                        session.setAttribute("user","csp");
                     out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
                        out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
                        out.println("<script>");
                        out.println("$(document).ready(function(){");
                        out.println("swal(\"Yaay..!\", \"Login Succesfull..!\", \"success\");})");
                        out.println("</script>");

                         RequestDispatcher rd=request.getRequestDispatcher("csphome.jsp");  
                         rd.include(request,response); 
                        
                    } else {
                        out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
                        out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
                        out.println("<script>");
                        out.println("$(document).ready(function(){");
                        out.println("swal(\"Oops...\", \"Login Failed..!\", \"error\");})");
                        out.println("</script>");

                         RequestDispatcher rd=request.getRequestDispatcher("csp.jsp");  
                         rd.include(request,response); 
                    }
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
                break;
                     
                 case 4:
                try {
                    System.out.println( sk);
                    rs = st.executeQuery("select * from uploads where secretkey='" + sk + "' AND algo='TDES'");
                    if (rs.next()) {
                        session.setAttribute("ssidsecretkey", rs.getString("secretkey"));
                                               
                      out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
                        out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
                        out.println("<script>");
                        out.println("$(document).ready(function(){");
                        out.println("swal(\"Yaay...\", \"Your Secret key Matched..!\", \"success\");})");
                        out.println("</script>");
                         
                         RequestDispatcher rd=request.getRequestDispatcher("request_tdes.jsp");  
                         rd.include(request,response); 
                        
                    } else {
                        out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
                        out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
                        out.println("<script>");
                        out.println("$(document).ready(function(){");
                        out.println("swal(\"Oops...\", \"Your Secret Key is Not Matched. Try again.!\", \"error\");})");
                        out.println("</script>");

                         RequestDispatcher rd=request.getRequestDispatcher("access_tdes.jsp");  
                         rd.include(request,response); 
                    }
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
                break;
                case 5:
                try {
                    
                    rs = st.executeQuery("select * from uploads where secretkey='" + sk + "' AND algo='Ceaser'");
                    if (rs.next()) {
                        session.setAttribute("ssidsecretkey", rs.getString("secretkey"));
                                               
                      out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
                        out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
                        out.println("<script>");
                        out.println("$(document).ready(function(){");
                        out.println("swal(\"Yaay...\", \"Your Secret key Matched..!\", \"success\");})");
                        out.println("</script>");

                         RequestDispatcher rd=request.getRequestDispatcher("request_ceaser.jsp");  
                         rd.include(request,response); 
                        
                    } else {
                        out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
                        out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
                        out.println("<script>");
                        out.println("$(document).ready(function(){");
                        out.println("swal(\"Oops...\", \"Your Secret Key is Not Matched. Try again.!\", \"error\");})");
                        out.println("</script>");

                         RequestDispatcher rd=request.getRequestDispatcher("access_ceaser.jsp");  
                         rd.include(request,response); 
                    }
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
                break;
                case 6:
                try {
                    rs = st.executeQuery("select * from uploads where secretkey='" + sk + "' AND algo='RSA'");
                    if (rs.next()) {
                        session.setAttribute("ssidsecretkey", rs.getString("secretkey"));
                                               
                     out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
                        out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
                        out.println("<script>");
                        out.println("$(document).ready(function(){");
                        out.println("swal(\"Yaay...\", \"Your Secret key Matched..!\", \"success\");})");
                        out.println("</script>");

                         RequestDispatcher rd=request.getRequestDispatcher("request_rsa.jsp");  
                         rd.include(request,response); 
                        
                    } else {
                        out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
                        out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
                        out.println("<script>");
                        out.println("$(document).ready(function(){");
                        out.println("swal(\"Oops...\", \"Your Secret Key is Not Matched. Try again.!\", \"error\");})");
                        out.println("</script>");

                         RequestDispatcher rd=request.getRequestDispatcher("access_rsa.jsp");  
                         rd.include(request,response); 
                    }
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
                break;                     
                 
                case 7:
                try {
                    rs = st.executeQuery("select * from register where otp='" + otp + "' ");
                    if (rs.next()) {
                        out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
                        out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
                        out.println("<script>");
                        out.println("$(document).ready(function(){");
                        out.println("swal(\"Yaay...\", \"Login Succesfull..!\", \"success\");})");
                        out.println("</script>");

                         RequestDispatcher rd=request.getRequestDispatcher("clienthome.jsp");  
                         rd.include(request,response); 
                        
                    } else {
                        out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
                        out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
                        out.println("<script>");
                        out.println("$(document).ready(function(){");
                        out.println("swal(\"Oops...\", \"Level 2 - Login Failed..!\", \"error\");})");
                        out.println("</script>");

                         RequestDispatcher rd=request.getRequestDispatcher("client.jsp");  
                         rd.include(request,response); 
                    }
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
                               
                break;    
                 
            default:
                response.sendRedirect("index.html");
        }
    } catch (Exception ex) {
        ex.printStackTrace();
    }
%>