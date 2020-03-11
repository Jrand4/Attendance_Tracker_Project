<%-- 
    Document   : loginAction
    Created on : Mar 11, 2020, 12:36:36 PM
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
      String email = request.getParameter("email");
      String password = request.getParameter("psw");
      String userType;
      String sql = "select userUserName, userPassword from user where userUserName = '"
              + email + "' and userPassword = '" + password + "'";
      String sql2 = "select userType from user where userUserName = '"
              + email + "' and userPassword = '" + password + "'";
      DBConnect dbConnect = new DBConnect();
      String validation = dbConnect.isValid(sql);
      out.println("<h2>" + validation + "</h2>");
      if (!validation.equals("Login Failed")) {
        String uType = dbConnect.getUserType(sql2);
        if (!uType.equals("NONE")) {
          if (uType.equals("faculty")) {
    %> <jsp:forward page ="fhomeLoggedIn.jsp"/> <%
    } else if (uType.equals("admin")) {
    %> <jsp:forward page ="ahomeLoggedIn.jsp"/> <%
} else if (uType.equals("student")) {
    %> <jsp:forward page ="shomeLoggedIn.jsp"/> <%
      }
    }
  }
    %>.
    <h1>Hello World!</h1>
  </body>
</html>
