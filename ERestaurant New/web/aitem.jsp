<%@page import="java.sql.ResultSet"%>
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
    <div class="booktable">
     <h3>Add New Item</h3>
     <div class="form">
       <div class="form1">
       		Item Name:<br/><br/><br/>
            Price:<br/><br/><br/>
            Category:<br/><br/><br/>
            Image:<br/><br/>
       </div>
         <form action="AI" method="post" enctype="multipart/form-data">
     	<div class="form2">
        	<input class="lform" name="iname" type="text" /><br/><br/>
        	<input class="lform" name="price" type="text" /><br/><br/>
            <select name="categ" class="lform">
                <option value="vm">Veg Main Course</option>
                <option value="nvm">Non-Veg Main Course</option>
                <option value="roti">Roti</option>
                <option value="rice">Rice</option>
                <option value="salad">Salad</option> 
                <option value="raita">Raita</option>
                <option value="sweet">Sweet</option>
                <option value="vc">VegChinese</option> 
                <option value="nvc">Non-VegChinese</option> 
            </select><br/><br/><br/>
       		<input  type='file' name='img'/><br/>
       </div>
       <div class="form3">
       	<input class="bluebutton" value="Add" type="submit" />
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
  <div class="canceltable">
    	<h3>Modify Item</h3>
        <div class="form">
       <div class="form1">
       		Item Name:<br/><br/><br/>
       </div>
        <form action="ModifyItem.jsp" method="post">
     	<div class="form2">
        	<input class="mform" name="iname" type="text" />
            <input class="bluebutton" value="GO" type="submit" />
        </form>
       </div>       
        <div class="removefloat"></div>
        <%
        ResultSet rs=(ResultSet)session.getAttribute("itemDetails");
        if(rs!=null)
        {
        %>
            <hr/><br/>
            <div class="form1">
                Item Name:<br/><br/><br/>
                Price:<br/><br/><br/>
                Category:<br/><br/><br/>
                Image:<br/><br/><br/>
            </div>
            <form action="MI" method="post" enctype="multipart/form-data">
            <div class="form2">
                <input name="itname" type="hidden" value="<%=rs.getString(1)%>"/>
                <input class="lform" name="iname" type="text" value="<%=rs.getString(1)%>" /><br/><br/>
                <input class="lform" name="price" type="text" value="<%=rs.getString(2)%>"/><br/><br/>
                <%=rs.getString(4)%> &nbsp; <select name="categ" class="lform">
                    <option value="vm">Veg Main Course</option>
                    <option value="nvm">Non-Veg Main Course</option>
                    <option value="roti">Roti</option>
                    <option value="rice">Rice</option>
                    <option value="salad">Salad</option> 
                    <option value="raita">Raita</option>
                    <option value="sweet">Sweet</option>
                    <option value="vc">Veg Chinese</option> 
                    <option value="nvc">Non-Veg Chinese</option> 
                </select><br/><br/>
                <img src='GetPhoto?iname=<%=rs.getString(1)%>' width="100" height="100" />
                <input  type='file' name='img'/>
            </div>
           <div class="form3">          
            <input class="bluebutton" value="Update" type="submit" />&nbsp;&nbsp;
            <input class="redbutton" value="Delete" type="button" onclick="parent.location='DeleteItem.jsp?iname=<%= rs.getString(1)%>' "/>
            </form
            </div>
        
        <%
            session.setAttribute("itemDetails",null);
        }

        String msg2=(String)request.getParameter("msg2");
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
