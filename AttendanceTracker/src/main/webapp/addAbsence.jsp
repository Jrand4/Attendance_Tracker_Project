<%-- 
    Document   : addAbsence
    Created on : Apr 20, 2020, 11:30:10 AM
    Author     : xarro
--%>

<%@page import="java.sql.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8" import="myBeans.DBConnect"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
  </head>
  <body>
    <%
      DBConnect dbConnect = new DBConnect();
      String courseID = request.getParameter("courseID");
      String studentID = request.getParameter("studentID");
      Date date = Date.valueOf(request.getParameter("date"));
      String sql = "insert into courseStudentAbsence values (0, '" + courseID + "', '" + studentID + "', '" + date + "')";
      dbConnect.insertData(sql);
    %> 
    <jsp:forward page="courseViewByDay.jsp"> 
      <jsp:param name="courseID" value="<%= courseID%>" /> 
      <jsp:param name="date" value="<%= date%>" /> 
    </jsp:forward>

    <h1>Hello World!</h1>
  </body>
</html>