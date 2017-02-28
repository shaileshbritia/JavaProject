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
    String uid=(String)session.getAttribute("uid");
    String name=(String)session.getAttribute("uname");
    if(uid==null)  
    {
        response.sendRedirect("index.jsp?msg=Please Login First!!");
    }
    PreparedStatement getUserWhereID=(PreparedStatement)application.getAttribute("getUserWhereID");
    getUserWhereID.setString(1,uid);
    ResultSet rs=getUserWhereID.executeQuery();
    rs.next();
%>
<body>
<div class="container">
  <div class="header">
  	<h5>E-Restaurant</h5>
    <p>
    
    <a href="profile.jsp">Profile</a> &nbsp;&nbsp;&nbsp; 
    <a href="booktable.jsp">BookTable</a> &nbsp;&nbsp;&nbsp;
    
    <a href="menu.jsp">Menu</a> &nbsp;&nbsp;&nbsp;
    <a href="chefs.jsp">Chefs</a> &nbsp;&nbsp;&nbsp;
    <a href="gallery.jsp">Gallery</a> &nbsp;&nbsp;&nbsp;
    <a href="contact.jsp">Contact</a> &nbsp;&nbsp;&nbsp;
    <a href="cart.jsp">Cart</a> &nbsp;&nbsp;&nbsp;
    
    Welcome <font color="#F7A90F"><b> <%=name%> </b></font> &nbsp;&nbsp;&nbsp; 
    <input class="redbutton" type="button" value="logout" onclick="parent.location='logout.jsp' "/>
    
	</p>
  </div>
  <div class="block5"></div>
<iframe src="slide.html" style="width:960px;height:365px;max-width:100%;overflow:hidden;border:none;padding:0;margin:0 auto;			display:block;" marginheight="0" marginwidth="0"></iframe>
  <div class="content">
    <div class="booktable">
     <h3>Book Table</h3>
     <div class="form">
       <div class="form1">
       		Booking Date:<br/><br/><br/>
            Slot:<br/><br/><br/>
            No of Tables:<br/><br/>
       </div>
        <form action="booktableProcess.jsp" method="post">
     	<div class="form2">
        	<input class="lform" name="bdate" type="date" /><br/><br/>
        	<select name="slot" class="lform">
                <option value="8AM-10AM">8AM-10AM</option>
                <option value="10AM-12PM">10AM-12PM</option>
                <option value="12PM-2PM">12PM-2PM</option>
                <option value="2PM-4PM">2PM-4PM</option>
                <option value="4PM-6PM">4PM-6PM</option>
                <option value="6PM-8PM">6PM-8PM</option> 
                <option value="8PM-10PM">8PM-10PM</option>
                <option value="10PM-12AM">10PM-12AM</option>
            </select>
              <br/><br/>
       		<select name="ntable" class="lform">
                <option value="1">1</option>
                <option value="2">2</option>
                <option value="3">3</option>
                <option value="4">4</option>
                <option value="5">5</option>
            </select><br/>
       </div>
       <div class="form3">
       	<input class="bluebutton" value="Book" type="submit" />
        </form>
      </div>
        <%
            String msg=(String)request.getAttribute("msg");
            if(msg!=null)  
            {
        %>
              <br/><%=msg%>
        <%
            }
        %>
    </div>
  </div>
  <div class="canceltable">
    	<h3>Cancel Table</h3>
        <div class="form">
       <div class="form1">
       		Booking ID:<br/><br/><br/>
       </div>
        <form action="canceltableProcess.jsp" method="post">
     	<div class="form2">
        	<input class="lform" name="bid" type="text" /><br/><br/>
       </div>
       <div class="form3">
       	<input class="redbutton" value="Cancel Booking" type="submit" />
        </form>
        </div>
        <%
            String msg2=(String)request.getAttribute("msg2");
            if(msg2!=null)  
            {
        %>
              <br/><%=msg2%>
        <%
            }
        %>
     </div>
</div>
   </div>
  <div class="footer">Design & Develop by ABC</div>
    
</div>
</body>
</html>
