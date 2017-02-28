
package db;

import java.sql.*;
import javax.swing.JOptionPane;

public class DB 
{
    public static Connection con;
    public static Statement st;
    public static PreparedStatement memberlogin,adminlogin,addmember,modifymember1,memberhomereturn1,memberhomesell1,memberhomesearch1,
            adminhome1,getitem,admin_home_addmedicine,admin_home_delete,admin_home_modify,admin_home_viewallexpiries,
            modify_member_modify,member_home_returnitem,member_home_returnallitem1,member_home_returnallitem2,
            modify_member_delete,member_home_savebill,maxBid,insertbillitem,updateqtyitem;
    static
    {
        try
            
        {
            Class.forName("com.mysql.jdbc.Driver");
                con=DriverManager.getConnection("jdbc:mysql://localhost:3306/medisol","root","incapp");
                st=con.createStatement();
                memberlogin=con.prepareStatement("select * from memberlogin where mid=? and pass=?");
                adminlogin=con.prepareStatement("select * from adminlogin where aid=? and pass=?");
                addmember=con.prepareStatement("insert into memberlogin values(?,?,?,?)");
                modifymember1=con.prepareStatement("select * from memberlogin where name like ?");
                memberhomereturn1=con.prepareStatement("select * from billitem where name like ?");//add data in table on keyrelease
                memberhomesell1=con.prepareStatement("select * from item where name like ?");
                memberhomesearch1=con.prepareStatement("select * from item where name like ?");
                adminhome1=con.prepareStatement("select * from item where name like ?");
                getitem=con.prepareStatement("select * from item where itemid=?");
                admin_home_addmedicine=con.prepareStatement("insert into item(name,batch,qty,exp,mrp) values(?,?,?,?,?)");
                admin_home_delete=con.prepareStatement("delete from item where itemid=?");
                admin_home_modify=con.prepareStatement("update item set name=?,batch=?,qty=?,exp=?,mrp=? where itemid=?");
                admin_home_viewallexpiries=con.prepareStatement("select * from item where exp>=?");
                modify_member_modify=con.prepareStatement("update memberlogin set name=?,phone=?, where mid=?");
                member_home_returnitem=con.prepareStatement("delete from billitem where bid=? and itemid=?");
                member_home_returnallitem1=con.prepareStatement("delete from billitem where bid=?");
                member_home_returnallitem2=con.prepareStatement("delete from billinvoice where bid=?");
                modify_member_delete=con.prepareStatement("delete from memberlogin where mid=?");
                member_home_savebill=con.prepareStatement("insert into billinvoice(bid,pname,amt,disc,namt,bdate,mid) values(?,?,?,?,?,?,?)");
                maxBid=con.prepareStatement("select max(bid) from billinvoice");
                insertbillitem=con.prepareStatement("insert into billitem(bid,itemid,name,qty,mrp,amount) values(?,?,?,?,?,?)");
                updateqtyitem=con.prepareStatement("update item set qty=? where itemid=?");
                
        }
        catch(Exception ex)
        {
            JOptionPane.showConfirmDialog(null,ex);
        }
    } 
}
