<%-- 
    Document   : login
    Created on : Mar 13, 2018, 3:47:25 PM
    Author     : phamtunganh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <style>
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

            setTimeout(function () {
                //do what you need here
                var elmnt = document.getElementById("content");
                elmnt.scrollIntoView();
            }, 2000);
        </script>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tooda, the new standard</title>
        <link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
        <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
    </head>
    <%
        String error = (String) request.getAttribute("error");
        if (error == null) {
            error = "";
        }
    %>
    <body >
     <%@include file="header.html"%> 
        <br><br/>
        <br>
        <div class="container">
            <div class="row">
                <div class="col-sm-6 col-md-4 col-md-offset-4 outlined">
                    <h1 class="text-center login-title">Log In</h1>
                    <div class="account-wall">
                        <form id="content" class='form-signin' action="login" method='POST'>
                            <!--{% csrf_token %}-->
                            <div class="form-group">
                                <input type='text' name='username' class='underlined' placeholder='Username' required autofocus>
                            </div>
                            <div class="form-group">
                                <input type='password' name='password' class='underlined' placeholder='Password' required>

                            </div>
                            <p style="color:red"><%= error%></p>
                            <br>
                            <div class="form-group">
                                <button class='btn btn-lg btn-primary btn-block' type='submit'>Sign in</button>
                            </div>
                            <span class="clearfix"></span>
                        </form>
                    </div>
                    <div  class="text-center">
                        Don't have an account? <a href="signup.jsp" class="new-account">Register here!</a>
                    </div>
                </div>
            </div>
        </div>
        <br><br><br>
        <%@include file="footer.html" %>
    </body>
</html>
