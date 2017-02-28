<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<% 
	String u=request.getParameter("aid");
	String p=request.getParameter("pass");
        Statement st=(Statement)application.getAttribute("stmt");
        ResultSet rs=st.executeQuery("select * from admininfo where aid='"+u+"' and pass='"+p+"'");
        if(rs.next())
        {
            session.setAttribute("aname", rs.getString(3));
            response.sendRedirect("adminhome.jsp");
        }
        else
        {
            response.sendRedirect("index.jsp?msg=Wrong Entries!!");
        }   		
%>