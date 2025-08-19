<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="java.text.*"%>
<!doctype html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <meta http-equiv="X-UA-Compatible" content="ie=edge" />
  <title>Products</title>

  <!-- Bootstrap 5 & FontAwesome -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />

  <style>
    body {
      background-color: #f4f6f9;
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    }
    nav.navbar {
      background-color: #000;
      padding: 15px 0;
      box-shadow: 0 4px 12px rgba(0,0,0,0.2);
      transition: all 0.4s ease;
    }
    .nav-link {
      color: #fff !important;
      transition: color 0.3s ease;
    }
    .nav-link:hover {
      color: #17c0eb !important;
    }
    .container-main {
      margin-top: 50px;
    }
    .card {
      background: white;
      border-radius: 16px;
      box-shadow: 0 6px 18px rgba(0,0,0,0.05);
      padding: 2rem;
    }
    .btn-primary {
      background-color: #dc3545;
      border-color: #dc3545;
      font-weight: bold;
    }
    .btn-primary:hover {
      background-color: #bb2d3b;
      border-color: #bb2d3b;
    }
    table thead {
      background-color: #dc3545;
      color: white;
    }
    table tbody tr:hover {
      background-color: #f2f2f2;
    }
    .product-image {
      width: 100px;
      height: 100px;
      object-fit: cover;
    }
  </style>
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-dark">
  <div class="container">
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
            data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false"
            aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav ms-auto">
        <li class="nav-item"><a class="nav-link" href="/adminhome">Home</a></li>
        <li class="nav-item"><a class="nav-link" href="/logout">Logout</a></li>
      </ul>
    </div>
  </div>
</nav>

<div class="container container-main">
  <div class="card">
    <div class="d-flex justify-content-between align-items-center mb-4">
      <h2 class="text-danger"><i class="fas fa-boxes me-2"></i>Products</h2>
      <a href="/admin/products/add" class="btn btn-primary">Add Product</a>
    </div>

    <div class="table-responsive">
      <table class="table align-middle table-hover">
        <thead>
          <tr>
            <th>SN</th>
            <th>Product Name</th>
            <th>Category</th>
            <th>Preview</th>
            <th>Quantity</th>
            <th>Price</th>
            <th>Weight</th>
            <th>Description</th>
            <th class="text-center">Delete</th>
            <th class="text-center">Update</th>
          </tr>
        </thead>
        <tbody>
          <%
            try {
              String url = "jdbc:mysql://localhost:3306/springproject";
              Class.forName("com.mysql.cj.jdbc.Driver");
              Connection con = DriverManager.getConnection(url, "root", "");
              Statement stmt = con.createStatement();
              Statement stmt2 = con.createStatement();
              ResultSet rs = stmt.executeQuery("SELECT * FROM products");

              while (rs.next()) {
          %>
          <tr>
            <td><%= rs.getInt("id") %></td>
            <td><%= rs.getString("name") %></td>
            <td>
              <%
                int categoryid = rs.getInt("categoryid");
                ResultSet rs2 = stmt2.executeQuery("SELECT * FROM categories WHERE categoryid = " + categoryid);
                if (rs2.next()) {
                  out.print(rs2.getString("name"));
                }
              %>
            </td>
            <td>
              <%
                  String imageFile = rs.getString("image");
                  if (imageFile != null && !imageFile.trim().isEmpty()) {
              %>
                      <img src="<%= request.getContextPath() %>/images/<%= imageFile %>" 
                           class="product-image" 
                           alt="<%= rs.getString("name") %>">
              <%
                  } else {
              %>
                      <img src="<%= request.getContextPath() %>/images/no-image.png" 
                           class="product-image" 
                           alt="No Image">
              <%
                  }
              %>
            </td>
            <td><%= rs.getInt("quantity") %></td>
            <td>&#8377;<%= rs.getInt("price") %></td>
            <td><%= rs.getInt("weight") %>g</td>
            <td><%= rs.getString("description") %></td>
            <td class="text-center">
              <form action="products/delete" method="get" onsubmit="return confirm('Are you sure you want to delete this product?');">
                <input type="hidden" name="id" value="<%= rs.getInt("id") %>" />
                <button type="submit" class="btn btn-danger btn-sm">Delete</button>
              </form>
            </td>
            <td class="text-center">
              <form action="products/update" method="get">
                <input type="hidden" name="pid" value="<%= rs.getInt("id") %>" />
                <button type="submit" class="btn btn-warning btn-sm">Update</button>
              </form>
            </td>
          </tr>
          <%
              }
              con.close();
            } catch (Exception ex) {
          %>
          <tr>
            <td colspan="10" class="text-danger text-center fw-bold">
              Exception Occurred: <%= ex.getMessage() %>
            </td>
          </tr>
          <% } %>
        </tbody>
      </table>
    </div>
  </div>
</div>

<!-- Bootstrap 5 JS Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
