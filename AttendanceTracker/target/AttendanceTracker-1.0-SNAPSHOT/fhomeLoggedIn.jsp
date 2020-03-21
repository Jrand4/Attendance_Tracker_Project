<%-- 
    Document   : home
    Created on : Mar 3, 2020, 1:56:31 PM
    Author     : xarro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
    <style>
      *{
        box-sizing: border-box;
      }
      body {
        margin: 0;
        font-family: Arial, Helvetica, sans-serif;
      }
      a{
        color: white;
        float: left;
      }
      .navList {
        list-style-type:none;
        margin: 0;
        padding: 0;
        overflow: visible;
        background-color: #7f7f7f;
        float: left;
        height: 25px;
        font-size: 16px;
      }

      .navListLink {
        display: block;
        color: white;
        text-align: center;
        padding: 0px 25px;
        text-decoration: none;
      }

      /* Change the link color to #111 (black) on hover */
      .navListLink:hover {
        background-color: #5f5f5f;
        border: 2px solid #fff;
        color: white;
      }
      .navbarleft{
        box-sizing: border-box;
        height: 45px;
        width: 75%;
        margin-top: 150px;
        padding-left: 20px;
        padding-right: 20px;
        padding-top: 10px;
        color: white;
        position: fixed;
        background-color: #7f7f7f;
        border: 3px solid #000;
        z-index: 1;
      }
      .navbarright{
        box-sizing: border-box;
        height: 45px;
        width: 25%;
        margin-left: 75%;
        margin-top: 150px;
        padding-left: 20px;
        padding-right: 20px;
        padding-top: 10px;
        color: white;
        position: fixed;
        background-color: #7f7f7f;
        border: 3px solid #000;
        z-index: 1;
      }
      .title{
        box-sizing: border-box;
        height: 150px;
        width: 100%;
        padding-left: 20px;
        padding-right: 20px;
        padding-top: 30px;
        text-align: left;
        color: white;
        font-weight: bold;
        font-size: 50px;
        position: fixed;
        z-index: 2;
        top: 0;
        left: 0;
        background-color: #056644;
        border: 2px solid #000;
      }
      .content{
        height: 1080px;
        width: 1920px;
        position: fixed;
        background-repeat: no-repeat;
        background-image: url(room.jpg);
        background-size: 100%;
      }
    </style>
  </head>
  <body>
        <% 
        try {
          if (!session.getAttribute("userType").equals("faculty")) {
      %> <jsp:forward page ="index.jsp"/> <%
      }
    } catch (Exception ex) {
      %> <jsp:forward page ="index.jsp"/> <%
}
    %>
    <div class="title">
      Attendance Tracker
    </div>
    <div class="navbarleft" style="color: white;">
      <div class="navList">
        <a class="navListLink" href="fhomeLoggedIn.jsp">Home</a>
        <a class="navListLink" href="courseManager.jsp">Course Manager</a>
      </div>
    </div>
    <div class="navbarright" style="color: white;">
      <div class="navList">
        <a class="navListLink" href="accountSettings.jsp">Account Settings</a>
        <a class="navListLink" href="logout.jsp">Logout</a>
      </div>
    </div>
    <div class="content">
      
    </div>
    <h1>Hello World!</h1>
  </body>
</html>