<%@ page language="java" contentType="text/html; charset=UTF-8"
      pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*,javax.servlet.*,javax.servlet.http.*" %>
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
   String email = request.getParameter("emi");
   String pwd = request.getParameter("pwdi");

   
    HttpSession hs = request.getSession();
	hs.setAttribute("em",email);
	hs.setAttribute("pwd",pwd);
	String username="";

   try {
       Class.forName("com.mysql.cj.jdbc.Driver");
       Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/smart_service?user=root&password=root");
       String qry = "select * from signup where email=? and pwd=?";
       PreparedStatement ps = con.prepareStatement(qry);
       ps.setString(1, email);
       ps.setString(2, pwd);
       ResultSet rs = ps.executeQuery();
       
       System.out.println("Executing query with email: " + email + " and password: " + pwd);
       
       if (rs.next()) {
    	   System.out.println("Executing query with email: " + email + " and password: " + pwd);
    	    username=rs.getString(1);
    	    hs.setAttribute("username", username);
           RequestDispatcher rd = request.getRequestDispatcher("home.jsp");
           rd.forward(request, response);
       } else { 
    	   System.out.println("wrong passowrd or email");
    	   RequestDispatcher rd = request.getRequestDispatcher("wronglogin.html");
           rd.forward(request, response);
       }
   } catch (ClassNotFoundException | SQLException e1) {
       e1.printStackTrace();
   }
   
   %>
</body>
</html>