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
                    alert("Enter Something");
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
                        document.location.reload();
                    }
                }
            }
            var gaid;
            function go5(aid)
            {
                gaid=aid;
                xmlhttp.open("GET","./session_check",true);
                xmlhttp.onreadystatechange = go6;
                xmlhttp.send();
                console.log("request sent");
            }
            function go6()
            {
                if(xmlhttp.readyState === 4 && xmlhttp.status == 200)
                {
                    console.log(xmlhttp.responseText);
                    if(xmlhttp.responseText.trim()=== "fail")
                    {
                        alert("Log in first");
                        window.location.href="userlogin.jsp";
                    }
                    else
                    {
                        go7();
                    }
                }
            }
            function go7()
            {
                var e = document.getElementById("user2").value;
                var qid2 = document.getElementById("qid2").value;
                xmlhttp.open("GET","./likeRequest?answer2="+gaid+"&user3="+e,true);
                xmlhttp.onreadystatechange = go8;
                xmlhttp.send();
                console.log("request sent");
            }
            function go8()
            {
                if(xmlhttp.readyState === 4 && xmlhttp.status === 200)
                {
                    console.log(xmlhttp.responseText);
                    if(xmlhttp.responseText.trim()==="success")
                    {
                        alert("liked");
                        document.location.reload();
                    }
                    else if (xmlhttp.responseText.trim()==="fail")
                    {
                        alert(" unliked");
                        document.location.reload();
                    }
                }
            }
          
            function add(aid)
            {
                gaid=aid;
               
                xmlhttp.open("GET","./session_check",true);
                xmlhttp.onreadystatechange = add2;
                xmlhttp.send();
                console.log("request sent");
            }
            function add2()
            {
                if(xmlhttp.readyState===4 && xmlhttp.status===200)
                {
                    console.log(xmlhttp.responseText);
                    if(xmlhttp.responseText.trim()==="fail")
                    {
                        alert("Log In First");
                        window.location.href="userlogin.jsp";
                    }
                    if(xmlhttp.responseText.trim()==="success")
                    {
                        add3();
                    }
                }
            }
            function add3()
            {
               
               
                var ac = document.getElementById("add"+gaid).value;
              
                
                if(ac=="")
                {
                    alert("Enter Something");
                }
                else
                {
                xmlhttp.open("GET","./addComment?comment="+ac+"&answer3="+gaid,true);
                xmlhttp.onreadystatechange = add4;
                xmlhttp.send();
                console.log("request sent");
            }
            }
            function add4()
            {
                if(xmlhttp.readyState === 4 && xmlhttp.status === 200)
                {
                 console.log(xmlhttp.responseText);
                 if(xmlhttp.responseText.trim()==="success")
                 {
                     alert("comment added");
                     document.location.reload();
                     
                 }
                    
                }
            }
            function bigImg(x) {
            x.style.height = "20px";
            x.style.width = "20px";
            }

            function normalImg(x) {
            x.style.height = "16px";
            x.style.width = "16px";
            }

        </script>
        
        <%
                   int qid1= Integer.parseInt(request.getParameter("question_id"));

                        ResultSet rs = DBLoader.executeStatement("select * from question where questionid='"+qid1+"'");
                        while (rs.next())
                        {
                            String title = rs.getString("title");
                            String des = rs.getString("description");
                            String postedby = rs.getString("posted_by");
                            String postedby2 = rs.getString("posted_by");
                            String postedon = rs.getString("posted_on");
                            String keyword = rs.getString("keywords");
                            String content = rs.getString("content");
                            String qid = rs.getString("questionid");

                    %>
                  <div  style="margin: 150px;margin-top: 10px;margin-bottom: 10px;padding: 10px;border-radius: 10px;box-shadow: 1px 1px 5px #000;background-color: transparent">

                   <%
                    ResultSet rs6 = DBLoader.executeStatement("select * from usersignup where username ='"+postedby+"'");
                    while(rs6.next())
                    {
                     String pho = rs6.getString("photo");

                    %>
                <div  style="float:right;">
               <img class="rounded float-right" src="<%=pho%>" style="width: 50px;height: 50px;margin-left: 8px;margin-bottom: 5px; margin-bottom: 5px;border-radius: 20px 20px 20px 20px;" /> 
               </div> 
          
                        <h2 style="color: #005cbf"><%=title%></h2>

                        <p class="lead"><%=des%></p>
                        <p><%=content%></p>
                        <p style="float:left">Keywords:<small><%=keyword%></small></p>
                         
                        <div style="text-align: right">
                            <span>Posted by :<a href="userProfile.jsp?userNameProfile=<%=postedby%>&userPhoto=<%=pho%>"><%=postedby%></span></a>
                            <p>Posted on: <%=postedon%> </p>
                            <div style="text-align: left">

                            </div>
                           <input type="text" id="qid" value="<%=qid%>" hidden="" />

                        </div>
                                  <%
                 }
                 %>
             
                    </div>
                       
 
        <div style="margin:150px;margin-top: 10px;margin-bottom: 10px;padding: 6px;box-shadow: 1px 1px 5px #000;">
            <p style="color: #28a745;"><small>Post Answer:</small></p>
        <textarea id="tex"  rows="1" cols="100" class="form-control" onfocus="this.rows=4;" style="margin: 4px;padding: 4px;border-radius: 0px; " ></textarea>
        <input type="button" class="btn btn-default" style="text-align: left" id="ans" value="Post" onclick="go1()" />               
        </div>
                <p style="color:#28a745;margin-left: 150px;"><small>Answers:</small></p>
        
            <%
                int qid3 = Integer.parseInt(request.getParameter("question_id"));
                ResultSet rs2 = DBLoader.executeStatement("select * from answer where qid = '"+qid3+"' ORDER BY aid DESC");
                String qid2="";
                while (rs2.next())
                {
                    String ans = rs2.getString("answer");
                    String date = rs2.getString("dateTime");
                     qid2 = rs2.getString("aid");
                    String user = (String)session.getAttribute("usersignup");
                    String user2 = rs2.getString("username");
                    int ansid = rs2.getInt("aid");
                %>
           <div style="margin:150px;margin-top: 10px;margin-bottom: 10px;padding: 10px;box-shadow: 1px 1px 5px #005cbf;position: static;">
               <p><%=ans%></p>
                                                 <%
                    ResultSet rs8 = DBLoader.executeStatement("select * from usersignup where username ='"+user2+"'");
                    while(rs8.next())
                    {
                     String pho3 = rs8.getString("photo");

                    %>
                <div  style="float:right;">
               <img class="rounded float-right" src="<%=pho3%>" style="width: 50px;height: 50px;margin-left: 8px;margin-bottom: 5px; margin-bottom: 5px;border-radius: 20px 20px 20px 20px;" /> 
               </div>
               <div style="text-align: right;">
                   <span style="float:right;" ><small>Posted by:<%=user2%><br>
                   Posted on:<%=date%></small></span> 
 
               </div>
                   <%
                       }
                       %>
                   
               
                  <%
                      
                       ResultSet rs4 = DBLoader.executeStatement("select count(*) as count from likeTable where aid='"+qid2+"'");
                       while(rs4.next())
                       {
                       int count = rs4.getInt("count");
                       %>
                       <input type="button"  id="like" class="btn btn-default"  value="Like" style="color:#005cbf" onclick="go5('<%=qid2%>')"/>
                        <span><%=count%></span>
        
                       <%
                           }
                           %>
               <img  onmouseover="bigImg(this)" onmouseout="normalImg(this)" border="0" src="images\jlike.png" alt="jlike" width="16" height="16" onclick="go5('<%=qid2%>')" >  
               <br><textarea class="form-control" id="add<%=qid2%>" placeholder="comment:" rows="1" cols="40" onfocus="this.rows=4;"style="resize: none;margin-top: 3px;"></textarea>
               <input type="button" class="btn btn-default" value="Add Comment" style="color: #005cbf;margin-top: 3px;" onclick="add('<%=qid2%>')"/>
               
               <%
                    ResultSet rs5 = DBLoader.executeStatement("select * from comment where aid = '"+ansid+"'");
                    while(rs5.next())
                    {
                        String com = rs5.getString("comment");
                        String user3 = rs5.getString("username");
                        
                %>
           <div style="margin:10px;margin-top: 10px;margin-bottom: 10px;padding: 10px;box-shadow: 1px 1px 2px #000;background-color: lightgoldenrodyellow">
                                  <%
                    ResultSet rs7 = DBLoader.executeStatement("select * from usersignup where username ='"+user3+"'");
                    while(rs7.next())
                    {
                     String pho2 = rs7.getString("photo");

                    %>
 
               <p><%=com%></p>
               <div  style="float:right;">
               <img class="rounded float-right" src="<%=pho2%>" style="width: 50px;height: 50px;margin-left: 8px;margin-bottom: 5px; margin-bottom: 5px;border-radius: 20px 20px 20px 20px;" /> 
               </div>
               <div style="text-align: right;">
                   <span  ><small>Posted by:<%=user3%><br>
                   Posted on:<%=date%></small></span> 
               </div>
                   <%
                       }
                       %>
               
           </div>
                <%
                    }
                    %>
               
               <input type="text" id="qid2" value="<%=qid2%>" hidden="" />
               <input type="text" id="user2" value="<%=user2%>" hidden="" />
           </div>
           
               <%
                   }

                   %>
                   
                            <%
                        }
                        %>
    
    </body>
</html>
