<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="bootstrap-3.3.7-dist/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <script src="bootstrap-3.3.7-dist/js/jquery-3.3.1.js" type="text/javascript"></script>
        <script src="bootstrap-3.3.7-dist/js/bootstrap.js" type="text/javascript"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Home</title>
        <script>
          var xmlhttp=new XMLHttpRequest();
          function change_password()
          {
             var admin_name = document.getElementById("un").value;
             var old_pass = document.getElementById("op").value;
             var new_pass = document.getElementById("np").value;
             var confirm_pass = document.getElementById("cp").value;
             
             if(admin_name==""||old_pass==""||new_pass==""||confirm_pass=="") 
             {
                 
                 alert("All fields are required");
             }
             
            if(new_pass!=confirm_pass)
            {
                alert("New password not matching");
                
            }
            
            if(new_pass==confirm_pass)
            {
                
                xmlhttp.open("GET","./admin_changePass?un="+admin_name+"&op="+old_pass+"&np="+new_pass,true); 
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
              
              window.location.href="admin_login.jsp";
          }
    
        </script>
        
    </head>
    <body>
         <%
             String u = (String)(session.getAttribute("user"));    
             
             if(u==null)
               response.sendRedirect("admin_login.jsp");
        %>
        
        <h1>Welcome <%= u %> </h1>
        
        

        </div><br>
        <div class="container">
            <div class="row">

                <div class="col-sm-8 col-sm-offset-2">
                    <div class ="form-group">
                        <a href="manage_categories.jsp"> <input type="button" class ="btn btn-success" value ="Manage Category"/></a><br>
                    </div>
                    
                    
                    
                    

        
        <div class="container">
            <div class="row">

                <div class="col-sm-12">

                    <button data-toggle="modal" data-target="#myModal" class="btn btn-success">Change Password</button>
                    

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
                            <label for="un">Enter Username</label>
                            <input type="text" id="un" value="<%=u %>"  class="form-control" readonly /><br>
                        </div>

                        <div class="form-group">
                            <label for="op">Old Password</label>
                            <input id="op" type="password" placeholder="password" class="form-control"  /><br>
                        </div>

                       <div class="form-group">
                            <label for="np">New Password</label>
                            <input id="np" type="password" placeholder="password" class="form-control"  /><br>
                        </div>
                            <div class="form-group">
                            <label for="cp">Confirm Password</label>
                            <input id="cp" type="password" placeholder="password" class="form-control"  /><br>
                        </div>
                    </form>

                    </div>
                    <div class="modal-footer">
                        <button data-dismiss="modal" class="btn btn-warning" onclick="change_password()">Change</button>
                    </div>
                    
                        <div class="modal-footer">
                        <button data-dismiss="modal" class="btn btn-warning">Close</button>
                        </div>     


                </div>

            </div>

        </div>


    </body>
</html>
