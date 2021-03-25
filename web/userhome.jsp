<%-- 
    Document   : userhome
    Created on : 18 Apr, 2019, 12:05:42 PM
    Author     : Lab-3_13
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="bootstrap-3.3.7-dist/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <script src="bootstrap-3.3.7-dist/js/jquery-3.3.1.js" type="text/javascript"></script>
        <script src="bootstrap-3.3.7-dist/js/bootstrap.js" type="text/javascript"></script>
    </head>
    <body>
    <center><h2>User Home</h2></center>
    <script>
        var xmlhttp=new XMLHttpRequest();
          function go1()
          {
             var user_name = document.getElementById("user1").value;
             var old_pass = document.getElementById("opas").value;
             var new_pass = document.getElementById("npas").value;
             var confirm_pass = document.getElementById("cpas").value;
             
             if(user_name==""||old_pass==""||new_pass==""||confirm_pass=="") 
             {
                 
                 alert("All fields are required");
             }
             
            if(new_pass!=confirm_pass)
            {
                alert("New password not matching");
                
            }
            
            if(new_pass==confirm_pass)
            {
                
                xmlhttp.open("GET","./user_change_password?user1="+user_name+"&opas="+old_pass+"&npas="+new_pass,true); 
                 xmlhttp.onreadystatechange=go2;            
             
                 xmlhttp.send(); 
                 console.log("request sent");
            }
          }
           function go2()
          {
              
              if( xmlhttp.readyState==4  && xmlhttp.status ==200)
              {
                  
                  //document.getElementById("").innerHTML = xmlhttp.responseText;
                  
                  console.log(xmlhttp.responseText);
                  
                  if(xmlhttp.responseText.trim()=="Success")
                  {
                      alert("Password change successful");
                     setInterval("go3()",1000);
                  }
                  else
                  {
                      alert("Change password failed");
                  }
              }
          }
          
          function go3()
          {
              
              window.location.href="userlogin.jsp";
          }
          function go4()
          {
              window.location.href="addquestion.jsp";
          }
          function seeques()
          {
              window.location.href="index.jsp";
          }
          
    </script>
        
         <%
             String u = (String)(session.getAttribute("usersignup"));    
             
             if(u==null)
               response.sendRedirect("userlogin.jsp");
        %>
        
        <h1 style="margin: 30px" >Welcome <%= u %> </h1>
        <center><input  type="button" class="btn btn-default" value="Add Question" onclick="go4()"/></center>
        <br>
        <center><input  type="button" class="btn btn-default" value="See Questions" onclick="seeques()"/></center>

         <br>
 <div class="container">
    <div class="row">

    <div class="col-sm-12">

        <center><button  data-toggle="modal" data-target="#myModal" class="btn btn-default">Change Password</button></center>
                    

                </div>
            </div>

        </div>

        <div class="modal fade" id="myModal">
            <div class="modal-dialog">
                <div class="modal-content">

                    <div class="modal-header">
                        <a class="close" data-dismiss="modal">&times</a>
                        <h1>Change Password</h1>
                    </div>
                    <div class="modal-body">
                        <form>
                        <div class="form-group">
                            <label for="user1">Enter Username</label>
                            <input type="text" id="user1" placeholder="Enter Username"  class="form-control" /><br>
                        </div>

                        <div class="form-group">
                            <label for="opas">Old Password</label>
                            <input id="opas" type="password" placeholder="Old Password" class="form-control"  /><br>
                        </div>

                       <div class="form-group">
                            <label for="npas">New Password</label>
                            <input id="npas" type="password" placeholder="New Password" class="form-control"  /><br>
                        </div>
                            <div class="form-group">
                            <label for="cpas">Confirm Password</label>
                            <input id="cpas" type="password" placeholder="Confirm Password" class="form-control"  /><br>
                        </div>
                    </form>

                    </div>
                    <div class="modal-footer">
                        <button data-dismiss="modal" class="btn btn-warning" onclick="go1()">Change</button>
                    </div>
                    
                        <div class="modal-footer">
                        <button data-dismiss="modal" class="btn btn-warning">Close</button>
                        </div>  
                </div>
                </div>
                </div>
 

    </body>
</html>
