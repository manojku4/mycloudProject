
<%@page import="com.oreilly.servlet.*,java.sql.*,java.lang.*,java.text.SimpleDateFormat,java.util.*,java.io.*,javax.servlet.*, javax.servlet.http.*"  errorPage="Error.jsp"%>

<%@ page import="Network.DbConnection"%>


       <% 
       
       Connection conn = null;
       Statement stmt = null;
       ResultSet rs = null;
        try
                {
		String id=request.getParameter("id");	
                
                conn = DbConnection.getConnection();

stmt = conn.createStatement();

rs = stmt.executeQuery("select * from uploads where fileid = '"+id+"'");

if (rs.next()) {
                
                String fname = rs.getString("filename");
                String secr = rs.getString("secretkey");
                String Algo = rs.getString("algo");
                   String  Cname=(String)session.getAttribute("ssname");
                    String  Cmail=(String)session.getAttribute("ssemail");
                     String  State=(String)session.getAttribute("ssstate");
                      String  Country=(String)session.getAttribute("sscountry");
//                      String  FileName=(String)session.getAttribute("SSfilename");
//                      String  secret=(String)session.getAttribute("SSsecretkey");

                   String  Status="No";  
       System.out.println("Request is activated"+Cname+State+State+Country+Status);
	  	  
	 
       Connection con= DbConnection.getConnection();
        Statement st=con.createStatement();
		
        
            String sql="insert into request(name, mail, state, country, fname, secretkey, status, algo) values ('"+Cname+"','"+Cmail+"','"+State+"','"+Country+"','"+fname+"','"+secr+"','"+Status+"','"+Algo+"')";
		
        int x=st.executeUpdate(sql);
		if(x!=0){
                            
                        out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
                        out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
                        out.println("<script>");
                        out.println("$(document).ready(function(){");
                        out.println("swal(\"\", \"Request to Access File Succesfull...!\", \"success\");})");
                        out.println("</script>");
                        RequestDispatcher rd = request.getRequestDispatcher("clientfile.jsp");
                        rd.include(request,response);

                    } else {
                        //out.println("<script src=\"https://unpkg.com/sweetalert/dist/sweetalert.min.js\"></script>");
                        out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
                        out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
                        out.println("<script>");
                        out.println("$(document).ready(function(){");
                        out.println("swal(\"\", \"Failed to make request.. Try again..!\", \"error\");})");
                        out.println("</script>");
                        
                        RequestDispatcher rd = request.getRequestDispatcher("clientfile.jsp");
                        rd.include(request,response);
                                           }

        con.close();
        st.close();
        } else {

out.println("Error");


}
        }
        catch(Exception e)
                {
        out.println(e);
		
        }
        %>