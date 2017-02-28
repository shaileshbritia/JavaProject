<%@page import="my.ItemStore"%>
<%@page import="java.util.*"%>
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
                    
    LinkedHashMap tm=(LinkedHashMap)session.getAttribute("itemStore");
    Set set = tm.entrySet();
    Iterator i = set.iterator();
    int x=0;
    int total=0;
    if(i.hasNext()) 
    {x++;}
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
  <h3>My Cart</h3>
  <div class="content">
    <div class="cartbg">
        
        <%
        if(x==0)
        {
            String msg=(String)request.getParameter("msg");
            if(msg!=null)  
            {
            %>
              <center><b><font color="#AD1025"><%=msg%></font></b></center> 
            <%
            }
            else{
        %>
            <center><b><font color="#AD1025">Cart is Empty</font></b></center> 
        <%
            }
        }
        else
        {
        %>
            <div class="ctable" >
            <table >
                <tr>
                    <th width="62%">Item List</th><th width="14%">Price</th><th width="9%">Qty</th><th width="15%">Total</th>   
                </tr>               
                <%  
                    tm=(LinkedHashMap)session.getAttribute("itemStore");
                    set = tm.entrySet();
                    i = set.iterator();
                    while(i.hasNext()) 
                    {
                        Map.Entry me = (Map.Entry)i.next();
                        ItemStore is=(ItemStore)tm.get(me.getKey());
                %>
                        <tr>                           
                            <td><a href="DeleteItem.jsp?iname=<%=is.iname%>"> <img src="img/close.png" width="15" height="15" /></a>					                          
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <%=is.iname%> </td>
                            <td><%=is.price%></td>
                            <td><%=is.qty%></td>
                            <% total=total+is.qty*is.price;%>
                            <td><%=is.qty*is.price%></td>
                        </tr> 
                <%            
                    }
                %>
                
            </table>
            </div>
            <div class="total">             
              <font size="+1">&nbsp;&nbsp;&nbsp;Net Amount: &nbsp;&nbsp;</font>
              <font size="+1.5"><b><%=total%>/- </b></font>
                <br/><br/><br/>
            <font size="+.5"><b>Delivery Addresss </b></font><br/><br/>
            <form action="Order.jsp" method="post">
                <textarea name="addr" class='aform'><%=rs.getString(5)%></textarea><br/><br/>
                <input name="total" type="hidden" value='<%=total%>' />
                <input class="bluebutton" name="" type="submit" value="Order Now"/>
            </form>  
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
