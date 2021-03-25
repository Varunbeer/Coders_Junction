package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class admin_005fhome_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <link href=\"bootstrap-3.3.7-dist/css/bootstrap.css\" rel=\"stylesheet\" type=\"text/css\"/>\n");
      out.write("        <script src=\"bootstrap-3.3.7-dist/js/jquery-3.3.1.js\" type=\"text/javascript\"></script>\n");
      out.write("        <script src=\"bootstrap-3.3.7-dist/js/bootstrap.js\" type=\"text/javascript\"></script>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>Admin Home</title>\n");
      out.write("        <script>\n");
      out.write("          var xmlhttp=new XMLHttpRequest();\n");
      out.write("          function change_password()\n");
      out.write("          {\n");
      out.write("             var admin_name = document.getElementById(\"un\").value;\n");
      out.write("             var old_pass = document.getElementById(\"op\").value;\n");
      out.write("             var new_pass = document.getElementById(\"np\").value;\n");
      out.write("             var confirm_pass = document.getElementById(\"cp\").value;\n");
      out.write("             \n");
      out.write("             if(admin_name==\"\"||old_pass==\"\"||new_pass==\"\"||confirm_pass==\"\") \n");
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
      out.write("                xmlhttp.open(\"GET\",\"./admin_changePass?un=\"+admin_name+\"&op=\"+old_pass+\"&np=\"+new_pass,true); \n");
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
      out.write("              window.location.href=\"admin_login.jsp\";\n");
      out.write("          }\n");
      out.write("    \n");
      out.write("        </script>\n");
      out.write("        \n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("         ");

             String u = (String)(session.getAttribute("user"));    
             
             if(u==null)
               response.sendRedirect("admin_login.jsp");
        
      out.write("\n");
      out.write("        \n");
      out.write("        <h1>Welcome ");
      out.print( u );
      out.write(" </h1>\n");
      out.write("        \n");
      out.write("        \n");
      out.write("\n");
      out.write("        </div><br>\n");
      out.write("        <div class=\"container\">\n");
      out.write("            <div class=\"row\">\n");
      out.write("\n");
      out.write("                <div class=\"col-sm-8 col-sm-offset-2\">\n");
      out.write("                    <div class =\"form-group\">\n");
      out.write("                        <a href=\"manage_categories.jsp\"> <input type=\"button\" class =\"btn btn-success\" value =\"Manage Category\"/></a><br>\n");
      out.write("                    </div>\n");
      out.write("                    \n");
      out.write("                    \n");
      out.write("                    \n");
      out.write("                    \n");
      out.write("\n");
      out.write("        \n");
      out.write("        <div class=\"container\">\n");
      out.write("            <div class=\"row\">\n");
      out.write("\n");
      out.write("                <div class=\"col-sm-12\">\n");
      out.write("\n");
      out.write("                    <button data-toggle=\"modal\" data-target=\"#myModal\" class=\"btn btn-success\">Change Password</button>\n");
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
      out.write("                            <label for=\"un\">Enter Username</label>\n");
      out.write("                            <input type=\"text\" id=\"un\" value=\"");
      out.print(u );
      out.write("\"  class=\"form-control\" readonly /><br>\n");
      out.write("                        </div>\n");
      out.write("\n");
      out.write("                        <div class=\"form-group\">\n");
      out.write("                            <label for=\"op\">Old Password</label>\n");
      out.write("                            <input id=\"op\" type=\"password\" placeholder=\"password\" class=\"form-control\"  /><br>\n");
      out.write("                        </div>\n");
      out.write("\n");
      out.write("                       <div class=\"form-group\">\n");
      out.write("                            <label for=\"np\">New Password</label>\n");
      out.write("                            <input id=\"np\" type=\"password\" placeholder=\"password\" class=\"form-control\"  /><br>\n");
      out.write("                        </div>\n");
      out.write("                            <div class=\"form-group\">\n");
      out.write("                            <label for=\"cp\">Confirm Password</label>\n");
      out.write("                            <input id=\"cp\" type=\"password\" placeholder=\"password\" class=\"form-control\"  /><br>\n");
      out.write("                        </div>\n");
      out.write("                    </form>\n");
      out.write("\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"modal-footer\">\n");
      out.write("                        <button data-dismiss=\"modal\" class=\"btn btn-warning\" onclick=\"change_password()\">Change</button>\n");
      out.write("                    </div>\n");
      out.write("                    \n");
      out.write("                        <div class=\"modal-footer\">\n");
      out.write("                        <button data-dismiss=\"modal\" class=\"btn btn-warning\">Close</button>\n");
      out.write("                        </div>     \n");
      out.write("\n");
      out.write("\n");
      out.write("                </div>\n");
      out.write("\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("        </div>\n");
      out.write("\n");
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
