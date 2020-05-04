/*
 * This contains the business logic to connect to the database
 *
 * @author nmahadev
 */
package myBeans;

import javax.mail.*;
import javax.mail.internet.*;
import javax.activation.*;
import java.sql.*;

public class DBConnect {

  // driver and connection string variables
  private final String driver = "com.mysql.jdbc.Driver";
  private final String url = "jdbc:mysql://localhost:3306/attendance_tracker";
  private final String user = "mahadev";
  private final String pwd = "mahadev";

  // JDBC variables and methods
  private Connection conn = null;           // creates the pipeline 
  private Statement stm = null;
  private PreparedStatement pstm = null;
  private ResultSet rst = null;             // returns table of query
  private ResultSetMetaData rsmd = null;    // returns the structure information of the table

  private Connection conn2 = null;           // creates the pipeline 
  private Statement stm2 = null;
  private PreparedStatement pstm2 = null;
  private ResultSet rst2 = null;             // returns table of query
  private ResultSetMetaData rsmd2 = null;    // returns the structure information of the table

  // Utility Methods
  private String openDB() {
    try {
      Class.forName(driver);
      conn = DriverManager.getConnection(url, user, pwd);
      stm = conn.createStatement();
    } catch (Exception e) {
      return e.getMessage();
    }
    return "Opened";
  }

  private String openDB2() {
    try {
      Class.forName(driver);
      conn2 = DriverManager.getConnection(url, user, pwd);
      stm2 = conn2.createStatement();
    } catch (Exception e) {
      return e.getMessage();
    }
    return "Opened";
  }

  private String closeDB() {
    try {
      stm.close();
      conn.close();
    } catch (Exception e) {
      return e.getMessage();
    }
    return "Closed";
  }

  private String closeDB2() {
    try {
      stm2.close();
      conn2.close();
    } catch (Exception e) {
      return e.getMessage();
    }
    return "Closed";
  }

  public String isValid(String sql) {
    String message = openDB();
    if (message.equals("Opened")) {
      int count = 0;
      try {
        rst = stm.executeQuery(sql);
        while (rst.next()) {
          count++;
        }
      } catch (Exception e) {
        message = e.getMessage();
      }
      if (count != 0) {
        message = "Login Successful";
      } else {
        message = "Login Failed";
      }
      closeDB();
    }
    return message;
  }

  public int getLastNamesCount(String sql) {
    String message = openDB();
    int count = 0;
    if (message.equals("Opened")) {
      try {
        rst = stm.executeQuery(sql);
        while (rst.next()) {
          count++;
        }
        message = closeDB();
      } catch (Exception ex) {
        return 0;
      }
    }
    return count;
  }

  public int getAbsenceCount(String sql) {
    String message = openDB2();
    int count = 0;
    if (message.equals("Opened")) {
      try {
        rst2 = stm2.executeQuery(sql);
        while (rst2.next()) {
          count++;
        }
        message = closeDB2();
      } catch (Exception ex) {
        return 0;
      }
    }
    return count;
  }

  public void SendMail(String to) {
    String from = "attendancetracker4400@gmail.com";//change accordingly ; 
    String pass = "FS-395909";
    java.util.Properties props = System.getProperties();
    String host = "smtp.gmail.com";

    props.put("mail.smtp.starttls.enable", "true");
    props.put("mail.smtp.ssl.trust", host);
    props.put("mail.smtp.user", from);
    props.put("mail.smtp.password", pass);
    props.put("mail.smtp.port", "587");
    props.put("mail.smtp.auth", "true");
    Session session = Session.getInstance(props, new javax.mail.Authenticator() {
      protected PasswordAuthentication getPasswordAuthentication() {
        return new PasswordAuthentication("attendancetracker4400@gmail.com", "FS-395909");
      }
    });

    //compose the message  
    try {
      MimeMessage message = new MimeMessage(session);
      message.setFrom(new InternetAddress(from));
      message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
      message.setSubject("Ping");
      DBConnect dbConnect = new DBConnect();
      String userName = getData("select userUserName from user where userEmailBackup = '" + to + "'");
      String password = getData("select userPassword from user where userEmailBackup = '" + to + "'");
      message.setText("Hello, here is your login information.  \nUserName:" + userName + "\nPassword:" + password + "\n");

      // Send message  
      Transport transport = session.getTransport("smtp");
      transport.connect(host, 587, from, pass);
      transport.sendMessage(message, null);
      System.out.println("message sent successfully....");
    } catch (MessagingException mex) {
      mex.printStackTrace();
    }
  }

  public int getLastNum(String sql) {
    String message = openDB();
    int count = 0;
    if (message.equals("Opened")) {
      try {
        rst = stm.executeQuery(sql);
        if (rst.last()) {
          count = Integer.parseInt(rst.getString(1));
        }
        message = closeDB();
      } catch (Exception ex) {
        return -1;
      }
    }
    return count;
  }

  // APIs connect database
  public String insertData(String sql) {
    String message = openDB();

    if (message.equals("Opened")) {
      try {
        stm.executeUpdate(sql);
        message = "Success";
      } catch (Exception e) {
        return e.getMessage();
      }
      message = "Update Successful";
    }
    closeDB();
    return message;
  }

