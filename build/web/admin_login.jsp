<%-- 
    Document   : admin_login
    Created on : 7 Apr, 2019, 11:00:17 PM
    Author     : JAI DAYAL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="bootstrap-3.3.7-dist/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <title>LOGIN</title>
        <script>
            
            
            var xmlhttp=new XMLHttpRequest();
         function go()   
         {
             var un = document.getElementById("name").value;
             var ps = document.getElementById("password").value;
                          
             if(un==""||ps=="")
             {
                 alert("fill the empty field");
             } 
            else
             {
                 xmlhttp.open("GET","./admin_login_logic?un="+un+"&ps="+ps,true); 
                 xmlhttp.onreadystatechange=go2;            
             
                 xmlhttp.send(); 
                 console.log("request sent"); 
             }
         }   
            
          function go2()
          {
              
              if( xmlhttp.readyState==4  && xmlhttp.status ==200)
              {
                  
                  document.getElementById("h11").innerHTML = xmlhttp.responseText;
                  
                  console.log(xmlhttp.responseText);
                  
                  if(xmlhttp.responseText.trim()=="Login Successfull")
                  {
                     setInterval("go3()",1000);
                  }
                  else
                  {
                      
                  }
              }
          }
          
          function go3()
          {
              
              window.location.href="admin_home.jsp";
          }
    
        </script>
    </head>
    <body>
        <h1><center>Admin Login</center></h1>
    <center><label class="label label-default">Enter Username</label></center><br>
    <center><input type="text" id="name"></center><br>
    <center><label>Enter Password</label></center><br>
    <center><input type="password" id="password"></center>
    <br>
    <br>
    <center><input type="button" class="btn btn-primary  btn-lg" value="Login" onclick="go()"/></center>
    <h1 id="h11"></h1>
    </body>
</html>
