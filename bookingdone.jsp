<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="java.io.*" %>

<%
    String jdbcUrl = "jdbc:mysql://localhost:3306/smart_service";
    String jdbcUser = "root";
    String jdbcPassword = "root";
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    String serviceId = null;
    String username = (String) session.getAttribute("username");

    try {
        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection(jdbcUrl, jdbcUser, jdbcPassword);

        String query = "SELECT serviceId FROM bookservice WHERE username = ? ORDER BY datetime DESC LIMIT 1";
        pstmt = conn.prepareStatement(query);
        pstmt.setString(1, username);
        rs = pstmt.executeQuery();
          
        
        if (rs.next()) {
            serviceId = rs.getString("serviceId");
           
                session.setAttribute("serviceId", serviceId);
        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        if (rs != null) rs.close();
        if (pstmt != null) pstmt.close();
        if (conn != null) conn.close();
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
        body {
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
            background-color: #ffffff;
            margin: 0;
            font-family: 'Poppins', sans-serif;
        }
        .container {
            display: flex;
            max-width: 1400px;
            width: 100%;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            overflow: hidden;
        }
        .image-section {
            flex: 50%;
            background-image: url('./project_images/order.jpg');
            background-size: cover;
            background-position: center;
            height: 500px;
        }
        .content-section {
            flex: 50%;
            padding: 40px;
            display: flex;
            flex-direction: column;
            justify-content: center;
            text-align: center;
        }
        h1 {
            color: #FF6F61;
            font-size: 40px;
            margin-bottom: 10px;
        }
        p {
            color: #333;
            font-size: 25px;
            margin-bottom: 20px;
        }
        .info-message{
           color: #333;
            font-size: 17px;
            margin-top: 40px;
        }
        .service-id {
            color: #333;
            font-size: 24px;
            margin-top: 40px;
        }
        .button-container {
            display: flex;
            justify-content: center;
            gap: 20px;
            margin-top: 20px;
        }
        a {
            background-color: #000;
            color: white;
            padding: 15px 25px;
            text-decoration: none;
            border-radius: 5px;
            font-size: 19.5px;
            transition: background-color 0.3s;
        }
        a:hover {
            background-color: #555;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="image-section"></div>
        <div class="content-section">
            <h1>Your Service Has Been Booked Successfully!</h1>
            <p>More details will be sent to your email.</p>
            <div class="button-container">
                <a href="home.jsp">Go to Home</a>
                <a href="bookedservices.jsp">See Booked Services</a>
            </div>
            <div class="service-id">Service ID: <%= serviceId != null ? serviceId : "Not Available" %>
            <input type="hidden" name="service_Id" value="serviceId">
            </div>
            <p class="info-message">
                   Please note this Service ID for future reference. You may need it for tracking your service status or for any inquiries.</p>
        </div>
    </div>
</body>

</html>
