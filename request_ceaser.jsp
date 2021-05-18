<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%@page import="Network.DbConnection"%>
<%@page import="pack.Download_ceaser"%>
<!DOCTYPE html>
<html lang="en">

  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link href="https://fonts.googleapis.com/css?family=Poppins:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i&display=swap" rel="stylesheet">

    <title>Ceaser Cipher Request</title>
    
    <!-- Additional CSS Files -->
    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">

    <link rel="stylesheet" type="text/css" href="css/font-awesome.css">

    <link rel="stylesheet" href="css/style.css">
    
    <style>


.banner { 
    position:fixed;
    top:25%;
    left:25%;
    background: rgba(250,250,250,0.6); 
    width: 700px; 
    height: 400px;
    
}
.banner a{color: #0077b5;}
.banner a:hover{color: #66c9ff;}
    </style>
       
      </head>
    
    <body style="overflow:hidden;">
    
        <!-- ***** Preloader Start ***** -->
    <div id="js-preloader" class="js-preloader">
      <div class="preloader-inner">
        <span class="dot"></span>
        <div class="dots">
          <span></span>
          <span></span>
          <span></span>
        </div>
      </div>
    </div>
    <!-- ***** Preloader End ***** -->
    
    <!-- ***** Header Area Start ***** -->
    <header class="header-area header-sticky">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <nav class="main-nav">
                        <!-- ***** Logo Start ***** -->
                        <a href="clienthome.jsp" class="logo"> SECURE <em> DATA </em></a>
                        <!-- ***** Logo End ***** -->
                        <!-- ***** Menu Start ***** -->
                        <ul class="nav">
                        <li class="main-button"><a href="file_download.jsp"> << BACK</a></li> 
                        </ul>                                            
                        <a class='menu-trigger'>
                            <span>Menu</span>
                        </a>
                        <!-- ***** Menu End ***** -->
                    </nav>
                </div>
            </div>
        </div>
 
        <%
                        String search = session.getAttribute("ssidsecretkey").toString();
                        System.out.println("get the search"+search);
                        session.setAttribute("search", search);
         %>

            <div class="banner">
            
                    <center><h2>User Details</h2></center><br />
                    <table border="2" style="text-align: center;margin-left: 70px">
                            <tr><th style="text-align: center;width: 70px;">File ID</th>
                                <th style="text-align: center;width: 120px;">Client Name</th>
                                <th style="text-align: center;width: 120px;">File Name</th>
                                <th style="text-align: center;width: 120px;">Date</th>
                                <th style="text-align: center;width: 100px;">View</th>
                                <th style="text-align: center;">Download</th>
                            </tr>    
                            <% 
                                int fid=0;
                                Connection con = null;
                                Statement st = null;
                                ResultSet rs = null;
                                try {
                                    con = DbConnection.getConnection();
                                    st = con.createStatement();
                                    rs = st.executeQuery("select * from uploads where secretkey LIKE '%" + search + "%'");
                                    if (rs.next()) {
                                   
                            %>
                                <td><%=rs.getString("fileid")%></td>
                                <td><%=rs.getString("cname")%></td>     
                                <td><%=rs.getString("filename")%></td>     
                                <td><%=rs.getString("date")%></td>     
                                <td> <a href="viewdata_ceaser.jsp?id=<%=rs.getString("fileid")%>"><font style="color: green">view</a></font> </td>  
                                <td> <a href="Download_ceaser?id=<%=rs.getString("fileid")%>"><font style="color: green">Download</a></font> </td>   
                                <tr />
                                                                                                                                         
                                        <% } 
                                    } catch (Exception ex) {
                                        ex.printStackTrace();
                                    }

                                %>
                        
                 </table>
                                
                                
           </div>

<script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js" type="text/javascript"></script>              

    </header>
                                                                                                                                         
    <!-- ***** Header Area End ***** -->

    <!-- ***** Main Banner Area Start ***** -->
    <div class="main-banner" id="top">
         <img src="images/client.jpg" style="max-width: 100%;height:auto;">
     </div>

    <!-- ***** Main Banner Area End ***** -->
   
  

    <!-- jQuery -->
    <script src="assets/js/jquery-2.1.0.min.js"></script>

    <!-- Bootstrap -->
    <script src="js/popper.js"></script>
    <script src="js/bootstrap.min.js"></script>

    <!-- Plugins -->
    <script src="js/scrollreveal.min.js"></script>
    <script src="js/waypoints.min.js"></script>
    <script src="js/jquery.counterup.min.js"></script>
    <script src="js/imgfix.min.js"></script> 
    <script src="js/mixitup.js"></script> 
    <script src="js/accordions.js"></script>
    
    <!-- Global Init -->
    <script src="js/custom.js"></script>

  </body>
</html>