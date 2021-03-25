<%-- 
    Document   : question_details
    Created on : 24 Apr, 2019, 1:59:32 PM
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
        <script>
            var xmlhttp = new XMLHttpRequest();
            function go1()
            {


                xmlhttp.open("GET", "./session_check", true);
                xmlhttp.onreadystatechange = go2;
                xmlhttp.send();
                console.log("request sent");
            }


            function go2()
            {
                if (xmlhttp.readyState === 4 && xmlhttp.status === 200)
                {

                    console.log(xmlhttp.responseText);
                    if (xmlhttp.responseText.trim() === "fail")
                    {
                        alert("Log in first");
                        window.location.href = "userlogin.jsp";

                    } else
                    {
                        go3();
                    }
                }


            }

            function go3()
            {
                var b = document.getElementById("tex").value;
                                var qid = document.getElementById("qid").value;

                if (b == "")
                {
                    alert("Enter something");
                } else
                {
                    xmlhttp.open("GET", "./addanswer?answer="+b+"&qid="+qid, true);
                    xmlhttp.onreadystatechange = go4;
                    xmlhttp.send();
                    console.log("request send");

                }
            }

            function go4()
            {
                if (xmlhttp.readyState === 4 && xmlhttp.status === 200)
                {
                    console.log(xmlhttp.responseText);
                    if (xmlhttp.responseText.trim() === "success")
                    {
                        alert("answer added");
                    }
                }
            }

        </script>
        <%
            int qid2 = Integer.parseInt(request.getParameter("question_id2"));

            ResultSet rs = DBLoader.executeStatement("select * from question where questionid='" + qid2 + "'");
            while (rs.next()) {
                String title = rs.getString("title");
                                String qid = rs.getString("questionid");

                String des = rs.getString("description");
                String postedby = rs.getString("posted_by");
                String postedon = rs.getString("posted_on");
                String keyword = rs.getString("keywords");
                String content = rs.getString("content");
        %>
        <div  style="margin: 10px;padding: 10px;border-radius: 10px;box-shadow: 1px 1px 5px #000;">


            <h2 style="color: #005cbf"><%=title%></h2>

            <p class="lead"><%=des%></p>
            <p><%=content%></p>
            <p><%=keyword%></p>


            <div style="text-align: right">

                <span>Posted by :<%=postedby%></span>
                <p>Posted on: <%=postedon%> </p>
                <div style="text-align: left">

                </div>
                
                <input type="text" id="qid" value="<%=qid%>" hidden="" />
            </div>
        </div>

        <%
            }
        %>
        <p style="color: #28a745; margin:10px;padding: 10px;">Post Answer:</p>
        <div style="margin:10px;padding: 10px;border-radius:10px;box-shadow: 1px 1px 5px #000;">
            <textarea id="tex"  rows="4" cols="100" class="form-control" style="margin: 4px;padding: 4px;border-radius: 0px; " ></textarea>
           
            
            <input type="button" class="btn btn-default" style="text-align: left" id="ans" value="Post" onclick="go1()" />               

        </div>        

    </body>
</html>
