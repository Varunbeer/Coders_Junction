<%-- 
    Document   : usersignup
    Created on : 12 Apr, 2019, 1:52:22 PM
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
        <script>
            function readandpreview(fileobj, imageid)
            {
                var firstfile = fileobj.files[0];

                var reader = new FileReader();

                //alert("File name: " + firstfile.name);
                //alert("File size: " + firstfile.size);

                reader.onload = (function(f)
                {
                    return function read12(e)
                    {
                        if (firstfile.type.indexOf("image") !== -1)
                        {
                            document.getElementById(imageid).src = e.target.result;
                        } else if (firstfile.type.indexOf("audio") !== -1)
                        {
                            document.getElementById(imageid).src = "audio.jpg";
                        } else if (firstfile.type.indexOf("video") !== -1)
                        {
                            document.getElementById(imageid).src = "video.jpg";
                        } else
                        {
                            document.getElementById(imageid).src = "other.png";
                        }
                    };
                })(firstfile);


                reader.readAsDataURL(firstfile);
            }
            
        
            
        
          
            
            function go1()
            {
                var flag=0;
                var user=document.getElementById("use").value;
                var pass=document.getElementById("pas").value;
                var email=document.getElementById("em").value;
                var contactnumber=document.getElementById("cn").value;
                var sec_qu=document.getElementById("s1").value;
                var sec_an=document.getElementById("sa").value;
                var gender=document.getElementById("gender").value;
                var photo=document.getElementById("photo3").value;
                var index = email.indexOf("@");
                var index1=email.indexOf(".");
               
                if(contactnumber.length!=10)
                {
                    document.getElementById("check").innerHTML="Invalid Contact Number";
                }
                else if(sec_qu=="0")
                {
                    document.getElementById("check").innerHTML="Choose Security Question";
                }
                else if(sec_an<="")
                {
                    
                    document.getElementById("check").innerHTML="Enter Valid Security Answer"
                }
                else if(gender=="0")
                {
                    document.getElementById("check").innerHTML="Choose A Gender"
                }
                else if(pass=="")
                {
                    document.getElementById("check").innerHTML="Choose A Valid Password"
                }
                else if(user=="")
                {
                    document.getElementById("check").innerHTML="Choose A Valid Username"
                }
                
            else
                {
                var ans = "";
                //NEW CODE
                var formdata = new FormData();

                var controls = document.getElementById("form3").elements;
                



                var flag = 0;
                for (var i = 0; i < controls.length; i++)
                {
                    if (controls[i].name == "" || controls[i].name == null)
                    {
                      flag = 1;
                    }


                    if (controls[i].type == "file")
                    {
                        if (controls[i].files.length != 0)
                        {
                            ans = ans + controls[i].name + ": " + controls[i].files[0].name + "\n";
                            formdata.append(controls[i].name, controls[i].files[0]);
                        } else
                        {
                            flag = 2;
                        }
                    } else    // for other input types  text,password,select
                    {
                        ans = ans + controls[i].name + ": " + controls[i].value + "\n";
                        //formdata.append("rn",document.getElementById("rn").value);
                        //formdata.append(firstfile.name,firstfile);

                        formdata.append(controls[i].name, controls[i].value);
                    }
//                    alert(ans);
//                    alert(flag);
                }

                if (flag == 1)
                {
                 document.getElementById("check")="All Fields Are Mandatory"
                } else if (flag == 2)
                {
                    document.getElementById("check").innerHTML="Choose Photo"
                } 
                else
                {
                    


                    var xhr = new XMLHttpRequest();

                    xhr.open("POST", "./userdata", true);
                   
                    //for response receiving
                    xhr.onreadystatechange = function ()
                    {
                        if (xhr.readyState === 4 && xhr.status == 200)
                        {
                            var res = xhr.responseText.trim();
                            alert(res);
                            
                            if (res == "success")
                            {

                            alert(xhr.responseText);
                              

                            } else
                            {
                                alert(xhr.responseText);
                            }
                        }
                    
                    };



                    xhr.send(formdata);
                    
                    window.location.href="userlogin.jsp";

                }
            }
        }
            </script>
        <title>User Sign Up</title>
    </head>
    <body>
    <center>
        <h2> User Sign Up</h2>
        <center><p style="color:red;" id="check" ></p></center>

        <div class =" col-sm-8 col-sm-offset-2">

            <form action="#" method="post" enctype="multipart/form-data" id="form3">
                
                <div class="form-group">
                    <label for="use">Username</label>
                    <input type="text" id ="use" name="use"  placeholder="Username" class ="form-control"/>
                    <div class="col-sm-1" id="1">
                    </div>
                </div>

                <div class="form-group">
                    <label for="des">Password</label>
                    <input type="Password" value="" id ="pas" name="pas" placeholder="Password" class ="form-control"/>
                </div>

                <div class="form-group">
                    <label for="em">Email</label>
                    <input type="email" value="" id ="em" name="em" placeholder="name@example.com" class ="form-control"/>
                </div>
                <div class="form-group">
                    <label for="de">Contact Number</label>
                    <input type="text" value="" id ="cn" name="cn" placeholder="Contact Number" class ="form-control"/>
                </div>

              <div class="container">
  
  <div class="form-group">
      <label class="col-sm-4" for="s1">Security Question</label>
      <div class="col-sm-7">
          <select id="s1" name="s1">
              <option value="0">--Security Question</option>
              <option>what is your dog name</option>
              <option>what is your salary></option>
              <option>what is name of your hometown</option>
          </select>
          <br>
      </div>
  </div>
</div>
                
<div class="form-group">
                    <label for="de">Security Answer</label>
                    <input type="text" value="" id ="sa" name="sa" placeholder="Security Answer" class ="form-control"/>
                </div>
<div class="form-group">
    <label class="col-sm-4" for="s1">Gender</label>
    <div class="col-sm-7">
        <select id="gender" name="gender">
            <option value="0">--select--</option>
            <option>male</option>
            <option>female</option>
        </select>
                                </div>
</div>
                <br>
                <br>
                
                <div class="form-group">
                                        <label for="photo1">Upload photo</label>
                                        <img src="" id="im3" style="width: 100px;height: 100px" />
                                        <input type="file" id ="photo3" name="photo" placeholder="upload photo" onchange="readandpreview(this, 'im3')" />
                                    </div>

            </form>
            <div class="form-group">
                <input type="button" class="btn btn-success" value="submit" onclick="go1()" />
            </div>
        </div>
        
        <div id="ulog">



        </div>

    </body>
</html>
