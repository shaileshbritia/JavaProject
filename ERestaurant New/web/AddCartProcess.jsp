<%@page import="my.ItemStore"%>
<%@page import="java.util.*"%>
<%    
    String e=(String)session.getAttribute("uid");
    String n=(String)session.getAttribute("uname");
    if(e==null)  
    {
        response.sendRedirect("index.jsp?msg=Please Login First!!");       
    }
    else
    {
        ItemStore is=new ItemStore();
        is.iname=request.getParameter("iname");
        is.price=Integer.parseInt(request.getParameter("price"));
        is.qty=Integer.parseInt(request.getParameter("noi"));

        LinkedHashMap tm=(LinkedHashMap)session.getAttribute("itemStore");
        ItemStore is2=(ItemStore)tm.get(is.iname);
        if(is2==null)
            tm.put(is.iname, is);
        else
        {
            is.qty=is.qty+is2.qty;
            tm.put(is.iname, is);
        }

        response.sendRedirect("menu.jsp?categ="+request.getParameter("categ"));
    }
%>