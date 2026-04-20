# E-commerce-Project
An E-commerce web application built using Spring Boot, JSP, and MySQL, providing core functionalities of an online shopping platform. This project implements key e-commerce features like product management, user authentication, cart handling, and admin features.

---

## 📸 Preview
<img width="1920" height="877" alt="screencapture-localhost-8080-2026-04-17-13_31_57" src="https://github.com/user-attachments/assets/46ca0f75-61c6-47fa-bc78-e91faf4f8dcc" />
<img width="1920" height="1800" alt="screencapture-localhost-8080-index-2026-04-17-13_29_14" src="https://github.com/user-attachments/assets/bf65ec0a-cede-496a-b3e2-4522a34c5721" />
<img width="1920" height="877" alt="screencapture-localhost-8080-admin-2026-04-17-13_31_37" src="https://github.com/user-attachments/assets/98fd7862-4691-4201-8f09-fc53646695aa" />
<img width="1920" height="877" alt="screencapture-localhost-8080-adminhome-2026-04-17-13_30_15" src="https://github.com/user-attachments/assets/9d961c8b-17ed-40e8-9b31-a81971c49355" />

---

## ✨ Features

- **User Features**
  - User registration & authentication
  - Browse products by categories
  - Product management (CRUD)
  - Shopping cart functionality
  - Order processing
  - Database integration (MySQL)
  - RESTful APIs for frontend integration

- **Admin Features**
  - Admin login and dashboard
  - Add, update, delete products
  - Manage categories
  - View all users and orders
  - Upload product images
 
- **General**
  - Secure authentication (session-based)
  - JSP-based front-end views
  - MySQL database integration
  - Responsive layout (JSP + CSS)
 
---

## 🛠️ Tech Stack

- **Backend:** Spring Boot (Java), Spring MVC  
- **Frontend:** JSP, HTML, CSS  
- **Database:** MySQL (with `springproject.sql` schema provided)  
- **Build Tool:** Maven  
- **Server:** Embedded Tomcat (via Spring Boot)

---

## ⚙️ Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/iamvikash28/E-commerce-project-springBoot.git
   cd E-commerce-project-springBoot/JtProject
   ```

2. **Database setup**
   - Create a MySQL database (e.g., `springproject`).
   - Import the SQL script:
     ```bash
     mysql -u root -p ecommerce_db < springproject.sql
     ```

3. **Configure application.properties**
   Update `src/main/resources/application.properties` with your DB credentials:
   ```properties
   spring.datasource.url=jdbc:mysql://localhost:3306/springproject
   spring.datasource.username=root
   spring.datasource.password=yourpassword
   spring.jpa.hibernate.ddl-auto=update
   ```

4. **Build and run**
   ```bash
   mvn clean install
   mvn spring-boot:run
   ```

5. **Access the application**
   - User site → `http://localhost:8080/`
   - Admin login → `http://localhost:8080/admin`

---

## 🚀 Usage

- **User Login/Signup:** Register as a new user or log in with existing credentials.  
- **Shopping:** Browse categories, add items to cart, and proceed to checkout.  
- **Admin Panel:** Log in as admin to manage products, categories, and view all users.  

---

## 📂 Project Structure

E-commerce-project-springBoot-main/
├── JtProject/
│   ├── pom.xml
│   ├── springproject.sql
│   ├── src/
│   │   ├── main/
│   │   │   ├── java/com/jtspringproject/JtSpringProject/
│   │   │   │   ├── JtSpringProjectApplication.java
│   │   │   │   └── controller/
│   │   │   │       ├── AdminController.java
│   │   │   │       └── UserController.java
│   │   │   ├── resources/
│   │   │   │   ├── application.properties
│   │   │   │   └── Product Images/
│   │   │   └── webapp/views/
│   │   │       ├── adminHome.jsp
│   │   │       ├── adminlogin.jsp
│   │   │       ├── buy.jsp
│   │   │       ├── categories.jsp
│   │   │       ├── contact.jsp
│   │   │       └── demo.jsp
│   └── target/ (generated files after build)

---

## 🗄️ Database Setup

- SQL schema and sample data are in `springproject.sql`.  
- Default tables include:
  - `users` (user accounts)  
  - `products` (catalog)  
  - `categories`  
  - `login`    

---

## 👤 Author

**Vikash Verma**
Aspiring Data Analyst | Excel · SQL · Power BI · Python | E-mail- vikashverma566@gmail.com

---
