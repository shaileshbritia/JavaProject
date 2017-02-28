<%@page import="java.sql.*"%>
<%
    String n=request.getParameter("iname");
    PreparedStatement deleteItem=(PreparedStatement)application.getAttribute("deleteItem");
    deleteItem.setString(1, n);
    deleteItem.executeUpdate();
    response.sendRedirect("aitem.jsp?msg2=Successfully Deleted!!"); 
%>