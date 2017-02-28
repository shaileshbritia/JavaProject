import javax.servlet.*;  
import java.sql.*;  
public class ConListener implements ServletContextListener
{  
    public void contextInitialized(ServletContextEvent event) 
    {  
        try
        {  
            //Class.forName("oracle.jdbc.driver.OracleDriver");
            //Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","ID","PASSWORD");         

            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/erestaurant","root","incapp");
            PreparedStatement insertUser=con.prepareStatement("insert into userinfo values(?,?,?,?,?)");
            PreparedStatement getUserWhereID=con.prepareStatement("select * from userinfo where email=?");
            PreparedStatement updateUser=con.prepareStatement("update userinfo set name=?,ph=?,addr=? where email=?");
            PreparedStatement getTotalTable=con.prepareStatement("select nt from totaltable");
            PreparedStatement getTableAllocated=con.prepareStatement("select tbook from tablebook where date=? and slot=? and status='Booked'");
            PreparedStatement getMaxTableBookID=con.prepareStatement("select max(tbid) from tablebook");
            PreparedStatement checkBID=con.prepareStatement("select * from tablebook where tbid=? and status='Booked'");
            PreparedStatement insertTableBook=con.prepareStatement("insert into tablebook values(?,?,?,?,?,?,?)");
            PreparedStatement cancelTableBook=con.prepareStatement("update tablebook  set status='Canceled' where tbid=? and status='Booked'");
            PreparedStatement getItemWhereCateg=con.prepareStatement("select * from itemdetails where categ=?");
            PreparedStatement getMaxOrderID=con.prepareStatement("select max(oid) from orderbook");
            PreparedStatement insertOrder=con.prepareStatement("insert into orderbook values(?,?,?,?,?)");
            PreparedStatement insertOrderItem=con.prepareStatement("insert into orderitem values(?,?,?,?)");
            PreparedStatement getOrders=con.prepareStatement("select * from orderbook where odate=?");
            PreparedStatement getOrderItems=con.prepareStatement("select * from orderitem where oid=?");
            PreparedStatement insertItem=con.prepareStatement("insert into itemdetails values(?,?,?,?)");
            PreparedStatement getItemWhereName=con.prepareStatement("select * from itemdetails where iname=?");
            PreparedStatement updateItem=con.prepareStatement("update itemdetails set iname=?,price=?,image=?,categ=? where iname=?");
            PreparedStatement updateItem2=con.prepareStatement("update itemdetails set iname=?,price=?,categ=? where iname=?");
            PreparedStatement deleteItem=con.prepareStatement("delete from itemdetails where iname=?");
            PreparedStatement getTables=con.prepareStatement("select * from tablebook where date>=?");
            Statement st=con.createStatement();
            ServletContext ctx=event.getServletContext();     
            ctx.setAttribute("stmt", st);  
            ctx.setAttribute("dbcon", con);
            ctx.setAttribute("insertUser", insertUser);
            ctx.setAttribute("getUserWhereID", getUserWhereID);
            ctx.setAttribute("updateUser", updateUser);
            ctx.setAttribute("getTotalTable", getTotalTable);
            ctx.setAttribute("getTableAllocated", getTableAllocated);
            ctx.setAttribute("getMaxTableBookID", getMaxTableBookID);
            ctx.setAttribute("checkBID", checkBID);
            ctx.setAttribute("insertTableBook", insertTableBook);
            ctx.setAttribute("cancelTableBook", cancelTableBook);
            ctx.setAttribute("getItemWhereCateg", getItemWhereCateg);
            ctx.setAttribute("getMaxOrderID", getMaxOrderID);
            ctx.setAttribute("insertOrder", insertOrder);
            ctx.setAttribute("insertOrderItem", insertOrderItem);
            ctx.setAttribute("getOrders", getOrders);
            ctx.setAttribute("getOrderItems", getOrderItems);
            ctx.setAttribute("insertItem", insertItem);
            ctx.setAttribute("getItemWhereName", getItemWhereName);
            ctx.setAttribute("updateItem", updateItem);
            ctx.setAttribute("updateItem2", updateItem2);
            ctx.setAttribute("deleteItem", deleteItem);
            ctx.setAttribute("getTables", getTables);
        }
        catch(Exception e)
        {
                e.printStackTrace();
        }  
    }   
    public void contextDestroyed(ServletContextEvent e) {}  
}  