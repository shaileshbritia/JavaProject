
import java.sql.*;
import javax.swing.JOptionPane;
public class DBConnect {
    static Connection c;
    static Statement st;
    static PreparedStatement ps;
    static
    {
        try
        {
            Class.forName("com.mysql.jdbc.Driver");
            c=DriverManager.getConnection("jdbc:mysql://localhost:3306/AVPS","root","incapp");

            //Class.forName("oracle.jdbc.driver.OracleDriver");
            //c=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","id","password");
            st=c.createStatement();
            ps=c.prepareStatement("insert into Parking values(?,?,?,?,?,?,?)");
        }
        catch(Exception ex)
        {
            JOptionPane.showMessageDialog(null, "DataBase Error: "+ex);
        }
    }
}
