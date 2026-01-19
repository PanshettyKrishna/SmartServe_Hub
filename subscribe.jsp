<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
    String email = request.getParameter("email");

    String url = "jdbc:mysql://localhost:3306/smart_service";
    String user = "root";
    String password = "root";

      
    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    
    try {
   
        Class.forName("com.mysql.cj.jdbc.Driver");

        // Establish the connection
        con = DriverManager.getConnection(url, user, password);


            String insertSubscribeQuery = "INSERT INTO subscribe (email) VALUES (?)";
            ps = con.prepareStatement(insertSubscribeQuery);
            ps.setString(1, email);
            ps.executeUpdate();
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
        #thank-you-section {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 40px;
            height: 500px;
            background-color: #fff;
            width: 100%;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }

        .thank-you-content {
            flex: 1;
            padding: 20px;
            text-align: left;
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
            background-color: #f04949;
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
            flex: 1;
            height: 550px;
            background-image: url('./project_images//Thank_you.jpg'); /* This will use your uploaded image */
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
            <h3>Thank You for Subscribing!</h3>
            <p>We appreciate your subscription. Stay tuned for exciting updates and offers directly to your inbox.</p>
            <form action="home.jsp">
            <button class="btn-go-home">Go to Home</button>
            </form>
        </div>
    </section>
</body>
</html>
    