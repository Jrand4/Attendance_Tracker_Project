<%-- 
    Document   : advancedSettingsAction
    Created on : Mar 11, 2020, 3:07:25 PM
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
      try {
        String nValue = request.getParameter("nValue");
        int n = Integer.parseInt(nValue);
        int min = (int) Math.pow(10, n);
        int max = (int) (Math.pow(10, n + 1) - 1);

        DBConnect dbConnect = new DBConnect();
        String message = dbConnect.fillNumbers(min,max);
      } catch (Exception e) {

      }
    %>.
    <h1>Hello World!</h1>
  </body>
</html>
