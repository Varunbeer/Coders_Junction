<%-- 
    Document   : userProfile
    Created on : 4 May, 2019, 3:33:25 PM
    Author     : Lab-3_13
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="vmm.DBLoader"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
         <div style="margin:150px;margin-top: 50px;margin-bottom: 10px;padding: 10px;box-shadow: 1px 1px 5px #005cbf;position: static;">
          <%
          String postedby = request.getParameter("userNameProfile");
          ResultSet rs = DBLoader.executeStatement("select * from question where posted_by='"+postedby+"'");
          rs.next();
          {
            String name = rs.getString("posted_by");
         %>
         
       
         <center><h1>Name:<%=name%></h1></center>
        
         </div>
         <%
             }
             %>
        <div style="margin:150px;margin-right: 900px;margin-top: 10px;margin-bottom: 10px;padding: 10px;box-shadow: 1px 1px 5px #005cbf;position: static;">
        <%
          String postedby2 = request.getParameter("userNameProfile");
          ResultSet rs2 = DBLoader.executeStatement("select * from question where posted_by='"+postedby2+"'");
          while(rs2.next())
          {
            String title = rs2.getString("title");
         %>
         <p><%=title%></p>
         <%
             }
         %>
        </div>
         
           <%
             String pho = request.getParameter("userPhoto");
           ResultSet rs3 = DBLoader.executeStatement("select * from usersignup where photo = '"+pho+"' ");
           rs.next();
           {
           String photo1 =  rs3.getString("photo");
         %>
          <img class="rounded float-right" src="<%=photo1%>" style="width: 50px;height: 50px;margin-left: 8px;margin-bottom: 5px; margin-bottom: 5px;border-radius: 20px 20px 20px 20px;" /> 
         <%
             }
         %>
         
         </div>
         

    </body>
</html>
