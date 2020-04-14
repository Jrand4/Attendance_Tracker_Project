<%@page import="java.sql.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8" import="myBeans.DBConnect"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
    <style>
      *{
        box-sizing: border-box;

      }
      body {
        margin: 0;
        font-family: Arial, Helvetica, sans-serif;
      }
      a{
        color: white;
        float: right;
      }
      btn btn-info{
        float: right;
      }
      ul{
        background-color: #0C8D60;
      }
      li{
        background-color: #0C8D60;
      }
      .list-group-item{
        display: block;
        color: black;
        text-align: left;
        padding: 25px 25px;
        text-decoration: none;
        background-color: #13EBA2;
        border: 2px solid #000;
        width: 100%;
        margin-top: 15px;
        height: 75px;
      }
      .navList {
        list-style-type:none;
        margin: 0;
        padding: 0;
        overflow: visible;
        background-color: #7f7f7f;
        float: left;
        height: 25px;
        font-size: 16px;
      }
      .previousButton{
        float:left;
      }
      .nextButton{
        float:right;
      }
      .navListLink {
        display: block;
        color: white;
        text-align: center;
        padding: 0px 25px;
        text-decoration: none;
      }

      /* Change the link color to #111 (black) on hover */
      .navListLink:hover {
        background-color: #5f5f5f;
        border: 2px solid #fff;
        color: white;
      }
      .courseNav{
        color:white;
        text-align: left;
        padding-top: 5px;
        padding-left: 25px;
        list-style-type:none;
        overflow: visible;
        background-color: #05AC72;
        width: 100%;
        height: 50px;
        font-size: 25px;
        border: 3px solid #000;
      }
      .dateNav{
        color:white;
        text-align: center;
        padding-top: 5px;
        list-style-type:none;
        overflow: visible;
        background-color: #05AC72;
        width: 100%;
        height: 50px;
        font-size: 25px;
        border: 3px solid #000;
      }
      .courseNavListLink {
        align-items: center;
        align-content: center;
        padding-left: 30px;
        padding-top: 10px;
        display: block;
        color: white;
        float: right;
        text-align: center;
        padding-left: 15px;
        padding-right: 15px;
        font-size: 16px;
        text-decoration: none;
      }

      /* Change the link color to #111 (black) on hover */
      .courseNavListLink:hover {
        background-color: #6df3c5;
        border: 2px solid #000;
        color: black;
      }
      .courseList {
        list-style-type:none;
        margin: 0;
        padding-left: 20px;
        padding-right: 20px;
        overflow: visible;
        float: bottom;
        width: 100%;
        height: calc(100% - 25px);
        font-size: 15px;
      }

      .courseListLink {
        display: block;
        color: black;
        text-align: left;
        padding: 25px 25px;
        text-decoration: none;
        background-color: #13EBA2;
        border: 2px solid #000;
        width: 100%;
        margin-top: 15px;
        height: 125px;
      }

      /* Change the link color to #111 (black) on hover */
      .courseListLink:hover {
        background-color: #6df3c5;
        border: 2px solid #000;
        color: black;
      }
      .navbarleft{
        box-sizing: border-box;
        height: 45px;
        width: 75%;
        margin-top: 150px;
        padding-left: 20px;
        padding-right: 20px;
        padding-top: 10px;
        color: white;
        position: fixed;
        background-color: #7f7f7f;
        border: 3px solid #000;
        z-index: 1;
      }
      .navbarright{
        box-sizing: border-box;
        height: 45px;
        width: 25%;
        margin-left: 75%;
        margin-top: 150px;
        padding-left: 20px;
        padding-right: 20px;
        padding-top: 10px;
        color: white;
        position: fixed;
        background-color: #7f7f7f;
        border: 3px solid #000;
        z-index: 1;
      }
      .title{
        box-sizing: border-box;
        height: 150px;
        width: 100%;
        padding-left: 20px;
        padding-right: 20px;
        padding-top: 30px;
        text-align: left;
        color: white;
        font-weight: bold;
        font-size: 50px;
        position: fixed;
        z-index: 2;
        top: 0;
        left: 0;
        background-color: #056644;
        border: 2px solid #000;
      }
      .sidecontent {
        box-sizing: border-box;
        height: calc(100% - 195px);
        width: 35%;
        margin-top: 195px;
        margin-bottom: 50px;
        padding-bottom: 10%;
        position: fixed;
        z-index: 3;
        top: 0;
        left: 0;
        background-color: #0C8D60;
        overflow-y: scroll;
        border: 3px solid #000;
      }
      .content {
        box-sizing: border-box;
        width: 65%;
        height: calc(100% - 195px);
        margin-left: 35%;
        margin-top: 195px;
        z-index: 0;
        position: fixed;
        overflow-y: scroll;
        background-color: #0C8D60;
        border: 3px solid #000;
      }
    </style>
  </head>
  <body>
    <%
      try {
        if (!session.getAttribute("userType").equals("faculty")) {
    %> <jsp:forward page ="index.jsp"/> <%
      }
    } catch (Exception ex) {
    %> <jsp:forward page ="index.jsp"/> <%
      }
    %>
    <%
      Date date = new java.sql.Date(System.currentTimeMillis());
      String courseID = request.getParameter("value");
      session.setAttribute("courseID", courseID);
      String sql = "select courseCategory,courseName from course where courseID = '" + courseID + "'";
      DBConnect dbConnect = new DBConnect();
      String courseInfo = dbConnect.getData(sql);
      sql = "select user.userID,user.userLastName,user.userFirstName from user inner join student on user.userID = student.userID inner join studentcourse on student.studentID = studentcourse.studentID inner join course on studentcourse.courseID = course.courseID where course.courseID = '" + courseID + "' order by user.userLastName asc";
    %>
    <div class="title">
      Course Manager 
    </div>
    <div class="navbarleft" style="color: white;">
      <div class="navList">
        <a class="navListLink" href="fhomeLoggedIn.jsp">Home</a>
        <a class="navListLink" href="courseManager.jsp">Course Manager</a>
      </div>
    </div>
    <div class="navbarright" style="color: white;">
      <div class="navList">
        <a class="navListLink" href="accountSettings.jsp">Account Settings</a>
        <a class="navListLink" href="logout.jsp">Logout</a>
      </div>
    </div>
    <div class="content">
      <div class="courseNav">
        Selected Course: <%= courseInfo%>
        <a class="courseNavListLink" href="courseViewByDay.jsp?value=<%=courseID%>">By Day</a>
        <a class="courseNavListLink" href="courseViewOverall.jsp?value=<%=courseID%>">Overview</a>
      </div>
      <div class="dateNav">
        <a class="btn btn-secondary previousButton" role="button" location.href="addAbsence.jsp?value=">Previous</a>
        Selected Date: <%= date%>
        <a class="btn btn-secondary nextButton" role="button" location.href="addAbsence.jsp?value=">Next</a>
      </div>
      <div class="courseList">
        <%=  dbConnect.htmlStudentByDayList(sql, courseID, date)%>
      </div>
    </div>
    <div class="sidecontent">
      <div class="courseNav">
        Course List:
        <a class="courseNavListLink" href="addCourse.jsp">Add Course</a>
        <a class="courseNavListLink" href="removeCourse.jsp">Remove Course</a>
      </div>
      <div class="courseList">
        <%
          String sql2 = "select course.* from course inner join facultycourse on course.courseID = facultycourse.courseID, faculty,user where faculty.facultyID = facultycourse.facultyID and faculty.userID = user.userID and user.userUserName like '%" + session.getAttribute("userName") + "%' order by courseTerm asc, courseCategory asc";
          DBConnect dbConnect2 = new DBConnect();
        %>
        <%= dbConnect2.htmlCourseList(sql2)%>
      </div>
    </div>
    <h1>Hello World!</h1>
  </body>
</html>