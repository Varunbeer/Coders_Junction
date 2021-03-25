package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class admin_005flogin_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("        <title>LOGIN</title>\n");
      out.write("        <script>\n");
      out.write("            \n");
      out.write("            \n");
      out.write("            var xmlhttp=new XMLHttpRequest();\n");
      out.write("         function go()   \n");
      out.write("         {\n");
      out.write("             var un = document.getElementById(\"name\").value;\n");
      out.write("             var ps = document.getElementById(\"password\").value;\n");
      out.write("                          \n");
      out.write("             if(un==\"\"||ps==\"\")\n");
      out.write("             {\n");
      out.write("                 alert(\"fill the empty field\");\n");
      out.write("             } \n");
      out.write("            else\n");
      out.write("             {\n");
      out.write("                 alert(\"else block\");\n");
      out.write("                 xmlhttp.open(\"GET\",\"./admin_login_logic?un=\"+un+\"&ps=\"+ps,true); \n");
      out.write("                 xmlhttp.onreadystatechange=go2;            \n");
      out.write("             \n");
      out.write("                 xmlhttp.send(); \n");
      out.write("                 console.log(\"request sent\"); \n");
      out.write("                 alert(\"end of else\");\n");
      out.write("             }\n");
      out.write("         }   \n");
      out.write("            \n");
      out.write("          function go2()\n");
      out.write("          {\n");
      out.write("              \n");
      out.write("              if( xmlhttp.readyState==4  && xmlhttp.status ==200)\n");
      out.write("              {\n");
      out.write("                  \n");
      out.write("                  document.getElementById(\"h11\").innerHTML = xmlhttp.responseText;\n");
      out.write("                  \n");
      out.write("                  console.log(xmlhttp.responseText);\n");
      out.write("                  \n");
      out.write("                  if(xmlhttp.responseText.trim()==\"Login Successfull\")\n");
      out.write("                  {\n");
      out.write("                     setInterval(\"go3()\",1000);\n");
      out.write("                  }\n");
      out.write("                  else\n");
      out.write("                  {\n");
      out.write("                      \n");
      out.write("                  }\n");
      out.write("              }\n");
      out.write("          }\n");
      out.write("          \n");
      out.write("          function go3()\n");
      out.write("          {\n");
      out.write("              \n");
      out.write("              window.location.href=\"admin_home.jsp\";\n");
      out.write("          }\n");
      out.write("    \n");
      out.write("        </script>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <h1><center>Admin Login</center></h1>\n");
      out.write("    <center><label class=\"label label-default\">Enter Username</label></center><br>\n");
      out.write("    <center><input type=\"text\" id=\"name\"></center><br>\n");
      out.write("    <center><label>Enter Password</label></center><br>\n");
      out.write("    <center><input type=\"password\" id=\"password\"></center>\n");
      out.write("    <br>\n");
      out.write("    <br>\n");
      out.write("    <center><input type=\"button\" class=\"btn btn-primary  btn-lg\" value=\"Login\" onclick=\"go()\"/></center>\n");
      out.write("    <h1 id=\"h11\"></h1>\n");
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
