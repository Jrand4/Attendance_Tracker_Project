<%-- 
    Document   : registerAction
    Created on : Mar 11, 2020, 2:56:50 PM
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
        String firstName = request.getParameter("firstname");
        String lastName = request.getParameter("lastname");
        String bkupEmail = request.getParameter("bkupemail");
        String userType = request.getParameter("usertype");
        String sql = "SELECT USERLASTNAME FROM USER WHERE USERLASTNAME = '" + lastName + "'";
        DBConnect dbConnect = new DBConnect();
        int count = dbConnect.getLastNamesCount(sql);
        count++;
        sql = "select usernumber from user";
        int nCount = dbConnect.getLastNum(sql);
        sql = "select userID from user";
        int idC = dbConnect.getLastNum(sql);
        idC++;
        nCount++;
        if (count != 0 && nCount != 0) {
          String n = String.format("%08d", nCount);
          char f = firstName.charAt(0);
          char w = n.charAt(4);
          char x = n.charAt(5);
          char y = n.charAt(6);
          char z = n.charAt(7);
          String userN = "";
          String nEmail = "";
          userN = f + lastName + Integer.toString(count);
          String nPass = "FS-" + w + x + y + z;
          if (userType.equals("student")) {
            nEmail = userN + "@student.edu";
          } else if (userType.equals("faculty")) {
            nEmail = userN + "@faculty.edu";
          } else if (userType.equals("admin")) {
            nEmail = userN + "@admin.edu";
          }
          sql = "insert into user values (0, '" + n + "', "
                  + "'" + firstName + "', '" + lastName + "', '" + nEmail + "', '" + bkupEmail + "', '" + userType
                  + "', '" + userN + "', '" + nPass + "')";
          String sql2 = "";
          dbConnect.insertData(sql);
          if (userType.equals("student")) {
            sql2 = "insert into student values (0, '" + 0 + "', '" + idC + "')";
          } else if (userType.equals("faculty")) {
            sql2 = "insert into faculty values (0, '" + idC + "')";
          } else if (userType.equals("admin")) {
            sql2 = "insert into admin values (0, '" + idC + "')";
          }
          dbConnect.insertData(sql2);
        }
    %> <jsp:forward page ="registerUserSuccess.jsp"/> <%
    } catch (Exception ex) {
    %> <jsp:forward page ="registerUserFailure.jsp"/> <%
      }

    %>
    <h1>Hello World!</h1>
  </body>
</html>

