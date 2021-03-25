import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import vmm.DBLoader;

public class admin_changePass extends HttpServlet
{

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException
    {
        try
          {
             HttpSession session= request.getSession();
              
             response.setContentType("text/html");           
             PrintWriter out = response.getWriter();
           
             String un = request.getParameter("un");
             String op = request.getParameter("op");
             String np = request.getParameter("np");
                        
             ResultSet rs = DBLoader.executeStatement("select * from admin_data where username=\'"+un+"\' and password=\'"+op+"\'");
                                    
             if(rs.next())
             {   out.println("Success");
                 rs.updateString("password",np);
                 rs.updateRow();
             }
             else
             {
                 out.println("<h3 style=\"color: red\">Change Password Failed</h3>");
             }
                   
             
             
          }
          catch(Exception ex)
          {
             ex.printStackTrace();
          }
         
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
