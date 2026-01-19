<%@ page import="java.sql.*" %>
<%@ page import="java.util.UUID" %>
<%@ page import="smartservice_cal.GenerateServiceId" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Smart Service</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
      <link rel="icon" href="./project_images/favicon2.ico" type="image/x-icon">
    <link rel="icon" href="./project_images/favicon2.png" type="image/png">
    <link rel="shortcut icon" href="./project_images/favicon2.ico" type="image/x-icon">
    <style>
        .alert-modal, .success-modal {
            display: none;
            position: fixed;
            z-index: 1000;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
            justify-content: center;
            align-items: center;
        }
        .alert-content {
            background-color: #fff;
            padding: 20px 30px;
            border-radius: 10px;
            width: 300px;
            text-align: center;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }
        .alert-content h2 {
            font-size: 18px;
            font-weight: bold;
            margin-bottom: 15px;
            color: #333;
        }
        .alert-content .tick-icon {
            color: green;
            font-size: 40px;
            margin-bottom: 10px;
        }
        .alert-content button {
            background-color: #5cacee;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            margin-top: 10px;
        }
    </style>
</head>
<body>

<%
   String username = (String) session.getAttribute("username");
    String email = request.getParameter("email");
    String mobile = request.getParameter("mobile");
    String datetime = request.getParameter("datetime");
    String payment = request.getParameter("gender");
    String servicetitle = request.getParameter("pagetitle");
    String expertise = request.getParameter("expertise");
    String aemail=null;
    String serviceId="";
    int rowsInserted = 0;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/smart_service", "root", "root");

        String fetchEmailQuery = "SELECT email FROM signup WHERE id = ?";
        PreparedStatement pstmt = conn.prepareStatement(fetchEmailQuery);
        pstmt.setString(1, username);
        ResultSet rs = pstmt.executeQuery();

        if (rs.next()) {
           aemail = rs.getString("email");
           serviceId =  GenerateServiceId.generateServiceId(8);
           
        }
        rs.close();
        pstmt.close();

        String sql = "INSERT INTO cart VALUES (?,?, ?, ?, ?, ?, ?, ?,?)";
        PreparedStatement statement = conn.prepareStatement(sql);
        statement.setString(1, username);
        statement.setString(2,aemail);
        statement.setString(3, email);
        statement.setString(4, mobile);
        statement.setString(5, datetime);
        statement.setString(6, payment);
        statement.setString(7, servicetitle);
        statement.setString(8, expertise);
        statement.setString(9,serviceId);

        rowsInserted = statement.executeUpdate();
        statement.close();
        conn.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>

<div id="successAlert" class="alert-modal success-modal">
    <div class="alert-content">
        <i class="fas fa-check-circle tick-icon"></i>
        <h2><%= rowsInserted > 0 ? "Service has been added to cart" : "Failed to add service to cart" %></h2>
        <button onclick="handleCloseAlert()">OK</button>
    </div>
</div>

<script>
    window.onload = function() {
        if (<%= rowsInserted > 0 %>) {
            document.getElementById('successAlert').style.display = 'flex';
        } else {    
            alert("Failed to add service to cart. Please try again.");
            window.location.href = "home.jsp";
        }
    };

    function handleCloseAlert() {
        document.getElementById('successAlert').style.display = 'none';
        window.location.href = "cart.jsp";
    }
</script>

</body>
</html>
