import java.sql.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;

@WebServlet("/MI")
@MultipartConfig(maxFileSize = 16177215) 
public class ModifyItem extends HttpServlet {
protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try
        {
            ServletContext application=getServletContext();
            Statement st=(Statement)application.getAttribute("stmt");
            String in=request.getParameter("itname");
            String n=request.getParameter("iname");
            int p=Integer.parseInt(request.getParameter("price"));
            String c=request.getParameter("categ");
          
            if(!(in.equals(n)))
            {
               ResultSet rs1=st.executeQuery("select * from itemdetails where iname='"+n+"'");
                if(rs1.next())
                {
                    response.sendRedirect("aitem.jsp?msg2=Item Already Added!!");
                }  
            }
            Part filePart = request.getPart("img");
            if(filePart.getSize()==0)
            {
                PreparedStatement updateItem=(PreparedStatement)application.getAttribute("updateItem2");
                updateItem.setString(1, n);
                updateItem.setInt(2, p);
                updateItem.setString(3, c);
                updateItem.setString(4, in);
                updateItem.executeUpdate();
            }
            else
            {
                PreparedStatement updateItem=(PreparedStatement)application.getAttribute("updateItem");
                InputStream pis = filePart.getInputStream();
                updateItem.setString(1, n);
                updateItem.setInt(2, p);
                updateItem.setBinaryStream(3, pis);
                updateItem.setString(4, c);
                updateItem.setString(5, in);
                updateItem.executeUpdate();
            }
            response.sendRedirect("aitem.jsp?msg2=Successfully Updated!!");  
        }
        catch(Exception ee)
        {
            out.println("Exception Occur: "+ee);
            ee.printStackTrace();
        }
    }

}
