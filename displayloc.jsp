<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="smartservice_cal.DistanceCalculator" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
      <link rel="icon" href="./project_images/favicon2.ico" type="image/x-icon">
    <link rel="icon" href="./project_images/favicon2.png" type="image/png">
    <link rel="shortcut icon" href="./project_images/favicon2.ico" type="image/x-icon">
    <title>Smart Service</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            overflow-x: hidden;    
              background-color: #f0f0f0;
        }
        #top{
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            align-items: center;
            background-color: #f0f0f0;
            font-family: Arial, sans-serif;
            overflow-x: hidden; 
        }
        #top-image {
            width: 100%;
            height: 320px; /* Set your desired height */
            background-image: url('./project_images/Online world-pana.png'); /* Replace with your image path */
            background-size: cover;
            background-position: center;
            position: fixed; 
            top: 0;
            left: 0;
            z-index: 1000;
            transition: opacity 0.5s ease;
        }

        #first {
            margin-top: 270px;
            font-size: 36px;
            color: #000000;
            text-align: center; /* Center the heading */
            border-bottom: 2px solid #ccc; /* Line below heading */
            padding-bottom: 10px; /* Space between heading and line */
        }
           #second {
            margin-top: 20px;
            font-size: 40px;
            color: #000000;
            text-align: center; /* Center the heading */
            border-bottom: 2px solid #ccc; /* Line below heading */
            padding-bottom: 10px; /* Space between heading and line */
            line-height:1.5em;
        }
        p {
            font-size: 16px;
            color: #373333;
            text-align: center;
            margin-bottom: 30px;
        }

        .cards-wrapper {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 12px;
            width: 1500px; /* Set max width for layout */
            margin-top: 20px; /* Space above cards */
        }

        .card-container {
            width: 240px;
            height: 320px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            margin: 20px;
            transition: transform 0.3s ease, background-color 0.3s ease;
        }

        .card-container:hover {
            transform: scale(1.05);
        }

        .card-container:nth-child(1):hover .card-header,
        .card-container:nth-child(1):hover .card-footer { background-color: #ea808f; }
        .card-container:nth-child(2):hover .card-header,
        .card-container:nth-child(2):hover .card-footer { background-color: #ecec8f; }
        .card-container:nth-child(3):hover .card-header,
        .card-container:nth-child(3):hover .card-footer { background-color: #efb079; }
        .card-container:nth-child(4):hover .card-header,
        .card-container:nth-child(4):hover .card-footer { background-color: #6db66d; }
        .card-container:nth-child(5):hover .card-header,
        .card-container:nth-child(5):hover .card-footer { background-color: #7ea4dd; }

        .card-container .card-header,
        .card-container .card-footer {
            background-color: #556474;
        }

        .card-header {
            height: 80px;
            display: flex;
            justify-content: center;
            align-items: center;
            color: white;
            font-size: 20px;
            font-weight: bold;
        }

        .card-body {
            padding: 20px;
            text-align: center;
            background-color: #fff;
        }

        .card-body h2 {
            margin: 0;
            font-size: 24px;
            font-weight: bold;
            color: #333;
        }

        .card-body p {
            margin: 10px 0;
            font-size: 20px;
            color: #666;
        }

        .card-footer {
            padding: 20px;
            text-align: center;
            height:20px;
        }

        .btn-contact {
            background-color: #101112;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .btn-contact:hover {
            background-color: #ffffff;
            color: #333;
        }
         #newsletter {
            margin-top:100px;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 40px;
            background-color: #f0f0f0;
            max-width: 2000px;
            width: 95%;
            border-radius: 8px;
        }

        .newsletter {
            flex: 1.1;
            height: 500px;
            padding: 20px;
            border-radius: 8px;
            margin-left:80px;
           
        }

        .newsletter h3 {
            font-size: 38px;
            color: #000;
            margin-bottom: 15px;
            font-weight: bold;
        }

        .newsletter p {
            font-size: 22px;
            color: #444;
            margin-bottom: 30px;
            line-height: 1.5;
            text-align:left; 
        }

        .newsletter .highlight {
            color: #000;
            font-weight: bold;
        }

        .newsletter input[type="email"] {
            width: 70%;
            padding: 10px;
            font-size: 19px;
            height: 35px;
            color: #333;
            border: 1px solid #ccc;
            border-radius: 4px;
            margin-bottom: 40px;
        }

        .newsletter .btn-contact {
            width: 30%;
            background-color: #101112;
            color: #ffffff;
            padding: 10px 20px;
            border: none;
            margin-left: 150px;
            border-radius: 5px;
            font-size: 22px;
            cursor: pointer;
            height: 50px;
            transition: background-color 0.3s ease;
        }

        .newsletter .btn-contact:hover {
            background-color: #444;
            transform:scale(1.1,1.1);
        }

        .location-image {
            flex: 1;
            height: 600px;
            background-image: url('./project_images/Email campaign-cuate.png'); /* Replace with your image path */
            background-size: cover;
            background-position: center;
            border-radius: 8px;
            margin-left: 20px;
        }

         #sustainability {
            background-color: #f0f0f0;
            font-family: Arial, sans-serif;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 40px;
            height:650px;
            width: 95%;
            border-radius: 8px;
            
        }

        .sustainability-content {
            flex: 1;
            padding: 20px;
            text-align: left;
        }

        .sustainability-content h3 {
            font-size: 43px;
            color: #000;
            margin-bottom: 20px;
            font-weight: bold;
        }

        .sustainability-content p {
            font-size: 22px;
            color: #444;
            margin-top: 30px;
            line-height: 1.5;
            text-align:left;
        }

        .sustainability-content .btn-know-more {
            margin-top: 20px;
            margin-left:10px;
            background-color: #101112;
            color: #ffffff;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            font-size: 23px;
            cursor: pointer;
            height: 60px;
            width:30%;
            transition: background-color 0.3s ease;
        }

        .sustainability-content .btn-know-more:hover {
            background-color: #24c650;
        }

        .sustainability-image {
            flex: 0.9;
            height: 500px; 
            background-image: url('./project_images/Environment-pana.png'); /* Replace with your image path */
            background-size: cover;
            background-position: center;
            border-radius: 8px;
            margin-left: 20px;
        }
    
        footer {
            background-color: #f5f5f5;
            padding: 40px 0;
            border-top: 1px solid #eaeaea;
            font-family: 'Arial', sans-serif;
            color: #333;
            margin-top: 50px;
        }

        .footer-container {
            max-width: 1200px;
            margin: auto;
            text-align:left;
        }

        .footer-logo {
            display: flex;
            align-items: start;
            justify-content: start;
            margin-bottom: 20px; 
        }

        .footer-logo img {
            width: 100px;
            margin-right: 30px;
        }

        .footer-logo span {
            font-size: 35px;
            font-weight: 700;
            color: #000;
            margin-top: 5px;
        }

        .footer-links {
            display: flex;
            justify-content: start;
            flex-wrap: wrap; 
            margin-bottom: 30px; 
            border-bottom: 1px solid #eaeaea; 
            padding-bottom: 20px; 
        }

        .footer-column {
            flex: 1;
            margin: 10px 20px;
            min-width: 200px; 
        }

        .footer-column h4 {
            font-size: 16px;
            font-weight: 700;
            margin-bottom: 15px;
        }

        .footer-column ul {
            list-style: none;
            padding: 0;
        }

        .footer-column ul li {
            margin-bottom: 15px; 
        }

        .footer-column ul li a {
            text-decoration: none;
            color: #333;
            font-size: 14px;
            transition: color 0.3s;
        }

        .footer-column ul li a:hover {
            color: #000;
        }

        .social-icons {
            display: flex;
            justify-content:start;
            gap: 20px;
        }

        .social-icons a {
            font-size: 25px;
            color: #333;
            text-decoration: none;
            transition: color 0.3s;
        }

        .social-icons a:hover {
            color: #000;
        }

        .footer-bottom {
            text-align: center;
            font-size: 15px;
            color: #000;
            margin-top: 20px; 
        }

        .footer-bottom p {
            margin-bottom: 5px;
        }

        .footer-bottom small {
            color: #999;
        }
    </style>
    <script>
        let lastScrollTop = 0; 
        window.addEventListener('scroll', function() {
            const topImage = document.getElementById('top-image');
            let scrollTop = window.pageYOffset || document.documentElement.scrollTop;

            // Show or hide the image based on scroll direction
            if (scrollTop === 0) {
                
                topImage.style.opacity = '1'; // Hide image
            } else {
                // Scrolling up
                topImage.style.opacity = '0'; // Show image
            }
            lastScrollTop = scrollTop <= 0 ? 0 : scrollTop; // For Mobile or negative scrolling
        });
    </script>
</head>
<body>
<section id="top">
    <div id="top-image"></div> <!-- Image Div -->
    <h1 id="first">Smart Service</h1>
    <h1 id="second">Nearest Services to Your Location, your service will be done from our nearest Smart Service Center.</h1>

    <div class="cards-wrapper">
        <%
            String userLatParam = request.getParameter("lat");
            String userLonParam = request.getParameter("lon");

            double userLat = userLatParam != null ? Double.parseDouble(userLatParam) : 0.0;
            double userLon = userLonParam != null ? Double.parseDouble(userLonParam) : 0.0;

            List<Map<String, Object>> locations = new ArrayList<>();
            Connection conn = null;
            PreparedStatement ps = null;
            ResultSet rs = null;

            try {
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/smart_service?user=root&password=root");
                String sql = "SELECT * FROM map_details";
                ps = conn.prepareStatement(sql);
                rs = ps.executeQuery();

                while (rs.next()) {
                    Map<String, Object> location = new HashMap<>();
                    location.put("name", rs.getString(1));  // Location name
                    Double lat = rs.getDouble("latitude");  // Latitude
                    Double lon = rs.getDouble("longitude");  // Longitude
                    if (lat != null && lon != null) {
                        double distance = DistanceCalculator.calculateDistance(userLat, userLon, lat, lon);
                        location.put("distance", distance);  // Distance
                    } else {
                        location.put("distance", 0.0);  // Default distance if not available
                    }
                    locations.add(location);  // Add location to the list
                }
            } catch (SQLException e) {
                e.printStackTrace();
            } finally {
                if (rs != null) try { rs.close(); } catch (SQLException e) {}
                if (ps != null) try { ps.close(); } catch (SQLException e) {}
                if (conn != null) try { conn.close(); } catch (SQLException e) {}
            }

            // Sort locations by distance
            locations.sort((loc1, loc2) -> {
                return Double.compare((Double) loc1.get("distance"), (Double) loc2.get("distance"));
            });

            for (int i = 0; i < Math.min(5, locations.size()); i++) {
                Map<String, Object> location = locations.get(i);
        %>
        <div class="card-container">
            <!-- Top Section -->
            <div class="card-header">
            </div>

            <!-- Middle Section -->
            <div class="card-body">
                <h2><%= location.get("name") %></h2>
                <p>Distance: <%= String.format("%.2f", location.get("distance")) %> km</p>
            </div>

            <!-- Bottom Section -->
            <div class="card-footer">

            </div>
        </div>
        <%
            }
        %>
    </div>
    </section>
       <div id="newsletter">
        <div class="newsletter">
            <h3>Subscribe to our <span class="highlight">Newsletter</span></h3>
            <p>Stay updated with the latest news, offers, and promotions from <strong>Smart Service</strong>! Join our community today!</p>
             <form action="subscribe.jsp">
            <input type="email" placeholder="Enter your email address" name="email" required>
             <button class="btn-contact">Subscribe</button>
            </form>
        </div>
        <div class="location-image"></div>
    </div>
     <section id="sustainability">
        <div class="sustainability-image"></div>
        <div class="sustainability-content">
            <h3>Sustainability at Smart Service</h3>
            <p>We are committed to sustainable practices that benefit both our customers and the environment.</p>
            <form action="knowmore.html">
            <button class="btn-know-more">Know More</button>
            </form>
        </div>
    </section>
    <footer>
    <div class="footer-container">
        <div class="footer-logo">
            <img src="./project_images/logo.png" alt="Smart Service Logo">
            <span>Smart Service</span>
        </div>
        
        <div class="footer-links">
            <div class="footer-column">
                <h4>Company</h4>
                <ul>
                    <li><a href="aboutus.html">About us</a></li>
                    <li><a href="terms.html">Terms & conditions</a></li>
                    <li><a href="privacypolicy.html">Privacy policy</a></li>
                    <li><a href="impact.html">Smart Service impact</a></li>
                    <li><a href="careers.html">Careers</a></li>
                </ul>
            </div>
            <div class="footer-column">
                <h4>For customers</h4>
                <ul>
                    <li><a href="seereviews.jsp">Customer reviews</a></li>
                    <li><a href="home.jsp#available_services">Categories near you</a></li>
                    <li><a href="fandq.html">F & Q</a></li>
                    <li><a href="contactus.html">Contact us</a></li>
                </ul>
            </div>
            <div class="footer-column">
                <h4>For partners</h4>
                <ul>
                    <li><a href="#">Register as a professional</a></li>
                     <li><a href="p_privacypolicy.html">Privacy policy</a></li>
                </ul>
            </div>
            <div class="footer-column">
                <h4>Social Links</h4>
                <div class="social-icons">
                    <a href="https://x.com/Smart_ServiceX"><i class="fab fa-twitter"></i></a>
                    <a href="https://www.facebook.com/"><i class="fab fa-facebook"></i></a>
                    <a href="https://www.instagram.com/smartserviceig/"><i class="fab fa-instagram"></i></a>
                    <a href="https://www.linkedin.com/"><i class="fab fa-linkedin"></i></a>
                </div>
            </div>
        </div>
    </div>

    <div class="footer-bottom">
        <p>&copy; Copyright 2024 Smart Service. All rights reserved.</p>
    </div>
</footer>
</body>
</html>