/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.CategoriesDAO;
import dal.ProductsDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.Vector;
import model.Categories;
import model.Products;

@WebServlet("/shop")
public class ShopController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ProductsDAO daoProduct = new ProductsDAO();
        CategoriesDAO daoCategoies = new CategoriesDAO();

        String service = request.getParameter("service");

        if (service == null) {
            service = "listAllProduct";
        }
        if (service.equals("listAllProduct")) {
            Vector<Products> vectorP = daoProduct.getAll();
            Vector<Categories> vectorC = daoCategoies.getAll();

            request.setAttribute("dataProduct", vectorP);
            request.setAttribute("dataCategories", vectorC);
            request.getRequestDispatcher("shop.jsp").forward(request, response);
        }
        if (service.equals("searchId")) {
            int cateId = Integer.parseInt(request.getParameter("cateId"));

            Vector<Products> vectorP = daoProduct.getProductsByBrand(cateId);
            Vector<Categories> vectorC = daoCategoies.getAll();

            request.setAttribute("dataProduct", vectorP);
            request.setAttribute("dataCategories", vectorC);
            request.getRequestDispatcher("shop.jsp").forward(request, response);
        } else if (service.equals("searchByName")) {
            String keyword = request.getParameter("keyword");

            // Kiểm tra nếu keyword rỗng hoặc null thì hiển thị toàn bộ sản phẩm
            Vector<Products> vectorP;
            if (keyword == null || keyword.trim().isEmpty()) {
                vectorP = daoProduct.getAll();
            } else {
                vectorP = daoProduct.getProductsByKeywords(keyword);
            }

            Vector<Categories> vectorC = daoCategoies.getAll();

            request.setAttribute("dataProduct", vectorP);
            request.setAttribute("dataCategories", vectorC);
            request.setAttribute("keyword", keyword); // Giữ lại keyword để hiển thị lại trong ô tìm kiếm
            request.getRequestDispatcher("shop.jsp").forward(request, response);
        } else if (service.equals("searchId")) {
            int cateId = Integer.parseInt(request.getParameter("cateId"));

            Vector<Products> vectorP = daoProduct.getProductsByBrand(cateId);
            Vector<Categories> vectorC = daoCategoies.getAll();

            request.setAttribute("dataProduct", vectorP);
            request.setAttribute("dataCategories", vectorC);
            request.getRequestDispatcher("shop.jsp").forward(request, response);
        }
    }

}

