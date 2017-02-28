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
    <a href="chefs.jsp">Our Chefs</a> &nbsp;&nbsp;&nbsp;
    <a href="gallery.jsp">Gallery</a> &nbsp;&nbsp;&nbsp;
    <a href="contact.jsp">Contact</a> &nbsp;&nbsp;&nbsp;
    <a href="cart.jsp">ViewCart</a> &nbsp;&nbsp;&nbsp;
    
    Welcome <font color="#F7A90F"><b> <%=name%> </b></font> &nbsp;&nbsp;&nbsp;
    <input class="redbutton" type="button" value="logout" onclick="parent.location='logout.jsp' "/>
	</p>
  </div>
  <div class="block5"></div>
<iframe src="slide.html" style="width:960px;height:365px;max-width:100%;overflow:hidden;border:none;padding:0;margin:0 auto;			display:block;" marginheight="0" marginwidth="0"></iframe>
  <div class="content">
    <div class="booktable">
     <h3>Change Password</h3>
     <div class="form">
       <div class="form1">
       		Old Password:<br/><br/><br/>
            New Password:<br/><br/><br/>
            Confirm Password:<br/><br/>
       </div>
        <form action="changepassProcess.jsp" method="post">
     	<div class="form2">
        	<input class="lform" name="opass" type="password" /><br/><br/>
        	<input class="lform" name="npass" type="password" /><br/><br/>
       		<input class="lform" name="cpass" type="password" /><br/><br/>
       </div>
       <div class="form3">
       	<input class="bluebutton" value="Change" type="submit" />
        </form>
      </div>
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
  </div>
  <div class="footer">Design & Develop by ABC</div>
    
</div>
</body>
</html>
