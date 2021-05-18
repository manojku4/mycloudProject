<!DOCTYPE html>
<%@page import="java.sql.*;"%>
<%@page import="Network.DbConnection;"%>
<html lang="en">
<head>
    
     <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link href="https://fonts.googleapis.com/css?family=Poppins:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i&display=swap" rel="stylesheet">

    <title>CSP-FileDetails</title>
    
    <!-- Additional CSS Files -->
    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="css/font-awesome.css">
    <link rel="stylesheet" href="css/style.css">
    <%@page import="java.sql.*;"%>
    <script type="text/javascript"> 
        window.history.forward(); 
        function noBack() { 
            window.history.forward(); 
        } </script>
    <style>
        
 .banner{
    position: relative;
    width:100%;
    margin: auto;  
    background: rgba(250,250,250,0.6);
}
.banner table{ position: fixed;top:25%;left:30%;background: rgba(250,250,250,0.6);}
.banner h1{background: rgba(250,250,250,0.6);text-align:center;position:fixed;top:15%;left:40%; }

  .other-button a {
  background-color: #ddd;
  border: none;
  color: #00bfff;
  padding: 10px 20px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  margin: 4px 2px;
  cursor: pointer;
  border-radius: 16px;
}

.other-button a:hover {
  background-color: #00bfff;
  color:white;
}
    </style>
</head>
<body style="overflow: hidden;" >
  <%
   String user = (String)session.getAttribute("user");
   if(user == null) { %>
   <script>alert("You have to login first.. Redirection to LOGIN PAGE...") ;</script>
   <% response.sendRedirect("csp.jsp");
   }
    %>  
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
                        <a href="csphome.jsp" class="logo"> SECURE <em> DATA </em></a>
                        <!-- ***** Logo End ***** -->
                        <!-- ***** Menu Start ***** -->
                        <ul class="nav">
                        <li><a href="csphome.jsp" >Home</a></li>
                        <li><a href="cspauth.jsp" >CLIENT AUTHORIZE</a></li>
                        <li><a href="cspfile.jsp" class="active" >FILE DETAILS</a></li>
                        <li><a href="cspdownload.jsp" >DOWNLOADS</a></li>
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

       
<div class="banner">        
    
<%
    try
    {
        Connection con=DbConnection.getConnection();
        Statement st=con.createStatement();
        ResultSet rs=st.executeQuery("select * from uploads;");
           %>
    <h1 style="text-align: center;"> CLIENT DETAILS </h1>
     
    <table border=1 align=center style="text-align:center;width: 600px;">
         
      <thead>
          <tr>
              <th>FILE ID </th>
             <th>USER NAME</th>
            <th>FILE NAME</th>
            <th>DATE</th>
            <th>VIEW</th>
          </tr>
      </thead>
        <%while(rs.next())
        {
            %>
            <tr>
                <td><%=rs.getString("fileid") %></td>
                <td><%=rs.getString("cname") %></td>
                <td><%=rs.getString("filename") %></td>
                <td><%=rs.getString("date") %></td>              
                <td class="other-button" ><a href="csp_viewdata.jsp?id=<%=rs.getString("fileid") %>">VIEW</a></td>
                
                
                
            </tr>
            <%}%>
           
        </table>
    <%}
    catch(Exception e){
        out.print(e.getMessage());%><br><%
    }
    finally{
        //st.close();
        //con.close();
    }
    %>
 </div>  

<script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js" type="text/javascript"></script>    

    </header>
    <!-- ***** Header Area End ***** -->
    
    <!-- ***** Main Banner Area Start ***** -->
    <div class="main-banner" id="top">
         <img src="images/csp.jpg" style="max-width: 100%;height:auto;">
     
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
