<%-- 
    Document   : login
    Created on : Mar 13, 2018, 3:47:25 PM
    Author     : phamtunganh
--%>

<%@page import="modal.Comment"%>
<%@page import="modal.User"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modal.Post"%>
<%@page import="dal.CommentContext"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="//fonts.googleapis.com/css?family=Lobster" />
        <link href="css/commentbox.css" rel="stylesheet" type="text/css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tooda, the new standard</title>
        <link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
        <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
        <link  href="http://ironsummitmedia.github.io/startbootstrap-modern-business/font-awesome/css/font-awesome.min.css" rel="stylesheet"/>
        <link type="text/css" href="css/postdecoration.css" rel="stylesheet"> 
        <script>
            function doComment(id) {
                document.getElementById(id).submit();
            }
            function doSubmit(id){
                document.getElementById(id).submit();
            }
        </script>
        <style>
            #cmt{
                color: #000000; font-size: 20px; font-family: "Times New Roman";
                line-height: 25px; text-shadow: 0 1px 1px #fff; padding-top: 5px;
            }
            #price{
                color: #96888e; font-size: 18px; font-family: "Times New Roman";
                line-height: 18px; text-shadow: 0 1px 1px #fff; padding-top: 5px;
            }
            #title{

                color: #d04764; font-family: 'Lobster', 
                    cursive; font-size: 50px; font-weight: normal; line-height: 50px; 
                text-shadow: 1px 0 0 #fff;}
            body{
                background-image: url("image/background.jpg");
                background-repeat: no-repeat;
                background-attachment: fixed;
                background-position: center;
                background-size: cover;
            }
            #content{
                color: #96888e; font-size: 25px; font-family: "Times New Roman";
                line-height: 30px; text-shadow: 0 1px 1px #fff; padding-top: 5px;
            }
            #post{
                background-image: url("image/backgroundpost.jpg");
            }
            #main{
                max-width: 500px;
                margin: auto;

                padding: 10px;
            }
            table, th, td {
                vertical-align: middle;
                border: 1px solid black;
                width: 600px;
            }
            td{
                text-align: left
            }
        </style>
        
    </head>
    <%
        CommentContext cContext = new CommentContext();
        String userId = (String) session.getAttribute("userId");
        String authority = (String) session.getAttribute("authority");
        ArrayList<Comment> cmtlist = (ArrayList<Comment>) request.getAttribute("cmtlist");
        User user = (User) session.getAttribute("user");
        String status = (String) session.getAttribute("status");
        ArrayList<Post> postlist = (ArrayList<Post>) request.getAttribute("postlist");
        int totalPage = Integer.parseInt(request.getAttribute("totalpage").toString());
        int pagegap = Integer.parseInt(request.getAttribute("pagegap").toString());
        int pageIndex = Integer.parseInt(request.getAttribute("pageindex").toString());

    %>
    <body>
        <%@include file="headerMain.html" %>

        <br>


        <%                for (Post p : postlist) {

        %>

        <div class="container">
            <div class="row">
                <div class="col-md-3">       
                </div>
                <div class="col-md-6"><br><br><br>
                    <div class="panel panel-default">
                        <div class="panel-body">
                            <div class="pull-left media">
                                <img class="img-responsive" src="https://cdn1.iconfinder.com/data/icons/toolbar-signs/512/person-512.png" alt="...">
                            </div>
                            <div class="pull-right"><br>

                                <b><a href="listofuser?userid=<%=p.getUser().getUserId()%>"><%=p.getUser().getUsername()%></a></b>
                            </div><br>
                            <center>
                                <br>
                                <h2><div id="title"><%= p.getTitle()%></div></h2>
                            </center>
                            <br>
                            <div id="content">
                                <div style="text-align: left">
                                    <p><%="Review: <br>" + p.getDescription()%><br>
                                    <div id="price">      <%= "Địa chỉ: " + p.getAddress()%><br> 
                                        <%= "Giá tiền: " + p.getPrice() + " VNÐ"%><br></div>
                                    <input type="hidden" value="<%= p.getCategory().getCateName()%>">
                                    <br>
                                </div>
                            </div>
                            <img src="<%=p.getImageUrl()%>" class="img-responsive"><hr>
                            
                            <% if (status.equals("oneuser")) { %>
                            <br>
                            <form id="update<%=p.getId()%>" action="updatepost" method="get">
                                <input type="hidden" name="postid" value="<%=p.getId()%>" >
                            <button class="btn btn-default" onclick="doSubmit('update<%=p.getId()%>')">Update post</button>
                            </form>
                            <br>
                            <%}%>
                            <br>
                            <div id="content"> Comments:</div><br>
                            <div class="pull-left" style="text-align: left">

                                <div id="cmt">
                                    <%
                                        ArrayList<Comment> listByPost = cContext.getByPost(p.getId());
                                        for (Comment cmt : listByPost) {
                                    %>
                                    <%= cmt.getUser().getUsername() + ": " + cmt.getCmt()%><br>
                                    <%}%>
                                </div>
                                <br>
                                <form id="addcomment<%=p.getId()%>" class="form-inline"  role="form" action="addcomment" method="post">
                                    <div class="form-group">

                                        <input type="hidden" name="postid" value="<%=p.getId()%>" />
                                        <input name="comment" class="form-control" type="text" size="56" placeholder="Your comments" required/>
                                    </div>  
                                    <div class="form-group">
                                        <button class="btn btn-default" onclick="doComment(addcomment<%=p.getId()%>)">ADD</button>

                                    </div>

                                </form>
                                <br>
                            </div>
                            <br>
                            <div class="pull-right">
                                <a><i class="fa fa-2x fa fa-facebook-square"></i></a>
                                <a><i class="fa fa-2x fa fa-google-plus-square"></i></a>
                                <a><i class="fa fa-2x fa fa-twitter-square"></i></a>
                            </div>
                        </div>
                        <div class="col-md-3">       
                        </div>

                    </div>

                </div>

            </div>
        </div>
        <%}%>

        <%=util.HtmlHelper.pagger(pageIndex, pagegap, totalPage)%>
    </div>
    <br><br>

    <br>
    <%@include file="footer.html" %>
</body>
</html>
