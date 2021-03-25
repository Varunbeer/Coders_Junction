/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

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
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import vmm.FileUploader;
import vmm.DBLoader;

@MultipartConfig
public class likeRequest extends HttpServlet
{

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {

        
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        
        try
        {
           
            String aid = request.getParameter("answer2");
            String user = (String)session.getAttribute("usersignup");
           
            ResultSet rs = DBLoader.executeStatement("select * from likeTable where aid = \'"+aid+"\' and username =\'"+user+"\'");
            if(rs.next())
            {
            rs.deleteRow();
            out.println("fail");
            }
            else
            {
            rs.moveToInsertRow();
            rs.updateString("aid" , aid);
            rs.updateString("username",user);
            rs.insertRow();
            out.println("success");
            }

        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
