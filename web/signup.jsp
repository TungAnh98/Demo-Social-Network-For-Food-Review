<%-- 
    Document   : signup
    Created on : Mar 13, 2018, 10:00:46 PM
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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sign Up For Tooda</title>
        <style>

            body{
                font-family: 'Arbutus', cursive;
            }
        </style>  
    </style>
    <link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
    <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
</head>
<%
    String error = (String) request.getAttribute("errorSignUp");
    if (error == null) {
        error = "";
    }

%>
<body>
    <%@include file="header.html" %>
    <br />
    <form action="signup" method="post">
        <div class="container">
            <div class="col-md-3"></div>
            <div class="col-md-6">
                <div class="row myborder">
                    <h2 style="color: black; margin: initial; margin-bottom: 10px;">Sign up now, waiting for what ???</h2><hr>
                    <div class="input-group margin-bottom-20">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-user mycolor"></i></span>
                        <input size="60" maxlength="255" class="form-control" placeholder="User Name" name="username" id="UserRegistration_username" required autofocus type="text">                                                        </div>
                    <div class="input-group margin-bottom-20">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-lock mycolor"></i></span>
                        <input size="60" maxlength="255" class="form-control" placeholder="Password" name="password" id="UserRegistration_password" required type="password">                                    </div>
                    <br>
                    <p style="color:red"><%= error%></p>
                    <div class="row">
                        <div class="col-md-12">
                            <button class="btn-u pull-center" type="submit">Sign Up</button>
                        </div>
                    </div>
                </div>
                <div class="col-md-2"></div>
            </div>
        </div>
    </form>
    <%@include file="footer.html" %>
</body>
</html>
