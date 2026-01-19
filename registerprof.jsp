<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.IOException, java.io.PrintWriter, java.sql.Connection, java.sql.DriverManager, java.sql.PreparedStatement, java.sql.ResultSet,
    java.sql.SQLException, javax.servlet.RequestDispatcher, javax.servlet.ServletException, javax.servlet.annotation.WebServlet, javax.servlet.http.HttpServlet,
    javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse, javax.servlet.http.HttpSession" %>
<%
    String fullName = request.getParameter("fullName");
    String email = request.getParameter("email");
    String password = request.getParameter("password");
    String mobile = request.getParameter("mobile");
    String dob = request.getParameter("dob");
    String gender = request.getParameter("gender");
    String languages = request.getParameter("languages");
    String expertise = request.getParameter("expertise");
    System.out.println("Full Name: " + fullName);

    String url = "jdbc:mysql://localhost:3306/smart_service";
    String user = "root";
    String dbPassword = "root";

    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    boolean emailExists = false;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection(url, user, dbPassword);

        String checkEmailQuery = "SELECT * FROM professionals WHERE email = ?";
        ps = con.prepareStatement(checkEmailQuery);
        ps.setString(1, email);
        rs = ps.executeQuery();
        emailExists = rs.next();

        if (emailExists) {
        	  RequestDispatcher rd = request.getRequestDispatcher("emailalreadyexistProf.html");
              rd.forward(request, response);
            
        } else {
            String insertProfessionalQuery = "INSERT INTO professionals VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
            ps = con.prepareStatement(insertProfessionalQuery);
            ps.setString(1, fullName);
            ps.setString(2, email);
            ps.setString(3, password);
            ps.setString(4, mobile);
            ps.setString(5, dob);
            ps.setString(6, gender);
            ps.setString(7, languages);
            ps.setString(8, expertise);
            ps.executeUpdate();
%>
            <!DOCTYPE html>
            <html lang="en">
            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                  <link rel="icon" href="./project_images/favicon2.ico" type="image/x-icon">
                   <link rel="icon" href="./project_images/favicon2.png" type="image/png">
                   <link rel="shortcut icon" href="./project_images/favicon2.ico" type="image/x-icon">
                <title>Smart Service</title>
                <style>
                    body {
                        overflow: hidden;
                        margin: 0;
                        padding: 0;
                    }
                    #thank-you-section {
                        font-family: Arial, sans-serif;
                        display: flex;
                        justify-content: space-between;
                        align-items: center;
                        background-color: #fff;
                        width: 100%;
                        border-radius: 8px;
                    }
                    .thank-you-content {
                        flex: 0.8;
                        padding: 20px;
                        text-align: left;
                        margin-left: 30px;
                    }
                    .thank-you-content h3 {
                        font-size: 50px;
                        color: #000;
                        margin-bottom: 15px;
                        font-weight: bold;
                    }
                    .thank-you-content p {
                        font-size: 22px;
                        color: #444;
                        margin-bottom: 40px;
                        line-height: 1.5;
                    }
                    .thank-you-content .btn-go-home {
                        background-color: #010714;
                        color: #ffffff;
                        padding: 10px 20px;
                        border: none;
                        border-radius: 5px;
                        font-size: 22px;
                        cursor: pointer;
                        height: 60px;
                        transition: background-color 0.3s ease;
                    }
                    .thank-you-content .btn-go-home:hover {
                        background-color: #444;
                    }
                    .thank-you-image {
                        flex: 0.8;
                        height: 530px;
                        background-image: url('./project_images/shaking_hands.jpg');
                        background-size: cover;
                        background-position: center;
                        border-radius: 8px;
                        margin-left: 20px;
                        margin-top: 100px;
                    }
                </style>
            </head>
            <body>
                <section id="thank-you-section">
                    <div class="thank-you-image"></div>
                    <div class="thank-you-content">
                        <h3>Thank You for Registering!</h3>
                        <p>We appreciate your registration as a professional. You will now receive updates and opportunities relevant to your expertise via email and mobile number.</p>
                        <form action="index.html">
                            <button class="btn-go-home">Go to Main Page</button>
                        </form>
                    </div>
                </section>
            </body>
            </html>
<%
        }
    } catch (Exception e) {
        out.println("Error: " + e.getMessage());
    } finally {
        try {
            if (rs != null) rs.close();
            if (ps != null) ps.close();
            if (con != null) con.close();
        } catch (SQLException e) {
            out.println("Error closing resources: " + e.getMessage());
        }
    }
%>
