package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.ResultSet;
import vmm.DBLoader;

public final class question_005fdetails_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <script>\n");
      out.write("            var xmlhttp = new XMLHttpRequest();\n");
      out.write("            function go1()\n");
      out.write("            {\n");
      out.write("\n");
      out.write("\n");
      out.write("                xmlhttp.open(\"GET\", \"./session_check\", true);\n");
      out.write("                xmlhttp.onreadystatechange = go2;\n");
      out.write("                xmlhttp.send();\n");
      out.write("                console.log(\"request sent\");\n");
      out.write("            }\n");
      out.write("\n");
      out.write("\n");
      out.write("            function go2()\n");
      out.write("            {\n");
      out.write("                if (xmlhttp.readyState === 4 && xmlhttp.status === 200)\n");
      out.write("                {\n");
      out.write("\n");
      out.write("                    console.log(xmlhttp.responseText);\n");
      out.write("                    if (xmlhttp.responseText.trim() === \"fail\")\n");
      out.write("                    {\n");
      out.write("                        alert(\"Log in first\");\n");
      out.write("                        window.location.href = \"userlogin.jsp\";\n");
      out.write("\n");
      out.write("                    } else\n");
      out.write("                    {\n");
      out.write("                        go3();\n");
      out.write("                    }\n");
      out.write("                }\n");
      out.write("\n");
      out.write("\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            function go3()\n");
      out.write("            {\n");
      out.write("                var b = document.getElementById(\"tex\").value;\n");
      out.write("                var qid = document.getElementById(\"qid\").value;\n");
      out.write("\n");
      out.write("                if (b == \"\")\n");
      out.write("                {\n");
      out.write("                    alert(\"Enter something\");\n");
      out.write("                } else\n");
      out.write("                {\n");
      out.write("                    xmlhttp.open(\"GET\", \"./addanswer?answer=\"+b+\"&qid=\"+qid, true);\n");
      out.write("                    xmlhttp.onreadystatechange = go4;\n");
      out.write("                    xmlhttp.send();\n");
      out.write("                    console.log(\"request send\");\n");
      out.write("\n");
      out.write("                }\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            function go4()\n");
      out.write("            {\n");
      out.write("                if (xmlhttp.readyState === 4 && xmlhttp.status === 200)\n");
      out.write("                {\n");
      out.write("                    document.getElementById(\"ques\").innerHTML=xmlhttp.responseText;\n");
      out.write("                    \n");
      out.write("                    console.log(xmlhttp.responseText);\n");
      out.write("                    \n");
      out.write("                    if (xmlhttp.responseText.trim() === \"success\")\n");
      out.write("                    {\n");
      out.write("                        window.location.href=\"question_details.jsp\";\n");
      out.write("                        alert(\"answer added\");\n");
      out.write("                        document.location.reload();\n");
      out.write("                    }\n");
      out.write("                }\n");
      out.write("            }\n");
      out.write("\n");
      out.write("        </script>\n");
      out.write("        ");

                   int qid1= Integer.parseInt(request.getParameter("question_id"));

                        ResultSet rs = DBLoader.executeStatement("select * from question where questionid='"+qid1+"'");
                        while (rs.next())
                        {
                            String title = rs.getString("title");
                            String des = rs.getString("description");
                            String postedby = rs.getString("posted_by");
                            String postedon = rs.getString("posted_on");
                            String keyword = rs.getString("keywords");
                            String content = rs.getString("content");
                            int qid2 = rs.getInt("questionid");
                            String qid = rs.getString("questionid");

                    
      out.write("\n");
      out.write("                  <div  style=\"margin: 10px;padding: 10px;border-radius: 10px;box-shadow: 1px 1px 5px #000;\">\n");
      out.write("\n");
      out.write("\n");
      out.write("                        <h2 style=\"color: #005cbf\"><a href=\"question_details.jsp?\">");
      out.print(title);
      out.write(" </a> </h2>\n");
      out.write("\n");
      out.write("                        <p class=\"lead\">");
      out.print(des);
      out.write("</p>\n");
      out.write("                        <p>");
      out.print(content);
      out.write("</p>\n");
      out.write("                        <p>");
      out.print(keyword);
      out.write("</p>\n");
      out.write("                         \n");
      out.write("                        <div style=\"text-align: right\">\n");
      out.write("                            \n");
      out.write("                            <span>Posted by :");
      out.print(postedby);
      out.write("</span>\n");
      out.write("                            <p>Posted on: ");
      out.print(postedon);
      out.write(" </p>\n");
      out.write("                            <div style=\"text-align: left\">\n");
      out.write("\n");
      out.write("                            </div>\n");
      out.write("                           <input type=\"text\" id=\"qid\" value=\"");
      out.print(qid);
      out.write("\" hidden=\"\" />\n");
      out.write("\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                       \n");
      out.write("                            ");

                                }
                            
      out.write("\n");
      out.write("        <p style=\"color: #28a745; margin:10px;padding: 10px;\">Post Answer:</p>\n");
      out.write("        <div style=\"margin:10px;padding: 10px;border-radius:10px;box-shadow: 1px 1px 5px #000;\">\n");
      out.write("        <textarea id=\"tex\"  rows=\"4\" cols=\"100\" class=\"form-control\" style=\"margin: 4px;padding: 4px;border-radius: 0px; \" ></textarea>\n");
      out.write("        <input type=\"button\" class=\"btn btn-default\" style=\"text-align: left\" id=\"ans\" value=\"Post\" onclick=\"go1()\" />               \n");
      out.write("        </div>\n");
      out.write("            ");

                int qid3 = Integer.parseInt(request.getParameter("question_id"));
                ResultSet rs2 = DBLoader.executeStatement("select * from answer where qid = '"+qid3+"' ORDER BY aid ASC");
                while (rs2.next())
                {
                    String ans = rs2.getString("answer");
                
                
      out.write("\n");
      out.write("           <div style=\"margin:10px;padding: 10px;box-shadow: 1px 1px 5px #000;position: static;\">\n");
      out.write("               <p class=\"lead\" >");
      out.print(ans);
      out.write("</p>\n");
      out.write("               <div style=\"text-align: right\">\n");
      out.write("               </div>\n");
      out.write("           </div>\n");
      out.write("               ");

                   }

                   
      out.write("\n");
      out.write("                   <div id=\"ques\">\n");
      out.write("                       \n");
      out.write("                   </div>\n");
      out.write("        </div>\n");
      out.write("        </div>                 \n");
      out.write("                          \n");
      out.write("                                                            \n");
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
