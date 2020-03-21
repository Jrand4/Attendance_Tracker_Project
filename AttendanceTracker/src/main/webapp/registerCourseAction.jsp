<%-- 
    Document   : registercourseaction
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
        String courseTerm = request.getParameter("courseterm");
        String courseName = request.getParameter("coursename");
        String courseCategory = request.getParameter("coursecategory");
        String courseNumber = request.getParameter("coursenumber");
        String courseSection = request.getParameter("coursesection");
        String[] courseDays = request.getParameterValues("coursedays");
        String courseStart = request.getParameter("coursestarttime");
        String courseEnd = request.getParameter("courseendtime");

        String cDays = "";
        for (int i = 0; i < courseDays.length; i++) {
          cDays = cDays + courseDays[i];
        }
        String sql = "insert into course values (0, '" + courseTerm + "', "
                + "'" + courseName + "', '" + courseCategory + "', '" + courseNumber + "', '" + courseSection + "', '" + cDays
                + "', '" + courseStart + "', '" + courseEnd + "')";
        try {
          DBConnect dbConnect = new DBConnect();
          dbConnect.insertData(sql);
          %> <jsp:forward page ="registerCourse.jsp"/> <%
        } catch (Exception ex) {
          out.print(ex);
        }
    %>.
    <h1>Hello World!</h1>
  </body>
</html>
