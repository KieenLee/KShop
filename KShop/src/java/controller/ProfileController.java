/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.UsersDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.Vector;
import model.Users;

/**
 *
 * @author LAZYVL
 */
@WebServlet("/profile")
public class ProfileController extends HttpServlet {
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        UsersDAO daoUser = new UsersDAO();
        String service = request.getParameter("service");
        
        if (service == null) {
            service = "listAllProfile";
        }
        if(service.equals("listAllProfile")){
            Users user = (Users) session.getAttribute("user");
            
            Vector<Users> vectorUser = daoUser.getUserById(user.getId());
            
            request.setAttribute("dataUser", vectorUser);
            request.getRequestDispatcher("profile.jsp").forward(request, response);
        }
        if(service.equals("listAllProfileAdmin")){
            Users user = (Users) session.getAttribute("user");
            
            Vector<Users> vectorUser = daoUser.getUserById(user.getId());
            
            request.setAttribute("dataUser", vectorUser);
            request.getRequestDispatcher("admin_profile.jsp").forward(request, response);
        }
        if(service.equals("updateProfile")){
            int id = Integer.parseInt(request.getParameter("id"));
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");
            String dob = request.getParameter("dob");
            String address = request.getParameter("address");

            Users user = new Users();
            user.setId(id);
            user.setName(name);
            user.setEmail(email);
            user.setPhone(phone);
            user.setDob(java.sql.Date.valueOf(dob));
            user.setAddress(address);

            daoUser.updateUser(user);
            session.setAttribute("user", user);
            response.sendRedirect("profile?service=listAllProfile");
        }
    }

}