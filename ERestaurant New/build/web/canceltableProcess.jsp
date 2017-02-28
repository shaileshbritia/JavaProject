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
    String bookid=request.getParameter("bid");
    int tbid=Integer.parseInt(bookid);
    PreparedStatement checkBID=(PreparedStatement)application.getAttribute("checkBID");
    checkBID.setInt(1, tbid);
    ResultSet rs=checkBID.executeQuery();
    if(rs.next())
    {
        PreparedStatement cancelTableBook=(PreparedStatement)application.getAttribute("cancelTableBook");       
        cancelTableBook.setInt(1, tbid);
        cancelTableBook.executeUpdate();

        String msg="Table Canceled Successfull. Get other details from your Mail box.";
        String subject=msg;
        String body="Dear "+n+",your table Successfullly CANCELED and Your Booking Id: "+tbid+". Thank You!!";

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
            System.out.println(ex);
        }

        response.sendRedirect("booktable.jsp?msg2=Table Canceled Successfull.");
    }
    else
    {
        response.sendRedirect("booktable.jsp?msg2=Wrong Booking Id!!");
        
    }
    	
%>