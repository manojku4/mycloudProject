/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Network;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author java4
 */
public class DbConnection {
    public static Connection getConnection()
    {
        Connection con = null;
        try{
             Class.forName("com.mysql.jdbc.Driver");
             con = DriverManager.getConnection("jdbc:mysql://localhost:3306/datasecurity", "root", "root");
        }
        catch(ClassNotFoundException | SQLException e)
        {
        }
        return con;
    }
}
