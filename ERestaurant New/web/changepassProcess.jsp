<%@page import="java.sql.*"%>
<% 
    Statement st=(Statement)application.getAttribute("stmt");
    String e=(String)session.getAttribute("uid");
    String o=request.getParameter("opass");
    String n=request.getParameter("npass");
    String c=request.getParameter("cpass");
    if(e==null)  
    {
        response.sendRedirect("index.jsp?msg=Please Login First!!");
    } 
    String msg="";
    if(n.equals(c))
    {
        try 
        {
            ResultSet rs=st.executeQuery("select * from userinfo where email='"+e+"' and pass='"+o+"'");
            if(rs.next())
            {
                st.executeUpdate("update userinfo set pass='"+n+"' where email='"+e+"' and pass='"+o+"'");
                msg="Password Updated Successfully!!";
            }
            else
            {
                msg="Wrong OLD Password!!";
            }
        } catch (Exception ex) {
            msg=ex.toString();
        }
    }
    else
    {
        msg="Wrong Confirm Password!!";
    }
    response.sendRedirect("changepass.jsp?msg="+msg);
    
%>