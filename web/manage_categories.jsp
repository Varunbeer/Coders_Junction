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
            var xhr;
            function go8()
            {
                
                xhr = new XMLHttpRequest();
                xhr.onreadystatechange = go9;
                xhr.open("GET", "./getCategories", true);
                xhr.send();
            }

            function go9()
            {
                if (xhr.readyState == 4 && xhr.status == 200)
                {
                    var res = xhr.responseText.trim();
//                    document.getElementById("res").innerHTML = res;
                    var mainjson = JSON.parse(res);

                    var jsa = mainjson["ans"];

                    var ans = "";

                    ans += "<table class='table'>";

                    ans += "<thead class='bg-primary'>";
                    ans += "<tr>";
                    ans += "<td>catname</td><td>description</td><td>photo</td><td></td><td></td>";
                    ans += "</tr>";
                    ans += "</thead>";

                    ans += "<tbody>";

                    for (var i = 0; i < jsa.length; i++)
                    {
                        var js = jsa[i];

                        ans += "<tr>";

                        ans += "<td>" + js["catname"] + "</td>";
                        ans += "<td>" + js["description"] + "</td>";
                        ans += "<td> <img src='" + js["photo"] + "' width='100' height='100' />  </td>";
                        ans += "<td> <input type= 'button' value ='Edit' class='btn btn-success' onclick=\"go10('" + js["catname"] + "','" + js["description"] + "','" + js["photo"] + "')\" />";
                        ans += "<td> <input type= 'button' value ='Delete' class='btn btn-danger' onclick= \"go12('" + js["catname"] + "')\"/>";
                        ans += "</tr>";


                    }



                    ans += "</tbody>";



                    ans += "</table>";


                    document.getElementById("maincontent").innerHTML = ans;
                }
            }

            function go10(catname, description, photo)
            {
                $('#myModal').modal('show');
                document.getElementById("cat1").value = catname;
                document.getElementById("des1").value = description;
                document.getElementById("im2").src = photo;



            }
            function go7()
            {
                var ans = "";
                //NEW CODE
                var formdata = new FormData();

                var controls = document.getElementById("form1").elements;



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
                    alert("CHECK: --> Give name attribute to all controls in form");
                } else if (flag == 2)
                {
                    alert("CHECK: --> Select Files for file controls");
                } else
                {
                    alert("working");

                    var xhr = new XMLHttpRequest();

                    xhr.open("POST", "./addcategories_response", true);
                    //for response receiving
                    xhr.onreadystatechange = function ()
                    {
                        if (xhr.readyState === 4 && xhr.status == 200)
                        {
                            var res = xhr.responseText.trim();
                            alert(res);
                            if (res == 'success')
                            {

                            alert("go8 called");
                                go8();



                            } else
                            {
                                alert(res);
                            }
                        }

                    };



                    xhr.send(formdata);
                }
            }

            function go11()
            {

                var ans = "";
                //NEW CODE
                var formdata = new FormData();

                var controls = document.getElementById("form2").elements;



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
                    alert("CHECK: --> Give name attribute to all controls in form");
                } else if (flag == 2)
                {
                    alert("CHECK: --> Select Files for file controls");
                } else
                {


                    var xhr = new XMLHttpRequest();

                    xhr.open("POST", "./editCategory", true);
                    //for response receiving
                    xhr.onreadystatechange = function()
                    {
                        if (xhr.readyState === 4 && xhr.status == 200)
                        {
                            var res = xhr.responseText.trim();
                            alert(res);
                            if (res == 'success')
                            {
                                document.getElementById("d3").innerHTML = "<h3 style=\"color: green;text-align:center\">Change Successful</h3>";


                                go8();



                            } else
                            {
                                alert(res);
                            }
                        }

                    };



                    xhr.send(formdata);
                }
            }

            function go12(catname)
            {
                var value = confirm('are you sure you want to delete it');
                if (value == true)
                {
                    alert("go12 called");
                    xhr = new XMLHttpRequest();
                    xhr.onreadystatechange = go13;
                    xhr.open("GET", "./deleteCategory?cat1=" + catname, true);
                    xhr.send();
                }
            }
            function go13()
            {
                
                if (xhr.readyState == 4 && xhr.status == 200)
                {
                   
                    console.log(xhr.responseText);
                    if (xhr.responseText.trim() == "success")
                    {
                        
                        go8();
                        document.getElementById("d3").innerHTML = "<h3 style=\"color: green;text-align:center\">Deleted Successfully</h3>";
                    }
                }
            }


        </script>
    </head>

    <body onload="go8()">



        <div class ="container">

            <center>
                <h2> Add Category</h2>

            </center>
            <div class ="row">
                <div class =" col-sm-8 col-sm-offset-2">

                    <form action="#" method="post" enctype="multipart/form-data" id="form1">
                        <div class ="form-group ">

                            <label for="cat">Cat Name</label>
                            <input type="text" value="" id="cat" name="cat" placeholder="category" class ="form-control"/><br>

                        </div>
                        <div class="form-group">
                            <label for="des">Des</label>
                            <input type="text" value="" id ="des" name="des" placeholder="description" class ="form-control"/>
                        </div>
                        <div class="form-group">
                            <label for="photo">Upload photo</label>
                            <img src="" id="im1" style="width: 100px;height: 100px" />
                            <input type="file" id ="photo" name="photo" placeholder="upload photo" onchange="readandpreview(this, 'im1')" />
                        </div>



                    </form>
                    <div class="form-group">
                        <input type="button" class="btn btn-success" value="Add" onclick="go7()" />
                    </div>
                     

            <div id="d3">



            </div>

                    <div id="maincontent" ></div>


                </div>
            </div>
        </div>

                <div class ="container">
                <div class="modal fade" id="myModal">
            <div class="modal-dialog">
                <div class="modal-content">

                    <div class="modal-header">
                        <a class="close" data-dismiss="modal">&times</a>
                        <h1>Edit Category</h1>
                    </div>
                    <div class="modal-body">
                        <div class ="row">
                            <div class =" col-sm-8 col-sm-offset-2">

                                <form action="#" method="post" enctype="multipart/form-data" id="form2">
                                    <div class ="form-group ">

                                        <label for="cat1">Cat Name</label>
                                        <input type="text" value="" id="cat1" name="cat1" placeholder="category" disabled="" class ="form-control"/><br>

                                    </div>
                                    <div class="form-group">
                                        <label for="des1">Des</label>
                                        <input type="text" value="" id ="des1" name="des1" placeholder="description" class ="form-control"/>
                                    </div>
                                    <div class="form-group">
                                        <label for="photo1">Upload photo</label>
                                        <img src="" id="im2" style="width: 100px;height: 100px" />
                                        <input type="file" id ="photo1" name="photo1" placeholder="upload photo" onchange="readandpreview(this, 'im2')" />
                                    </div>



                                </form>
                                <div class="form-group">
                                    <input type="button" class="btn btn-success" value="Edit" onclick="go11()"  />
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button data-dismiss="modal" class="btn btn-warning">Close</button>
                        </div>
                         <div id="d3">



                        </div>

                        

                    </div>

                </div>

            </div>





    </body>

</html>
