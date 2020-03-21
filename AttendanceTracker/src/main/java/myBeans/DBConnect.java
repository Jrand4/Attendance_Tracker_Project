/*
 * This contains the business logic to connect to the database
 *
 * @author nmahadev
 */
package myBeans;

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

  private String closeDB() {
    try {
      stm.close();
      conn.close();
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
              result += "?value=" + rst.getString(i + 1) + "\">";
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
              result += "?value=" + rst.getString(i + 1) + "\">";
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
              result += "?value=" + rst.getString(i + 1) + "\">";
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
