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
    ResultSet rs=null;
    if(uid==null)  
    {
        PreparedStatement getUserWhereID=(PreparedStatement)application.getAttribute("getUserWhereID");
        getUserWhereID.setString(1,uid);
        rs=getUserWhereID.executeQuery();
        rs.next();
    }
%>
<body>
<div class="container">
  <div class="header">
  	<h5>E-Restaurant</h5>
    <p>
    <%
    if(uid!=null)
    {
    %>
        <a href="profile.jsp">Profile</a> &nbsp;&nbsp;&nbsp; 
        <a href="booktable.jsp">BookTable</a> &nbsp;&nbsp;&nbsp;
        <a href="menu.jsp">Menu</a> &nbsp;&nbsp;&nbsp;
        <a href="chefs.jsp">Chefs</a> &nbsp;&nbsp;&nbsp;
        <a href="gallery.jsp">Gallery</a> &nbsp;&nbsp;&nbsp;
        <a href="contact.jsp">Contact</a> &nbsp;&nbsp;&nbsp;
        <a href="cart.jsp">Cart</a> &nbsp;&nbsp;&nbsp;
        Welcome <font color="#F7A90F"><b> <%=name%> </b></font> &nbsp;&nbsp;&nbsp;
        <input class="redbutton" type="button" value="logout" onclick="parent.location='logout.jsp' "/>
    <%       
    }
    else
    {
    %>
        <a href="index.jsp">Home</a>  &nbsp;&nbsp;&nbsp;
        <a href="menu.jsp">Menu</a>  &nbsp;&nbsp;&nbsp;
        <a href="chefs.jsp">Chefs</a> &nbsp;&nbsp;&nbsp;
        <a href="gallery.jsp">Gallery</a> &nbsp;&nbsp;&nbsp;
        <a href="contact.jsp">Contact</a> 
    <%
    }
    %>
    </p>
  </div>
  <div class="block5"></div>
<iframe src="slide.html" style="width:960px;height:365px;max-width:100%;overflow:hidden;border:none;padding:0;margin:0 auto;			display:block;" marginheight="0" marginwidth="0"></iframe>
	<br/>
	<h3>Our Chefs</h3>
  <div class="gallerycontent">
    <div class="chefimage">
    <img src="img/chef1.jpeg" width="259" height="161" /><br/><br/> <b>James Jone</b> <br /><p>Leading, co-ordinating and directing Food operation to ensure that quality culinary products are delivered to guests.Creating and implementing menu concepts that strengthen the business.</p>
    </div>
    <div class="chefimage">
    <img src="img/chef2.jpeg" width="259" height="161" /><br/><br/> <b>Ching Sheen</b> <br /><p>Over 20 years of culinary experience in diverse restaurant and innovative restaurants internationally, I am qualified in international cookery and the implementation of food systems. </p>
    </div>
    <div class="chefimage">
    <img src="img/chef3.jpeg" width="259" height="161" /><br/><br/> <b>Mady Kron</b> <br /><p>Professional culinary career representing international experience with 4, 5 and 6 star Cruise Line and hotel operations with pre-opening experiences.</p>
    </div>
    
  </div>
  <div class="footer">Design & Develop by ABC</div>
    
</div>
</body>
</html>
