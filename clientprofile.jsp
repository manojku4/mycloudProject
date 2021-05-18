<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%@page import="Network.DbConnection"%>
<!DOCTYPE html>
<html lang="en">

  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link href="https://fonts.googleapis.com/css?family=Poppins:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i&display=swap" rel="stylesheet">

    <title>Client</title>
    
    <!-- Additional CSS Files -->
    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">

    <link rel="stylesheet" type="text/css" href="css/font-awesome.css">

    <link rel="stylesheet" href="css/style.css">
    <style>


.banner { 
    position:fixed;
    top:25%;
    left:0%;
    background: rgba(250,250,250,0.6); 
    width: 400px; 
    height: 380px;
    
}

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
                        <li><a href="clienthome.jsp" style="color:black;" >Home</a></li>
                        <li><a href="clientprofile.jsp" class="active">PROFILE</a></li>
                        <li><a href="file_upload.jsp" style="color:black;" >FILE UPLOAD</a></li>
                        <li><a href="clientfile.jsp" style="color:black;">FILE DETAILS</a></li>
                        <li><a href="file_download.jsp" style="color:black;">DOWNLOAD</a></li>
                        <li class="main-button"><a href="index.html">LOGOUT</a></li> 
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
    Connection con = null;
    Statement st = null;
    ResultSet rs = null;
    String cname = session.getAttribute("ssname").toString();    
    try
    {
        con = DbConnection.getConnection();
        st = con.createStatement();
        rs=st.executeQuery("select * from register where username='" + cname + "'");
        
        while(rs.next())
        {
            %>
            <div>
                        <center><h1>Your Profile</h1></center>
                        <fieldset class="banner" style="margin-left: 510px;">
                            </br>
                            <label><strong>UID</strong></label><input type="text" readonly="" value="<%=rs.getString("id")%>" style="margin-left: 100px;width: 250px;"/><br /><br />
                            <label><strong>NAME</strong></label>&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" readonly="" value="<%=rs.getString("name")%>" style="margin-left: 68px;width: 250px;"/><br /><br />
                            <label><strong>GENDER</strong></label>&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" readonly="" value="<%=rs.getString("gender")%>" style="margin-left: 52px;width: 250px;"/><br /><br />
                            <label><strong>EMAIL</strong></label><input type="text" readonly="" value="<%=rs.getString("email")%>" style="margin-left: 80px;width: 250px;"/><br /><br />
                            <label><strong>DOB</strong></label><input type="text" readonly="" value="<%=rs.getString("dob")%>" style="margin-left: 90px;width: 250px;"/><br /><br />
                            <label><strong>Cell</strong></label><input type="text" readonly="" value="<%=rs.getString("phone")%>" style="margin-left: 92px;width: 250px;"/><br /><br />
                        </fieldset>
                    </div>
                      
    <%}
    } catch (Exception ex) {
                            ex.printStackTrace();
                        }

    %>
      

<script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js" type="text/javascript"></script>    

    </header>
    <!-- ***** Header Area End ***** -->
    
    <!-- ***** Main Banner Area Start ***** -->
    <div class="main-banner" id="top">
         <img src="images/client.jpg" style="max-width: 100%;height:auto;">
     
    </div>
    <!-- ***** Main Banner Area End ***** -->
   <!-- jQuery -->
    <script src="js/jquery-2.1.0.min.js"></script>

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

        
            