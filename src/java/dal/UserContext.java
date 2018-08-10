/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import modal.Category;
import modal.User;

/**
 *
 * @author phamtunganh
 */
public class UserContext extends DBContext<User> {

    @Override
    public User get(int id) {
        User user = null;
        String query = "SELECT [userId]\n"
                + "      ,[username]\n"
                + "      ,[pass]\n"
                + "      ,[authority]\n"
                + "  FROM [AssignmentJavaNet].[dbo].[UserLogin] where userId=?";
        PreparedStatement stm;
        try {
            stm = con.prepareStatement(query);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                int userId = rs.getInt("userId");
                String username = rs.getString("username");
                String pass = rs.getString("pass");
                boolean autho = rs.getBoolean("authority");
                user = new User(username, userId, pass, autho);
            }
        } catch (SQLException ex) {
            Logger.getLogger(CategoryContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return user;

    }

    public User login(String username, String password) {
        User user = null;
        String query = "select userId,username,pass,authority from UserLogin where username=? and pass=?";
        try {
            PreparedStatement stm = con.prepareStatement(query);
            stm.setString(1, username);
            stm.setString(2, password);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                int id = rs.getInt("userId");
                String uname = rs.getString("username");
                String pass = rs.getString("pass");
                boolean autho = rs.getBoolean("authority");
                user = new User(username, id, password, autho);
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return user;
    }

    public User checkSignup(String username) {
        User user = null;
        String query = "select userId,username,pass,authority from UserLogin where username=?";
        try {
            PreparedStatement stm = con.prepareStatement(query);
            stm.setString(1, username);

            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                user = new User();
                user.setUsername(rs.getString("username"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return user;
    }

    public void insert(User user) {
        String query = "insert into UserLogin(username,pass,authority) values (?,?,0)";
        PreparedStatement stm;
        try {
            stm = con.prepareStatement(query);
            stm.setString(1, user.getUsername());
            stm.setString(2, user.getPassword());
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(UserContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }

}
