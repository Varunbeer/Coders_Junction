<%-- 
    Document   : view_questions_category_wise
    Created on : 20 Apr, 2019, 3:12:00 PM
    Author     : Lab-3_13
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="vmm.DBLoader"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="bootstrap-3.3.7-dist/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <script src="bootstrap-3.3.7-dist/js/jquery-3.3.1.js" type="text/javascript"></script>
        <script src="bootstrap-3.3.7-dist/js/bootstrap.js" type="text/javascript"></script>
        <title>JSP Page</title>
    </head>
    <body>

        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <%
                        String catname = request.getParameter("category");
                        ResultSet rs = DBLoader.executeStatement("select * from question where category='"+catname+"' ORDER BY questionid DESC");
                        while (rs.next()) {
                            String title = rs.getString("title");
                            String des = rs.getString("description");
                            String qid = rs.getString("questionid");
                            String postedby = rs.getString("posted_by");
                            int qid1 = rs.getInt("questionid");

                    %>

                    <!--BOX-->


                    <div  style="margin: 10px;padding: 10px;border-radius: 10px;box-shadow: 1px 1px 5px #000;">


                        <h2 style="color: #005cbf"><a href="question_details.jsp?question_id=<%=qid1%>"><%=title%> </a> </h2>

                        <p class="lead"><%=des%></p>
                        
                        <div style="text-align: right">
                            
                            <span>Posted by :<%=postedby%></span>
                            
                        </div>
                    </div>


                    <%
                        }
                    %>

                    <!--end: BOX-->  

                </div>
            </div>
        </div>

    </body>




</html>
