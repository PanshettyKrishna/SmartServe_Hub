<%@ page import="java.sql.*, java.util.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Smart Service</title>
      <link rel="icon" href="./project_images/favicon2.ico" type="image/x-icon">
    <link rel="icon" href="./project_images/favicon2.png" type="image/png">
    <link rel="shortcut icon" href="./project_images/favicon2.ico" type="image/x-icon">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #ffffff;
            color: #000000;
            padding: 20px;
            background-image: linear-gradient(10deg, rgba(255, 182, 193, 0.8), rgba(255, 255, 255, 0.8)), url('./project_images/pink-bg1.jpg');
            background-size: cover; 
        }
        .testimonial-section {
            max-width: 1600px;
            margin: auto;
            text-align: center;
        }
        .testimonial-heading {
            font-size: 40px;
            color: #ff3366;
            margin-bottom: 10px;
        }
        .testimonial-description {
            font-size: 20px;
            color: #555555;
            text-align: start;
            margin-bottom: 30px;
        }
        .cards-container {
            display: flex;
            flex-wrap: wrap;
        }
        .card {
            width: 30%;
            background-color: #f9f9f9;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            padding: 20px;
            margin-top: 20px;
            margin-left: 10px;
            margin-right: 20px;
            text-align: left;
            border: 1px solid #000;
            box-sizing: border-box;
        }
        .card-rating {
            color: #ff3366;
            font-size: 14px;
            margin-bottom: 10px;
        }
        .card-text {
            font-size: 14px;
            color: #333333;
            margin: 10px 0;
        }
        .card-author {
            font-size: 16px;
            font-weight: bold;
            color: #ff3366;
        }
        .stars {
            color: #ff3366;
            font-size: 20px;
        }
    .filter-section {
        margin-bottom: 20px;
        padding: 10px;
        display: inline-block;
    }
    .filter-section label {
        font-size: 18px;
        color: #ff3366;
        margin-right: 10px;
        font-weight: bold;
    }
    .filter-section select {
        padding: 10px;
        font-size: 16px;
        border: 1px solid #ff3366;
        border-radius: 5px;
        background-color: #ffffff;
        color: #333;
        cursor: pointer;
        -webkit-appearance: none;
        -moz-appearance: none;
        appearance: none;
        background-image: url('https://cdn-icons-png.flaticon.com/512/32/32195.png');
        background-repeat: no-repeat;
        background-position: right 10px center;
        background-size: 20px;
        width: 150px;
    }
    .filter-section select:focus {
        outline: none;
        border-color: #ff3366;
        box-shadow: 0 0 5px rgba(255, 51, 102, 0.5);
    }   
        
        .filter-section button {
            padding: 10px 20px;
            font-size: 16px;
            background-color: #ff3366;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        .filter-section button:hover {
            background-color: #e62e5c;
        }
    </style>
</head>
<body>
    <div class="testimonial-section">
        <h1 class="testimonial-heading">Read what our customers love&#10084; about us</h1>
        <p class="testimonial-description">
            At Smart Service, we have successfully partnered with clients across various sectors to elevate the quality of their service experience. Our innovative solutions have helped businesses expand their reach and build stronger customer loyalty.
        </p>

        <div class="filter-section">
            <form method="post" action="seereviews.jsp">
                <label for="ratingFilter">Filter by Rating:</label>
                <select id="ratingFilter" name="ratingFilter">
                    <option value="all">All Ratings</option>
                    <option value="5">5 Stars</option>
                    <option value="4">4 Stars</option>
                    <option value="3">3 Stars</option>
                    <option value="2">2 Stars</option>
                    <option value="1">1 Star</option>
                </select>
                <button type="submit">Apply</button>
            </form>
        </div>

        <div class="cards-container">
            <%
                String ratingFilter = request.getParameter("ratingFilter");
                int selectedRating = 0;

                if (ratingFilter != null && !ratingFilter.equals("all")) {
                    selectedRating = Integer.parseInt(ratingFilter); 
                }

                try {
                    Class.forName("com.mysql.cj.jdbc.Driver"); 
                    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/smart_service?user=root&password=root");

                    String query;
                    if (selectedRating > 0) {
                        query = "SELECT * FROM review WHERE reviewrating = " + selectedRating;
                    } else {
                        query = "SELECT * FROM review";
                    }

                    Statement stmt = conn.createStatement();
                    ResultSet rs = stmt.executeQuery(query);

                    while(rs.next()) {
                        String feedback = rs.getString(1);
                        String userName = rs.getString(2);
                        int rating = rs.getInt(3);
            %>
            <div class="card">
                <div class="card-rating">
                    <%
                        for (int i = 0; i < rating; i++) {
                    %>
                        <span class="stars">★</span>
                    <%
                        }
                        for (int i = rating; i < 5; i++) {
                    %>
                        <span class="stars" style="color: #ccc;">★</span>
                    <%
                        }
                    %>
                </div>
                <p class="card-text"><%= feedback %></p>
                <p class="card-author">- <%= userName %></p>
            </div>
            <%
                    }
                    conn.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            %>
        </div>
    </div>
</body>
</html>
