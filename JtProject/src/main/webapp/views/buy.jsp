<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>Buy Product</title>

  <!-- Bootstrap & Font Awesome -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />

  <style>
    body {
      background: linear-gradient(to right, #f3f4f7, #dee3ea);
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      min-height: 100vh;
      display: flex;
      flex-direction: column;
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

    .form-wrapper {
      flex: 1;
      display: flex;
      align-items: center;
      justify-content: center;
      padding: 40px 15px;
    }

    .form-card {
      width: 100%;
      max-width: 600px;
      background-color: #ffffff;
      padding: 40px 30px;
      border-radius: 20px;
      box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
      transition: transform 0.3s ease;
    }

    .form-card:hover {
      transform: scale(1.01);
    }

    h3 {
      color: #dc3545;
      font-weight: bold;
      margin-bottom: 30px;
      text-align: center;
    }

    .form-label {
      font-weight: 600;
    }

    .form-control {
      transition: box-shadow 0.2s ease;
    }

    .form-control:focus {
      box-shadow: 0 0 0 0.2rem rgba(220, 53, 69, 0.25);
      border-color: #dc3545;
    }

    .btn-danger {
      font-weight: bold;
      transition: background-color 0.3s ease;
    }

    .btn-danger:hover {
      background-color: #c82333;
    }
  </style>
</head>
<body>

<!-- Navbar (Unified Style) -->
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

<!-- Buy Form -->
<div class="form-wrapper">
  <div class="form-card">
    <h3><i class="fas fa-credit-card me-2"></i> Payment Information</h3>

    <form action="/submitPayment" method="post">
      <!-- Name -->
      <div class="row mb-3">
        <div class="col">
          <label class="form-label">First Name</label>
          <input type="text" name="first-name" class="form-control form-control-lg" required />
        </div>
        <div class="col">
          <label class="form-label">Last Name</label>
          <input type="text" name="last-name" class="form-control form-control-lg" required />
        </div>
      </div>

      <!-- Card Details -->
      <div class="mb-3">
        <label class="form-label">Card Details</label>
        <div class="row g-2">
          <!-- Card Number -->
          <div class="col-md-6">
            <label class="form-label small">Card Number</label>
            <div class="input-group">
              <span class="input-group-text"><i class="fas fa-credit-card"></i></span>
              <input type="text" id="cardNumber" name="number" class="form-control form-control-lg"
                     placeholder="1234 5678 9012 3456" maxlength="19" required />
            </div>
          </div>

          <!-- Expiry Date -->
          <div class="col-md-3">
            <label class="form-label small">Expiry</label>
            <input type="text" id="expiry" name="expiry" class="form-control form-control-lg"
                   placeholder="MM/YY" maxlength="5" required />
          </div>

          <!-- CVV -->
          <div class="col-md-3">
            <label class="form-label small">CVV</label>
            <input type="password" id="cvv" name="cvc" class="form-control form-control-lg"
                   placeholder="•••" maxlength="3" required />
          </div>
        </div>
      </div>

      <!-- Address -->
      <div class="mb-3">
        <label class="form-label">Street Address</label>
        <input type="text" name="streetaddress" class="form-control form-control-lg" required />
      </div>

      <div class="row mb-3">
        <div class="col">
          <label class="form-label">City</label>
          <input type="text" name="city" class="form-control form-control-lg" required />
        </div>
        <div class="col">
          <label class="form-label">ZIP Code</label>
          <input type="text" name="zipcode" class="form-control form-control-lg" required />
        </div>
      </div>

      <!-- Email -->
      <div class="mb-4">
        <label class="form-label">Email</label>
        <input type="email" name="email" class="form-control form-control-lg" required placeholder="you@example.com" />
      </div>

      <!-- Submit -->
      <div class="d-grid">
        <button type="submit" class="btn btn-danger btn-lg">Submit Payment</button>
      </div>
    </form>
  </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
  // Auto-format card number
  document.getElementById('cardNumber').addEventListener('input', function (e) {
    let value = e.target.value.replace(/\D/g, '').substring(0, 16);
    let formatted = value.replace(/(\d{4})(?=\d)/g, '$1 ');
    e.target.value = formatted;
  });

  // Auto-format expiry date
  document.getElementById('expiry').addEventListener('input', function (e) {
    let value = e.target.value.replace(/\D/g, '').substring(0, 4);
    if (value.length >= 3) {
      value = value.replace(/(\d{2})(\d{1,2})/, '$1/$2');
    }
    e.target.value = value;
  });

  // Disable paste on card/expiry fields
  ['cardNumber', 'expiry'].forEach(id => {
    document.getElementById(id).addEventListener('paste', function (e) {
      e.preventDefault();
    });
  });
</script>

</body>
</html>
