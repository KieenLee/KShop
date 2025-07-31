/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.UsersDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Vector;
import model.Users;

/**
 *
 * @author LAZYVL
 */
@WebServlet("/register")
public class RegisterController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Lấy các tham số từ form
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        String fullname = req.getParameter("fullname");
        String email = req.getParameter("email");
        String phone = req.getParameter("phone");
        String dobString = req.getParameter("dob"); // Lấy chuỗi ngày tháng từ form
        String address = req.getParameter("address");

        Date dob = null;
        try {
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            dob = dateFormat.parse(dobString);
        } catch (ParseException e) {
            e.printStackTrace();
            req.getRequestDispatcher("register.jsp").forward(req, resp);
            return;
        }

        Vector<Users> vector = (new UsersDAO()).getAllUser();
        for (Users user : vector) {
            if (user.getUserName().equals(username)) {
                req.getRequestDispatcher("register.jsp").forward(req, resp);
                return;
            }
        }

        UsersDAO dao = new UsersDAO();
        Users user = new Users(username, password, fullname, email, phone, dob, address, "user");
        dao.insertUser(user);
        req.getRequestDispatcher("login.jsp").forward(req, resp);
    }
}
