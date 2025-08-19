<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>Products</title>

  <!-- Bootstrap 5.3 & Font Awesome -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />

  <style>
    body {
      background-color: #f4f6f9;
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    }

    .navbar {
      background-color: #000;
      padding: 15px 0;
      box-shadow: 0 4px 12px rgba(0, 0, 0, 0.2);
      transition: all 0.4s ease;
    }

    .nav-link {
      color: #fff !important;
      transition: color 0.3s ease;
    }

    .nav-link:hover {
      color: #17c0eb !important;
    }

    .container-card {
      background-color: #fff;
      border-radius: 16px;
      padding: 2rem;
      box-shadow: 0 8px 20px rgba(0, 0, 0, 0.05);
      margin-top: 40px;
    }

    h2.page-title {
      font-size: 2rem;
      font-weight: bold;
      color: #dc3545;
      margin-bottom: 1.5rem;
    }

    table th {
      background-color: #dc3545;
      color: white;
      vertical-align: middle;
    }

    table td {
      vertical-align: middle;
    }

    .btn-buy {
      background-color: #198754;
      color: white;
      font-weight: bold;
      border: none;
    }

    .btn-buy:hover {
      background-color: #146c43;
    }

    img.product-image {
      object-fit: cover;
      border-radius: 8px;
    }
  </style>
</head>

<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg">
  <div class="container">
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav ms-auto">
        <li class="nav-item"><a class="nav-link" href="/index">Home</a></li>
        <li class="nav-item"><a class="nav-link" href="/profileDisplay">Profile</a></li>
        <li class="nav-item"><a class="nav-link" href="/logout">Logout</a></li>
      </ul>
    </div>
  </div>
</nav>

<div class="container">
  <div class="container-card">

    <%-- Fetch and display products --%>
    <%
      try {
        String url = "jdbc:mysql://localhost:3306/springproject";
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection(url, "root", "");
        Statement stmt = con.createStatement();
        Statement stmt2 = con.createStatement();

        Integer categoryId = (Integer) request.getAttribute("categoryId");
        ResultSet rs;

        if (categoryId != null) {
            rs = stmt.executeQuery("SELECT * FROM products WHERE categoryid = " + categoryId);

            ResultSet catRs = stmt2.executeQuery("SELECT name FROM categories WHERE categoryid = " + categoryId);
            if (catRs.next()) {
    %>
              <h2 class="page-title text-center text-uppercase">
                 <%= catRs.getString("name") %>
              </h2>
    <%
            }
        } else {
            rs = stmt.executeQuery("SELECT * FROM products");
    %>
            <h2 class="page-title text-center text-uppercase">All Available Products</h2>
    <%
        }
    %>

    <div class="table-responsive mt-3">
      <table class="table table-bordered align-middle text-center">
        <thead>
          <tr>
            <th>Serial No.</th>
            <th>Product Name</th>
            <th>Category</th>
            <th>Preview</th>
            <th>Quantity</th>
            <th>Price</th>
            <th>Weight</th>
            <th>Description</th>
            <th>Buy</th>
          </tr>
        </thead>
        <tbody>
          <%
            boolean hasProducts = false;
            while (rs.next()) {
              hasProducts = true;
              int categoryid = rs.getInt("categoryid");
              ResultSet rs2 = stmt2.executeQuery("SELECT name FROM categories WHERE categoryid = " + categoryid);
              String categoryName = "";
              if (rs2.next()) {
                categoryName = rs2.getString("name");
              }
              String imageName = rs.getString("image");
              String imageUrl = request.getContextPath() + "/images/" + imageName;
          %>
          <tr>
            <td><%= rs.getInt("id") %></td>
            <td><%= rs.getString("name") %></td>
            <td><%= categoryName %></td>
            <td>
              <img src="<%= imageUrl %>" onerror="this.src='https://via.placeholder.com/80';" class="product-image" height="80" width="80" />
            </td>
            <td><%= rs.getInt("quantity") %></td>
            <td>$<%= rs.getDouble("price") %></td>
            <td><%= rs.getDouble("weight") %>g</td>
            <td><%= rs.getString("description") %></td>
            <td>
              <form action="/buy" method="get">
                <input type="hidden" name="id" value="<%= rs.getInt("id") %>" />
                <button type="submit" class="btn btn-buy">
                  <i class="fas fa-cart-plus me-2"></i>Buy
                </button>
              </form>
            </td>
          </tr>
          <%
            }

            if (!hasProducts) {
          %>
            <tr>
              <td colspan="9" class="text-center text-danger fw-bold">
                <i class="fas fa-exclamation-triangle me-2"></i>Unavailable Products
              </td>
            </tr>
          <%
            }

            con.close();
          } catch (Exception ex) {
              out.println("<div class='text-danger text-center'>Error: " + ex.getMessage() + "</div>");
          }
          %>
        </tbody>
      </table>
    </div>
  </div>
</div>

<!-- JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
