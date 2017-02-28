<%@page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>E-Restaurant</title>
<style type="text/css">
</style>
<link href="css/style.css" rel="stylesheet" type="text/css" />
</head>
<%
    String name=(String)session.getAttribute("aname");
    if(name==null)  
    {
        response.sendRedirect("index.jsp?msg=Please Login First!!");
    }
    java.text.DateFormat dateFormat = new java.text.SimpleDateFormat("yyyy-MM-dd");
    String cd=dateFormat.format(new java.util.Date());
    PreparedStatement getOrders=(PreparedStatement)application.getAttribute("getOrders");
    getOrders.setString(1,cd);
    ResultSet rs=getOrders.executeQuery();
%>
<body>
<div class="container">
  <div class="header">
  	<h5>E-Restaurant</h5>
    <p>
        <a href="adminhome.jsp">Orders</a> &nbsp;&nbsp;&nbsp;
        <a href="abooktable.jsp">TableBookings</a> &nbsp;&nbsp;&nbsp;
        <a href="aitem.jsp">Items</a> &nbsp;&nbsp;&nbsp; 
        Welcome <font color="#F7A90F"><b> <%=name%> </b></font> &nbsp;&nbsp;&nbsp;
        <input class="redbutton" type="button" value="logout" onclick="parent.location='logout.jsp' "/>
    </p>
  </div>
  <div class="block5"></div>
<iframe src="slide.html" style="width:960px;height:365px;max-width:100%;overflow:hidden;border:none;padding:0;margin:0 auto;			display:block;" marginheight="0" marginwidth="0"></iframe>

  <div class="content">
    <div class="cartbg">
    	<br/><center><b><font color="#AD1025">List of Orders Placed (<%=cd%>)</font></b></center> <br/>
      <div class="ctable" >
            <table >
                <tr>
                    <th width="12%">Order ID</th><th width="60%">Items</th><th width="11%">Total</th><th width="17%">Date</th>   
                </tr>
                
                <%
                    PreparedStatement getOrderItems=(PreparedStatement)application.getAttribute("getOrderItems");                        
                    while(rs.next())
                    {
                        getOrderItems.setInt(1,rs.getInt(1));
                        ResultSet rs1=getOrderItems.executeQuery();
                        String item="";
                        while(rs1.next())
                            item=rs1.getString(2)+", "+item;
                %>
                <tr>
                     <td><%=rs.getInt(1)%></td>
                     <td><%=item%></td>
                     <td><%=rs.getInt(4)%></td>
                     <td><%=rs.getString(3)%></td>
                </tr>
                <%
                    }
                %>    
            </table>
      </div>
    </div>    
  </div>
  <div class="footer">Design & Develop by ABC</div>
    
</div>
</body>
</html>
