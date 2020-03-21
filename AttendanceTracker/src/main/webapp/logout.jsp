<%-- 
    Document   : logout
    Created on : Mar 3, 2020, 1:58:52 PM
    Author     : xarro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
  </head>
  <body>
    <%
      session.setAttribute("userType", "");
      session.setAttribute("userName", "");
    %>
    <jsp:forward page ="index.jsp"/>
    <h1>Logged Out!</h1>
  </body>
</html>
