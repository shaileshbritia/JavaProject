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
    String bd=request.getParameter("bdate");
    String s=request.getParameter("slot");
    String ntable=request.getParameter("ntable");
    int nt=Integer.parseInt(ntable);
    java.text.DateFormat dateFormat = new java.text.SimpleDateFormat("yyyy-MM-dd");
    String cd=dateFormat.format(new java.util.Date());
    int x=bd.compareTo(cd);
    if(x>=0)
    {
        PreparedStatement getTotalTable=(PreparedStatement)application.getAttribute("getTotalTable");
        ResultSet rs=getTotalTable.executeQuery();
        rs.next();
        int tt=rs.getInt(1);
        PreparedStatement getTableAllocated=(PreparedStatement)application.getAttribute("getTableAllocated");
        getTableAllocated.setString(1, bd);
        getTableAllocated.setString(2, s);
        rs=getTableAllocated.executeQuery();
        int ta=0;
        while(rs.next())
            ta=ta+rs.getInt(1);
        if(nt<=(tt-ta))
        {
            PreparedStatement getMaxTableBookID=(PreparedStatement)application.getAttribute("getMaxTableBookID");
            rs=getMaxTableBookID.executeQuery();
            int tbid=1;
            if(rs.next())
                tbid=rs.getInt(1)+1;
            PreparedStatement insertTableBook=(PreparedStatement)application.getAttribute("insertTableBook");       
            insertTableBook.setInt(1, tbid);
            insertTableBook.setString(2, n);
            insertTableBook.setString(3, bd);
            insertTableBook.setString(4, s);
            insertTableBook.setString(5, e);
            insertTableBook.setInt(6, nt);
            insertTableBook.setString(7, "Booked");
            insertTableBook.executeUpdate();

            String msg="Table Booked Successfull. Your Booking ID: "+tbid+". Get other details from your Mail box.";
            String subject=msg;
            String body="Dear "+n+",your table Successfullly booked and Your Booking Id: "+tbid+
                    ".\nTotal No of tables: "+nt+".\nBooking Date & Slot: "+bd+" "+s+".\n\nThank You!!";

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

            response.sendRedirect("booktable.jsp?msg=Table Booked Successfull. Your Booking ID: "+tbid);
            
        }
        else
        {
            response.sendRedirect("booktable.jsp?msg=Unable to Book. Total table left for given date & slot: "+(tt-ta));
            
        }            
    }
    else
    {
        response.sendRedirect("booktable.jsp?msg=Wrong date Entered!!");
   
    }	
%>