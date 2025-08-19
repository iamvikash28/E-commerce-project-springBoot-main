package com.jtspringproject.JtSpringProject.controller;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class UserController {

    @GetMapping("/register")
    public String registerUser() {
        return "register";
    }

    @GetMapping("/contact")
    public String contact() {
        return "contact";
    }

    @GetMapping("/buy")
    public String buy() {
        return "buy";
    }

    @GetMapping("/user/products")
    public String getproduct(@RequestParam(value = "category", required = false) Integer categoryId, Model model) {
        model.addAttribute("categoryId", categoryId);  // Pass categoryId to JSP
        return "uproduct"; // View name
    }

    @RequestMapping(value = "newuserregister", method = RequestMethod.POST)
    public String newUserRegister(@RequestParam("username") String username,
                                  @RequestParam("password") String password,
                                  @RequestParam("email") String email) {
        try {
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/springproject", "root", "");
            PreparedStatement pst = con.prepareStatement("INSERT INTO users(username, password, email) VALUES (?, ?, ?)");
            pst.setString(1, username);
            pst.setString(2, password);
            pst.setString(3, email);

            int i = pst.executeUpdate();
            System.out.println("Database updated: " + i);
        } catch (Exception e) {
            System.out.println("Exception: " + e);
        }
        return "redirect:/";
    }

    // ✅ Get user profile
    @GetMapping("/user/profile")
    public String getUserProfile(@RequestParam("username") String username, Model model) {
        try {
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/springproject", "root", "");
            PreparedStatement pst = con.prepareStatement("SELECT * FROM users WHERE username = ?");
            pst.setString(1, username);
            ResultSet rs = pst.executeQuery();
            if (rs.next()) {
                model.addAttribute("username", rs.getString("username"));
                model.addAttribute("email", rs.getString("email"));
                model.addAttribute("password", rs.getString("password")); // Note: Not secure
            }
        } catch (Exception e) {
            System.out.println("Exception in getUserProfile: " + e);
        }
        return "profile"; // Should map to a profile.jsp or profile.html
    }

    // ✅ Update user profile
    @PostMapping("/user/updateProfile")
    public String updateUserProfile(@RequestParam("username") String username,
                                    @RequestParam("email") String email,
                                    @RequestParam("password") String password) {
        try {
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/springproject", "root", "");
            PreparedStatement pst = con.prepareStatement("UPDATE users SET email = ?, password = ? WHERE username = ?");
            pst.setString(1, email);
            pst.setString(2, password);
            pst.setString(3, username);

            int i = pst.executeUpdate();
            System.out.println("User profile updated: " + i);
        } catch (Exception e) {
            System.out.println("Exception in updateUserProfile: " + e);
        }
        return "redirect:/user/profile?username=" + username;
    }
}
