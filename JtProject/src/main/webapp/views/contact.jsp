<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <meta http-equiv="X-UA-Compatible" content="ie=edge" />
  <title>Contact Supplier</title>

  <!-- Bootstrap 5 & Font Awesome -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />

  <style>
    body {
      background-color: #f4f6f9;
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    }

    nav.navbar {
      background-color: #212529;
    }

    .hero-section {
      background: linear-gradient(135deg, #dc3545, #bb2d3b);
      color: white;
      padding: 20px 0;
      text-align: center;
      border-radius: 0 0 60px 60px;
      margin-bottom: 30px;
    }

    .form-card {
      background-color: #ffffff;
      padding: 2.5rem;
      border-radius: 16px;
      box-shadow: 0 12px 24px rgba(0, 0, 0, 0.08);
      animation: fadeInUp 0.8s ease-in-out;
    }

    .form-title {
      font-size: 2rem;
      font-weight: bold;
      color: #dc3545;
      margin-bottom: 1.5rem;
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

    @keyframes fadeInUp {
      from {
        opacity: 0;
        transform: translateY(30px);
      }

      to {
        opacity: 1;
        transform: translateY(0);
      }
    }
  </style>
</head>

<body>
  <!-- Navbar -->
  <nav class="navbar navbar-expand-lg navbar-dark">
    <div class="container">
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
        <span class="navbar-toggler-icon"></span>
      </button>

      <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav ms-auto">
          <li class="nav-item"><a class="nav-link" href="/">Home</a></li>
          <li class="nav-item"><a class="nav-link" href="/profileDisplay">Profile</a></li>
          <li class="nav-item"><a class="nav-link" href="/logout">Logout</a></li>
        </ul>
      </div>
    </div>
  </nav>

  <!-- Hero Section -->
  <section class="hero-section">
    <div class="container">
      <h1 class="display-5 fw-bold">Contact Supplier</h1>
      <p class="lead">Please fill out the form below to get in touch with our supplier team.</p>
    </div>
  </section>

  <!-- Contact Form -->
  <div class="container mb-5">
    <div class="form-card mx-auto col-lg-8">
      <form action="https://formcarry.com/s/Pq3xf4Lbabh" method="POST">
        <!-- Product Name -->
        <div class="mb-3">
          <label class="form-label">Product Name</label>
          <div class="input-group">
            <span class="input-group-text"><i class="fas fa-box"></i></span>
            <input type="text" name="product Name" class="form-control" required />
          </div>
        </div>

        <!-- Contact Number -->
        <div class="mb-3">
          <label class="form-label">Contact Number</label>
          <div class="input-group">
            <span class="input-group-text"><i class="fas fa-phone-alt"></i></span>
            <input type="text" name="Number" maxlength="10" class="form-control" required />
          </div>
        </div>

        <!-- Email -->
        <div class="mb-3">
          <label class="form-label">Email ID</label>
          <div class="input-group">
            <span class="input-group-text"><i class="fas fa-envelope"></i></span>
            <input type="email" name="Email" class="form-control" required />
          </div>
        </div>

        <!-- Category -->
        <div class="mb-3">
          <label class="form-label">Category</label>
          <div class="input-group">
            <span class="input-group-text"><i class="fas fa-tags"></i></span>
            <input type="text" name="category" class="form-control" required />
          </div>
        </div>

        <!-- Description -->
        <div class="mb-3">
          <label class="form-label">Description</label>
          <textarea name="Message" rows="4" class="form-control" placeholder="Write a short description..." required></textarea>
        </div>

        <!-- Submit Button -->
        <div class="text-center">
          <button type="submit" class="btn btn-primary px-5 py-2">Send Message</button>
        </div>
      </form>
    </div>
  </div>

  <!-- Bootstrap JS -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>
