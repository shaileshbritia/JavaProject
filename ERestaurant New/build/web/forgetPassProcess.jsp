<%@page import="javax.mail.internet.*"%>
<%@page import="javax.mail.*"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<% 
    String e=request.getParameter("email");
    Statement st=(Statement)application.getAttribute("stmt");
    ResultSet rs=st.executeQuery("select * from userinfo where email='"+e+"'");
    if(rs.next())
    {
        String pw=rs.getString(3);
        String msg="Password Send Successfully!!";
        String subject=msg;
        String body="Your User ID "+e+"\nYour Password: "+pw+"\nThank You!!";

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
        response.sendRedirect("forgetpass.jsp?msg="+msg);
        
    }           
    else
    {
        response.sendRedirect("forgetpass.jsp?msg=Email ID does not Exist!!");
    }	
%>