/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.CartDAO;
import dal.Order_DetailDAO;
import dal.OrdersDAO;
import dal.Shopping_CartDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.Vector;
import model.Cart;
import model.Order_Detail;
import model.Orders;
import model.Users;

/**
 *
 * @author LAZYVL
 */
@WebServlet("/checkout")
public class CheckoutController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        CartDAO daoCart = new CartDAO();
        Shopping_CartDAO daoShoppingCart = new Shopping_CartDAO();
        OrdersDAO daoOrder = new OrdersDAO();
        Order_DetailDAO daoOrderDetail = new Order_DetailDAO();
        String service = request.getParameter("service");

        if (service == null) {
            service = "listAllCheckout";
        }

        if (service.equals("listAllCheckout")) {
            Users user = (Users) session.getAttribute("user");
            Vector<Cart> vectorCart = daoCart.getCartByUserIdAndStatus(user.getId(), 1);

            request.setAttribute("checkoutCart", vectorCart);
            request.getRequestDispatcher("checkout.jsp").forward(request, response);
        }
        if (service.equals("updateOrder")) {
            Users user = (Users) session.getAttribute("user");
            String totalPriceParam = request.getParameter("totalPrice");

            if (totalPriceParam != null && !totalPriceParam.isEmpty()) {
                double totalPrice = Double.parseDouble(totalPriceParam);

                // 1. Tạo đơn hàng mới với trạng thái "processing" và thêm vào Order_Detail
                int order_id = daoOrder.insertOrder(new Orders(user.getId(), totalPrice, "processing"));
                if (order_id != -1) {
                    daoOrderDetail.insertOrderDetailsFromCart(user.getId(), order_id);
                }
                // 2. Cập nhật trạng thái giỏ hàng (statusCart = 2)
                daoCart.updateCheckOut(user.getId(), 2);

                // 3. Chuyển hướng đến trang 
                response.sendRedirect("index.jsp");
            } else {
                // Nếu không có totalPrice, quay lại trang checkout
                response.sendRedirect("checkout?service=listAllCheckout");
            }
        }
    }
}