  public String getUserIDFromUserName(String sql) {
    String result = "";
    String message = openDB();
    if (message.equals("Opened")) {
      try {
        rst = stm.executeQuery(sql);
        rsmd = rst.getMetaData();
        int count = rsmd.getColumnCount();
        if (count == 1 && rst.next()) {
          result = rst.getString(1);
        } else {
          result = "NONE";
        }
        message = closeDB();
        return result;
      } catch (Exception e) {
        return e.getMessage();
      }
    } else {
      return message;
    }
  }

  public String getUserType(String sql) {
    String result = "";
    String message = openDB();
    if (message.equals("Opened")) {
      try {
        rst = stm.executeQuery(sql);
        rsmd = rst.getMetaData();
        int count = rsmd.getColumnCount();
        if (count == 1 && rst.next()) {
          result = rst.getString(1);
        } else {
          result = "NONE";
        }
        message = closeDB();
        return result;
      } catch (Exception e) {
        return e.getMessage();
      }
    } else {
      return message;
    }
  }

  public String htmlAddCourseList(String sql) {
    String result = "";
    String message = openDB();
    if (message.equals("Opened")) {
      try {
        rst = stm.executeQuery(sql);
        rsmd = rst.getMetaData();
        int count = rsmd.getColumnCount();
        //result += "<a class=\"courseListLink\" href=\"courseViewOverall.jsp\">";
        // create data rows
        while (rst.next()) {
          result += "<a class=\"courseListLink\" href=\"addCourseAction.jsp";
          for (int i = 0; i < count; i++) {
            if (i == 0) {
              result += "?courseID=" + rst.getString(i + 1) + "\">";
            } else if (i == 5) {
              result += " S" + rst.getString(i + 1) + " \n";
            } else if (i == 7) {
              result += " " + rst.getString(i + 1) + " to \n";
            } else {
              result += " " + rst.getString(i + 1) + " \n";
            }
          }
          result += "</a>\n";
        }
        message = closeDB();
        return result;
      } catch (Exception e) {
        return e.getMessage();
      }
    } else {
      return message;
    }
  }

  public String getData(String sql) {
    String result = "";
    String message = openDB2();
    if (message.equals("Opened")) {
      try {
        rst2 = stm2.executeQuery(sql);
        rsmd2 = rst2.getMetaData();
        int count = rsmd2.getColumnCount();
        while (rst2.next()) {
          for (int i = 0; i < count; i++) {
            result += rst2.getString(i + 1) + " ";
          }
        }
        message = closeDB2();
        return result;
      } catch (Exception e) {
        return e.getMessage();
      }
    } else {
      return message;
    }
  }

  public String htmlRemoveCourseList(String sql) {
    String result = "";
    String message = openDB();
    if (message.equals("Opened")) {
      try {
        rst = stm.executeQuery(sql);
        rsmd = rst.getMetaData();
        int count = rsmd.getColumnCount();
        //result += "<a class=\"courseListLink\" href=\"courseViewOverall.jsp\">";
        // create data rows
        while (rst.next()) {
          result += "<a class=\"courseListLink\" href=\"removeCourseAction.jsp";
          for (int i = 0; i < count; i++) {
            if (i == 0) {
              result += "?courseID=" + rst.getString(i + 1) + "\">";
            } else if (i == 5) {
              result += " S" + rst.getString(i + 1) + " \n";
            } else if (i == 7) {
              result += " " + rst.getString(i + 1) + " to \n";
            } else {
              result += " " + rst.getString(i + 1) + " \n";
            }
          }
          result += "</a>\n";
        }
        message = closeDB();
        return result;
      } catch (Exception e) {
        return e.getMessage();
      }
    } else {
      return message;
    }
  }

  public String htmlCourseList(String sql) {
    String result = "";
    String message = openDB();
    if (message.equals("Opened")) {
      try {
        rst = stm.executeQuery(sql);
        rsmd = rst.getMetaData();
        int count = rsmd.getColumnCount();
        //result += "<a class=\"courseListLink\" href=\"courseViewOverall.jsp\">";
        // create data rows
        while (rst.next()) {
          result += "<a class=\"courseListLink\" href=\"courseViewOverall.jsp";
          for (int i = 0; i < count; i++) {
            if (i == 0) {
              result += "?courseID=" + rst.getString(i + 1) + "\">";
            } else if (i == 5) {
              result += " S" + rst.getString(i + 1) + " \n";
            } else if (i == 7) {
              result += " " + rst.getString(i + 1) + " to \n";
            } else {
              result += " " + rst.getString(i + 1) + " \n";
            }
          }
          result += "</a>\n";
        }
        message = closeDB();
        return result;
      } catch (Exception e) {
        return e.getMessage();
      }
    } else {
      return message;
    }
  }

