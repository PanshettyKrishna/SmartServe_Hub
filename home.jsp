<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ page import="java.sql.*,javax.servlet.*,javax.servlet.http.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Baloo+2:wght@400;600;700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Acme&family=Dancing+Script:wght@400..700&family=Francois+One&family=Protest+Strike&family=Staatliches&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;600;700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans:wght@400;500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
      <link rel="icon" href="./project_images/favicon2.ico" type="image/x-icon">
    <link rel="icon" href="./project_images/favicon2.png" type="image/png">
    <link rel="shortcut icon" href="./project_images/favicon2.ico" type="image/x-icon">
    <title>Smart Service</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            background-color: #ffffff;
            color: #333333;
            overflow-x: hidden;
        }
       ul{
            margin: 0px;
            padding: 0;
            box-sizing: border-box;
       }
       header{
        height:700px;
       }
        nav {
            margin-top: 40px;
            width: 100%;
            padding: 10px 20px;
            display: flex;
            align-items: center;
            justify-content: flex-start;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.2); 
            transition: background-color 0.3s ease;
        }

        .smart-service {
            font-size: 40px;
            font-family: "Protest Strike", sans-serif;
            color: #333333; 
            margin-right: 200px;
            margin-left: 50px;
        }

        nav ul {
            display: flex;
            list-style: none;
            padding: 10px;
            margin: 0;
            border-radius: 20px;
        }

        nav ul li {
            margin: 0 10px;
        }

nav ul li a {
    text-decoration: none;
    color: #2874a6;
    font-size: 25px;
    padding: 8px;
    border-radius: 5px;
    transition: color 0.3s ease, border-bottom 0.3s ease;
    font-family: "Arial", sans-serif;
    font-weight: 400;
    margin-left: 15px;
    position: relative;
}

nav ul li a::after {
    content: "";
    position: absolute;
    left: 0;
    bottom: -3px;
    width: 0;
    height: 2px;
    background-color: #AEC6CF;
    transition: width 0.3s ease;
}

nav ul li a:hover {
    color: #ff226f;
}

