<%@ page import="java.sql.*" %>
<%
    String cartId = request.getParameter("cart_id");
    String jdbcURL = "jdbc:mysql://localhost:3306/smart_service";
    String dbUser = "root";
    String dbPassword = "root";

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);
        
        String sql = "DELETE FROM cart WHERE serviceId = ?";
        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setString(1, cartId);
        int rowsAffected = statement.executeUpdate();

        if (rowsAffected > 0) {
            // Item removed successfully
            response.sendRedirect("cart.jsp"); // Redirect back to the cart
        } else {
            // Handle case where no rows were affected
            out.println("Error: Item could not be removed.");
        }

        connection.close();
    } catch (Exception e) {
        e.printStackTrace();
        out.println("Database error: " + e.getMessage());
    }
%>
