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
	
  <h3>Edit Profile</h3>
  <div class="content">
    <div class="cartbg">
    <form action="editprofileProcess.jsp" method="get">
      &nbsp;&nbsp;Name: &nbsp;&nbsp;<input class="lform" name="name" type="text" value='<%=name%>' /><br/><br/>
      &nbsp;&nbsp;Email Id: &nbsp;&nbsp;<%=uid%><br/><br/>
      &nbsp;&nbsp;Phone: &nbsp;&nbsp;<input class="lform" name="ph" type="text" value='<%=rs.getString(4)%>' /><br/><br/>
      &nbsp;&nbsp;Address: &nbsp;&nbsp;<textarea class="lform" name="addr" ><%=rs.getString(5)%></textarea><br/><br/>
      <input class="bluebutton" name="" type="submit" value="Update" />
      </form>
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
  <div class="footer">Design & Develop by ABC</div>
    
</div>
</body>
</html>
