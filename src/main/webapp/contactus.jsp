<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

    <%
        String jdbcURL = "jdbc:mysql://localhost:3306/smart_service";
        String dbUser = "root";
        String dbPassword = "root";

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String countryCode = request.getParameter("country-code");
        String phone = request.getParameter("phone");
        String message = request.getParameter("message");
        
        System.out.println(name+" "+email+" ");
        
        long mobileNum=Long.parseLong(countryCode+phone);

        if (name != null && email != null && phone != null && message != null) {
            Connection conn = null;
            PreparedStatement pstmt = null;

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                conn = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);

                String sql = "INSERT INTO contactus  VALUES (?, ?, ?, ?)";
                System.out.println("Insertd");
                pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, name);
                pstmt.setString(2, email);
                pstmt.setLong(3,mobileNum);
                pstmt.setString(4, message);
                
                pstmt.executeUpdate();
                
            } catch (Exception e) {
                e.printStackTrace();
                out.println("<p>Error: " + e.getMessage() + "</p>");
            } finally {
                try {
                    if (pstmt != null) pstmt.close();
                    if (conn != null) conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        } else {
            out.println("<p>Please fill in all fields.</p>");
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
                        overflow: hidden;
                        margin: 0;
                        padding: 0;
                    }
                    #contact-us-section {
                        font-family: Arial, sans-serif;
                        display: flex;
                        justify-content: space-between;
                        align-items: center;
                        background-color: #fff;
                        width: 100%;
                        border-radius: 8px;
                    }
                    .contact-us-content {
                        flex: 0.8;
                        padding: 20px;
                        text-align: left;
                        margin-left: 30px;
                    }
                    .contact-us-content h3 {
                        font-size: 50px;
                        color: #000;
                        margin-bottom: 15px;
                        font-weight: bold;
                    }
                    .contact-us-content p {
                        font-size: 22px;
                        color: #444;
                        margin-bottom: 40px;
                        line-height: 1.5;
                    }
                    .contact-us-content .btn-go-home {
                        background-color: #444;
                        color: #ffffff;
                        padding: 10px 20px;
                        border: none;
                        border-radius: 5px;
                        font-size: 22px;
                        cursor: pointer;
                        height: 60px;
                        transition: background-color 0.3s ease;
                    }
                    .contact-us-content .btn-go-home:hover {
                        background-color: #000;
                        transform:scale(1.1,1.1);
                    }
                    .contact-us-image {
                        flex: 0.8;
                        height: 580px;
                        background-image: url('./project_images/Good team-pana.png');
                        background-size: cover;
                        background-position: center;
                        border-radius: 8px;
                        margin-left: 20px;
                        margin-top: 100px;
                    }
                </style>
            </head>
            <body>
     <section id="contact-us-section">
    <div class="contact-us-image"></div>
    <div class="contact-us-content">
        <h3>Thank You for Reaching Out!</h3>
        <p>We appreciate your inquiry. Our team will get back to you shortly with the information you need. If you have any urgent questions, feel free to contact us directly via phone or email.</p>
        <form action="home.jsp">
            <button class="btn-go-home">Go to Home</button>
        </form>
    </div>
</section>
                
            </body>
            </html>
