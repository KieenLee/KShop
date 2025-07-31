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
import model.Categories;
import model.Products;

public class CategoriesDAO extends DBContext {

    public Vector<Categories> getAll() {
        PreparedStatement stm = null;
        ResultSet rs = null;
        Vector<Categories> categories = new Vector<>();
        String sql = "SELECT * FROM Categories";
        try {
            stm = connection.prepareStatement(sql);
            rs = stm.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");

                categories.add(new Categories(id, name));
            }
            return categories;
        } catch (SQLException ex) {
            Logger.getLogger(ProductsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

}
