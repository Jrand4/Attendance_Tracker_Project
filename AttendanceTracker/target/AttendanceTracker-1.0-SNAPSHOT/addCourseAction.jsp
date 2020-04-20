<%-- 
    Document   : addCourseAction
    Created on : Mar 21, 2020, 2:29:46 PM
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
    DBConnect dbConnect = new DBConnect();
    String courseID = request.getParameter("courseID");
    String sql = "select user.userID from user where user.userUserName like '%" + session.getAttribute("userName") + "%'";
    String userID = dbConnect.getUserIDFromUserName(sql);
    sql = "select faculty.facultyID from user,faculty where user.userID = faculty.userID and user.userUserName like '%" + session.getAttribute("userName") + "%'";
    String facultyID = dbConnect.getUserIDFromUserName(sql);
    if(courseID != null && facultyID != null){
      sql = "insert into facultycourse values (0, '" + facultyID + "', "
                  + "'" + courseID + "', 'No')";
      dbConnect.insertData(sql);
      %> <jsp:forward page ="addCourse.jsp"/> <%
    }else{
      out.print("ERROR");
    }
      %>
    <h1>Hello World!</h1>
  </body>
</html>