  public String htmlStudentOverallList(String sql, String courseID) {
    String result = "";
    String message = openDB();
    if (message.equals("Opened")) {
      try {
        rst = stm.executeQuery(sql);
        rsmd = rst.getMetaData();
        int count = rsmd.getColumnCount();
        String userID = "";
        String studentID = "";
        while (rst.next()) {
          result += "<a class=\"courseListLink\" href=\"studentAbsentClassRecord.jsp";
          for (int i = 0; i < count; i++) {
            if (i == 0) {
              userID = rst.getString(i + 1);
              result += "?userID=" + userID + "&courseID=" + courseID + "\">";
              studentID = getStudentIDFromUserID(userID);
            } else if (i == 1) {
              result += " " + rst.getString(i + 1) + ", \n";
            } else if (i == 2) {
              result += rst.getString(i + 1) + " \n<br>Absences: " + getAbsenceCount("select courseStudentAbsenceID from courseStudentAbsence where studentID = '" + studentID + "' AND courseID = '" + courseID + "'");
            } else {
              result += " " + rst.getString(i + 1) + " \n";
            }
          }
          result += "</a>\n";
        }
        message = closeDB();
        return result;
      } catch (Exception e) {
        return e.getMessage();
      }
    } else {
      return message;
    }
  }

  public boolean wasPresentAtDay(String studentID, String courseID, Date date) {
    String s = "";
    s = getData("select courseStudentAbsenceID from courseStudentAbsence where courseID = '" + courseID + "' AND studentID = '" + studentID + "' AND date = '" + date + "'");
    if (s.equals("")) {
      return true;
    } else {
      return false;
    }

  }

  public String getStudentIDFromUserID(String userID) {

    return getData("select student.studentID from user,student where user.userID = student.userID and student.userID = '" + userID + "'");
  }

  public String getUserIDFromStudentID(String studentID) {

    return getData("select user.userID from user,student where user.userID = student.userID and student.studentID = '" + studentID + "'");
  }

  public String htmlStudentByDayList(String sql, String courseID, Date date) {
    String result = "";
    String message = openDB();
    boolean absent = false;
    if (message.equals("Opened")) {
      try {
        rst = stm.executeQuery(sql);
        rsmd = rst.getMetaData();
        int count = rsmd.getColumnCount();
        String userID = "";
        String studentID = "";
        String firstName = "";
        String lastName = "";
        result += "<ul class=\"list-group\">";
        while (rst.next()) {
          result += "<li class=\"list-group-item\">";
          for (int i = 0; i < count; i++) {
            if (i == 0) {
              userID = rst.getString(i + 1);
              studentID = getStudentIDFromUserID(userID);
            } else if (i == 1) {
              lastName = rst.getString(i + 1);
            } else if (i == 2) {
              firstName = rst.getString(i + 1) + " \n";
            }
          }
          absent = !wasPresentAtDay(studentID, courseID, date);
          if (!absent) {
            result += lastName + "," + firstName + "<a class=\"btn btn-info\" role=\"button\" href=\"addAbsence.jsp?courseID=" + courseID + "&studentID=" + studentID + "&date=" + date + "&destination=1\">Absent</a>\n</li>\n";
          } else {
            result += lastName + "," + firstName + "[ABSENT] <a class=\"btn btn-warning\" role=\"button\" href=\"removeAbsence.jsp?courseID=" + courseID + "&studentID=" + studentID + "&date=" + date + "&destination=1\">Excuse</a>\n</li>\n";
          }
        }
        result += "</ul>";
        message = closeDB();
        return result;
      } catch (Exception e) {
        return e.getMessage();
      }
    } else {
      return message;
    }
  }

  public String htmlRemoveAbsenceList(String sql, String studentID, String courseID) {
    String result = "";
    String message = openDB();
    boolean absent = false;
    if (message.equals("Opened")) {
      try {
        rst = stm.executeQuery(sql);
        rsmd = rst.getMetaData();
        int count = 0;
        result += "<ul class=\"list-group\">";
        Date date = null;
        while (rst.next()) {
          date = Date.valueOf(rst.getString(count + 1));
          result += "<li class=\"list-group-item\"> " + date;
          result += "<a class=\"btn btn-warning\" role=\"button\" href=\"removeAbsence.jsp?courseID=" + courseID + "&studentID=" + studentID + "&date=" + date + "&destination=0\">Excuse</a>\n</li>\n";
        }
        result += "</ul>";
        message = closeDB();
        return result;
      } catch (Exception e) {
        return e.getMessage();
      }
    } else {
      return message;
    }
  }

  public String htmlTable(String sql) {
    String result = "<table>\n";
    String message = openDB();
    if (message.equals("Opened")) {
      try {
        rst = stm.executeQuery(sql);
        rsmd = rst.getMetaData();
        int count = rsmd.getColumnCount();
        // create column headings
        result += "<tr>\n";
        for (int i = 0; i < count; i++) {
          result += "<th>" + rsmd.getColumnName(i + 1) + "</th>\n";
        }
        result += "</tr>\n";
        // create data rows
        while (rst.next()) {
          result += "<tr>\n";
          for (int i = 0; i < count; i++) {
            result += "<td>" + rst.getString(i + 1) + "</td>\n";
          }
          result += "</tr>\n";
        }
        result += "</table>\n";
        message = closeDB();
        return result;
      } catch (Exception e) {
        return e.getMessage();
      }
    } else {
      return message;
    }
  }
}
