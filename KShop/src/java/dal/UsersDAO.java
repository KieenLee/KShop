/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import model.Users;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;
import java.util.logging.Level;
import java.util.logging.Logger;

public class UsersDAO extends DBContext {

    public Users login(String inputUsername, String inputPassword) {
        PreparedStatement stm = null;
        ResultSet rs = null;
        String sql = "select * from Users where username = ? and password = ?";
        try {
            stm = connection.prepareStatement(sql);
            stm.setString(1, inputUsername);
            stm.setString(2, inputPassword);
            rs = stm.executeQuery();
            while (rs.next()) {
                Users u = new Users();
                u.setId(rs.getInt("id"));
                u.setUserName(rs.getString("userName"));
                u.setPassword(rs.getString("password"));
                u.setName(rs.getString("name"));
                u.setEmail(rs.getString("email"));
                u.setPhone(rs.getString("phone"));
                u.setDob(rs.getDate("dob"));
                u.setAddress(rs.getString("address"));
                u.setRole(rs.getString("role"));
                return u;
            }

        } catch (SQLException ex) {
            Logger.getLogger(UsersDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public Users register(Users user) {
        PreparedStatement stm = null;

        String sql = "INSERT INTO Users (userName, password, name, email, phone, dob, address, role) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            if (user.getUserName() != null && !user.getUserName().isEmpty()
                    && user.getPassword() != null && !user.getPassword().isEmpty()
                    && user.getRole() != null && !user.getRole().isEmpty()) {
                stm = connection.prepareStatement(sql);
                stm.setString(1, user.getUserName());
                stm.setString(2, user.getPassword());
                stm.setString(3, user.getName());
                stm.setString(4, user.getEmail());
                stm.setString(5, user.getPhone());
                stm.setDate(6, new java.sql.Date(user.getDob().getTime()));
                stm.setString(7, user.getAddress());
                stm.setString(8, user.getRole());
                stm.executeUpdate();
                System.out.println("Registration successful! Click here to login.");
            } else {
                System.out.println("Insert failed: Invalid data");
            }
        } catch (SQLException ex) {
            System.out.println("Insert failed");
            Logger.getLogger(UsersDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return user;
    }

    public Vector<Users> getAllUser() {
        PreparedStatement stm = null;
        ResultSet rs = null;
        Vector<Users> users = new Vector<>();
        String sql = "SELECT * FROM Users";
        try {
            stm = connection.prepareStatement(sql);
            rs = stm.executeQuery();
            while (rs.next()) {
                Users u = new Users();
                u.setId(rs.getInt("id"));
                u.setUserName(rs.getString("userName"));
                u.setPassword(rs.getString("password"));
                u.setName(rs.getString("name"));
                u.setEmail(rs.getString("email"));
                u.setPhone(rs.getString("phone"));
                u.setDob(rs.getDate("dob"));
                u.setAddress(rs.getString("address"));
                u.setRole(rs.getString("role"));
                users.add(u);
            }
            return users;
        } catch (SQLException ex) {
            Logger.getLogger(UsersDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public Vector<Users> getUserById(int uid) {
        PreparedStatement stm = null;
        ResultSet rs = null;
        Vector<Users> users = new Vector<>();
        String sql = "SELECT * FROM Users WHERE id = ?";
        try {
            stm = connection.prepareStatement(sql);
            stm.setInt(1, uid);
            rs = stm.executeQuery();
            while (rs.next()) {
                Users u = new Users();
                u.setId(rs.getInt("id"));
                u.setUserName(rs.getString("userName"));
                u.setPassword(rs.getString("password"));
                u.setName(rs.getString("name"));
                u.setEmail(rs.getString("email"));
                u.setPhone(rs.getString("phone"));
                u.setDob(rs.getDate("dob"));
                u.setAddress(rs.getString("address"));
                u.setRole(rs.getString("role"));
                users.add(u);
            }
            return users;
        } catch (SQLException ex) {
            Logger.getLogger(UsersDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public void insertUser(Users user) {
        PreparedStatement stm = null;

        String sql = "INSERT INTO Users (userName, password, name, email, phone, dob, address, role) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            stm = connection.prepareStatement(sql);
            stm.setString(1, user.getUserName());
            stm.setString(2, user.getPassword());
            stm.setString(3, user.getName());
            stm.setString(4, user.getEmail());
            stm.setString(5, user.getPhone());
            stm.setDate(6, new java.sql.Date(user.getDob().getTime()));
            stm.setString(7, user.getAddress());
            stm.setString(8, user.getRole());
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(UsersDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public Users getUsersById(int userId) {
        PreparedStatement stm = null;
        ResultSet rs = null;
        String sql = "SELECT * FROM Users WHERE id = ?";
        try {
            stm = connection.prepareStatement(sql);
            stm.setInt(1, userId);
            rs = stm.executeQuery();
            if (rs.next()) {
                Users u = new Users();
                u.setId(rs.getInt("id"));
                u.setUserName(rs.getString("userName"));
                u.setPassword(rs.getString("password"));
                u.setName(rs.getString("name"));
                u.setEmail(rs.getString("email"));
                u.setPhone(rs.getString("phone"));
                u.setDob(rs.getDate("dob"));
                u.setAddress(rs.getString("address"));
                u.setRole(rs.getString("role"));
                return u;
            }
        } catch (SQLException ex) {
            Logger.getLogger(UsersDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    //get all customer (role_id = 1)
    public Vector<Users> getAllCustomer() {
        PreparedStatement stm = null;
        ResultSet rs = null;
        Vector<Users> users = new Vector<>();
        String sql = "SELECT * FROM Users WHERE role = 'user'";
        try {
            stm = connection.prepareStatement(sql);
            rs = stm.executeQuery();
            while (rs.next()) {
                Users u = new Users();
                u.setId(rs.getInt("id"));
                u.setUserName(rs.getString("userName"));
                u.setPassword(rs.getString("password"));
                u.setName(rs.getString("name"));
                u.setEmail(rs.getString("email"));
                u.setPhone(rs.getString("phone"));
                u.setDob(rs.getDate("dob"));
                u.setAddress(rs.getString("address"));
                u.setRole(rs.getString("role"));
                users.add(u);
            }
            return users;
        } catch (SQLException ex) {
            Logger.getLogger(UsersDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public Vector<Users> getCustomerByName(String name) {
        PreparedStatement stm = null;
        ResultSet rs = null;
        Vector<Users> customers = new Vector<>();
        String sql = "SELECT * FROM Users WHERE role = 'user' AND name LIKE ?";
        try {
            stm = connection.prepareStatement(sql);
            stm.setString(1, "%" + name + "%");
            rs = stm.executeQuery();
            while (rs.next()) {
                Users u = new Users();
                u.setId(rs.getInt("id"));
                u.setUserName(rs.getString("userName"));
                u.setPassword(rs.getString("password"));
                u.setName(rs.getString("name"));
                u.setEmail(rs.getString("email"));
                u.setPhone(rs.getString("phone"));
                u.setDob(rs.getDate("dob"));
                u.setAddress(rs.getString("address"));
                u.setRole(rs.getString("role"));
                customers.add(u);
            }
            return customers;
        } catch (SQLException ex) {
            Logger.getLogger(UsersDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public void updateUser(Users user) {
        PreparedStatement stm = null;
        String sql = "UPDATE Users SET name = ?, email = ?, phone = ?, dob = ?, address = ? WHERE id = ?";
        try {
            stm = connection.prepareStatement(sql);
            stm.setString(1, user.getName());
            stm.setString(2, user.getEmail());
            stm.setString(3, user.getPhone());
            stm.setDate(4, new java.sql.Date(user.getDob().getTime()));
            stm.setString(5, user.getAddress());
            stm.setInt(6, user.getId());
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(UsersDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void deleteUser(int userId) {
        PreparedStatement stm = null;
        String sql = "DELETE FROM Users WHERE id = ?";
        try {
            stm = connection.prepareStatement(sql);
            stm.setInt(1, userId);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(UsersDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
