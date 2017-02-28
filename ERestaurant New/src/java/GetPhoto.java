

import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class GetPhoto extends HttpServlet {

    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String s=request.getParameter("iname");
            ServletContext application=getServletContext();
            Statement st=(Statement)application.getAttribute("stmt");
            ResultSet rs1=st.executeQuery("select image from itemdetails where iname='"+s+"'");
            if(rs1.next())
            {
                response.getOutputStream().write(rs1.getBytes(1));
            }
        } catch (Exception ex) {
            System.out.print("hello "+ex);
        }
    }
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
