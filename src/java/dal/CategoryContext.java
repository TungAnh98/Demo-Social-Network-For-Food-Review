/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import modal.Category;

/**
 *
 * @author phamtunganh
 */
public class CategoryContext extends DBContext<Category> {

    @Override
    public Category get(int id) {
        Category category = null;
        String query = "SELECT  [categoryId]\n"
                + "      ,[categoryName]\n"
                + "  FROM [AssignmentJavaNet].[dbo].[Category] where categoryId=?";
        PreparedStatement stm;
        try {
            stm = con.prepareStatement(query);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            if(rs.next()){
                int categoryId = rs.getInt("categoryId");
                String categoryName = rs.getString("categoryName");
                category = new Category(categoryId, categoryName);
            }
        } catch (SQLException ex) {
            Logger.getLogger(CategoryContext.class.getName()).log(Level.SEVERE, null, ex);
        }

        return category;
    }
    public ArrayList<Category> getAll() {
        ArrayList<Category> cateList = new ArrayList<>();
        String query = "SELECT  [categoryId]\n"
                + "      ,[categoryName]\n"
                + "  FROM [AssignmentJavaNet].[dbo].[Category] ";
        PreparedStatement stm;
        try {
            stm = con.prepareStatement(query);
         
            ResultSet rs = stm.executeQuery();
            while(rs.next()){
                int categoryId = rs.getInt("categoryId");
                String categoryName = rs.getString("categoryName");
                Category category = new Category(categoryId, categoryName);
                cateList.add(category);
            }
        } catch (SQLException ex) {
            Logger.getLogger(CategoryContext.class.getName()).log(Level.SEVERE, null, ex);
        }

        return cateList;
    }
}
