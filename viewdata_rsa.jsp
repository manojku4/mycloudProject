<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%@page import="Network.DbConnection"%>
<%@page import="Algorithms.decryption"%>
<!DOCTYPE html>
<html lang="en">

  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link href="https://fonts.googleapis.com/css?family=Poppins:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i&display=swap" rel="stylesheet">

    <title>Encrypted File Data-RSA</title>
    
    <!-- Additional CSS Files -->
    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">

    <link rel="stylesheet" type="text/css" href="css/font-awesome.css">

    <link rel="stylesheet" href="css/style.css">
<style>
body {font-family: Arial, Helvetica, sans-serif;}

/* The Modal (background) */
.modal {
  display: none; /* Hidden by default */
  position: fixed; /* Stay in place */
  z-index: 1; /* Sit on top */
  padding-top: 100px; /* Location of the box */
  left: 0;
  top: 0;
  width: 100%; /* Full width */
  height: 100%; /* Full height */
  overflow: auto; /* Enable scroll if needed */
  background-image:url("images/client.jpg");
  background-position: center;
  background-repeat: no-repeat;
  background-size: cover;
}

/* Modal Content */
.modal-content {
  background-color: rgba(250,250,250,0.6);
  margin: auto;
  padding: 20px;
  border: 1px solid #888;
  width: 80%;
  
}
.btn{
  background-color: whitesmoke; 
  border: none;
  color: #00bfff;
  padding: 10px 20px;
  text-align: center;
  display: inline-block;
  margin: 4px 2px;
  cursor: pointer;
  border-radius: 16px;
  font-weight: 700;
}

.btn:hover {
  background-color: #00bfff;
  color:white;
}

</style>
</head>

<body style="overflow: hidden;">
    
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
                        </ul>                                            
                        <a class='menu-trigger'>
                            <span>Menu</span>
                        </a>
                        <!-- ***** Menu End ***** -->
                    </nav>
                </div>
            </div>
        </div>
        

<!-- The Modal -->
<div id="myModal" class="modal">
<%
    Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null;
    try
    {
        String id = request.getParameter("id");
        conn = DbConnection.getConnection();
        stmt=conn.createStatement();
        
        rs=stmt.executeQuery("select filedata from uploads where fileid="+id);
           %>
  <!-- Modal content -->
  <div class="modal-content"></br>
      <button class="btn"><a style="text-decoration: none;" href="request_tdes.jsp"> << BACK</a></button>
    <span class="close">&times;</span>
     <%while(rs.next())
        {
          String fkey =rs.getString("secretkey");  
          Blob blob = rs.getBlob("filedata"); 
          byte a[] = blob.getBytes(1, (int) blob.length());
          String str = new String(a, "UTF-8");
          String dec = new decryption().decrypt(str, fkey);
     
     %>
          <textarea rows="10" cols="100" name="file" ><%=dec%></textarea><br>
    <%}%>
  </div>
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

<script>
// Get the modal
var modal = document.getElementById("myModal");

// Get the button that opens the modal
//var btn = document.getElementById("myBtn");

// Get the <span> element that closes the modal
var span = document.getElementsByClassName("close")[0];

// When the user clicks the button, open the modal 
window.onpageshow = function() {
  modal.style.display = "block";
};
</script>

<script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js" type="text/javascript"></script>              

    </header>
    <!-- ***** Header Area End ***** -->

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