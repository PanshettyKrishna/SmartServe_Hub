<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>

<%
String reviewText = request.getParameter("reviewText");
String reviewerName = request.getParameter("reviewerName");
String reviewerRating = request.getParameter("reviewRating");
/*int rating=Integer.parseInt(reviewerRating);*/
int rating = 0;
if (reviewerRating != null && !reviewerRating.trim().isEmpty()) {
    rating = Integer.parseInt(reviewerRating);
}
Connection con = null;
PreparedStatement ps = null;

try {
    Class.forName("com.mysql.cj.jdbc.Driver");  
    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/smart_service?user=root&password=root");

    String query = "INSERT INTO review VALUES (?, ?,?)";
    ps = con.prepareStatement(query);
    ps.setString(1, reviewText);
    ps.setString(2, reviewerName);
    ps.setInt(3,rating);
    ps.executeUpdate();
    RequestDispatcher rd = request.getRequestDispatcher("reviewsubmitted.html");
    rd.forward(request, response);
    
} catch (ClassNotFoundException | SQLException e) {
    e.printStackTrace();
} finally {
    if (ps != null) ps.close();
    if (con != null) con.close();
}
%>
