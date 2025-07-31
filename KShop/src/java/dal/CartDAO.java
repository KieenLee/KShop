/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Cart;
import model.Shopping_Cart;
import java.sql.PreparedStatement;

/**
 *
 * @author LAZYVL
 */
public class CartDAO extends DBContext {

    public Vector<Cart> getCart() {
        Vector<Cart> vector = new Vector<>();
        String sql = "  SELECT s.id,s.user_id,s.product_id,p.name,s.quantity,s.price, s.statusCart FROM dbo.Shopping_Cart s JOIN dbo.Products p ON s.product_id = p.id";

        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                int userId = rs.getInt("user_id");
                int productId = rs.getInt("product_id");
                String productName = rs.getString("name");
                int quantity = rs.getInt("quantity");
                double price = rs.getDouble("price");
                int statusCart = rs.getInt("statusCart");
                vector.add(new Cart(id, userId, productId, productName, quantity, price, statusCart));

            }
            return vector;
        } catch (SQLException ex) {
            Logger.getLogger(CartDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public Vector<Cart> getCartByUserId(int userId) {
        Vector<Cart> vector = new Vector<>();
        String sql = "SELECT s.id, s.user_id, s.product_id, p.name, s.quantity, s.price, s.statusCart "
                + "FROM dbo.Shopping_Cart s "
                + "JOIN dbo.Products p ON s.product_id = p.id "
                + "WHERE s.user_id = ? AND  s.statusCart = 0";

        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, userId);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                int productId = rs.getInt("product_id");
                String productName = rs.getString("name");
                int quantity = rs.getInt("quantity");
                double price = rs.getDouble("price");
                int statusCart = rs.getInt("statusCart");
                vector.add(new Cart(id, userId, productId, productName, quantity, price, statusCart));
            }
        } catch (SQLException ex) {
            Logger.getLogger(CartDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return vector;
    }

    public Vector<Cart> getCheckOutByUserId(int userId) {
        Vector<Cart> vector = new Vector<>();
        String sql = "SELECT s.id, s.user_id, s.product_id, p.name, s.quantity, s.price, s.statusCart "
                + "FROM dbo.Shopping_Cart s "
                + "JOIN dbo.Products p ON s.product_id = p.id "
                + "WHERE s.user_id = ? AND  s.statusCart = 1";

        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, userId);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                int productId = rs.getInt("product_id");
                String productName = rs.getString("name");
                int quantity = rs.getInt("quantity");
                double price = rs.getDouble("price");
                int statusCart = rs.getInt("statusCart");
                vector.add(new Cart(id, userId, productId, productName, quantity, price, statusCart));
            }
        } catch (SQLException ex) {
            Logger.getLogger(CartDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return vector;
    }

    public int deleteCart(int id) {
        int n = 0;
        PreparedStatement stm = null;
        String sql = "DELETE FROM Shopping_Cart WHERE id = ?";
        try {
            stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            n = stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(CartDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public void deleteAllCartItemsByUser(int userId) {
        PreparedStatement stm = null;
        String sql = "DELETE FROM [Shopping_Cart] WHERE [user_id] = ?";
        try {
            stm = connection.prepareStatement(sql);
            stm.setInt(1, userId);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(CartDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void updateQuantityCart(int quantity, int cid) {
        String sql = "UPDATE dbo.Shopping_Cart SET quantity = ? WHERE id = ?";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, quantity);
            stm.setInt(2, cid);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(CartDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public Cart getCartItemByUserAndProduct(int userId, int productId) {
        String sql = "SELECT s.id, s.user_id, s.product_id, p.name, s.quantity, s.price, s.statusCart "
                + "FROM dbo.Shopping_Cart s JOIN dbo.Products p ON s.product_id = p.id "
                + "WHERE s.user_id = ? AND s.product_id = ? AND s.statusCart = 0";

        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, userId);
            stm.setInt(2, productId);

            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                int id = rs.getInt("id");
                String productName = rs.getString("name");
                int quantity = rs.getInt("quantity");
                double price = rs.getDouble("price");
                int statusCart = rs.getInt("statusCart");
                return new Cart(id, userId, productId, productName, quantity, price, statusCart);
            }
        } catch (SQLException ex) {
            Logger.getLogger(CartDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public void updateCartStatus(int userId, int newStatus) {
        String sql = "UPDATE Shopping_Cart SET statusCart = ? WHERE user_id = ? AND statusCart = 0";

        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, newStatus);
            stm.setInt(2, userId);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(CartDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void updateCheckOut(int userId, int newStatus) {
        String sql = "UPDATE Shopping_Cart SET statusCart = ? WHERE user_id = ? AND statusCart = 1";

        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, newStatus);
            stm.setInt(2, userId);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(CartDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public Vector<Cart> getCartByUserIdAndStatus(int userId, int status) {
        Vector<Cart> vector = new Vector<>();
        String sql = "SELECT s.id, s.user_id, s.product_id, p.name, s.quantity, s.price, s.statusCart "
                + "FROM Shopping_Cart s "
                + "JOIN Products p ON s.product_id = p.id "
                + "WHERE s.user_id = ? AND s.statusCart = ?";

        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, userId);
            stm.setInt(2, status);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                int productId = rs.getInt("product_id");
                String productName = rs.getString("name");
                int quantity = rs.getInt("quantity");
                double price = rs.getDouble("price");
                int statusCart = rs.getInt("statusCart");
                vector.add(new Cart(id, userId, productId, productName, quantity, price, statusCart));
            }
        } catch (SQLException ex) {
            Logger.getLogger(CartDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return vector;
    }

    public static void main(String[] args) {
        CartDAO dao = new CartDAO();
        Vector<Cart> vector = dao.getCart();
        for (Cart cart : vector) {
            System.out.println(cart);
        }

    }
}
