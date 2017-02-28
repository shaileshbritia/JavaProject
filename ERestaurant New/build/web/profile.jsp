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
        RequestDispatcher rd=request.getRequestDispatcher("index.jsp");
        request.setAttribute("msg","Please Login First!!");
        rd.forward(request, response);
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
	
  <h3>My Profile</h3>
  <div class="content">
    <div class="cartbg">
      &nbsp;&nbsp;Name: &nbsp;&nbsp;<b> <%=name%> </b><br/><br/>
      &nbsp;&nbsp;Email Id: &nbsp;&nbsp;<b> <%=uid%> </b><br/><br/>
      &nbsp;&nbsp;Phone: &nbsp;&nbsp;<b> <%=rs.getString(4)%> </b><br/><br/>
      &nbsp;&nbsp;Address: &nbsp;&nbsp;<b> <%=rs.getString(5)%> </b><br/><br/>
      <input class="bluebutton" name="" type="Button" value="Edit Profile"onclick="parent.location='editprofile.jsp' " />
      <input class="redbutton" name="" type="Button" value="Change Password"onclick="parent.location='changepass.jsp' " />
    </div>    
  </div>
  <div class="footer">Design & Develop by ABC</div>
    
</div>
</body>
</html>
