
package db;

import java.sql.*;
import javax.swing.JOptionPane;

public class DB 
{
    public static Connection c;
    public static Statement s;
    static
    {
        try
            
        {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            c=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","srs","8893");
            s=c.createStatement();
            
            
        }
        catch(Exception ex)
        {
            JOptionPane.showConfirmDialog(null,ex);
        }
    } 
}
