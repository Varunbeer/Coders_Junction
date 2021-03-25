<%-- 
    Document   : userlogin
    Created on : 18 Apr, 2019, 11:04:12 AM
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
    </script>

</head>
<body>
    <script>
        var xmlhttp = new XMLHttpRequest();
        function go1()
        {
            var un = document.getElementById("use1").value;
            var ps = document.getElementById("pas1").value;

            if (un == "" || ps == "")
            {
                alert("Enter Required Fields");
            } else
            {
                xmlhttp.open("GET", "./userlogin_logic?un=" + un + "&ps=" + ps, true);
                xmlhttp.onreadystatechange = go2;

                xmlhttp.send();
                console.log("request sent");
            }
        }

        function go2()
        {

            if (xmlhttp.readyState == 4 && xmlhttp.status == 200)
            {

                document.getElementById("ulog1").innerHTML = xmlhttp.responseText;

                console.log(xmlhttp.responseText);

                if (xmlhttp.responseText.trim() == "Login Successfull")
                {
                    setInterval("go3()", 1000);
                } else
                {

                }
            }
        }

        function go3()
        {

            window.location.href = "userhome.jsp";
        }

        function go4()
        {
            var un1 = document.getElementById("use2").value;


            if (un1 == "")
            {
                alert("Enter Required Fields");
            } else
            {
                xmlhttp.open("GET", "./forgot_password_response?un1=" + un1, true);
                xmlhttp.onreadystatechange = go5;

                xmlhttp.send();
                console.log("request sent");
            }
        }

        function go5()
        {

            if (xmlhttp.readyState == 4 && xmlhttp.status == 200)
            {


                console.log(xmlhttp.responseText);

                if (xmlhttp.responseText.trim() == "fail")
                {
                    alert("Wrong Username")
                } else
                {
                    alert(xmlhttp.responseText.trim());
                     document.getElementById("forgotdiv").style.display="block";
                    document.getElementById("sq").value=xmlhttp.responseText.trim();
                }
            }
        }



function checkanswer()
{
    var un1 = document.getElementById("use2").value;
    var sq = document.getElementById("sa").value;


            if (un1 == "")
            {
                alert("Enter Required Fields");
            } else
            {
                xmlhttp.open("GET", "./forgot_password_response?un1=" + un1 , true);
                
                xmlhttp.onreadystatechange = go5;

                xmlhttp.send();
                console.log("request sent");
            }
}
function checkanswer2()
{
    
    var sa = document.getElementById("sa").value;


            if (sa == "")
            {
                alert("Enter Required Fields");
            } else
            {
                xmlhttp.open("GET", "./forgot_password_response2?sa=" +sa, true);
                xmlhttp.onreadystatechange = go8;

                xmlhttp.send();
                console.log("request sent");
            }
            
            function go8()
            {
                if (xmlhttp.readyState == 4 && xmlhttp.status == 200)
            {
                console.log(xmlhttp.responseText);

                if (xmlhttp.responseText.trim() == "check phone")
                {
                    alert("Check sms on your smartphone");
                } else
                {
                    alert("Wrong Security Answer");
                }
                
                }
        
            }
            
}


    </script>

    <style>
        
        #forgotdiv
        {
            display:none;
        }
        
    </style>
<center>
    <h2> User Login</h2>


    <div class =" col-sm-8 col-sm-offset-2">

        <form action="#" method="post" enctype="multipart/form-data" id="form4">

            <div class="form-group">
                <label  for="use1" >Enter Username</label>

                <input id ="use1" name="use1" placeholder="Username" class ="form-control"/>
            </div>



            <br>
            <br>

            <div class="form-group">
                <label  for="pas1" >Enter Password</label>
                <input id ="pas1" name="pas1" type="password" placeholder="Password" class ="form-control"/>
            </div>

            <br>
            <br>
            <br>
            <div class="form-group">
                <input type="button" class="btn btn-success" value="Login" onclick="go1()" /><br>

            </div>

            <!-- Trigger the modal with a button -->
            <button type="button" class="btn btn-default" data-toggle="modal" data-target="#myModal">Forgot Password</button>
            <br>
            <br>
            <a href="usersignup.jsp">Sign up!</a>

            <!-- Modal -->
            <div id="myModal" class="modal fade" role="dialog">
                <div class="modal-dialog">

                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title">Forgot Password</h4>
                        </div>
                        
                        <div class="modal-body">

                       
                        <div class="form-group">
                            <label for="use2">Enter Username</label>
                            <center><input type="text" value="" id ="use2" name="use2" placeholder="Username" class ="form-group"/>
                            </center></div>
                        <!--        <div class="form-group">
                                <label for="sans">Security Answer</label>
                                <center><input type="text" value="" id ="sans" name="sans" placeholder="Security Answer" class ="form-control input-lg"/>
                                </center></div>-->
                        
                        <div class="form-group">
                            <input type="button" class="btn btn-default" value="Submit" onclick="go4()"  />
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        </div>
                        
                        
                        <div id="forgotdiv">
                              <div class="form-group">
                            <label for="use2">Security Question</label>
                            <center><input type="text" value="" id ="sq" disabled="" name="sq" class ="form-group"/>
                            </center></div>
                              <div class="form-group">
                            <label for="sa">Security Answer</label>
                            <center><input type="text" value="" id ="sa" name="sa" placeholder="Security Answer" class ="form-group"/>
                            </center></div>
                            <div class="form-group">
                            <input type="button" class="btn btn-default" value="Submit" onclick="checkanswer2()"  />
                       
                            </div>
                            </div>
                        
                        
                        </div>
                        </div>
                        
                        
                    </div>

                </div>
            </div>
        </form>
    </div>




</div>



<div id="ulog1">



</div>
</body>
</html>
