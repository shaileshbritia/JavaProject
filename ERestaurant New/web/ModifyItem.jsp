<%@page import="java.sql.*"%>
<%@page import="my.ItemStore"%>
<%@page import="java.util.*"%>
<%
String n=request.getParameter("iname");
String name=(String)session.getAttribute("aname");
if(name==null)  
{
    response.sendRedirect("index.jsp?msg=Please Login First!!");
}
else
{
    PreparedStatement getItemWhereName=(PreparedStatement)application.getAttribute("getItemWhereName");
    getItemWhereName.setString(1,n);
    ResultSet rs=getItemWhereName.executeQuery();
    if(rs.next())
    {
        session.setAttribute("itemDetails",rs);
        response.sendRedirect("aitem.jsp");
    }
    else
    {
        response.sendRedirect("aitem.jsp?msg2=Invalid Item Name!!");
    }
}
%>