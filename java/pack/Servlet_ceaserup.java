package pack;

import com.oreilly.servlet.MultipartRequest;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import Network.DbConnection;
import Network.Ftpcon;
import Algorithms.CaesarCipher;
import Algorithms.TrippleDES;
import java.sql.PreparedStatement;
import javax.servlet.RequestDispatcher;

/**
 *
 * @author java4
 */
public class Servlet_ceaserup extends HttpServlet {
File file;
final String filepath="D:/Files/";
    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
           HttpSession session = request.getSession(true);
             MultipartRequest m=new MultipartRequest(request,filepath);
           File file=m.getFile("file");           
           String filename=file.getName().toLowerCase();
           
            Connection con= DbConnection.getConnection();
            Statement st3=con.createStatement();
            ResultSet rt3=st3.executeQuery("select * from uploads where filename='"+filename+"'");
            if(rt3.next()){
                out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
                        out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
                        out.println("<script>");
                        out.println("$(document).ready(function(){");
                        out.println("swal(\"Error..!\", \"File already Exists..!\", \"info\");})");
                        out.println("</script>");
                        RequestDispatcher rd = request.getRequestDispatcher("upload_ceaser.jsp");
                        rd.include(request,response);
            }
            else{
            
            BufferedReader br=new BufferedReader(new FileReader(filepath+filename));
            StringBuffer sb=new StringBuffer();
            String temp=null;
            
            while(( temp=br.readLine())!=null){
               sb.append(temp);              
           }           
        
        int IDS=1;
          
            String CaesarCipher = new CaesarCipher().encrypt(sb.toString(), IDS);
            
           //storing encrypted file
            FileWriter fw=new FileWriter(file);
            fw.write(CaesarCipher);
            fw.close();
            System.out.println("ceaser"+CaesarCipher);
            HttpSession user=request.getSession(true);
            String Client =  (String)session.getAttribute("ssname");
            //String Client=user.getAttribute("ssname").toString();
            PreparedStatement pstm1 = null;
             DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
	   //get current date time with Date()
	     Date date = new Date();
	     System.out.println(dateFormat.format(date));
             String time=dateFormat.format(date); 
             session.setAttribute( "Session_Time", time );
	   //get current date time with Calendar()
	    Calendar cal = Calendar.getInstance();
	    System.out.println(dateFormat.format(cal.getTime()));
            
            String len=file.length()+"bytes";
            
            //uploading file
            boolean status=new Ftpcon().upload(file);
            System.out.println("file upload to cloud==>>><<<"+status);
            if(status){
                //Connection con= Dbconnection.getConn();
                Statement st=con.createStatement();

                String sq2 = "insert into uploads (fileid,filename,filedata,date,cname,algo,secretkey) values (?,?,?,?,?,?,?) ";

        

        pstm1 = con.prepareStatement(sq2);
        pstm1.setInt(1, 0);
        pstm1.setString(2, file.getName());

       
        pstm1.setString(3, CaesarCipher);
        pstm1.setString(4, time);
        pstm1.setString(5, Client);
        pstm1.setString(6, "Ceaser");
        pstm1.setString(7, new TrippleDES().encrypt(file.getName()));
         
        
       

        boolean sd = pstm1.execute();
        
        System.out.println(sd);
                              if (sd = false) {
                        out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
                        out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
                        out.println("<script>");
                        out.println("$(document).ready(function(){");
                        out.println("swal(\"\", \"File Upload Failed..Try Again!\", \"error\");})");
                        out.println("</script>");
                        RequestDispatcher rd = request.getRequestDispatcher("upload_ceaser.jsp");
                        rd.include(request,response);

                    } else {
                        //out.println("<script src=\"https://unpkg.com/sweetalert/dist/sweetalert.min.js\"></script>");
                        out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
                        out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
                        out.println("<script>");
                        out.println("$(document).ready(function(){");
                        out.println("swal(\"\", \"File has been Uploaded to Cloud Succesfully..!\", \"success\");})");
                        out.println("</script>");
                        
                        RequestDispatcher rd = request.getRequestDispatcher("file_upload.jsp");
                        rd.include(request,response);
                                           }

            }
            else{
              
            }
            }
        }
        catch(Exception e){
            out.println(e);
        }
        finally {            
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP
     * <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
