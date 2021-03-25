package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class addquestion_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("        <title>JSP Page</title>\n");
      out.write("    <script>\n");
      out.write("    var xml = new XMLHttpRequest();\n");
      out.write("    function category()\n");
      out.write("    {\n");
      out.write("        xml.open(\"GET\",\"./json_category\",true);\n");
      out.write("        xml.onreadystatechange = category2;\n");
      out.write("        xml.send();\n");
      out.write("    }\n");
      out.write("    function category2()\n");
      out.write("    {\n");
      out.write("    if (xml.readyState === 4 && xml.status === 200)\n");
      out.write("        {\n");
      out.write("            var res  = xml.responseText.trim();\n");
      out.write("            var mainjson=JSON.parse(res);\n");
      out.write("            console.log(res);\n");
      out.write("            var jsa = mainjson[\"ans\"];\n");
      out.write("             var ans=\"\";\n");
      out.write("             \n");
      out.write("             ans+=\"<option>Select Category</option>\";\n");
      out.write("             for(var i=0;i<jsa.length;i++)\n");
      out.write("             {\n");
      out.write("                 var js=jsa[i];\n");
      out.write("                 ans+=\"<option>\"+js[\"catname\"]+\"</option>\";\n");
      out.write("                 \n");
      out.write("             }\n");
      out.write("             document.getElementById(\"cat\").innerHTML=ans;\n");
      out.write("        }\n");
      out.write("        \n");
      out.write("    }\n");
      out.write("    \n");
      out.write("    function go1()\n");
      out.write("        {\n");
      out.write("            var title1=document.getElementById(\"ti\").value;\n");
      out.write("            var description=document.getElementById(\"desc\").value;\n");
      out.write("            var content=document.getElementById(\"con\").value;\n");
      out.write("            var category=document.getElementById(\"cat\").value;\n");
      out.write("            var keyword=document.getElementById(\"key\").value;\n");
      out.write("            xml.open(\"GET\",\"./addquestion_response?ti=\" + title1 + \"&desc=\" + description + \"&con=\" + content + \"&cat=\" + category + \"&key=\" + keyword,true);\n");
      out.write("            xml.onreadystatechange = go2;\n");
      out.write("            xml.send();\n");
      out.write("        }\n");
      out.write("        function go2()\n");
      out.write("        {\n");
      out.write("            if(xml.readyState===4 && xml.status===200)\n");
      out.write("            {\n");
      out.write("                document.getElementById(\"uadd\").innerHTML=xml.responseText;\n");
      out.write("                console.log(xml.responseText);\n");
      out.write("                if(xml.responseText.trim()===\"success\")\n");
      out.write("                {\n");
      out.write("                    alert(\"Question Added\");\n");
      out.write("                    window.location.href = \"userhome.jsp\";\n");
      out.write("                }\n");
      out.write("            }\n");
      out.write("        }\n");
      out.write("        \n");
      out.write("        </script>\n");
      out.write("        </head>\n");
      out.write("\n");
      out.write("        <body onload=\"category()\">\n");
      out.write("        <div class=\"jumbotron\" >\n");
      out.write("        <p>Add Question</p>\n");
      out.write("        </div>\n");
      out.write("        <center><p style=\"color:red;\" id=\"check\" ></p></center>\n");
      out.write("\n");
      out.write("        <div class =\" col-sm-8 col-sm-offset-2\">\n");
      out.write("\n");
      out.write("            <form action=\"#\" method=\"post\" enctype=\"multipart/form-data\" id=\"form3\">\n");
      out.write("                \n");
      out.write("                <div class=\"form-group\">\n");
      out.write("                    <label for=\"ti\">Title</label>\n");
      out.write("                    <input type=\"text\" id =\"ti\" name=\"ti\"  placeholder=\"Title\" class =\"form-control\"/>\n");
      out.write("                    <div class=\"col-sm-1\" id=\"1\">\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("\n");
      out.write("                <div class=\"form-group\">\n");
      out.write("                <label for=\"desc\">Description:</label>\n");
      out.write("                <textarea class=\"form-control\" rows=\"5\" id=\"desc\" placeholder=\"Description\"></textarea>\n");
      out.write("                </div>\n");
      out.write("\n");
      out.write("                <div class=\"form-group\">\n");
      out.write("                    <label for=\"con\">Content</label>\n");
      out.write("                    <input type=\"email\"  id =\"con\" name=\"con\" placeholder=\"Content\" class =\"form-control\"/>\n");
      out.write("                </div>\n");
      out.write("                \n");
      out.write("\n");
      out.write("  \n");
      out.write("  <div class=\"form-group\">\n");
      out.write("      <label  for=\"cat\">Category</label>\n");
      out.write("      <div class=\"form-group\">\n");
      out.write("          <select id=\"cat\" name=\"cat\" class=\"form-control\">\n");
      out.write("              \n");
      out.write("          </select>\n");
      out.write("          <br>\n");
      out.write("      </div>\n");
      out.write("  </div>\n");
      out.write("                \n");
      out.write(" <div class=\"form-group\">\n");
      out.write("                    <label for=\"key\">Keywords</label>\n");
      out.write("                    <input type=\"email\"  id =\"key\" name=\"key\" placeholder=\"Keywords should be comma seperated\" class =\"form-control\"/>\n");
      out.write("                </div>\n");
      out.write("                \n");
      out.write("\n");
      out.write("              <div class=\"container\">\n");
      out.write("\n");
      out.write("            </form>\n");
      out.write("            <div class=\"form-group\">\n");
      out.write("                <center><input type=\"button\" class=\"btn btn-default\" value=\"submit\" onclick=\"go1()\" /></center>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("        </div>\n");
      out.write("        \n");
      out.write("        <div id=\"uadd\">\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("        </div>\n");
      out.write("\n");
      out.write("    </body>\n");
      out.write("\n");
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
