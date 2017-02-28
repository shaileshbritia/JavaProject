
import java.sql.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;

@WebServlet("/AI")
@MultipartConfig(maxFileSize = 16177215) 
public class AddItem extends HttpServlet {

    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try
        {
            ServletContext application=getServletContext();
            Statement st=(Statement)application.getAttribute("stmt");
            PreparedStatement insertItem=(PreparedStatement)application.getAttribute("insertItem");
            String n=request.getParameter("iname");
            int p=Integer.parseInt(request.getParameter("price"));
            String c=request.getParameter("categ");
            ResultSet rs1=st.executeQuery("select * from itemdetails where iname='"+n+"'");
            if(rs1.next()||n==null)
            {
                response.sendRedirect("aitem.jsp?msg=Item Already Added!!");
            }
            else
            {
                InputStream pis = null; // input stream of the upload file        
                    // obtains the upload file part in this multipart request
                Part filePart = request.getPart("img");

                pis = filePart.getInputStream();

                insertItem.setString(1, n);
                insertItem.setInt(2, p);
                insertItem.setBinaryStream(3, pis);
                insertItem.setString(4, c);
                
                insertItem.executeUpdate();

                response.sendRedirect("aitem.jsp?msg=Successfully Added!!");
            }    
        }
        catch(Exception ee)
        {
            out.println("Exception Occur: "+ee);
            ee.printStackTrace();
        }
    }

}
