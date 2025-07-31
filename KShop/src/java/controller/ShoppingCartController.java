/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.CartDAO;
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
import java.util.Enumeration;
import java.util.Vector;
import model.Cart;
import model.Orders;
import model.Shopping_Cart;
import model.Users;

/**
 *
 * @author LAZYVL
 */
@WebServlet("/Cart")
public class ShoppingCartController extends HttpServlet {

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
        OrdersDAO daoOrder = new OrdersDAO();
        Shopping_CartDAO daoShoppingCart = new Shopping_CartDAO();
        String service = request.getParameter("service");

        if (service == null) {
            service = "listAllCart";
        }
        if (service.equals("add2Cart")) {
            int pid = Integer.parseInt(request.getParameter("pid"));
            Users user = (Users) session.getAttribute("user");
            double price = Double.parseDouble(request.getParameter("price"));

            Cart existingItem = daoCart.getCartItemByUserAndProduct(user.getId(), pid);

            if (existingItem != null) {
                int newQuantity = existingItem.getQuantity();
                if (newQuantity >= 5) {
                    newQuantity += 3;
                } else {
                    newQuantity += 2;
                }
                daoCart.updateQuantityCart(newQuantity, existingItem.getId());
            } else {
                int n = daoShoppingCart.addShoppingCart(new Shopping_Cart(user.getId(), pid, 1, price, 0));
            }

            response.sendRedirect("Cart?service=listAllCart");
        }
        if (service.equals("listAllCart")) {
            Users user = (Users) session.getAttribute("user");
            Vector<Cart> vectorCart = daoCart.getCartByUserId(user.getId());

            request.setAttribute("dataCart", vectorCart);
            request.getRequestDispatcher("cart.jsp").forward(request, response);

        }
        if (service.equals("deleteCart")) {
            int cid = Integer.parseInt(request.getParameter("cid"));

            daoCart.deleteCart(cid);
            response.sendRedirect("Cart?service=listAllCart");
        }
        if (service.equals("updateCart")) {
            Enumeration<String> paramNames = request.getParameterNames();

            while (paramNames.hasMoreElements()) {
                String paramName = paramNames.nextElement();

                if (paramName.startsWith("quantity_")) {
                    int cid = Integer.parseInt(paramName.substring(9));

                    int quantity = Integer.parseInt(request.getParameter(paramName));

                    if (quantity <= 0) {
                        quantity = 1;
                    }

                    daoCart.updateQuantityCart(quantity, cid);
                }
            }

            response.sendRedirect("Cart?service=listAllCart");
        }
        if (service.equals("checkout")) {
            Users user = (Users) session.getAttribute("user");

            // Cập nhật statusCart = 1 cho các sản phẩm có statusCart = 0 của user
            daoCart.updateCartStatus(user.getId(), 1);

            // Lấy danh sách sản phẩm đã cập nhật để hiển thị trong checkout.jsp
            Vector<Cart> vectorCart = daoCart.getCartByUserIdAndStatus(user.getId(), 1);

            request.setAttribute("checkoutCart", vectorCart);
            request.getRequestDispatcher("checkout.jsp").forward(request, response);
        }

    }
}
