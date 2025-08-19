<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.*" %>
<!doctype html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <meta http-equiv="X-UA-Compatible" content="ie=edge" />
  <title>Customer List</title>

  <!-- Bootstrap & Font Awesome -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />

  <style>
    body {
      background-color: #f4f6f9;
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    }

    /* Unified Navbar Style */
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

    .container-main {
      margin-top: 50px;
    }

    .table-card {
      background: #ffffff;
      border-radius: 16px;
      padding: 2rem;
      box-shadow: 0 6px 18px rgba(0, 0, 0, 0.05);
    }

    .table thead {
      background-color: #dc3545;
      color: white;
    }

    .table tbody tr:hover {
      background-color: #f2f2f2;
    }

    .title-header {
      font-weight: 600;
      color: #dc3545;
    }
  </style>
</head>
<body>

<!-- Unified Navbar (Copied from adminHome.jsp) -->
<nav class="navbar navbar-expand-lg">
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

<!-- Main Container -->
<div class="container container-main">
  <div class="table-card">
    <h2 class="mb-4 title-header text-center"><i class="fas fa-users me-2"></i>Customer List</h2>
    <div class="table-responsive">
      <table class="table table-hover align-middle">
        <thead>
          <tr>
            <th scope="col">User ID</th>
            <th scope="col">Customer Name</th>
            <th scope="col">Email</th>
            <th scope="col">Address</th>
          </tr>
        </thead>
        <tbody>
          <%
            try {
              String url = "jdbc:mysql://localhost:3306/springproject";
              Class.forName("com.mysql.cj.jdbc.Driver");
              Connection con = DriverManager.getConnection(url, "root", "");
              Statement stmt = con.createStatement();
              ResultSet rs = stmt.executeQuery("SELECT * FROM users");

              while (rs.next()) {
          %>
          <tr>
            <td><%= rs.getInt(1) %></td>
            <td><%= rs.getString(2) %></td>
            <td><%= rs.getString(6) %></td>
            <td><%= rs.getString(5) %></td>
          </tr>
          <%
              }
              con.close();
            } catch (Exception ex) {
          %>
          <tr>
            <td colspan="4" class="text-danger fw-bold text-center">Exception Occurred: <%= ex.getMessage() %></td>
          </tr>
          <% } %>
        </tbody>
      </table>
    </div>
  </div>
</div>

<!-- Bootstrap JS Bundle -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
