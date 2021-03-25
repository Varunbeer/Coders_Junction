package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class userhome_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <link href=\"bootstrap-3.3.7-dist/css/bootstrap.css\" rel=\"stylesheet\" type=\"text/css\"/>\n");
      out.write("        <script src=\"bootstrap-3.3.7-dist/js/jquery-3.3.1.js\" type=\"text/javascript\"></script>\n");
      out.write("        <script src=\"bootstrap-3.3.7-dist/js/bootstrap.js\" type=\"text/javascript\"></script>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("    <center><h2>User Home</h2></center>\n");
      out.write("    <script>\n");
      out.write("        var xmlhttp=new XMLHttpRequest();\n");
      out.write("          function go1()\n");
      out.write("          {\n");
      out.write("             var user_name = document.getElementById(\"user1\").value;\n");
      out.write("             var old_pass = document.getElementById(\"opas\").value;\n");
      out.write("             var new_pass = document.getElementById(\"npas\").value;\n");
      out.write("             var confirm_pass = document.getElementById(\"cpas\").value;\n");
      out.write("             \n");
      out.write("             if(user_name==\"\"||old_pass==\"\"||new_pass==\"\"||confirm_pass==\"\") \n");
      out.write("             {\n");
      out.write("                 \n");
      out.write("                 alert(\"All fields are required\");\n");
      out.write("             }\n");
      out.write("             \n");
      out.write("            if(new_pass!=confirm_pass)\n");
      out.write("            {\n");
      out.write("                alert(\"New password not matching\");\n");
      out.write("                \n");
      out.write("            }\n");
      out.write("            \n");
      out.write("            if(new_pass==confirm_pass)\n");
      out.write("            {\n");
      out.write("                \n");
      out.write("                xmlhttp.open(\"GET\",\"./user_change_password?user1=\"+user_name+\"&opas=\"+old_pass+\"&npas=\"+new_pass,true); \n");
      out.write("                 xmlhttp.onreadystatechange=go2;            \n");
      out.write("             \n");
      out.write("                 xmlhttp.send(); \n");
      out.write("                 console.log(\"request sent\");\n");
      out.write("            }\n");
      out.write("          }\n");
      out.write("           function go2()\n");
      out.write("          {\n");
      out.write("              \n");
      out.write("              if( xmlhttp.readyState==4  && xmlhttp.status ==200)\n");
      out.write("              {\n");
      out.write("                  \n");
      out.write("                  //document.getElementById(\"\").innerHTML = xmlhttp.responseText;\n");
      out.write("                  \n");
      out.write("                  console.log(xmlhttp.responseText);\n");
      out.write("                  \n");
      out.write("                  if(xmlhttp.responseText.trim()==\"Success\")\n");
      out.write("                  {\n");
      out.write("                      alert(\"Password change successful\");\n");
      out.write("                     setInterval(\"go3()\",1000);\n");
      out.write("                  }\n");
      out.write("                  else\n");
      out.write("                  {\n");
      out.write("                      alert(\"Change password failed\");\n");
      out.write("                  }\n");
      out.write("              }\n");
      out.write("          }\n");
      out.write("          \n");
      out.write("          function go3()\n");
      out.write("          {\n");
      out.write("              \n");
      out.write("              window.location.href=\"userlogin.jsp\";\n");
      out.write("          }\n");
      out.write("          function go4()\n");
      out.write("          {\n");
      out.write("              window.location.href=\"addquestion.jsp\";\n");
      out.write("          }\n");
      out.write("    </script>\n");
      out.write("        \n");
      out.write("         ");

             String u = (String)(session.getAttribute("usersignup"));    
             
             if(u==null)
               response.sendRedirect("userlogin.jsp");
        
      out.write("\n");
      out.write("        \n");
      out.write("        <h1>Welcome ");
      out.print( u );
      out.write(" </h1>\n");
      out.write("         <center><input type=\"button\" class=\"btn btn-default\" value=\"Add Question\" onclick=\"go4()\"/></center>\n");
      out.write("         <br>\n");
      out.write(" <div class=\"container\">\n");
      out.write("    <div class=\"row\">\n");
      out.write("\n");
      out.write("    <div class=\"col-sm-12\">\n");
      out.write("\n");
      out.write("        <center><button data-toggle=\"modal\" data-target=\"#myModal\" class=\"btn btn-default\">Change Password</button></center>\n");
      out.write("                    \n");
      out.write("\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("        </div>\n");
      out.write("\n");
      out.write("        <div class=\"modal fade\" id=\"myModal\">\n");
      out.write("            <div class=\"modal-dialog\">\n");
      out.write("                <div class=\"modal-content\">\n");
      out.write("\n");
      out.write("                    <div class=\"modal-header\">\n");
      out.write("                        <a class=\"close\" data-dismiss=\"modal\">&times</a>\n");
      out.write("                        <h1>Change Password</h1>\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"modal-body\">\n");
      out.write("                        <form>\n");
      out.write("                        <div class=\"form-group\">\n");
      out.write("                            <label for=\"user1\">Enter Username</label>\n");
      out.write("                            <input type=\"text\" id=\"user1\" placeholder=\"Enter Username\"  class=\"form-control\" /><br>\n");
      out.write("                        </div>\n");
      out.write("\n");
      out.write("                        <div class=\"form-group\">\n");
      out.write("                            <label for=\"opas\">Old Password</label>\n");
      out.write("                            <input id=\"opas\" type=\"password\" placeholder=\"Old Password\" class=\"form-control\"  /><br>\n");
      out.write("                        </div>\n");
      out.write("\n");
      out.write("                       <div class=\"form-group\">\n");
      out.write("                            <label for=\"npas\">New Password</label>\n");
      out.write("                            <input id=\"npas\" type=\"password\" placeholder=\"New Password\" class=\"form-control\"  /><br>\n");
      out.write("                        </div>\n");
      out.write("                            <div class=\"form-group\">\n");
      out.write("                            <label for=\"cpas\">Confirm Password</label>\n");
      out.write("                            <input id=\"cpas\" type=\"password\" placeholder=\"Confirm Password\" class=\"form-control\"  /><br>\n");
      out.write("                        </div>\n");
      out.write("                    </form>\n");
      out.write("\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"modal-footer\">\n");
      out.write("                        <button data-dismiss=\"modal\" class=\"btn btn-warning\" onclick=\"go1()\">Change</button>\n");
      out.write("                    </div>\n");
      out.write("                    \n");
      out.write("                        <div class=\"modal-footer\">\n");
      out.write("                        <button data-dismiss=\"modal\" class=\"btn btn-warning\">Close</button>\n");
      out.write("                        </div>  \n");
      out.write("                </div>\n");
      out.write("                </div>\n");
      out.write("                </div>\n");
      out.write(" \n");
      out.write("\n");
      out.write("    </body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
