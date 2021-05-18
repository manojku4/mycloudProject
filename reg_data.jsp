<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%@page import="java.util.Random"%>
<%@page import="Network.DbConnection"%>

<%

String name=request.getParameter("name");
String email=request.getParameter("email");
String username=request.getParameter("username");
String dob=request.getParameter("date");
String gender=request.getParameter("gender");
String state=request.getParameter("state");
String country=request.getParameter("country");
String phone=request.getParameter("phone");
Random rand = new Random();
int otp = rand.nextInt(900000) + 100000;
String password = String.valueOf(otp);
String auth = "NO";



try
{
Connection conn = DbConnection.getConnection();
Statement st=conn.createStatement();

int i=st.executeUpdate("insert into register(name ,email ,username ,dob ,gender ,state ,country ,phone,password , auth)values('"+name+"','"+email+"','"+username+"','"+dob+"','"+gender+"','"+state+"','"+country+"','"+phone+"','"+password+"','"+auth+"')");

if(i > 0)
{
 
out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
out.println("<script>");
out.println("$(document).ready(function(){");
out.println("swal(\"\", \"USER Registered\", \"success\");})");
out.println("</script>");

RequestDispatcher rd=request.getRequestDispatcher("register.jsp");  
rd.include(request,response); 


}
else
{
out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
out.println("<script>");
out.println("$(document).ready(function(){");
out.println("swal(\"\", \" USER NotRegistered\", \"error\");})");
out.println("</script>");
RequestDispatcher rd=request.getRequestDispatcher("register.jsp");  
rd.include(request,response); 

}
        
}
catch(Exception e)
{
out.println(e);
e.printStackTrace();
}
%>

