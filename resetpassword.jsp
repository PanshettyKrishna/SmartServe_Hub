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
        String email = request.getParameter("em");
        String password = request.getParameter("new_pwd");
        System.out.println(email+" "+password);
        boolean emailExists = false;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/smart_service?user=root&password=root");

            String qry = "SELECT * FROM signup WHERE email=?";
            PreparedStatement ps = con.prepareStatement(qry);
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                emailExists = true;
                String sql = "UPDATE signup SET pwd=? WHERE email=?";
                PreparedStatement ps1 = con.prepareStatement(sql);
                ps1.setString(1, password);
                ps1.setString(2, email);
                int rowsUpdated = ps1.executeUpdate();

                if (rowsUpdated > 0) {
                    response.sendRedirect("login.html?message=Password+updated+successfully");
                } 
            }
                if (!emailExists) {
                    response.sendRedirect("reset.html?message=Enter+a+valid+email+address");
                }


        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    %>
</body>

</html>