nav ul li a:hover::after {
    width: 100%;
}

 .container {
            display: flex;
            height: calc(100vh - 80px);
        }

        .left-content {
            flex: 1;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            padding: 20px;
        }

        .left-content h2 {
            font-family: 'IBM Plex Sans', sans-serif;
            font-size: 55px;
            font-weight: bold;
            text-align: center;
            color: #333333;
            margin-left:100px;
        }

        .left-content button {
            padding: 10px 20px;
            font-size: 18px;
            width: 120px;
            background-color: #000000;
            color: #ffffff;
            border: none;
            border-radius: 20px;
            cursor: pointer;
            margin-top: 20px;
            transition: background-color 0.3s ease, transform 0.3s ease;
        }

        .left-content button:hover {
            background-color: #3434f2;
            transform: scale(1.2, 1.2);
        }

        .right-image {
            flex: 0.9;
            background: url('./project_images/Maintenance-pana.png') no-repeat center center/cover;
            margin-top: 30px;
        }

        .main {
            text-align: center;
            padding: 20px;
        }

        #available_services{
            width: 100%;
            height:600px;
        }

        h2 {
            font-size: 40px;
            color: #333;
        }

        .services-container {
            display: flex;
            justify-content: center;
            align-items: flex-start; 
            flex-wrap: wrap; 
            margin-left:10px;
        }

        .service-card {
            background: #ffffff;
            border-radius: 10px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            margin: 10px;
            text-align: center;
            width: 250px; 
            padding: 10px;
            height: 360px;
            margin-left: 10px;
        }
        .service-card:hover {
          transform: scale(1.05);
           box-shadow: 0 5px 15px rgba(0, 0, 0, 0.3);
           transition: transform 0.3s ease, box-shadow 0.3s ease;
      }
        .service-card img {
            width: 100%; 
            border-radius: 5px;
            height: 230px;
            margin-top: 10px;
        }
        .service-card:hover img {
    transform: scale(1.1);
}
        .service-name {
            font-size: 30px;
            margin-top: 30px;
            color: #000; 
            text-decoration: none; 
        }

        .service-card a {
             text-decoration: none;
             color: #080f78; 
        }

        .book-service-btn {
            margin-top: 50px; 
            background-color: #333;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 20px;
            height: 70px;
            border-radius: 20px;
            transition: background-color 0.3s ease;
        }

        .book-service-btn:hover {
            background-color: #020547; 
            transform: scale(1.1,1.1);
        }
        #service-details {
        display: flex;
        align-items: start;
        margin-top: 100px;
        justify-content: space-between;
        padding: 50px;
        background-color: #f0f0f0;
        color: #333; 
        font-family: 'Open Sans', sans-serif;
        border-radius: 10px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        margin-left: 10px;
        margin-right: 10px;
    }

    .details-content {
        flex: 1;
        padding-right: 20px;
    }

    .details-content h2 {
        font-size: 36px;
        font-family: 'Open Sans', sans-serif;
        color: #000; 
        border-bottom: 2px solid #555; 
        padding-bottom: 10px;
        margin-bottom: 20px;
    }

    .details-content ol {
        list-style: none;
        padding-left: 0;
        text-align: left;
    }

    .details-content ol li {
        background: #fff; 
        padding: 15px;
        margin-bottom: 10px;
        border-radius: 10px;
        font-size: 18px;
        color: #555; 
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    }

    .details-content ol li::before {
        content: "✔"; 
        color: #03243a; 
        font-weight: bold;
        margin-right: 20px;
    }

    .details-image {
        flex: 0.7;
        background: url('./project_images/cleaning\ service-amico.png') no-repeat center center/cover;
        height: 600px;
        border-radius: 10px;
        margin-left: 20px;
    }
    #how_it_works_section {
             margin-top:100px;
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
            color: #333;
            padding: 20px;
            width: 100%;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 20px;
            box-sizing: border-box;
        }

        #how_it_works_image {
            width: 50%;
            margin-right: 20px;
        }

        #how_it_works_image img {
            width: 100%;
            height: auto;
            border-radius: 10px;
        }

        #how_it_works_content {
            width: 50%;
            background-color: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
        }

        h1 {
            text-align: center;
            color: #e91e63;
            margin-bottom: 20px;
        }

        .steps {
            display: flex;
            flex-direction: column;
            gap: 10px;
        }

        .step-box {
            background-color: #f2f2f2;
            border-radius: 10px;
            padding: 5px;
            text-align: center;
            box-shadow: 0 2px 10px rgba(173, 216, 230, 0.5);
            transition: box-shadow 0.3s ease;
            height: 100px;
            font-size: 0.9rem;
        }

        .step-box:hover {
            box-shadow: 0 4px 20px rgba(173, 216, 230, 0.7);
        }

        .step-box h3 {
            margin: 0;
            padding-top: 10px;
            color: white;
            border-radius: 5px;
            font-size: 20px;
            height: 30px;
        }

        .step-box p {
            font-size: 17px;
            padding-top: 5px;
        }

        .steps .step-box:nth-child(1) h3 {
            background-color: #e91e63;
        }

        .steps .step-box:nth-child(3) h3 {
            background-color: #ff9800;
        }

        .steps .step-box:nth-child(5) h3 {
            background-color: #00bcd4;
        }

        .steps .arrow:nth-child(2) {
            color: #e91e63;
        }

        .steps .arrow:nth-child(4) {
            color: #ff9800;
        }

        .arrow {
            text-align: center;
            margin: 10px 0;
            font-size: 2rem;
            font-weight: bold;
        }
        #reviews {
            padding: 50px 20px;
            margin-left: 50px;
            margin-top: 200px;
        }

        .reviews-container {
            display: flex;
            align-items: center;
            justify-content: space-between;
        }

        .review-form {
            flex: 0.4;
            padding-right: 20px;
        }

        .reviews-heading {
            font-family: 'Montserrat', sans-serif;
            font-size: 36px;
            color: #333;
            text-align: left;
            margin-bottom: 20px;
            border-bottom: 1px solid #555;
            padding-bottom: 10px;
        }
.review-input {
    width: 600px; 
    padding: 12px; 
    border: 1px solid #ddd; 
    border-radius: 5px; 
    margin-bottom: 15px; 
    font-size: 16px; 
    transition: border-color 0.3s; 
}

