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
import model.Shopping_Cart;

public class Shopping_CartDAO extends DBContext {

    public Vector<Shopping_Cart> getAll() {
        PreparedStatement stm = null;
        ResultSet rs = null;
        Vector<Shopping_Cart> cart = new Vector<>();
        String sql = "SELECT * FROM Shopping_Cart";
        try {
            stm = connection.prepareStatement(sql);
            rs = stm.executeQuery();
            while (rs.next()) {
                int userId = rs.getInt("userId");
                int productId = rs.getInt("productId");
                int quantity = rs.getInt("quantity");
                double price = rs.getDouble("price");
                int statusCart = rs.getInt("statusCart");

                cart.add(new Shopping_Cart(userId, productId, quantity, price, statusCart));
            }
            return cart;
        } catch (SQLException ex) {
            Logger.getLogger(ProductsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public int addShoppingCart(Shopping_Cart other) {
        int n = 0;
        String sql = "INSERT INTO [dbo].[Shopping_Cart]\n"
                + "           ([user_id]\n"
                + "           ,[product_id]\n"
                + "           ,[quantity]\n"
                + "           ,[price]\n"
                + "           ,[statusCart])\n"
                + "     VALUES\n"
                + "           (?,?,?,?,0)";

        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, other.getUserId());
            stm.setInt(2, other.getProductId());
            stm.setInt(3, other.getQuantity());
            stm.setDouble(4, other.getPrice());

            n = stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(Shopping_CartDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public static void main(String[] args) {
        Shopping_CartDAO dao = new Shopping_CartDAO();
        int n = dao.addShoppingCart(new Shopping_Cart(2, 1, 1, 100000, 0));
        System.out.println(n);
    }
}
