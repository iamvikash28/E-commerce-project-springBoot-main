<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en" xmlns:th="http://www.thymeleaf.org"
      xmlns:sec="http://www.thymeleaf.org/thymeleaf-extras-springsecurity3">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Deals - Home</title>

    <!-- Bootstrap & Font Awesome -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css">

    <!-- Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Signika:wght@400;600&display=swap" rel="stylesheet">

    <!-- Animate on Scroll -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.css"/>

    <style>
        body {
            font-family: 'Signika', sans-serif;
            background-color: #f8f9fa;
        }

        /* Navbar Styles */
        .navbar {
            background-color: #000;
            padding: 15px 0;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.2);
            transition: all 0.4s ease;
        }

        .navbar-brand {
            font-weight: 600;
            font-size: 24px;
            color: #17c0eb !important;
        }

        .nav-link {
            color: #fff !important;
            transition: color 0.3s ease;
        }

        .nav-link:hover {
            color: #17c0eb !important;
        }

        .welcome-msg {
            margin-left: 20px;
            color: #fff;
        }

        /* Carousel */
        .carousel-item img {
            max-height: 450px;
            width: 100%;
            object-fit: cover;
        }

        .carousel-caption {
            background: rgba(0, 0, 0, 0.5);
            padding: 15px;
            border-radius: 8px;
        }

        /* Category Cards Styles */
        .card {
            border: none;
            box-shadow: 0 8px 24px rgba(0, 0, 0, 0.12);
            margin-bottom: 30px;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .card:hover {
            transform: translateY(-10px) scale(1.02);
            box-shadow: 0 12px 32px rgba(0, 0, 0, 0.2);
        }

        .card img {
            height: 200px;
            object-fit: cover;
            border-top-left-radius: 0.5rem;
            border-top-right-radius: 0.5rem;
        }

        .card-title {
            font-size: 20px;
            font-weight: 600;
        }

        /* Category Button Theme */
        .btn-food {
            background-color: #e0794f;
            color: white;
            border-radius: 30px;
            padding: 10px 20px;
            font-weight: 600;
            transition: background-color 0.3s ease, transform 0.2s ease, box-shadow 0.2s ease;
        }

        .btn-food:hover {
            background-color: #d35400;
            transform: scale(1.1);
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.2);
        }

        /* Footer Styles */
        .footer {
            background-color: #292929;
            color: white;
            padding: 20px 0;
            text-align: center;
            margin-top: 50px;
        }
    </style>
</head>
<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg">
    <div class="container">
        <span class="welcome-msg">Welcome ${username}</span>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navBarMain">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navBarMain">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <a class="nav-link" href="profileDisplay">Profile</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" sec:authorize="isAuthenticated()" href="logout">Logout</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<!-- Category Carousel -->
<div id="categoryCarousel" class="carousel slide" data-ride="carousel" data-interval="3000" data-pause="hover">
    <div class="carousel-inner">
        <%
            try {
                String url = "jdbc:mysql://localhost:3306/springproject";
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection(url, "root", "");
                Statement stmt = con.createStatement();
                ResultSet rs = stmt.executeQuery("SELECT * FROM categories");

                boolean first = true;
                while (rs.next()) {
                    String categoryImage = rs.getString("image");
                    if (categoryImage == null || categoryImage.trim().isEmpty()) {
                        categoryImage = "no-image.png";
                    }
        %>
        <div class="carousel-item <%= first ? "active" : "" %>">
            <img src="images/<%= categoryImage %>" class="d-block w-100" alt="<%= rs.getString("name") %>">
            <div class="carousel-caption d-none d-md-block">
                <h5><%= rs.getString("name") %></h5>
                <p>Explore our <%= rs.getString("name") %> collection</p>
                <a href="/user/products?category=<%= rs.getInt("categoryid") %>" class="btn btn-food">Shop Now</a>
            </div>
        </div>
        <%
                    first = false;
                }
                con.close();
            } catch (Exception ex) {
        %>
        <div class="carousel-item active">
            <img src="images/no-image.png" class="d-block w-100" alt="Error loading categories">
            <div class="carousel-caption d-none d-md-block">
                <h5>Error</h5>
                <p><%= ex.getMessage() %></p>
            </div>
        </div>
        <%
            }
        %>
    </div>
    <a class="carousel-control-prev" href="#categoryCarousel" role="button" data-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
    </a>
    <a class="carousel-control-next" href="#categoryCarousel" role="button" data-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
    </a>
</div>

<!-- Categories Section -->
<div class="container mt-5">
    <h2 class="mb-4 text-center" style="font-weight:600;">Shop by Category</h2>
    <div class="row justify-content-center">
        <%
            try {
                String url = "jdbc:mysql://localhost:3306/springproject";
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection(url, "root", "");
                Statement stmt = con.createStatement();
                ResultSet rs = stmt.executeQuery("SELECT * FROM categories");

                while (rs.next()) {
                    String categoryImage = rs.getString("image");
                    if (categoryImage == null || categoryImage.trim().isEmpty()) {
                        categoryImage = "no-image.png";
                    }
        %>
        <div class="col-md-3 mb-4" data-aos="zoom-in">
            <div class="card h-100">
                <img src="images/<%= categoryImage %>" class="card-img-top" alt="<%= rs.getString("name") %>">
                <div class="card-body text-center">
                    <h5 class="card-title"><%= rs.getString("name") %></h5>
                    <p class="card-text">Explore our <%= rs.getString("name") %> collection</p>
                    <a href="/user/products?category=<%= rs.getInt("categoryid") %>" class="btn btn-food">View All</a>
                </div>
            </div>
        </div>
        <%
                }
                con.close();
            } catch (Exception ex) {
        %>
        <div class="col-12 text-danger">
            Exception Occurred: <%= ex.getMessage() %>
        </div>
        <%
            }
        %>
    </div>
</div>

<!-- Footer -->
<footer class="footer">
    <div class="container">
        <p>&copy; <%= java.time.Year.now() %> Deals. All rights reserved.</p>
    </div>
</footer>

<!-- JS Scripts -->
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.js"></script>
<script>
    AOS.init();
</script>
</body>
</html>
