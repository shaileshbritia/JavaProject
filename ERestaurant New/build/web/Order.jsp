<%@page import="my.ItemStore"%>
<%@page import="javax.mail.internet.*"%>
<%@page import="javax.mail.*"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<%    
    String e=(String)session.getAttribute("uid");
    String n=(String)session.getAttribute("uname");
    if(e==null)  
    {
        response.sendRedirect("index.jsp?msg=Please Login First!!");       
    }  
    String addr=request.getParameter("addr");
    int total=Integer.parseInt(request.getParameter("total"));
    
    java.text.DateFormat dateFormat = new java.text.SimpleDateFormat("yyyy-MM-dd");
    String cd=dateFormat.format(new java.util.Date());
    
    PreparedStatement getMaxOrderID=(PreparedStatement)application.getAttribute("getMaxOrderID");
    ResultSet rs=getMaxOrderID.executeQuery();
    int oid=1;
    if(rs.next())
        oid=rs.getInt(1)+1;
    
    LinkedHashMap tm=(LinkedHashMap)session.getAttribute("itemStore");
    Set set = tm.entrySet();
    Iterator i = set.iterator();
    PreparedStatement insertOrderItem=(PreparedStatement)application.getAttribute("insertOrderItem");             
    String item="";
    while(i.hasNext()) 
    {
        Map.Entry me = (Map.Entry)i.next();
        ItemStore is=(ItemStore)tm.get(me.getKey());
        insertOrderItem.setInt(1, oid);
        insertOrderItem.setString(2, is.iname);
        insertOrderItem.setInt(3, is.price);
        insertOrderItem.setInt(4, is.qty);
        insertOrderItem.executeUpdate();
        item= item+ "Item: "+is.iname+"  Price: "+is.price+"  Quantity: "+is.qty+"\n";
    }
    PreparedStatement insertOrder=(PreparedStatement)application.getAttribute("insertOrder");             
    insertOrder.setInt(1, oid);
    insertOrder.setString(2, e);
    insertOrder.setString(3, cd);
    insertOrder.setInt(4, total);
    insertOrder.setString(5, addr);
    insertOrder.executeUpdate();
    tm=new LinkedHashMap();
    session.setAttribute("itemStore", tm);
    
    String msg="Order Placed Successfull. Your Order ID: "+oid;
    String subject=msg;
    String body="Dear "+n+",your order Successfullly placed and Your Order Id: "+oid+
            "\n\n"+item+"\n Thank You!!";

    final String aemail=application.getInitParameter("aemail");
    final String apass=application.getInitParameter("apass");
    try
    {
        Properties properties = new Properties();
        properties.put("mail.smtp.host", "smtp.gmail.com");  
        properties.put("mail.smtp.socketFactory.port", "465");  
        properties.put("mail.smtp.socketFactory.class",  
              "javax.net.ssl.SSLSocketFactory");  
        properties.put("mail.smtp.auth", "true");  
        properties.put("mail.smtp.port", "465");
        Session ses = Session.getInstance(properties,    
            new javax.mail.Authenticator() {  
             protected PasswordAuthentication getPasswordAuthentication() {  
             return new PasswordAuthentication(aemail, apass); } 
            });  

        Message message = new MimeMessage(ses);  
        message.setFrom(new InternetAddress(aemail));  
        message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(e));  
        message.setSubject(subject);  
        message.setText(body);  
        Transport.send(message);               
    }
    catch(Exception ex)
    {
        msg=msg+" Mail Sending Fail<br/>"+ex.toString();
    }
    //response.sendRedirect("cart.jsp?msg=success");
    response.sendRedirect("cart.jsp?msg="+msg+".<br/>Order delivered within 30 minutes. Get other details from your Mail box.");	
%>