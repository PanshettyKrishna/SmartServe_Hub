<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.IOException, java.io.PrintWriter, java.sql.Connection, java.sql.DriverManager, java.sql.PreparedStatement, java.sql.ResultSet,
    java.sql.SQLException, javax.servlet.RequestDispatcher, javax.servlet.ServletException, javax.servlet.annotation.WebServlet, javax.servlet.http.HttpServlet,
    javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse, javax.servlet.http.HttpSession, java.time.LocalDate, java.time.format.DateTimeParseException,
    java.time.Period, java.time.format.DateTimeFormatter" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Smart Service</title>
      <link rel="icon" href="./project_images/favicon2.ico" type="image/x-icon">
    <link rel="icon" href="./project_images/favicon2.png" type="image/png">
    <link rel="shortcut icon" href="./project_images/favicon2.ico" type="image/x-icon">
</head>
<body>
    <%
        String id = request.getParameter("idn");
        String fname = request.getParameter("fn");
        String lname = request.getParameter("ln");
        String email = request.getParameter("em");
        String pwd = request.getParameter("pwd");
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/smart_service?user=root&password=root");
                String sql = "select * from signup where email = ?";
                PreparedStatement ps1 = con.prepareStatement(sql);
                ps1.setString(1, email);
                ResultSet rs = ps1.executeQuery();
                if (rs.next()) {
                    RequestDispatcher rd = request.getRequestDispatcher("emailalreadyexist.html");
                    rd.forward(request, response);
                } else {
                    String qry = "insert into signup values (?, ?, ?, ?, ?)";
                    PreparedStatement ps = con.prepareStatement(qry);
                    ps.setString(1, id);
                    ps.setString(2, fname);
                    ps.setString(3, lname);
                    ps.setString(4, email);
                    ps.setString(5, pwd);
                    ps.executeUpdate();

                    RequestDispatcher rd = request.getRequestDispatcher("login.html");
                    rd.forward(request, response);
                }
            } catch (ClassNotFoundException | SQLException e) {
                e.printStackTrace();
            }
            
    %>
</body>
</html>
