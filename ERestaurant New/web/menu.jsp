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
<body>
<div class="container">
  <div class="header">
  	<h5>E-Restaurant</h5>
    <p>
    <%
    String uid=(String)session.getAttribute("uid");
    String name=(String)session.getAttribute("uname");
    ResultSet rs=null;
    if(uid!=null)  
    {
        PreparedStatement getUserWhereID=(PreparedStatement)application.getAttribute("getUserWhereID");
        getUserWhereID.setString(1,uid);
        rs=getUserWhereID.executeQuery();
        rs.next();
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
<div class="content">
    <div class="menu1">
        <a href="menu.jsp?categ=vm"> Veg Main Course</a><br/><hr/><br/>
        <a href="menu.jsp?categ=nvm"> Non-Veg Main Course</a><br/><hr/><br/>
        <a href="menu.jsp?categ=rice"> Rice</a><br/><hr/><br/>
        <a href="menu.jsp?categ=salad"> Salad</a><br/><hr/><br/>
        <a href="menu.jsp?categ=raita"> Raita</a><br/><hr/><br/>
        <a href="menu.jsp?categ=sweet"> Sweet</a><br/><hr/><br/>
        <a href="menu.jsp?categ=vc"> VegChinese</a><br/><hr/><br/>
        <a href="menu.jsp?categ=nvc"> Non-VegChinese</a><br/><hr/><br/>
        <a href="menu.jsp?categ=roti"> Roti</a><br/><br/>
  	</div>
  	<div class="menu2">
        <%
            String categ=request.getParameter("categ");
            if(categ==null)
            {
                categ="vm";
            }
            PreparedStatement getItemWhereCateg=(PreparedStatement)application.getAttribute("getItemWhereCateg");
            getItemWhereCateg.setString(1,categ);
            rs=getItemWhereCateg.executeQuery();
            while(rs.next())
            {
        %>
            <div class="item">
                <img src='GetPhoto?iname=<%=rs.getString(1)%>' width="100" height="100" />
                <div class="itemd">
                    <font size="+1.5"><%=rs.getString(1)%></font><br/><br/>
                    Pirce: <font color="#AD1025"><%=rs.getString(2)%>/-</font>
                </div>
                <div class="itemb">
                    <form action="AddCartProcess.jsp" method="post">
                    &nbsp;Quantity: &nbsp;&nbsp;<select name="noi" class="iform">
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                        <option value="4">4</option>
                        <option value="5">5</option>
                    </select><br/><br/>
                    <input name="iname" type="hidden" value='<%=rs.getString(1)%>' />
                    <input name="price" type="hidden" value='<%=rs.getString(2)%>' />
                    <input name="categ" type="hidden" value='<%=categ%>' />
                    <input class="bluebutton" value="Add to Cart" type="submit" />
                </form>
                </div> 
            </div>
        <%
            }      
        %>
  	
	</div>
  </div>
  <div class="footer">Design & Develop by ABC</div>
    
</div>
</body>
</html>
