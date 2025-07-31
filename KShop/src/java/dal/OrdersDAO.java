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
import model.Orders;

public class OrdersDAO extends DBContext {

    public int insertOrder(Orders other) {
        PreparedStatement stm = null;
        ResultSet rs = null;
        int orderId = -1; // Giá trị mặc định nếu không lấy được ID

        String sql = "INSERT INTO [dbo].[Orders] ([user_id], [total_price], [status]) VALUES (?, ?, 'processing')";
        try {
            stm = connection.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS);
            stm.setInt(1, other.getUserId());
            stm.setDouble(2, other.getTotalPrice());
            stm.executeUpdate();

            // Lấy order_id vừa tạo
            rs = stm.getGeneratedKeys();
            if (rs.next()) {
                orderId = rs.getInt(1);
            }
        } catch (SQLException ex) {
            Logger.getLogger(OrdersDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return orderId;
    }

    public int insertOrderAndGetId(Orders other) throws SQLException {
        PreparedStatement stm = null;
        ResultSet rs = stm.executeQuery();
        int generatedId = -1;

        String sql = "INSERT INTO [dbo].[Orders]\n"
                + "           ([user_id]\n"
                + "           ,[total_price]\n"
                + "           ,[status])\n"
                + "     VALUES\n"
                + "           (?,?,?); SELECT SCOPE_IDENTITY();";
        try {
            stm = connection.prepareStatement(sql);
            stm.setInt(1, other.getUserId());
            stm.setDouble(2, other.getTotalPrice());
            stm.setString(3, "Pending");

            if (rs.next()) {
                generatedId = rs.getInt(1);
            }

        } catch (SQLException ex) {
            Logger.getLogger(OrdersDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return generatedId;
    }

    public Orders getOrderById(int orderId) {
        Orders order = null;
        PreparedStatement stm = null;
        ResultSet rs = null;

        String sql = "SELECT * FROM [Orders] WHERE id = ?";
        try {
            stm = connection.prepareStatement(sql);
            stm.setInt(1, orderId);
            rs = stm.executeQuery();

            if (rs.next()) {
                order = new Orders(
                        rs.getInt("id"),
                        rs.getInt("user_id"),
                        rs.getDouble("total_price"),
                        rs.getString("status")
                );
            }
        } catch (SQLException ex) {
            Logger.getLogger(OrdersDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return order;
    }

    public Vector<Orders> getOrderByName(String userName) {
        Vector<Orders> orders = new Vector<>();
        PreparedStatement stm = null;
        ResultSet rs = null;

        String sql = "SELECT o.id, o.user_id, o.total_price, o.status "
                + "FROM [FashionShop].[dbo].[Orders] o JOIN [FashionShop].[dbo].[Users] u ON o.user_id = u.id "
                + "WHERE u.name LIKE ?";
        try {
            stm = connection.prepareStatement(sql);
            stm.setString(1, "%" + userName + "%");
            rs = stm.executeQuery();

            while (rs.next()) {
                Orders order = new Orders(
                        rs.getInt("id"),
                        rs.getInt("user_id"),
                        rs.getDouble("total_price"),
                        rs.getString("status")
                );
                orders.add(order);
            }
        } catch (SQLException ex) {
            Logger.getLogger(OrdersDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return orders;
    }

    public Vector<Orders> getOrders() {
        Vector<Orders> orders = new Vector<>();
        PreparedStatement stm = null;
        ResultSet rs = null;

        String sql = "SELECT * FROM [Orders]";
        try {
            stm = connection.prepareStatement(sql);
            rs = stm.executeQuery();

            while (rs.next()) {
                Orders order = new Orders(
                        rs.getInt("id"),
                        rs.getInt("user_id"),
                        rs.getDouble("total_price"),
                        rs.getString("status")
                );
                orders.add(order);
            }
        } catch (SQLException ex) {
            Logger.getLogger(OrdersDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return orders;
    }

    public void updateOrderStatus(int orderId, String status) {
        PreparedStatement stm = null;
        String sql = "UPDATE [Orders] SET status = ? WHERE id = ?";
        try {
            stm = connection.prepareStatement(sql);
            stm.setString(1, status);
            stm.setInt(2, orderId);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(OrdersDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void deleteOrder(int orderId) {
        PreparedStatement stm = null;
        String sql = "DELETE FROM [Orders] WHERE id = ?";
        try {
            stm = connection.prepareStatement(sql);
            stm.setInt(1, orderId);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(OrdersDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                if (stm != null) {
                    stm.close();
                }
            } catch (SQLException ex) {
                Logger.getLogger(OrdersDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }
    
}
