<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link href="https://fonts.googleapis.com/css?family=Poppins:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i&display=swap" rel="stylesheet">

    <title>Home</title>
    
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
p.contact { font-size: 12px; margin:0px 0px 10px 0;line-height: 14px; font-family:Arial, Helvetica;}
input[type="text"] { width: 400px; }
input[type="email"] { width: 400px; }
input[name="username"] { width: 200px; }
label { padding-top: 5px;color: #000; font-weight:bold;font-size: 14px;font-family:Arial, Helvetica; }
input { background-color: rgba(128, 255, 255,0.5); border: 1px solid rgba(122, 192, 0, 0.15); padding: 7px; font-family: Keffeesatz, Arial; color: #4b4b4b; font-size: 14px; -webkit-border-radius: 5px; margin-bottom: 15px; margin-top: -10px; }
input:focus { border: 1px solid #ff5400; background-color: rgba(255, 255, 255, 1); }

h1{
  font-size:1.5em;
  color:#525252;
  text-align: center;
}

.box{
  background:transparent;
  background: rgba(184, 184, 148,0.9);
  width:500px;
  border-radius:6px;
  margin: 0 auto 0 auto;
  padding:0px 0px 0px 0px;
  border: #2980b9 4px solid; 
  text-align: center;
}

.btn{
  background:#2ecc71;
  width:125px;
  color:white;
  border-radius:4px;
  border: #27ae60 1px solid;
  text-align: center;
  margin-top:10px;
  margin-bottom:10px;
  margin-left:16px;
  font-weight:800;
  font-size:0.8em;
}
.btn:hover{ background:#2CC06B;}

.form1 .select-style {
  -webkit-appearance: button;
  -webkit-border-radius: 2px;
  -webkit-box-shadow: 0px 1px 3px rgba(0, 0, 0, 0.1);
  -webkit-padding-end: 20px;
  -webkit-padding-start: 2px;
  -webkit-user-select: none;
  background-position: center right;
  background-repeat: no-repeat;
  border: 0px solid #FFF;
  color: #555;
  font-size: inherit;
  margin: 0;
  overflow: hidden;
  padding-top: 5px;
  padding-bottom: 5px;
  text-overflow: ellipsis;
  white-space: nowrap;}
.form1 .gender {
  width:100px;
  }
.form1 input.buttom{ background: #4b8df9; display: inline-block; padding: 5px 10px 6px; color: #fbf7f7; text-decoration: none; font-weight: bold; line-height: 1; -moz-border-radius: 5px; -webkit-border-radius: 5px; border-radius: 5px; -moz-box-shadow: 0 1px 3px #999; -webkit-box-shadow: 0 1px 3px #999; box-shadow: 0 1px 3px #999; text-shadow: 0 -1px 1px #222; border: none; position: relative; cursor: pointer; font-size: 14px; font-family:Verdana, Geneva, sans-serif;}
.form1 input.buttom:hover	{ background-color: #2a78f6; }

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
                            <li><a href="index.html" style="color:black;" >Home</a></li>
                            <li><a href="client.jsp" style="color:black;">CLIENT</a></li>
                            <li><a href="csp.jsp" style="color:black;">CSP</a></li> 
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

<form class="form1" method="post" action="reg_data.jsp">
    
<div class="box">
<h1>REGISTRATION</h1>
<p class="contact"><label for="name">Name</label></p> 
<input id="name" name="name" placeholder="Client Name" required="" tabindex="1" type="text"> 

<p class="contact"><label for="email">Email</label></p> 
<input id="email" name="email" placeholder="example@domain.com" required="" type="email" tabindex="2"> 
     
<p class="contact"><label for="username">Create a username</label></p> 
<input class="username" id="username" name="username" placeholder="username" required="" tabindex="3" type="text">&nbsp;<span class="status"></span>
</br>


<p><label>DOB </label>
<input type="date" id="dob" name="date" tabindex="4"  required>
<label>GENDER </label>                  
<select class="select-style gender" name="gender" tabindex="5">
<option value="select">i am...</option>
<option value="Male">Male</option>
<option value="Female">Female</option>
<option value="others">Other</option>
</select></p>
    
<input id="state" name="state" placeholder="State" required="" type="text" tabindex="6"> 

<input id="country" name="country" placeholder="Country" required="" type="text" tabindex="7"> 

<input id="phone" name="phone" placeholder="phone number" required="" type="text" tabindex="8"> 

<input class="btn" name="submit" id="submit" tabindex="9" value="Sign me up!" type="submit"> 	 
</form>     			
    
   
    </header>
    <!-- ***** Header Area End ***** -->
   
<!-- ***** Main Banner Area Start ***** -->
    <div class="main-banner" id="top">
         <img src="images/Reg.jpg" style="max-width: 100%;height:auto;">
    </div>
    <!-- ***** Main Banner Area End ***** -->
   
    
    <script src="js/jquery.js" type="text/javascript"></script>
	<script type="text/javascript">
          $(document).ready(function(){
              $(".username").change(function(){
                  var username = $(this).val();
                  if(username.length >= 3){
                      $(".status").html("<img src='images/loading.gif'><font color=gray> Checking availability...</font>");
                       $.ajax({
                          type: "POST",
                          url: "check",
                          data: "username="+ username,
                          success: function(msg){

                              $(".status").ajaxComplete(function(event, request, settings){
                                   
                                  $(".status").html(msg);

                              });
                          }
                      }); 
                  }
                  else{
                       
                      $(".status").html("<font color=red>Minimun <b>3</b> Character!</font>");
                  }
                  
              });
          });
        </script>
        

   

  </body>
</html>   


