<%@page import="java.sql.*"%>
<!doctype html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <meta http-equiv="X-UA-Compatible" content="ie=edge" />
  <title>Categories</title>

  <!-- Bootstrap 5 & FontAwesome -->
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

<!-- Navbar -->
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

<div class="container container-main">
  <div class="card">
    <div class="d-flex justify-content-between align-items-center mb-4">
      <h2 class="text-danger"><i class="fas fa-list-alt me-2"></i>Categories</h2>
      <!-- Add Category Button -->
      <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addCategoryModal">
        Add Category
      </button>
    </div>

    <!-- Add Category Modal -->
    <div class="modal fade" id="addCategoryModal" tabindex="-1" aria-labelledby="addCategoryLabel" aria-hidden="true">
      <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
          <!-- Use POST and multipart for file upload -->
          <form action="sendcategory" method="post" enctype="multipart/form-data">
            <div class="modal-header">
              <h5 class="modal-title" id="addCategoryLabel">Add New Category</h5>
              <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
              <div class="mb-3">
                <label for="categoryname" class="form-label">Category Name</label>
                <input type="text" name="categoryname" id="categoryname" class="form-control" placeholder="Category name" required />
              </div>

              <div class="mb-3">
                <label for="categoryImage" class="form-label">Category Image</label>
                <input type="file" class="form-control" id="categoryImage" name="categoryImage"
                       accept="image/png, image/jpeg" onchange="loadFile(event)" />
              </div>

              <div class="mb-3 text-center">
                <img id="imgPreview" src="#" alt="Image Preview"
                     style="display:none; max-height: 100px; border: 1px solid #ccc; padding: 5px;" />
              </div>
            </div>

            <div class="modal-footer">
              <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
              <input type="submit" class="btn btn-primary" value="Save Changes" />
            </div>
          </form>
        </div>
      </div>
    </div>

    <!-- Categories Table -->
    <div class="table-responsive">
      <table class="table align-middle table-hover">
        <thead>
          <tr>
            <th scope="col">SN</th>
            <th scope="col">Category Name</th>
            <th scope="col">Preview</th> <!-- ✅ Added Preview Column -->
            <th scope="col" class="text-center">Delete</th>
            <th scope="col" class="text-center">Update</th>
          </tr>
        </thead>
        <tbody>
          <%
            try {
              String url = "jdbc:mysql://localhost:3306/springproject";
              Class.forName("com.mysql.cj.jdbc.Driver");
              Connection con = DriverManager.getConnection(url, "root", "");
              Statement stmt = con.createStatement();
              ResultSet rs = stmt.executeQuery("select * from categories");

              while (rs.next()) {
          %>
          <tr>
            <td><%= rs.getInt("categoryid") %></td>
            <td><%= rs.getString("name") %></td>

            <!-- ✅ Image Preview Logic Start -->
            <td>
              <%
                String catImage = rs.getString("image");
                if (catImage != null && !catImage.trim().isEmpty()) {
              %>
                <img src="<%= request.getContextPath() %>/images/<%= catImage %>" 
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
            <!-- ✅ Image Preview Logic End -->

            <td class="text-center">
              <form action="categories/delete" method="get" onsubmit="return confirm('Are you sure you want to delete this category?');">
                <input type="hidden" name="id" value="<%= rs.getInt("categoryid") %>" />
                <button type="submit" class="btn btn-danger btn-sm">Delete</button>
              </form>
            </td>

            <td class="text-center">
              <button
                type="button"
                class="btn btn-warning btn-sm"
                data-bs-toggle="modal"
                data-bs-target="#updateCategoryModal"
                data-categoryid="<%= rs.getInt("categoryid") %>"
                data-categoryname="<%= rs.getString("name") %>"
                data-categoryimage="<%= catImage != null ? catImage : "" %>"
              >
                Update
              </button>
            </td>
          </tr>
          <%
              }
              con.close();
            } catch (Exception ex) {
          %>
          <tr>
            <td colspan="5" class="text-danger text-center fw-bold">
              Exception Occurred: <%= ex.getMessage() %>
            </td>
          </tr>
          <% } %>
        </tbody>
      </table>
    </div>
  </div>
</div>

<!-- Update Modal -->
<div class="modal fade" id="updateCategoryModal" tabindex="-1" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <!-- POST + multipart for file upload -->
      <form action="categories/update" method="post" enctype="multipart/form-data">
        <div class="modal-header">
          <h5 class="modal-title">Update Category</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
          <input type="hidden" name="categoryid" id="updateCategoryId" />
          <div class="mb-3">
            <label for="updateCategoryName" class="form-label">Category Name</label>
            <input type="text" name="categoryname" id="updateCategoryName" class="form-control" placeholder="Category name" required />
          </div>
          <div class="mb-3">
            <label for="updateCategoryImage" class="form-label">Category Image</label>
            <input type="file" class="form-control" id="updateCategoryImage" name="categoryImage" accept="image/*" onchange="loadUpdateFile(event)" />
          </div>
          <div class="mb-3 text-center">
            <!-- Show current image preview -->
            <img id="updateImgPreview" src="#" alt="Current Image" style="max-height:100px; border:1px solid #ccc; padding:5px; display:none;" />
          </div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
          <button type="submit" class="btn btn-primary">Update Category</button>
        </div>
      </form>
    </div>
  </div>
</div>

<!-- Scripts -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

<script>
  // Add modal image preview
  var loadFile = function(event) {
    var image = document.getElementById('imgPreview');
    image.src = URL.createObjectURL(event.target.files[0]);
    image.style.display = 'block';
  };

  // Update modal: fill inputs + show image preview on open
  var updateModal = document.getElementById('updateCategoryModal');
  updateModal.addEventListener('show.bs.modal', function(event) {
    var button = event.relatedTarget;
    var categoryId = button.getAttribute('data-categoryid');
    var categoryName = button.getAttribute('data-categoryname');
    var categoryImage = button.getAttribute('data-categoryimage');

    document.getElementById('updateCategoryId').value = categoryId;
    document.getElementById('updateCategoryName').value = categoryName;

    var imgPreview = document.getElementById('updateImgPreview');
    if(categoryImage && categoryImage.trim() !== '') {
      imgPreview.src = '<%=request.getContextPath()%>/images/' + categoryImage;
      imgPreview.style.display = 'block';
    } else {
      imgPreview.style.display = 'none';
    }
  });

  // Update modal image preview on file select
  var loadUpdateFile = function(event) {
    var img = document.getElementById('updateImgPreview');
    img.src = URL.createObjectURL(event.target.files[0]);
    img.style.display = 'block';
  };
</script>

</body>
</html>
