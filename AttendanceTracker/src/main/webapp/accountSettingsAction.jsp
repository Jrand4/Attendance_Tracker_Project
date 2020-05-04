<%-- 
    Document   : accountSettingsAction
    Created on : May 3, 2020, 1:04:58 PM
    Author     : xarro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="myBeans.DBConnect"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
  </head>
  <body>
    <%
      String userName = session.getAttribute("userName").toString();
      String currentPassword = request.getParameter("currentPassword").toString();
      String newPassword = request.getParameter("newPassword");
      String cNewPassword = request.getParameter("cNewPassword");
      DBConnect dbConnect = new DBConnect();
      String userID = dbConnect.getData("select userID from user where userUserName = '" + userName + "'");
      String dbCurrentPassword = dbConnect.getData("select userPassword from user where userUserName = '" + userName + "'").toString().trim();
      
      if(dbCurrentPassword.equals(currentPassword)){
        if(newPassword.equals(cNewPassword)){
          dbConnect.insertData("update user set userPassword = '" + newPassword + "' where userID = '" + userID + "'");
          %> <jsp:forward page ="accountSettingsSuccess.jsp"/> <%
        }
        else{
          %> <jsp:forward page ="accountSettingsError.jsp"/> <%
        }
      }
      else{
        %> <jsp:forward page ="accountSettingsError.jsp"/> <%
      }
      %>
  </body>
</html>
