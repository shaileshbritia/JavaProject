<%@page import="java.sql.*"%>
<% 
    String e=(String)session.getAttribute("uid");
    String n=request.getParameter("name");
    String p=request.getParameter("ph");
    String a=request.getParameter("addr");
    if(e==null)  
    {
        response.sendRedirect("index.jsp?msg=Please Login First!!");
    } 
    PreparedStatement updateUser=(PreparedStatement)application.getAttribute("updateUser");
    updateUser.setString(1,n);
    updateUser.setString(2,p);
    updateUser.setString(3,a);
    updateUser.setString(4,e);
    updateUser.executeUpdate();
    session.setAttribute("uname", n);
    response.sendRedirect("editprofile.jsp?msg=Details Updated Successfully!!");
    
%>