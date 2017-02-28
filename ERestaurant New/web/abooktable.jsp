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
    PreparedStatement getTables=(PreparedStatement)application.getAttribute("getTables");
    getTables.setString(1,cd);
    ResultSet rs=getTables.executeQuery();
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
    	
    	<br/><center><b><font color="#AD1025">Table Booking Details</font></b></center> <br/>
      <div class="ctable" >
            <table >
                <tr>
                    <th width="5%">Booking ID</th><th width="28%">Email ID</th><th width="17%">Name</th><th width="15%">Slot</th><th width="15%">Date</th><th width="10%">Tables</th><th width="10%">Status</th>   
                </tr>
                <%
                    int x=0;
                    while(rs.next())
                    {
                        x++;
       
                %>
                <tr>
                     <td><%=rs.getInt(1)%></td>
                     <td><%=rs.getString(5)%></td>
                     <td><%=rs.getString(2)%></td>
                     <td><%=rs.getString(4)%></td>
                     <td><%=rs.getString(3)%></td>
                     <td><%=rs.getString(6)%></td>
                     <td><%=rs.getString(7)%></td>                    
                </tr>
                <%
                    }
                %>   
                
            </table>
      </div>
      <%
      if(x!=0)
      {
     %>
      <div class="acanceltable">
    	<h3>Cancel Table</h3>
        <div class="acform">	
        <form action="acanceltableProcess.jsp" method="post">  	
            Booking ID:   
            <input class="lform" name="bid" type="text" />
            <input class="redbutton" value="Cancel Booking" type="submit" />
        </form>
        <br/><br/>
        <%
        String msg=(String)request.getParameter("msg");
        if(msg!=null)  
        {
        %>
            <br/><%=msg%>
        <%
        }
        %>
        </div>
     </div> 
     <%
        }
      %>
  </div>
  <div class="footer">Design & Develop by ABC</div>
    
</div>
</body>
</html>
