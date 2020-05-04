<%-- 
    Document   : forgotPasswordAction
    Created on : May 3, 2020, 3:27:58 PM
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
     String to = request.getParameter("backupEmail");
     DBConnect dbConnect = new DBConnect();
     dbConnect.SendMail(to);
     %> <jsp:forward page ="forgotPasswordSent.jsp"/> <%
      %>
  </body>
</html>
