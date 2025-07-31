package controller;

import dal.ProductsDAO;
import dal.UsersDAO;
import java.io.IOException;
import java.util.Vector;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Products;
import model.Users;

@WebServlet("/productAdmin")
public class ProductManagementController extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        UsersDAO daoUser = new UsersDAO();
        ProductsDAO daoProduct = new ProductsDAO();
        String service = request.getParameter("service");

        if (service == null) {
            service = "listAllProduct";
        }

        if (service.equals("listAllProduct")) {
            Users user = (Users) session.getAttribute("user");

            Vector<Products> vectorProduct = daoProduct.getAll();

            request.setAttribute("dataProduct", vectorProduct);
            request.getRequestDispatcher("admin_product.jsp").forward(request, response);
        }
        if (service.equals("add")) {
            Products product = new Products();
            product.setName(request.getParameter("name"));
            product.setPrice(Double.parseDouble(request.getParameter("price")));
            product.setStock(Integer.parseInt(request.getParameter("stock")));
            product.setCategoryId(Integer.parseInt(request.getParameter("category_id")));
            product.setImage(request.getParameter("image"));
            product.setCategory_type(request.getParameter("category_type"));
            daoProduct.insertProduct(product);
            response.sendRedirect("productAdmin");
        }
        if (service.equals("update")) {
            int id = Integer.parseInt(request.getParameter("id"));
            Products product = new Products();
            product.setName(request.getParameter("name"));
            product.setPrice(Double.parseDouble(request.getParameter("price")));
            product.setStock(Integer.parseInt(request.getParameter("stock")));
            product.setCategoryId(Integer.parseInt(request.getParameter("category_id")));
            product.setImage(request.getParameter("image"));
            product.setCategory_type(request.getParameter("category_type"));
            daoProduct.updateProduct(product, id);
            response.sendRedirect("productAdmin");
        }
        if (service.equals("delete")) {
            int id = Integer.parseInt(request.getParameter("id"));
            daoProduct.deleteProduct(id);
            response.sendRedirect("productAdmin");
        }
        if (service.equals("search")) {
            String searchName = request.getParameter("searchName");
            Vector<Products> vectorProduct = daoProduct.getProductsByKeywords(searchName);

            request.setAttribute("dataProduct", vectorProduct);
            request.getRequestDispatcher("admin_product.jsp").forward(request, response);
        }
    }
}
