package controller;

import dal.UsersDAO;
import java.io.IOException;
import java.util.Vector;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Users;

@WebServlet("/customerAdmin")
public class CustomerManagementController extends HttpServlet {

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
            service = "listAllCustomer";
        }

        if (service.equals("listAllCustomer")) {
            Users user = (Users) session.getAttribute("user");

            Vector<Users> vectorUser = daoUser.getAllCustomer();

            request.setAttribute("dataCustomer", vectorUser);
            request.getRequestDispatcher("admin_customer.jsp").forward(request, response);
        }
        if (service.equals("add")) {
            Users customer = new Users();
            customer.setUserName(request.getParameter("name"));
            customer.setPassword(""); // Password should be handled securely
            customer.setName(request.getParameter("name"));
            customer.setEmail(request.getParameter("email"));
            customer.setPhone(request.getParameter("phone"));
            customer.setDob(java.sql.Date.valueOf(request.getParameter("dob")));
            customer.setAddress(request.getParameter("address"));
            customer.setRole("user");
            daoUser.insertUser(customer);
            response.sendRedirect("customerAdmin");
        }
        if (service.equals("update")) {
            Users customer = new Users();
            customer.setId(Integer.parseInt(request.getParameter("id")));
            customer.setName(request.getParameter("name"));
            customer.setEmail(request.getParameter("email"));
            customer.setPhone(request.getParameter("phone"));
            customer.setDob(java.sql.Date.valueOf(request.getParameter("dob")));
            customer.setAddress(request.getParameter("address"));
            daoUser.updateUser(customer);
            response.sendRedirect("customerAdmin");
        }
        if (service.equals("delete")) {
            int id = Integer.parseInt(request.getParameter("id"));
            daoUser.deleteUser(id);
            response.sendRedirect("customerAdmin");
        }
        if (service.equals("search")) {
            String searchName = request.getParameter("searchName");
            Vector<Users> vectorUser = daoUser.getCustomerByName(searchName);

            request.setAttribute("dataCustomer", vectorUser);
            request.getRequestDispatcher("admin_customer.jsp").forward(request, response);
        }
        if (service.equals("detail")) {
            int id = Integer.parseInt(request.getParameter("id"));
            Users user = daoUser.getUsersById(id);

            request.setAttribute("userDetail", user);
            request.getRequestDispatcher("user_detail.jsp").forward(request, response);
        }
    }
}
