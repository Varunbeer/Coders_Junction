import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.util.Collection;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import vmm.DBLoader;
import vmm.FileUploader;


@MultipartConfig
public class userdata extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet userdata</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet userdata at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        PrintWriter out = response.getWriter();
        try
        {
            Collection<Part> parts = request.getParts();
            String absolutepath = request.getServletContext().getRealPath("/images");
            System.out.println(absolutepath);
            String filename="";
            for (Part part : parts)
            {
                String newfilename = new Date().getTime() + ".jpg";
                filename = FileUploader.savefileonserver(part, absolutepath, newfilename);
            }
            // File is uploaded...Now insert entry in DB
            
            String username = request.getParameter("use");
            
             String password = request.getParameter("pas");
             String email = request.getParameter("em");
             String contactnumber = request.getParameter("cn");
             String sec_ques = request.getParameter("s1");
             String sec_ans = request.getParameter("sa");
             String gender = request.getParameter("gender");
            
            ResultSet rs= DBLoader.executeStatement("select * from usersignup");
          //  if(rs.next())
            
                rs.next();
                 rs.moveToInsertRow();
                 rs.updateString("username", username);
                 rs.updateString("password", password);
                 rs.updateString("email", email);
                 rs.updateString("contact_number", contactnumber);
                 rs.updateString("security_question",sec_ques);
                 rs.updateString("security_answer",sec_ans);
                 rs.updateString("gender",gender);
                rs.updateString("photo", "images/"+filename);
                
                
                rs.insertRow();
                out.println("success");
            
           
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
