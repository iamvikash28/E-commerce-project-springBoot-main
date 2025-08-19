<!doctype html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport"
        content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>User Registration</title>

  <!-- Bootstrap & Font Awesome -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

  <style>
    body {
      background: linear-gradient(to right, #f3f4f7, #dee3ea);
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      min-height: 100vh;
      display: flex;
      align-items: center;
      justify-content: center;
    }

    .register-container {
      max-width: 500px;
      background-color: #ffffff;
      padding: 40px 30px;
      border-radius: 20px;
      box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
      transition: transform 0.3s ease;
    }

    .register-container:hover {
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
      box-shadow: 0 0 0 0.2rem rgba(220, 53, 69, 0.25);
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

    .login-link a {
      color: #dc3545;
      text-decoration: none;
    }

    .login-link a:hover {
      text-decoration: underline;
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

<div class="register-container">
  <h3 class="text-center mb-4 text-danger">
    <i class="fas fa-user-plus me-2"></i> Register
  </h3>

  <form action="newuserregister" method="post" autocomplete="off">

    <!-- Username -->
    <div class="mb-3">
      <label for="username" class="form-label">Username</label>
      <div class="input-group">
        <span class="input-group-text"><i class="fas fa-user"></i></span>
        <input type="text" name="username" id="username" placeholder="Enter your username" required class="form-control form-control-lg">
      </div>
    </div>

    <!-- Email -->
    <div class="mb-3">
      <label for="email" class="form-label">Email</label>
      <div class="input-group">
        <span class="input-group-text"><i class="fas fa-envelope"></i></span>
        <input type="email" name="email" id="email" placeholder="Enter your email" required class="form-control form-control-lg" minlength="6">
      </div>
      <small class="text-muted">We'll never share your email.</small>
    </div>

    <!-- Password -->
    <div class="mb-3">
      <label for="password" class="form-label">Password</label>
      <div class="input-group">
        <span class="input-group-text"><i class="fas fa-lock"></i></span>
        <input type="password" name="password" id="password" placeholder="Create a password" required
       class="form-control form-control-lg"
       pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[~`!@#$%^&*()\-_=+\[\]{};:'&quot;,.<>/?|\\]).{8,}"
       title="At least 8 characters including uppercase, lowercase, number, and special character">

        <span class="input-group-text toggle-password" id="togglePassword"><i class="fas fa-eye"></i></span>
      </div>
    </div>

    <!-- Address -->
    <div class="mb-3">
      <label for="address" class="form-label">Address</label>
      <textarea name="address" id="address" rows="3" placeholder="Enter your address" class="form-control form-control-lg"></textarea>
    </div>

    <!-- Login Link -->
    <div class="mb-3 text-center login-link">
      <span>Already have an account? <a href="index">Login here</a></span>
    </div>

    <!-- Submit Button -->
    <div class="d-grid">
      <button type="submit" class="btn btn-danger btn-lg">Register</button>
    </div>

    <!-- Optional error/message display -->
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
