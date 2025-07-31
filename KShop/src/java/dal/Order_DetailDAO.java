/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Cart;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;
import model.Bill;
import model.Order_Detail;
import model.Orders;

public class Order_DetailDAO extends DBContext {

    public void insertOrderDetailsFromCart(int userId, int orderId) {
        try {
            // Lấy danh sách sản phẩm từ Shopping_Cart của user
            String selectCartSQL = "SELECT product_id, quantity, price FROM Shopping_Cart WHERE user_id = ? AND statusCart = 1";
            PreparedStatement psSelect = connection.prepareStatement(selectCartSQL);
            psSelect.setInt(1, userId);
            ResultSet rs = psSelect.executeQuery();

            // Chèn từng sản phẩm vào Order_Detail
            String insertOrderDetailSQL = "INSERT INTO Order_Detail (order_id, product_id, quantity, price) VALUES (?, ?, ?, ?)";
            PreparedStatement psInsert = connection.prepareStatement(insertOrderDetailSQL);

            while (rs.next()) {
                int productId = rs.getInt("product_id");
                int quantity = rs.getInt("quantity");
                double price = rs.getDouble("price");

                psInsert.setInt(1, orderId);
                psInsert.setInt(2, productId);
                psInsert.setInt(3, quantity);
                psInsert.setDouble(4, price);
                psInsert.addBatch(); // Thêm vào batch để tối ưu insert
            }

            psInsert.executeBatch(); // Thực hiện batch insert

//            // Xóa giỏ hàng sau khi đã chuyển sang Order_Detail
//            String deleteCartSQL = "DELETE FROM Shopping_Cart WHERE user_id = ? AND statusCart = 1";
//            PreparedStatement psDelete = connection.prepareStatement(deleteCartSQL);
//            psDelete.setInt(1, userId);
//            psDelete.executeUpdate();
            // Đóng kết nối
            rs.close();
            psSelect.close();
            psInsert.close();
//            psDelete.close();

        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    public Vector<Bill> getOrderDetailsByOrderId(int orderId) {
        Vector<Bill> orderBill = new Vector<>();
        try {
            String sql = "SELECT od.product_id, od.quantity, od.price, od.total_price, p.image "
                    + "FROM Order_Detail od "
                    + "JOIN Products p ON od.product_id = p.id "
                    + "WHERE od.order_id = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, orderId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                int productId = rs.getInt("product_id");
                int quantity = rs.getInt("quantity");
                double price = rs.getDouble("price");
                double totalPrice = rs.getDouble("total_price");
                String image = rs.getString("image");

                orderBill.add(new Bill(orderId, productId, quantity, price, totalPrice, image));
            }

            rs.close();
            ps.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return orderBill;
    }

    public void deleteOrderDetailsByOrderId(int orderId) {
        PreparedStatement stm = null;
        String sql = "DELETE FROM [Order_Detail] WHERE order_id = ?";
        try {
            stm = connection.prepareStatement(sql);
            stm.setInt(1, orderId);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(Order_DetailDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                if (stm != null) {
                    stm.close();
                }
            } catch (SQLException ex) {
                Logger.getLogger(Order_DetailDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }
}
