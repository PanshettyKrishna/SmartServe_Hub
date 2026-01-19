<%@ page import="java.sql.*, java.util.*" %>
<%
    String service_Id=(String)(session.getAttribute("serviceId"));
     String username= (String)(session.getAttribute("username"));
   String jdbcURL = "jdbc:mysql://localhost:3306/smart_service";
    String dbUser = "root"; 
    String dbPassword = "root"; 

    List<Map<String, Object>> bookedServices = new ArrayList<>();

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);
        String sql1 = "SELECT username FROM bookservice WHERE serviceId=?";
        PreparedStatement statement1 = connection.prepareStatement(sql1);
        statement1.setString(1,service_Id);
        ResultSet resultSet1 = statement1.executeQuery();
        
        if(resultSet1.next())
        {
        	username=resultSet1.getString("username");
        }
        
        String sql = "SELECT * FROM bookservice WHERE username=?";
        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setString(1,username);
        ResultSet resultSet = statement.executeQuery();

        while (resultSet.next()) {
            Map<String, Object> service = new HashMap<>();
            service.put("service_id", resultSet.getString("serviceId"));
            service.put("service_title", resultSet.getString("serviceTitle"));
            service.put("service_details", resultSet.getString("serviceDetail"));
            service.put("service_date", resultSet.getDate("datetime"));
            bookedServices.add(service);
        }

        connection.close();
    } catch (Exception e) {
        e.printStackTrace();
    }

    String cancelServiceId = request.getParameter("cancelServiceId");
    if (cancelServiceId != null) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);
            String deleteSql = "DELETE FROM bookservice WHERE serviceId = ?";
            PreparedStatement deleteStatement = connection.prepareStatement(deleteSql);
            deleteStatement.setString(1, cancelServiceId);
            deleteStatement.executeUpdate();
            connection.close();
            response.sendRedirect("bookedservices.jsp"); // Redirect to refresh the page
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Smart Service</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
      <link rel="icon" href="./project_images/favicon2.ico" type="image/x-icon">
    <link rel="icon" href="./project_images/favicon2.png" type="image/png">
    <link rel="shortcut icon" href="./project_images/favicon2.ico" type="image/x-icon">
    <style>
        body {
            background-color: #f0f0f0;
            color: #333;
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }

        nav {
            display: flex;
            justify-content: space-between;
            align-items: center;
            background-color: #332d2d;
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
            font-size:28px;
            
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

       

        h1 {
            text-align: center;
            color: #1c1c1c;
            margin-top: 30px;
            font-size: 40px;
        }

        .empty-message {
    text-align: center;
    margin-top: 20px;
    font-size: 26px;
    color: #000; /* Text color changed to white for contrast */
    padding: 20px;
    border-radius: 8px;
    position: relative;
}

.empty-message img {
    margin-top:-50px;
    width: 350px;
    height: 350px;
    margin-bottom: 10px;
}

        .service-container {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
            gap: 20px;
            padding: 20px;
        }

        .service-card {
            background-color: #ffffff;
            border: 1px solid #ccc;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            padding: 20px;
            transition: transform 0.2s;
        }

        .service-card:hover {
            transform: scale(1.02);
        }

        .service-card h2 {
            font-size: 22px;
            margin: 0 0 10px;
            color: #333;
        }

        .service-card p {
            color: #666;
            margin: 8px 0;
        }

        .cancel-button {
            background-color: #000;
            color: #fff;
            border: none;
            padding: 10px 15px;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            margin-top:10px;
            transition: background-color 0.3s;
        }

        .cancel-button:hover {
            background-color: #d63636;
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

    <nav>
        <div class="brand">Smart Service</div>
        <div class="nav-links">
            <a href="home.jsp">Home</a>
            <a href="contactus.html">Contact Us</a>
            <a href="bookservice.html">Book Service</a>
        </div>
    </nav>

    <h1>Your Booked Services</h1>

    <% if (bookedServices.isEmpty()) { %>
        <div class="empty-message">
            <img src="./project_images/Questions-pana.png" alt="No Services" />
            <p>You have no booked services at the moment.</p>
            <p>Explore our services and book one today!</p>
        </div>
    <% } else { %>
        <div class="service-container">
            <% for (Map<String, Object> service : bookedServices) { %>
                <div class="service-card">
                    <h2><%= service.get("service_title") %></h2>
                    <p><strong>Details:</strong> <%= service.get("service_details") %></p>
                    <p><strong>Date:</strong> <%= service.get("service_date") %></p>
                    <p><strong>Service ID:</strong> <%= service.get("service_id") %></p>
                    <button class="cancel-button" onclick="openModal('<%= service.get("service_id") %>')">Cancel Service</button>
                </div>
            <% } %>
        </div>
    <% } %>

    <div id="confirmModal" class="modal">
        <div class="modal-content">
            <span class="close" onclick="closeModal()">&times;</span>
            <h2>Confirmation</h2>
            <p>Are you sure you want to remove this service?</p>
            <button id="confirmBtn" onclick="confirmRemoval()">Remove</button>
            <button onclick="closeModal()">Cancel</button>
        </div>
    </div>

    <script>
        let serviceIdToRemove = null;

        function closeModal() {
            document.getElementById("confirmModal").style.display = "none";
            serviceIdToRemove = null; // Reset the service ID
        }

        function confirmRemoval() {
            if (serviceIdToRemove) {
                const form = document.createElement("form");
                form.method = "post";
                form.action = "bookedservices.jsp"; // Adjust to your JSP page
                
                const input = document.createElement("input");
                input.type = "hidden";
                input.name = "cancelServiceId";
                input.value = serviceIdToRemove;
                
                form.appendChild(input);
                document.body.appendChild(form);
                form.submit();
            }
        }

        function openModal(serviceId) {
            serviceIdToRemove = serviceId;
            document.getElementById("confirmModal").style.display = "block";
        }

        window.onclick = function(event) {
            const modal = document.getElementById("confirmModal");
            if (event.target === modal) {
                closeModal();
            }
        }

        window.onkeydown = function(event) {
            if (event.key === "Escape") {
                closeModal();
            }
        }
    </script>

</body>
</html>
