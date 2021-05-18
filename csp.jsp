<!DOCTYPE html>
<html lang="en">

  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link href="https://fonts.googleapis.com/css?family=Poppins:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i&display=swap" rel="stylesheet">

    <title>CSP</title>
    
    <!-- Additional CSS Files -->
    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">

    <link rel="stylesheet" type="text/css" href="css/font-awesome.css">

    <link rel="stylesheet" href="css/style.css">
        
    <style>
           
   form1{
  font-family: 'Open Sans', sans-serif;
  margin: 0 auto 0 auto;  
  width:100%; 
  text-align:center;
    
}

p{
  font-size:12px;
  text-decoration: none;
  color:#ffffff;
}

h1{
  font-size:1.5em;
  color:#525252;
  text-align: center;
}

.box{
  background:transparent;
  background: rgba(250,250,250,0.6);
  width:300px;
  border-radius:6px;
  margin: 0 auto 0 auto;
  padding:0px 0px 0px 0px;
  border: #2980b9 4px solid; 
  text-align: center;
}

.username{
  text-align: center;
  background:#ecf0f1;
  border: #ccc 1px solid;
  border-bottom: #ccc 2px solid;
  padding: 8px;
  width:250px;
  color:black;
  margin-top:10px;
  font-size:1em;
  border-radius:4px;
}

.password{
  background:#ecf0f1;
  border: #ccc 1px solid;
  border-bottom: #ccc 2px solid;
  padding: 8px;
  width:250px;
  color:black;
  margin-top:10px;
  font-size:1em;
  border-radius:4px;
  text-align: center;
}

.btn{
  background:#2ecc71;
  width:125px;
  padding-top:5px;
  padding-bottom:5px;
  color:white;
  border-radius:4px;
  border: #27ae60 1px solid;
  text-align: center;
  margin-top:20px;
  margin-bottom:20px;
  margin-left:16px;
  font-weight:800;
  font-size:0.8em;
}

.btn:hover{
  background:#2CC06B; 
}

    </style>

    
    </head>
    
    <body>
    
        
    
    <!-- ***** Header Area Start ***** -->
    <header class="header-area header-sticky">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <nav class="main-nav">
                        <!-- ***** Logo Start ***** -->
                        <a href="index.html" class="logo"> SECURE <em> DATA </em></a>
                        <!-- ***** Logo End ***** -->
                        <!-- ***** Menu Start ***** -->
                        <ul class="nav">
                            <li><a href="index.html" style="color:black;">Home</a></li>
                            <li><a href="client.jsp" style="color:black;">CLIENT</a></li>
                            <li><a href="csp.jsp" class="active"><b>CSP</b></a></li> 
                            <li><a href="auditor.jsp" style="color:black;">AUDITOR</a></li> 
                            <li class="main-button"><a href="register.html">REGISTER</a></li>
                        </ul>        
                        <a class='menu-trigger'>
                            <span>Menu</span>
                        </a>
                        <!-- ***** Menu End ***** -->
                    </nav>
                </div>
            </div>
        </div>
        
<form class="form1" method="post" action="loginaction.jsp">
    <br><br>
<div class="box">
<h1>CSP LOGIN</h1>
<input type="text" name="ausername" placeholder="USERNAME" required class="username" autofocus/>  
<input type="password" name="apassword" placeholder="PASSWORD" required class="password" /> 
<input type="hidden" value="3" name="status" />
<input type="submit" name="sent" value="Login" class="btn" > <!-- End Btn -->
  
</div> <!-- End Box -->
</form>

<script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js" type="text/javascript"></script>              

    </header>
    <!-- ***** Header Area End ***** -->

    <!-- ***** Main Banner Area Start ***** -->
    <div class="main-banner" id="top">
         <img src="images/Reg.jpg" style="max-width: 100%;height:auto;">
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