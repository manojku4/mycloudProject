package pack;


import java.io.*;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import Network.DbConnection;

public class CheckAvailability extends HttpServlet {

	private static final long serialVersionUID = -734503860925086969L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {

            Connection conn = null;
            conn = DbConnection.getConnection();
            String username = request.getParameter("username");
            PreparedStatement ps = conn.prepareStatement("select username from register where username=?");
            ps.setString(1,username);
            ResultSet rs = ps.executeQuery();
             
            if (!rs.next()) {
                out.println("<font color=green><b>"+username+"</b> is avaliable");
            }
            else{
            out.println("<font color=red><b>"+username+"</b> is already in use</font>");
            }
            out.println();



        } catch (Exception ex) {

            out.println("Error ->" + ex.getMessage());

        } finally {
            out.close();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }
}
