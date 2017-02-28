<%@page import="javax.mail.internet.*"%>
<%@page import="javax.mail.*"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<% 
	String n=request.getParameter("name");
	String e=request.getParameter("email");
        String p=request.getParameter("ph");
	String a=request.getParameter("addr");

        PreparedStatement getUserWhereID=(PreparedStatement)application.getAttribute("getUserWhereID");
        getUserWhereID.setString(1,e);
        ResultSet rs=getUserWhereID.executeQuery();
        if(rs.next()||e==null)
        {
            response.sendRedirect("newuser.jsp?msg=User Already Registered!!");
            
        }
        else
        {
        Random RANDOM = new Random();
        int PASSWORD_LENGTH = 8;
        String letters = "abcdefghjkmnpqrstuvwxyzABCDEFGHJKMNPQRSTUVWXYZ23456789@";
        String pw = "";
        for (int i=0; i<PASSWORD_LENGTH; i++)
        {
            int index = (int)(RANDOM.nextDouble()*letters.length());
            pw += letters.substring(index, index+1);
        }
        PreparedStatement insertUser=(PreparedStatement)application.getAttribute("insertUser");       
        insertUser.setString(1, e);
        insertUser.setString(2, n);
        insertUser.setString(3, pw);
        insertUser.setString(4, p);
        insertUser.setString(5, a);
        insertUser.executeUpdate();
        
        String msg="Citizen Registered Successfull.";
        String subject=msg;
        String body="You are Registered Successfullly.\nYour User Id: "+e+" and Password: "+pw;

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
            msg=msg+" Mail Sending Fail<br/>";
        }
        response.sendRedirect("newuser.jsp?msg="+msg+" Get id and password from mail box.");
        }	
%>