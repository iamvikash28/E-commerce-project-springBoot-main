<!doctype html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport"
        content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Update Profile</title>

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

    .profile-container {
      max-width: 800px; /* Increased width */
      background-color: #ffffff;
      padding: 25px 30px; /* Reduced height (less padding) */
      border-radius: 16px;
      box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
      width: 40%;
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
    }

    .form-control:focus {
      box-shadow: 0 0 0 0.2rem rgba(220, 53, 69, 0.25);
      border-color: #dc3545;
    }

    .toggle-password {
      cursor: pointer;
      background-color: #f1f1f1;
      border-left: 0;
    }

    .btn-danger {
      font-weight: bold;
    }
  </style>
</head>
<body>

<div class="profile-container">
  <h3 class="text-center mb-4 text-danger">
    <i class="fas fa-user-edit me-2"></i> Update Profile
  </h3>

  <form action="updateuser" method="post">
    <input type="hidden" name="userid" value="${userid}">

    <!-- Username -->
    <div class="mb-3">
      <label for="username" class="form-label">User Name</label>
      <div class="input-group">
        <span class="input-group-text"><i class="fas fa-user"></i></span>
        <input type="text" name="username" id="username" required placeholder="Enter username"
               value="${username}" class="form-control form-control-lg">
      </div>
    </div>

    <!-- Email -->
    <div class="mb-3">
      <label for="email" class="form-label">Email address</label>
      <div class="input-group">
        <span class="input-group-text"><i class="fas fa-envelope"></i></span>
        <input type="email" name="email" id="email" required placeholder="Enter email"
               value="${email}" class="form-control form-control-lg">
      </div>
      <small class="form-text text-muted ms-2">We'll never share your email with anyone else.</small>
    </div>

    <!-- Password -->
<div class="mb-3">
  <label for="password" class="form-label">Password</label>
  <div class="input-group">
    <span class="input-group-text"><i class="fas fa-lock"></i></span>
    <input type="password" name="password" id="password" required placeholder="Enter password"
           value="${password}" class="form-control form-control-lg"
           pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[~`!@#$%^&*()\-_=+\[\]{};:'&quot;,.<>?/\\|]).{8,}"
           title="Must contain: at least one number, one uppercase, one lowercase, one special character, and 8+ characters">
    <span class="input-group-text toggle-password" id="togglePassword"><i class="fas fa-eye"></i></span>
  </div>
</div>


    <!-- Address -->
    <div class="mb-4">
      <label for="address" class="form-label">Address</label>
      <textarea name="address" id="address" rows="3" placeholder="Enter address"
                class="form-control form-control-lg">${address}</textarea>
    </div>

    <!-- Submit Button -->
    <div class="d-grid">
      <button type="submit" class="btn btn-danger btn-lg">Update Profile</button>
    </div>
  </form>
</div>

<!-- JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

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
