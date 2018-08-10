<%-- 
    Document   : login
    Created on : Mar 13, 2018, 3:47:25 PM
    Author     : phamtunganh
--%>

<%@page import="modal.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <style>
            table {
                border: 1px solid black;
                margin:0 auto;
            }
            body{
                background-image: url("image/background.jpg");
                background-repeat: no-repeat;
                background-attachment: fixed;
                background-position: center;
                background-size: cover;
            }
        </style>
        <link rel ="stylesheet" type="text/css" href="css/login.css">
        <script>

            function performAjaxSubmit() {



                var sampleFile = document.getElementById("sample").files[0];

                var formdata = new FormData();



                formdata.append("image", sampleFile);

                var xhr = new XMLHttpRequest();

                xhr.open("POST", "uploadimage", true);

                xhr.send(formdata);

                xhr.onload = function (e) {

                    if (this.status == 200) {

                        document.getElementById("test").innerHTML = this.responseText;
                        document.getElementById("test").value = this.responseText;
                        document.getElementById("tunganh").src = this.responseText;
                    }

                };

            }
        </script>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tooda, the new standard</title>
        <link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
        <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
    </head>
    <%
        ArrayList<Category> catelist = (ArrayList<Category>) request.getAttribute("catelist");
    %>
    <body >
        <%@include file="header.html"%> 
        <br><br/>
        <div class="container">
            <div class="row">
                <div class="col-sm-6 col-md-4 col-md-offset-4 outlined">
                    <h1 class="text-center login-title">Log In</h1>
                    <div class="account-wall">
                        <form action="addpost" method="post" >
                            <!--{% csrf_token %}-->
                            <div class="form-group">
                                Title: <input type="text" name="title" required>
                            </div>
                            <div class="form-group">
                                Location:<input type="text" name="location" required>
                            </div>
                            <div class="form-group">
                                Price:<input type="text" name="price" required >
                            </div>
                            <div class="form-group">
                                Category: <br><select name="category" required>
                                    <% for (Category cate : catelist) {
                                    %>
                                    <option value="<%= cate.getCateId()%>">
                                        <%= cate.getCateName()%>

                                    </option>
                                    <%}%>
                                </select>  
                            </div>
                            <div class="form-group">
                                Review:<textarea rows="5" cols="50" name="review" style="background-color: white;"required ></textarea>
                            </div>
                            <input type="hidden" id="test" name="urlpath">
                             <div class="form-group">
                                 Upload Image:<input type="file" id="sample" name="image" accept="image/*" required>
                            </div>
                            
                            <div class="form-group">
                                 <input id="uploadBtn" type="button" value="Save image" onclick="performAjaxSubmit();">
                            </div>
                            <br>
                            <img src="" alt="No image" id="tunganh" style="width:350px;height: 250px;">
                               <br><br>
                            <div class="form-group">
                                <button class='btn btn-lg btn-primary btn-block' type='submit'>Upload post</button>
                            </div>
                            
                         

                            <span class="clearfix"></span>
                        </form>
                    </div>

                </div>
            </div>
        </div>
        <%@include file="footer.html" %>
    </body>
</html>
