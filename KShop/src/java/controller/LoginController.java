package controller;

import dal.UsersDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import model.Users;

@WebServlet("/login")
public class LoginController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.sendRedirect("login.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();

        String username = req.getParameter("username");
        String password = req.getParameter("password");

        Users user = (new UsersDAO()).login(username, password);

        if (user == null) {
            req.setAttribute("errorMessage", "Wrong password or username!!!");
            req.getRequestDispatcher("login.jsp").forward(req, resp);
        } else {
            session.setAttribute("user", user);
            if ("admin".equals(user.getRole())) {
                resp.sendRedirect("customerAdmin");
            } else if ("user".equals(user.getRole())) {
                resp.sendRedirect("index.jsp");
            }
        }
    }
}
