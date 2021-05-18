<!DOCTYPE html>
<html lang="en">

  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link href="https://fonts.googleapis.com/css?family=Poppins:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i&display=swap" rel="stylesheet">

    <title>CSP-HOME</title>
    
    <!-- Additional CSS Files -->
    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">

    <link rel="stylesheet" type="text/css" href="css/font-awesome.css">

    <link rel="stylesheet" href="css/style.css">
    <script type="text/javascript"> 
        window.history.forward(); 
        function noBack() { 
            window.history.forward(); 
        } </script>
    <style>
.form1{
  background:transparent;
  background: rgba(184, 184, 148,0.6);
  width:500px;
  border-radius:6px;
  margin: 200px auto 0 auto;
  padding:0px 0px 0px 0px;
  border: #2980b9 4px solid; 
  text-align: center;
}
    </style>
    
      </head>
    
    <body style="overflow:hidden;">
    <%
   String user = (String)session.getAttribute("user");
   if(user == null) { %>
   <script>alert("You have to login first.. Redirection to LOGIN PAGE...") ;</script>
   <% response.sendRedirect("csp.jsp");
   }
    %>
       
    
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
                        <li><a href="csphome.jsp" class="active">Home</a></li>
                        <li><a href="cspauth.jsp" >CLIENT AUTHORIZE</a></li>
                        <li><a href="cspfile.jsp" >FILE DETAILS</a></li>
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
        
<form class="form1" method="post" action="#">
    

    <h1>WELCOME CSP</h1>

</form>

<script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js" type="text/javascript"></script>              

    </header>
    <!-- ***** Header Area End ***** -->

    <!-- ***** Main Banner Area Start ***** -->
    <div class="main-banner" id="top">
         <img src="images/csp.jpg" style="max-width: 100%;height:auto;">
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