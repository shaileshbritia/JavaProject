<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>E-Restaurant</title>
<style type="text/css">
</style>
<link href="css/style.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div class="container">
	<a href="admin.jsp">Admin Login</a>
  <div class="header">
  	<h5>E-Restaurant</h5>
    <p>
        <a href="menu.jsp">Menu</a>  &nbsp;&nbsp;&nbsp;
        <a href="chefs.jsp">Chefs</a> &nbsp;&nbsp;&nbsp;
        <a href="gallery.jsp">Gallery</a> &nbsp;&nbsp;&nbsp;
        <a href="contact.jsp">Contact</a> 
    </p>
  </div>
  <div class="block5"></div>
<iframe src="slide.html" style="width:960px;height:365px;max-width:100%;overflow:hidden;border:none;padding:0;margin:0 auto;			display:block;" marginheight="0" marginwidth="0"></iframe>
  <div class="content">
 	  <div class="welcome">
      	<h3>WELCOME TO OUR SITE</h3>
   	    <img src="img/welcome.jpg" width="202" height="141" />
    	</div>
      <p>ERestaurant, offers guests a fun and casual dining experience. The locally owned neighborhood favorite boasts a menu full of mouth-watering appetizers, comfort all-American favorites, and delectable desserts. In the evenings, Geogeske transforms into a hip lounge with a full-service bar and a mix of sultry beats by local Deejays.</p>
    <div class="login">
 	    	<h4>Login Form</h4>
 	      <div class="login1">
 	        User ID:<br/><br/><br/>
            Password:<br/><br/>
 	      </div>
      <form action="loginprocess.jsp" method="post">
          <div class="login2">
 	        <input  class="lform"name="uid" type="text" /><br/><br/>
            <input class="lform" name="pass" type="password" /><br/><br/>
 	      </div>
          <div class="login3">
          <input class="bluebutton" value="Login" type="submit" />
          <input class="redbutton" type="button" value="New User" onclick="parent.location='newuser.jsp'"/>
        </form><br/><br/>
        <a href="forgetpass.jsp">Forget Password</a>
        
        <%
            String msg=(String)request.getParameter("msg");
            if(msg!=null)  
            {
        %>
              <br/><br/><%=msg%>
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
