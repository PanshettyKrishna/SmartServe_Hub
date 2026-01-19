<%@ page import="java.sql.*, java.util.*" %>
<%
    String username = (String) session.getAttribute("username");

    String jdbcURL = "jdbc:mysql://localhost:3306/smart_service";
    String dbUser = "root";
    String dbPassword = "root";

    List<Map<String, Object>> cartItems = new ArrayList<>();

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);
        
        String sql = "SELECT * FROM cart WHERE username = ?";
        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setString(1, username);
        ResultSet resultSet = statement.executeQuery();

        while (resultSet.next()) {
            Map<String, Object> item = new HashMap<>();
            item.put("service_id", resultSet.getString("serviceId"));
            item.put("service_title", resultSet.getString("serviceTitle"));
            item.put("service_details", resultSet.getString("expertise"));
            item.put("service_date", resultSet.getDate("datetime"));
            item.put("payment_option", resultSet.getString("payment"));
            cartItems.add(item);
        }

        connection.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Smart Service</title>
    <link rel="stylesheet" href="path/to/fontawesome/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" integrity="sha384-k6RqeWeci5ZR/Lv4MR0sA0FfDOM8x0o1MlaNlfLO4sHGLKU6Zo5HkFf4gJ5b3p0Z" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" integrity="sha384-uo5KYm1qF+FWjyXo10KOBfUmDkRv4wJ8BfFblB6cGt/n/aFlgiT4hU2al3RM9la4" crossorigin="anonymous">
      <link rel="icon" href="./project_images/favicon2.ico" type="image/x-icon">
    <link rel="icon" href="./project_images/favicon2.png" type="image/png">
    <link rel="shortcut icon" href="./project_images/favicon2.ico" type="image/x-icon">
    <style>
        body {
            background-color: #fff;
            color: #ffffff;
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }

        /* Navbar styling */
        nav {
            display: flex;
            justify-content: space-between;
            align-items: center;
            background-color: #1c2541;
            padding: 15px;
            height:60px;
        }

        nav .brand {
            font-size: 32px;
            color: #ffffff;
        }

        nav a {
            color: #ffffff;
            margin: 0 25px;
            text-decoration: none;
            font-size:25px;
            
        }

        .nav-links a {
    position: relative;
    padding: 5px 6px;
    display: inline-block;
    overflow: hidden;
    transition: color 0.3s ease;
}

.nav-links a::before { 
    content: '';
    position: absolute;
    width: 100%;
    height: 2px;
    background-color: #fff;
    bottom: 0;
    left: -100%;
    transition: 0.4s ease;
}

.nav-links a:hover::before {
    left: 0;
}
        
        .empty-cart {
            text-align: center;
            margin-top: 10px;
            color: #e84545;
        }
     .empty-cart img{
        width: 250px; 
        height: 250px;
        margin-top:-30px;
     }
        .empty-cart h2 {
            font-size: 28px;
            color: #e84545;
            font-weight: bold;
        }

        .empty-cart p {
            color: #000;
            font-size: 20px;
            margin-top: 10px;
        }
         
        .empty-cart button {
            background-color: #000;
            border: none;
            color: #ffffff;
            padding: 15px 30px;
            font-size: 18px;
            border-radius: 5px;
            cursor: pointer;
            margin-top: 20px;
            transition: background-color 0.3s;
              width:15%;
        }

        .empty-cart button:hover {
            background-color: #333333;
            transform: scale(1.1); 
        }

          #heading-1{
          font-size:40px;
          text-align:center;
          color:#1c2541;
          }
         .cart-container {
         display: grid;
         grid-template-columns: repeat(auto-fill, minmax(450px, 1fr));
           gap: 50px;
         padding: 20px;
         }

        .cart-card {
            background-color: #1c2541;
            border: 1px solid #e0e1dd;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            margin: 15px 0;
            padding: 20px;
            width: 450px;
            transition: transform 0.2s;
        }

        .cart-card:hover {
            transform: scale(1.05);
        }

        .cart-card h2 {
            font-size: 23px;
            margin: 0 0 10px;
            color: #ffffff;
        }

        .cart-card p {
            color: #ffffff;
            margin: 8px 0;
        }

        .details {
            display: flex;
            justify-content: space-between;
        }

        .details p {
            color: #;
        }

        button {
            background-color:#D1C4E9;
            border: none;
            border-radius: 5px;
            color: #000;
            cursor: pointer;
            font-size: 18px;
            margin-top:10px;
            padding: 10px;
            width: 40%;
            margin-right:10px;
            transition: background-color 0.3s;
        }

        button:hover {
            background-color: #ff6b6b;
        }
        button i {
    margin-right: 8px;
    color:#000;
    font-size:20px;
}

