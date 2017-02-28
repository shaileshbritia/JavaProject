<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<% 
	String u=request.getParameter("uid");
	String p=request.getParameter("pass");
        Statement st=(Statement)application.getAttribute("stmt");
        ResultSet rs=st.executeQuery("select * from userinfo where email='"+u+"' and pass='"+p+"'");
        if(rs.next())
        {
            session.setAttribute("uid", u);
            session.setAttribute("uname", rs.getString(2));
            LinkedHashMap tm=new LinkedHashMap();
            session.setAttribute("itemStore", tm);
            response.sendRedirect("profile.jsp");
        }
        else
        {
            response.sendRedirect("index.jsp?msg=Wrong Enteries!!");
        }   		
%>