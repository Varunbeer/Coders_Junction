<%-- 
    Document   : addquestion.jsp
    Created on : 22 Apr, 2019, 12:46:32 PM
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
        <title>JSP Page</title>
    <script>
    var xml = new XMLHttpRequest();
    function category()
    {
        xml.open("GET","./json_category",true);
        xml.onreadystatechange = category2;
        xml.send();
    }
    function category2()
    {
    if (xml.readyState === 4 && xml.status === 200)
        {
            var res  = xml.responseText.trim();
            var mainjson=JSON.parse(res);
            console.log(res);
            var jsa = mainjson["ans"];
             var ans="";
             
             ans+="<option>Select Category</option>";
             for(var i=0;i<jsa.length;i++)
             {
                 var js=jsa[i];
                 ans+="<option>"+js["catname"]+"</option>";
                 
             }
             document.getElementById("cat").innerHTML=ans;
        }
        
    }
    
    function go1()
        {
            var title1=document.getElementById("ti").value;
            var description=document.getElementById("desc").value;
            var content=document.getElementById("con").value;
            var category=document.getElementById("cat").value;
            var keyword=document.getElementById("key").value;
            xml.open("GET","./addquestion_response?ti=" + title1 + "&desc=" + description + "&con=" + content + "&cat=" + category + "&key=" + keyword,true);
            xml.onreadystatechange = go2;
            xml.send();
        }
        function go2()
        {
            if(xml.readyState===4 && xml.status===200)
            {
                document.getElementById("uadd").innerHTML=xml.responseText;
                console.log(xml.responseText);
                if(xml.responseText.trim()==="success")
                {
                    alert("Question Added");
                    window.location.href = "userhome.jsp";
                }
            }
        }
        
        </script>
        </head>

        <body onload="category()">
        <div class="jumbotron" >
        <p>Add Question</p>
        </div>
        <center><p style="color:red;" id="check" ></p></center>

        <div class =" col-sm-8 col-sm-offset-2">

            <form action="#" method="post" enctype="multipart/form-data" id="form3">
                
                <div class="form-group">
                    <label for="ti">Title</label>
                    <input type="text" id ="ti" name="ti"  placeholder="Title" class ="form-control"/>
                    <div class="col-sm-1" id="1">
                    </div>
                </div>

                <div class="form-group">
                <label for="desc">Description:</label>
                <textarea class="form-control" rows="5" id="desc" placeholder="Description"></textarea>
                </div>

                <div class="form-group">
                    <label for="con">Content</label>
                    <input type="email"  id ="con" name="con" placeholder="Content" class ="form-control"/>
                </div>
                

  
  <div class="form-group">
      <label  for="cat">Category</label>
      <div class="form-group">
          <select id="cat" name="cat" class="form-control">
              
          </select>
          <br>
      </div>
  </div>
                
 <div class="form-group">
                    <label for="key">Keywords</label>
                    <input type="email"  id ="key" name="key" placeholder="Keywords should be comma seperated" class ="form-control"/>
                </div>
                

              <div class="container">

            </form>
            <div class="form-group">
                <center><input type="button" class="btn btn-default" value="submit" onclick="go1()" /></center>
            </div>
        </div>
        </div>
        
        <div id="uadd">



        </div>

    </body>

</html>