.modal {
    display: none;
    position: fixed; 
    z-index: 1; 
    left: 0;
    top: 0;
    width: 100%; 
    height: 100%; 
    overflow: auto; 
    background-color: rgba(0, 0, 0, 0.5); 
}

.modal-content {
    background-color: #fefefe;
    margin: 15% auto; 
    padding: 20px;
    border: 1px solid #888;
    width: 80%; 
    max-width: 500px; 
    border-radius: 8px; 
    text-align: center;
}
.modal-content h2,.modal-content p{
color:#000;
}
.close {
    color: #aaa;
    float: right;
    font-size: 28px;
    font-weight: bold;
}

.close:hover,
.close:focus {
    color: black;
    text-decoration: none;
    cursor: pointer;
}

.modal button {
    background-color: #1c2541;
    color: white;
    padding: 10px 15px;
    margin: 10px;
    border: none;
    width:20%;
    border-radius: 5px;
    cursor: pointer;
}

.modal button:hover {
    background-color: #333;
}

    </style>
</head>
<body>

<div id="confirmModal" class="modal">
    <div class="modal-content">
        <span class="close" onclick="closeModal()">&times;</span>
        <h2>Confirmation</h2>
        <p>Are you sure you want to remove this item from your cart?</p>
        <button id="confirmBtn" onclick="confirmRemoval()">Remove</button>
        <button onclick="closeModal()">Cancel</button>
    </div>
</div>

    <nav>
        <div class="brand">Smart Service</div>
        <div class="nav-links">
            <a href="home.jsp">Home</a>
            <a href="contactus.html">Contact Us</a>
            <a href="bookservice.html">Book Service</a>
        </div>
    </nav>

    <h1 id="heading-1">Your Cart Details !!!</h1>

   <% if (cartItems.isEmpty()) { %>
    <div class="empty-cart">
        <img src="./project_images/supermarket-shopping-cart.jpg" alt="Cart Icon">
        <h2>Your Cart is Empty!</h2>
        <p>Must add items to the cart before you proceed to check out.</p>
        <button onclick="window.location.href='bookservice.html'">Book Service</button>
    </div>
<% } else { %>
    <div class="cart-container">
        <% for (Map<String, Object> item : cartItems) { %>
            <div class="cart-card">
                <h2><%= item.get("service_title") %></h2>
                <p><%= item.get("service_details") %></p>
                <div class="details">
                    <p>Date & Time: <%= item.get("service_date") %></p>
                </div>
                <p>Payment Option: <%= item.get("payment_option") %></p>
                <p>Service ID: <%= item.get("service_id") %></p>
                <button type="button" onclick="removeFromCart('<%= item.get("service_id") %>')">
                    <i class="fas fa-trash-alt"></i> Remove
                </button>
                <button type="button" onclick="bookService('<%= item.get("service_id") %>')">
                    <i class="fas fa-book"></i> Book Service
                </button>
            </div>
        <% } %>
    </div>
<% } %>
   

    <script>
    let currentCartId;

    function removeFromCart(cartId) {
        currentCartId = cartId;
        document.getElementById("confirmModal").style.display = "flex";
    }

    function closeModal() {
        document.getElementById("confirmModal").style.display = "none";
    }

    function confirmRemoval() {
        window.location.href = "removefromcart.jsp?cart_id=" + currentCartId;
    }
    window.onclick = function(event) {
        const modal = document.getElementById("confirmModal");
        if (event.target == modal) {
            closeModal();
        }
    }
        function bookService(cartId) {
            window.location.href = "bookservice.jsp?cart_id=" + cartId;
        }
    </script>
</body>
</html>
