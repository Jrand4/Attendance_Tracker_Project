<%-- 
    Document   : accountSettings
    Created on : Mar 3, 2020, 1:58:33 PM
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
      }
      .btn btn-primary{
        background-color: #056644;
      }
      ul {
        list-style-type: none;
        margin: 0;
        padding: 0;
        overflow: hidden;
        background-color: #056644;
      }

      li {
        float: left;
      }

      li a {
        display: block;
        color: white;
        text-align: center;
        padding: 15px 25px;
        text-decoration: none;
      }

      /* Change the link color to #111 (black) on hover */
      li a:hover {
        background-color: #056644;
        border: 1px solid #fff;
        color: white;
      }
      .navbar{
        box-sizing: border-box;
        height: 75px;
        width: 100%;
        margin-left: 35%;
        padding-left: 20px;
        padding-right: 20px;
        color: white;
        position: fixed;
        background-color: #056644;
        border: 1px solid #000;
        z-index: 1;
      }
      .sidetitle{
        box-sizing: border-box;
        height: 75px;
        width: 35%;
        padding-left: 20px;
        padding-right: 20px;
        text-align: center;
        color: white;
        font-weight: bold;
        font-size: 2vw;
        position: fixed;
        z-index: 2;
        top: 0;
        left: 0;
        background-color: #056644;
        border: 1px solid #000;
      }
      .sidecontent {
        box-sizing: border-box;
        height: 100%;
        width: 35%;
        margin-top: 75px;
        margin-bottom: 0%;
        padding-bottom: 10%;
        padding-left: 20px;
        padding-right: 20px;
        position: fixed;
        z-index: 3;
        top: 0;
        left: 0;
        background-color: #ddd;
        overflow-x: hidden;
        border: 1px solid #000;
      }
      .content {
        box-sizing: border-box;
        width: 65%;
        height: calc(100% - 75px);
        margin-left: 35%;
        margin-top: 75px;
        z-index: 0;
        position: fixed;
        background-repeat: no-repeat;
        background-image: url(croom.jpg);
        background-size: 100% 100%;
        border: 5px solid #000;
      </style>
    </head>
    <body>
      <%
        try {
          if (session.getAttribute("userName").equals("")) {
      %> <jsp:forward page ="index.jsp"/> <%
        }
      } catch (Exception ex) {
      %> <jsp:forward page ="index.jsp"/> <%
        }
      %>
      <%
        if (session.getAttribute("userType").equals("admin")) {
      %> 
      <div class="navbar" style="color: white;">
        <ul>
          <li><a href="ahomeLoggedIn.jsp">Home</a></li>
          <li><a href="registerUser.jsp">Register New User</a></li>
          <li><a href="registerCourse.jsp">Register Course</a></li>
        </ul>
      </div>
      <%
      } else if (session.getAttribute("userType").equals("faculty")) {
      %> 
      <div class="navbar" style="color: white;">
        <ul>
          <li><a href="fhomeLoggedIn.jsp">Home</a></li>
          <li><a href="courseManager.jsp">Course Manager</a></li>
        </ul>
      </div>
      <%
      } else {
      %>

      <%
        }
      %>
      <div class="sidecontent">
        <form name="update" action="accountSettingsAction.jsp">
          <div class="form-group">
            <label for="currentPassword">Current Password:</label>
            <input type="password" class="form-control" name="currentPassword">
          </div>
          <div class="form-group">
            <label for="newPassword">New Password:</label>
            <input type="password" class="form-control" name="newPassword">
          </div>
          <div class="form-group">
            <label for="cNewPassword">Confirm New Password:</label>
            <input type="password" class="form-control" name="cNewPassword">
          </div>

          <button type="submit" class="btn btn-success">Submit</button>
          SUCCESS - Password Changed
        </form>
      </div>
      <div class="sidetitle">
        Change Password 
      </div>
      <div class="content">
      </div>
    </body>
  </html>
