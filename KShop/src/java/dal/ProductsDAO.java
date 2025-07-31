/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Vector;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Products;

public class ProductsDAO extends DBContext {

    public Vector<Products> getAll() {
        PreparedStatement stm = null;
        ResultSet rs = null;
        Vector<Products> products = new Vector<>();
        String sql = "SELECT * FROM Products";
        try {
            stm = connection.prepareStatement(sql);
            rs = stm.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                double price = rs.getDouble("price");
                int stock = rs.getInt("stock");
                int categoryId = rs.getInt("category_id");
                String image = rs.getString("image");
                String category_type = rs.getString("category_type");

                products.add(new Products(id, name, price, stock, categoryId, image, category_type));
            }
            return products;
        } catch (SQLException ex) {
            Logger.getLogger(ProductsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    //search by name
    public Vector<Products> getProductsByKeywords(String s) {
        PreparedStatement stm = null;
        ResultSet rs = null;
        Vector<Products> products = new Vector<>();
        String sql = "SELECT * FROM Products WHERE name LIKE ?";
        try {
            stm = connection.prepareStatement(sql);
            stm.setString(1, "%" + s + "%");
            rs = stm.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                double price = rs.getDouble("price");
                int stock = rs.getInt("stock");
                int categoryId = rs.getInt("category_id");
                String image = rs.getString("image");
                String category_type = rs.getString("category_type");

                products.add(new Products(id, name, price, stock, categoryId, image, category_type));
            }
            return products;
        } catch (SQLException ex) {
            Logger.getLogger(ProductsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public Vector<Products> getProductsByBrand(int brandId) {
        PreparedStatement stm = null;
        ResultSet rs = null;
        Vector<Products> products = new Vector<>();
        String sql = "SELECT * FROM Products WHERE category_id = ?";
        try {
            stm = connection.prepareStatement(sql);
            stm.setInt(1, brandId);
            rs = stm.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                double price = rs.getDouble("price");
                int stock = rs.getInt("stock");
                int categoryId = rs.getInt("category_id");
                String image = rs.getString("image");
                String category_type = rs.getString("category_type");

                products.add(new Products(id, name, price, stock, categoryId, image, category_type));
            }
            return products;
        } catch (SQLException ex) {
            Logger.getLogger(ProductsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public Products getProductsById(int productId) {
        PreparedStatement stm = null;
        ResultSet rs = null;
        Products product = null;
        String sql = "SELECT * FROM Products WHERE id = ?";
        try {
            stm = connection.prepareStatement(sql);
            stm.setInt(1, productId);
            rs = stm.executeQuery();
            if (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String description = rs.getString("description");
                double price = rs.getDouble("price");
                int stock = rs.getInt("stock");
                int categoryId = rs.getInt("category_id");
                String image = rs.getString("image");
                String category_type = rs.getString("category_type");

                product = new Products(id, name, price, stock, categoryId, image, category_type);
            }
            return product;
        } catch (SQLException ex) {
            Logger.getLogger(ProductsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public int insertProduct(Products p) {
        PreparedStatement stm = null;
        ResultSet rs = null;
        int generatedId = -1;
        String sql = "INSERT INTO Products (name, price, stock, category_id, image, category_type) VALUES (?, ?, ?, ?, ?, ?)";
        try {
            stm = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            stm.setString(1, p.getName());
            stm.setDouble(2, p.getPrice());
            stm.setInt(3, p.getStock());
            stm.setInt(4, p.getCategoryId());
            stm.setString(5, p.getImage());
            stm.setString(6, p.getCategory_type());
            stm.executeUpdate();

            // Lấy ID tự động tạo
            rs = stm.getGeneratedKeys();
            if (rs.next()) {
                generatedId = rs.getInt(1);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return generatedId;
    }

    public int updateProduct(Products p, int pid) {
        int n = 0;
        PreparedStatement stm = null;
        String sql = "UPDATE Products SET name = ?, price = ?, stock = ?, category_id = ?, image = ?, category_type = ? WHERE id = ?";
        try {
            stm = connection.prepareStatement(sql);
            stm.setString(1, p.getName());
            stm.setDouble(2, p.getPrice());
            stm.setInt(3, p.getStock());
            stm.setInt(4, p.getCategoryId());
            stm.setString(5, p.getImage());
            stm.setString(6, p.getCategory_type());
            stm.setInt(7, pid);
            n = stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ProductsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public int deleteProduct(int id) {
        int n = 0;
        PreparedStatement stm = null;
        String sql = "DELETE FROM Products WHERE id = ?";

        try {
            stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            n = stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ProductsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public static void main(String[] args) {
        ProductsDAO dao = new ProductsDAO();

        int n = dao.updateProduct(new Products("ok", 12, 2, 1, "abc.img", "men"), 1);
        System.out.println(n);
    }
}
