<%-- 
    Document   : removeAbsence
    Created on : Apr 20, 2020, 12:08:17 PM
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
      String destination = request.getParameter("destination");
      String userID = dbConnect.getUserIDFromStudentID(studentID);
      Date date = Date.valueOf(request.getParameter("date"));
      String sql = "delete from courseStudentAbsence where courseStudentAbsence.courseID = '" + courseID + "' and courseStudentAbsence.studentID = '" + studentID + "' and courseStudentAbsence.date = '" + date + "'";
      dbConnect.insertData(sql);
      if (destination.equals("1")) {
    %> 
    <jsp:forward page="courseViewByDay.jsp"> 
      <jsp:param name="courseID" value="<%= courseID%>" /> 
      <jsp:param name="date" value="<%= date%>" /> 
    </jsp:forward>
    <%
    } else {
    %>
    <jsp:forward page="studentAbsentClassRecord.jsp"> 
      <jsp:param name="userID" value="<%= userID%>" /> 
      <jsp:param name="courseID" value="<%= courseID%>" /> 
    </jsp:forward>
    <%
      }
    %>
    <h1>Hello World!</h1>
  </body>
</html>
