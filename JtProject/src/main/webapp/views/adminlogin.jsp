<!doctype html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport"
        content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Admin Login</title>

  <!-- Bootstrap & Font Awesome -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

  <style>
    body {
      background-color: #f8f9fa;
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      min-height: 100vh;
      display: flex;
      align-items: center;
      justify-content: center;
    }

    .admin-container {
      max-width: 450px;
      background-color: #ffffff;
      padding: 40px 30px;
      border-radius: 20px;
      box-shadow: 0 10px 30px rgba(0, 0, 0, 0.15);
      transition: transform 0.3s ease;
    }

    .admin-container:hover {
      transform: scale(1.01);
    }

    .form-label {
      font-weight: 600;
    }

    .input-group-text {
      background-color: #f1f1f1;
      border-right: 0;
    }

    .form-control {
      border-left: 0;
      transition: box-shadow 0.2s ease;
    }

    .form-control:focus {
      box-shadow: 0 0 0 0.2rem rgba(255, 0, 0, 0.25);
      border-color: #dc3545;
    }

    .toggle-password {
      cursor: pointer;
      color: #6c757d;
      background-color: #f1f1f1;
      border-left: 0;
    }

    .btn-danger {
      font-weight: bold;
      transition: background-color 0.3s ease;
    }

    .btn-danger:hover {
      background-color: #c82333;
    }

    .toast-message {
      font-size: 0.95rem;
      margin-top: 15px;
      padding: 10px 15px;
      border-radius: 8px;
      background-color: #ffe0e0;
      color: #b30000;
      text-align: center;
    }
  </style>
</head>
<body>

<div class="admin-container">
  <h3 class="text-center mb-4 text-danger">
    <i class="fas fa-user-shield me-2"></i> Admin Login
  </h3>

  <form action="loginvalidate" method="post" autocomplete="off">
    <!-- Username Field -->
    <div class="mb-3">
      <label for="username" class="form-label">Username</label>
      <div class="input-group">
        <span class="input-group-text"><i class="fas fa-user"></i></span>
        <input type="text" name="username" id="username" placeholder="Enter admin username" required class="form-control form-control-lg">
      </div>
    </div>

    <!-- Password Field -->
    <div class="mb-3">
      <label for="password" class="form-label">Password</label>
      <div class="input-group">
        <span class="input-group-text"><i class="fas fa-lock"></i></span>
        <input type="password" name="password" id="password" placeholder="Enter admin password" required class="form-control form-control-lg">
        <span class="input-group-text toggle-password" id="togglePassword"><i class="fas fa-eye"></i></span>
      </div>
    </div>

    <!-- Submit Button -->
    <div class="d-grid">
      <button type="submit" class="btn btn-danger btn-lg">Login</button>
    </div>

    <!-- Error Message -->
    <c:if test="${not empty message}">
      <div class="toast-message">${message}</div>
    </c:if>
  </form>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

<!-- Toggle Password -->
<script>
  document.getElementById('togglePassword').addEventListener('click', function () {
    const password = document.getElementById('password');
    const icon = this.querySelector('i');
    const isPassword = password.type === 'password';
    password.type = isPassword ? 'text' : 'password';
    icon.classList.toggle('fa-eye');
    icon.classList.toggle('fa-eye-slash');
  });
</script>

</body>
</html>
