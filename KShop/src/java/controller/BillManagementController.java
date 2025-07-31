package controller;

import dal.Order_DetailDAO;
import dal.OrdersDAO;
import dal.UsersDAO;
import java.io.IOException;
import java.util.Vector;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Bill;
import model.Order_Detail;
import model.Orders;
import model.Users;

@WebServlet("/billAdmin")
public class BillManagementController extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        UsersDAO daoUser = new UsersDAO();
        OrdersDAO daoOrder = new OrdersDAO();
        Order_DetailDAO daoOrderDetail = new Order_DetailDAO();
        String service = request.getParameter("service");

        if (service == null) {
            service = "listAllBill";
        }

        if (service.equals("listAllBill")) {
            Vector<Orders> vectorOrder = daoOrder.getOrders();
            Vector<Users> vectorUsers = daoUser.getAllUser();

            request.setAttribute("dataBill", vectorOrder);
            request.setAttribute("dataUsers", vectorUsers);
            request.getRequestDispatcher("admin_bill.jsp").forward(request, response);
        }

        if (service.equals("detail")) {
            int id = Integer.parseInt(request.getParameter("id"));
            Orders order = daoOrder.getOrderById(id);
            Users user = daoUser.getUsersById(order.getUserId());
            Vector<Bill> orderBill = daoOrderDetail.getOrderDetailsByOrderId(id);

            request.setAttribute("order", order);
            request.setAttribute("user", user);
            request.setAttribute("orderDetails", orderBill);
            request.getRequestDispatcher("order_detail.jsp").forward(request, response);
        }

        if (service.equals("delete")) {
            int id = Integer.parseInt(request.getParameter("id"));
            daoOrder.deleteOrder(id);
            daoOrderDetail.deleteOrderDetailsByOrderId(id);
            response.sendRedirect("billAdmin");
        }

        if (service.equals("search")) {
            String searchName = request.getParameter("searchName");
            Vector<Orders> vectorOrder = daoOrder.getOrderByName(searchName);
            Vector<Users> vectorUsers = daoUser.getAllUser();

            request.setAttribute("dataBill", vectorOrder);
            request.setAttribute("dataUsers", vectorUsers);
            request.getRequestDispatcher("admin_bill.jsp").forward(request, response);
        }
        if (service.equals("updateStatus")) {
            int id = Integer.parseInt(request.getParameter("id"));
            String status = request.getParameter("status");
            daoOrder.updateOrderStatus(id, status);
            response.sendRedirect("billAdmin");
        }
    }
}
