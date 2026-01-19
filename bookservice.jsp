<%@ page import="java.sql.*" %>
<%@ page import="java.util.UUID" %>
<%@ page import="smartservice_cal.GenerateServiceId" %>
<%
    String jdbcUrl = "jdbc:mysql://localhost:3306/smart_service";
    String jdbcUser = "root";
    String jdbcPassword = "root";
    Connection conn = null;   
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(jdbcUrl, jdbcUser, jdbcPassword);

        String serviceId = request.getParameter("cart_id");
        System.out.println(serviceId);
        String username = (String) session.getAttribute("username");
        String email = null, mobile = "", datetime = "", paymentOption = "", serviceTitle = "", serviceDetail = "";
        String accountEmail = null;

        if (serviceId == null || serviceId.isEmpty()) {
            String fetchEmailQuery = "SELECT email FROM signup WHERE id = ?";
            pstmt = conn.prepareStatement(fetchEmailQuery);
            pstmt.setString(1, username);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                accountEmail = rs.getString("email");
            }

            email = request.getParameter("email");
            mobile = request.getParameter("mobile");
            datetime = request.getParameter("datetime");
            paymentOption = request.getParameter("gender");
            serviceTitle = request.getParameter("pagetitle");
            serviceDetail = request.getParameter("expertise");

            serviceId = GenerateServiceId.generateServiceId(8);
        } else {
            String fetchCartQuery = "SELECT * FROM cart WHERE serviceId = ?";
            pstmt = conn.prepareStatement(fetchCartQuery);
            pstmt.setString(1, serviceId);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                username = rs.getString(1);
                accountEmail = rs.getString(2);
                email = rs.getString(3);
                mobile = rs.getString(4);
                datetime = rs.getString(5);
                paymentOption = rs.getString(6);
                serviceTitle = rs.getString(7);
                serviceDetail = rs.getString(8);
            }
        }

        if (email == null) {
            // Handle case when email is still null
            response.sendRedirect("error.jsp?message=Email is required");
        } else if (accountEmail != null) {
            String insertQuery = "INSERT INTO bookservice VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
            pstmt = conn.prepareStatement(insertQuery);
            pstmt.setString(1, serviceId);
            pstmt.setString(2, username);
            pstmt.setString(3, accountEmail);
            pstmt.setString(4, email);
            pstmt.setString(5, mobile);
            pstmt.setString(6, datetime);
            pstmt.setString(7, paymentOption);
            pstmt.setString(8, serviceTitle);
            pstmt.setString(9, serviceDetail);
            pstmt.executeUpdate();

            String deleteCartQuery = "DELETE FROM cart WHERE serviceId = ?";
            pstmt = conn.prepareStatement(deleteCartQuery);
            pstmt.setString(1, serviceId);
            pstmt.executeUpdate();
            
            
            RequestDispatcher rd = request.getRequestDispatcher("bookingdone.jsp");
            rd.forward(request, response);
        } else {
            RequestDispatcher rd = request.getRequestDispatcher("home.jsp");
            rd.forward(request, response);
        }
    } catch (Exception e) {
        e.printStackTrace();
        response.sendRedirect("error.jsp");
    } finally {
        if (rs != null) rs.close();
        if (pstmt != null) pstmt.close();
        if (conn != null) conn.close();
    }
%>
