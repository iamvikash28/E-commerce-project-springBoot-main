<!doctype html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <meta http-equiv="X-UA-Compatible" content="ie=edge" />
  <title>Admin Home</title>

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

    .jumbotron {
      background-color: #ffffff;
      padding: 3rem 2rem;
      margin-top: 30px;
      box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
      border-radius: 16px;
    }

    .card {
      border: none;
      border-radius: 16px;
      box-shadow: 0 6px 18px rgba(0, 0, 0, 0.05);
      transition: transform 0.2s ease;
      height: 100%;
      display: flex;
      flex-direction: column;
      justify-content: space-between;
    }

    .card:hover {
      transform: translateY(-5px);
    }

    .card-body {
      flex-grow: 1;
    }

    .card-title {
      font-weight: 600;
      color: #333;
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
  </style>
</head>

<body>

<!-- Unified Navbar -->
<nav class="navbar navbar-expand-lg">
  <div class="container">
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
            data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false"
            aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav ms-auto">
        <li class="nav-item"><a class="nav-link" href="/logout">Logout</a></li>
      </ul>
    </div>
  </div>
</nav>

<!-- Admin Dashboard -->
<div class="container mt-5">
  <div class="jumbotron text-center">
    <h1 class="display-5 fw-bold text-danger">Welcome Back, Admin</h1>
    <hr />
    <p class="lead">Manage your data from the admin control panel</p>
  </div>

  <div class="row justify-content-center mt-4">
    <!-- Categories Card -->
    <div class="col-sm-6 col-md-4 col-lg-3 mb-4 d-flex">
      <div class="card text-center bg-white w-100">
        <div class="card-body d-flex flex-column justify-content-between">
          <h4 class="card-title"><i class="fas fa-list-alt me-2"></i>Categories</h4>
          <p class="card-text">Manage the categories section here.</p>
          <a href="/admin/categories" class="btn btn-primary mt-3 align-self-center">Manage</a>
        </div>
      </div>
    </div>

    <!-- Products Card -->
    <div class="col-sm-6 col-md-4 col-lg-3 mb-4 d-flex">
      <div class="card text-center bg-white w-100">
        <div class="card-body d-flex flex-column justify-content-between">
          <h4 class="card-title"><i class="fas fa-box-open me-2"></i>Products</h4>
          <p class="card-text">Manage all the products here.</p>
          <a href="/admin/products" class="btn btn-primary mt-3 align-self-center">Manage</a>
        </div>
      </div>
    </div>

    <!-- Customers Card -->
    <div class="col-sm-6 col-md-4 col-lg-3 mb-4 d-flex">
      <div class="card text-center bg-white w-100">
        <div class="card-body d-flex flex-column justify-content-between">
          <h4 class="card-title"><i class="fas fa-users me-2"></i>Customers</h4>
          <p class="card-text">Manage all the customers here.</p>
          <a href="/admin/customers" class="btn btn-primary mt-3 align-self-center">Manage</a>
        </div>
      </div>
    </div>
  </div>
</div>

<!-- Bootstrap JS Bundle -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