.review-input:focus {
    border-color:2px solid #000; 
}
 .rating {
        font-size: 30px;
        display: flex;
        gap: 6px;
        cursor: pointer;
    }

    .rating-heading {
            font-size: 20px;
            margin-top: 10px;
            text-align:start;
            color: #000000;
            margin-bottom: 5px;
        }
    .rating span {
        color: #ddd;
        transition: color 0.3s;
    }

    .rating span.active {
        color: #f5a623;
    }
        .review-textarea {
            width: 600px;
            height: 250px;
            padding: 15px;
            margin-top:20px;
            border-radius: 10px;
            border: 1px solid #ccc;
            background-color: #fff;
            font-family: 'IBM Plex Sans', sans-serif;
            font-size: 20px;
            color: #333;
            margin-bottom: 10px;
            resize: none;
            box-shadow: 2px 2px 8px rgba(0, 0, 0, 0.1);
        }

        .reviews-buttons {
            display: flex;
            gap: 30px;
            margin-left: 140px;
            margin-top: 20px;
        }

        .review-btn {
            padding: 10px 20px;
            background-color: #333;
            color: #fff;
            border: none;
            border-radius: 10px;
            cursor: pointer;
            font-size: 16px;
            transition: all 0.3s ease;
            box-shadow: inset 0 0 0 0 #555;
        }
        .review-btn:hover {
            transform: scale(1.2,1.2);
    box-shadow: inset 0 0 25px 10px #000000;
}
        .review-image {
            flex: 0.6;
            background: url('./project_images/Online world-cuate.png') no-repeat center center/cover;
            height: 500px;
            opacity: 0.9;
            transition: opacity 0.3s ease, background-color 0.3s ease;
        }
        #locations {
            background-color: #222;
            color: #fff;
            font-family: 'Arial', sans-serif;
            padding: 40px;
            width: 100%; 
            display: flex;
            flex-direction: column;
            align-items: center;
            margin-top:100px;
        }

        #locations h2 {
            font-size: 28px;
            margin-bottom: 10px;
            border-bottom: 2px solid #444;
            padding-bottom: 10px;
            text-align: left;
            letter-spacing: 2px;
            width: 100%;
            color: #fff; 
        }

        .region {
            margin-bottom: 5px;
            width: 100%;
        }

        .region h3 {
            font-size: 20px;
            margin-bottom: 10px;
            color: #fff;
            text-transform: uppercase;
            border-bottom: 1px solid #333;
            padding-bottom: 5px;
            letter-spacing: 1.5px;
            text-align: start;
        }

        .cities {
            display: flex;
            flex-wrap: wrap;
            gap: 10px;
        }

        .city {
            font-size: 16px;
            margin-bottom: 5px;
            padding: 5px 10px;
            border-radius: 4px;
            transition: background-color 0.3s, color 0.3s;
            cursor: pointer;
            color: #a5a0a0;
        }

        .city:hover {
            transform: scale(1.2,1.2);
            color: #fff;
        }

        .modal {
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

        .modal-content {
            background-color: #fff;
            padding: 30px;
            border-radius: 10px;
            width: 350px;
            text-align: center;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }

        .modal-content img {
            width: 250px;
            margin-bottom: 20px;
        }

        .modal-content h2 {
            font-weight: bold;
            margin: 0;
            color: #333;
        }

        .modal-content p {
            color: #000;
            font-size: 25px;
            margin: 10px 0;
        }

        .modal-content button {
            background-color: #000000;
            color: white;
            padding: 10px 20px;
            border: none;
            margin-top: 10px;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .modal-content button:hover {
            background-color: gold;
        }
        footer {
            background-color: #f5f5f5;
            padding: 40px 0;
            border-top: 1px solid #eaeaea;
            font-family: 'Arial', sans-serif;
            color: #333;
            margin-top: 100px;
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
            font-size: 18px;
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
            font-size: 16px;
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
</head>
<body>
    <div id="customAlert" class="modal">
        <div class="modal-content">
        <img src="./project_images/5star.png" alt="Success Icon">
            <p id="alertMessage"></p>
            <button onclick="closeModal()">Ok</button>
        </div>
    </div>
    <header>
    <nav>
        <div class="smart-service">Smart Service</div>
        <ul>
            <li><a href="#available_services">Available Services</a></li>
            <li><a href="#service-details">Service Details</a></li>
            <li><a href="#how_it_works_section">How it Works?</a></li>
            <li><a href="#reviews">Reviews</a></li>
            <li><a href="aboutus.html">About Us</a></li>
        </ul>
    </nav>
    
    <div class="container">
        <section class="left-content">
            <h2 id="typewriter"></h2>
             <form  action="displayloc.jsp" method="post" id="locationForm">
            <input type="hidden" id="lat" name="lat">
            <input type="hidden" id="lon" name="lon">
            <button type="button" id="find-button">Find</button>
            </form>
        </section>
        <section class="right-image"></section>
    </div>
</header>
    <main class="main">
        <section id="available_services">
        <h2>Our Top Services</h2> 
        <div class="services-container">
            <div class="service-card">
                <a href="electric.html?username=<%= session.getAttribute("username") %>">
                    <img src="./project_images/138219283_10150844.jpg" alt="Electrician">
                    <div class="service-name">Electrician</div>
                </a>
            </div>
            <div class="service-card">
                <a href="carpenter.html?username=<%= session.getAttribute("username") %>">
                    <img src="./project_images/63325931_9551333.jpg" alt="Carpentry">
                    <div class="service-name">Carpentry</div>
                </a>
            </div>
            <div class="service-card">
                <a href="plumber.html?username=<%= session.getAttribute("username") %>">
                    <img src="./project_images/image.png" alt="Plumber">
                    <div class="service-name">Plumber</div>
                </a>
            </div>
            <div class="service-card">
                <a href="cleaning.html?username=<%= session.getAttribute("username") %>">
                    <img src="./project_images/4887679_52059.jpg" alt="House Cleaning">
                    <div class="service-name">Cleaning & Pest Control</div>
                </a>
            </div>
            <div class="service-card">
                <a href="painting.html?username=<%= session.getAttribute("username") %>">
                    <img src="./project_images/hand-drawn-painter-cartoon-illustration_23-2151066658.avif" alt="Painter">
                    <div class="service-name">Painting</div>
                </a>
            </div>
        </div>
        <form action="bookservice.html" method="post">
         <input type="hidden" name="username" value="<%= session.getAttribute("username") %>">
        <button class="book-service-btn">Book Service</button>
        </form>
    </section>
    <section id="service-details">
        <div class="details-content">
            <h2>Service Details</h2>
            <ol>
                <li>Use of top quality chemicals</li>
                <li>Professional equipment used</li>
                <li>Experienced and background verified partners</li>
                <li>Lowest priced quotes</li>
                <li>Guaranteed satisfaction</li>
                <li>Timely and efficient service</li>
                <li>Environment-friendly practices</li>
                <li>Thorough quality checks after service</li>
            </ol>
        </div>
        <div class="details-image"></div>
    </section>
    <section id="how_it_works_section">
        <div id="how_it_works_image">
            <img src="./project_images/Take Away-pana.png" alt="How It Works Image">
        </div>
        <div id="how_it_works_content">
            <h1>How it Works?</h1>
            <div class="steps">
                <div class="step-box">
                    <h3>Select The Service You Need</h3>
                    <p> Get lowest priced quotes for your Cleaning service</p>
                </div>
                <div class="arrow">↓</div>
                <div class="step-box">
                    <h3>Book your Service</h3>
                    <p> Select date and timeslot and complete service booking </p>
                </div>
                <div class="arrow">↓</div>
                <div class="step-box">
                    <h3>Get Hassle-Free Service Delivery</h3>
                    <p>Smart service Partner arrives at your doorstep to clean your house</p>
                </div>
            </div>
        </div>
    </section>
    <section id="reviews">
        <div class="reviews-container">
            <div class="review-form">
                <h2 class="reviews-heading">Let Us Know What You Think</h2>
                <form action="addreview.jsp" method="post">
                 <input type="text" class="review-input" id="reviewerName" name="reviewerName"
                    placeholder="Your Name"  value="UserName : <%= (session.getAttribute("username") != null) ? session.getAttribute("username") : "" %>"
                    required
                />
                 <h3 class="rating-heading">Rate Your Experience</h3>
                  <div class="rating">
                    <span onclick="setRating(1)">★</span>
                    <span onclick="setRating(2)">★</span>
                    <span onclick="setRating(3)">★</span>
                    <span onclick="setRating(4)">★</span>
                    <span onclick="setRating(5)">★</span>
                </div>
                 <input type="hidden" id="reviewRating" name="reviewRating" value="0" />
                <textarea class="review-textarea" id="reviewText"
                name="reviewText" placeholder="Write your review here..."></textarea>
                <div class="reviews-buttons">
                    <button type="button" class="review-btn" onclick="addReview(event)">Add Review</button>
                </form>
                <form action="seereviews.jsp" method="post">
                    <button class="review-btn">See Reviews</button>
                </form>
                </div>
            </div>
            <div class="review-image"></div>
        </div>
    </section>
    <section id="locations">
    <h2>Serving in</h2>
        
    <div class="region">
        <h3>India</h3>
        <div class="cities">
            <span class="city">Agra</span>
            <span class="city">Ahmedabad</span>
            <span class="city">Bangalore</span>
            <span class="city">Bhopal</span>
            <span class="city">Chennai</span>
            <span class="city">Coimbatore</span>
            <span class="city">Dehradun</span>
            <span class="city">Delhi NCR</span>
            <span class="city">Guwahati</span>
            <span class="city">Hyderabad</span>
            <span class="city">Indore</span>
            <span class="city">Jaipur</span>
            <span class="city">Kanpur</span>
            <span class="city">Kochi</span>
            <span class="city">Kolkata</span>
            <span class="city">Lucknow</span>
            <span class="city">Mumbai</span>
            <span class="city">Nagpur</span>
            <span class="city">Patna</span>
            <span class="city">Pune</span>
            <span class="city">Surat</span>
            <span class="city">Thiruvananthapuram</span>
            <span class="city">Varanasi</span>
            <span class="city">Vijayawada</span>
            <span class="city">Visakhapatnam</span>
        </div>
    </div>

    <div class="region">
        <h3>UAE</h3>
        <div class="cities">
            <span class="city">Abu Dhabi</span>
            <span class="city">Dubai</span>
            <span class="city">Sharjah</span>
        </div>
    </div>

    <div class="region">
        <h3>Singapore</h3>
        <div class="cities">
            <span class="city">Singapore</span>
        </div>
    </div>

    <div class="region">
        <h3>KSA</h3>
        <div class="cities">
            <span class="city">Jeddah</span>
            <span class="city">Riyadh</span>
            <span class="city">Al Madinah</span>
        </div>
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
                    <li><a href="#available_services">Categories near you</a></li>
                    <li><a href="fandq.html">F & Q</a></li>
                    <li><a href="contactus.html">Contact us</a></li>
                </ul>
            </div>
            <div class="footer-column">
                <h4>For partners</h4>
                <ul>
                    <li><a href="registerprof.html">Register as a professional</a></li>
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
    </main>

    <script>
        document.addEventListener("DOMContentLoaded", function() {
            const text = "Find the Service Nearest to Your Location";
            const typewriterElement = document.getElementById("typewriter");
            let index = 0;

            function typeWriter() {
                if (index < text.length) {
                    typewriterElement.innerHTML += text.charAt(index);
                    index++;
                    setTimeout(typeWriter, 100);
                } else {
                    setTimeout(() => {
                        typewriterElement.innerHTML = "";
                        index = 0;
                        typeWriter();
                    }, 2000);
                }
            }

            typeWriter();
        });

        function addReview() {
            event.preventDefault();
        var reviewText = document.getElementById('reviewText').value.trim();
        var reviewRating = document.getElementById('reviewRating').value;
        
        if (reviewText === "") {
            showAlert('Please Write a review');
            return;
        }
        
        if (reviewRating === "0") {
            showAlert('Please provide a rating');
            return;
        }
        else{
            document.forms[2].submit();
        }
    }
        function showAlert(message) {
            document.getElementById('alertMessage').innerText = message;
            document.getElementById('customAlert').style.display = 'flex';
        }

        function closeModal() {
            document.getElementById('customAlert').style.display = 'none';
        }
        function setRating(rating) {
            const stars = document.querySelectorAll('.rating span');
            document.getElementById('reviewRating').value = rating;
            
            stars.forEach((star, index) => {
                if (index < rating) {
                    star.classList.add('active');
                } else {
                    star.classList.remove('active');
                }
            });
        }
        document.getElementById('find-button').addEventListener('click', function() {
  
            if (navigator.geolocation) {
                navigator.geolocation.getCurrentPosition(function(position) {
                    let lat = position.coords.latitude;
                    let lon = position.coords.longitude;

                    document.getElementById('lat').value = lat;
                    document.getElementById('lon').value = lon;
                    
                    document.getElementById('locationForm').submit();
                    

                }, function(error) {
                    console.error("Error obtaining location: ", error);
                    alert("Unable to retrieve your location. Please check your browser settings.");
                });
            } else {
                alert("Geolocation is not supported by this browser.");
            }
        });
        <%
        String latitude = request.getParameter("lat");
        String longitude = request.getParameter("lon");
        String username=(String)(session.getAttribute("username"));
        session.setAttribute("username", username);
    %>
    </script>
</body>
</html>
     