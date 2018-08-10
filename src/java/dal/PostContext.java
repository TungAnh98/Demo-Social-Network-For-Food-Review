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
import modal.Post;
import modal.User;

/**
 *
 * @author phamtunganh
 */
public class PostContext extends DBContext<Post> {

    @Override
    public Post get(int id) {
        Post p = null;
        String query = "SELECT  [postId]\n"
                + "      ,[title]\n"
                + "      ,[imageUrl]\n"
                + "      ,[review]\n"
                + "      ,[locations]\n"
                + "      ,[grade]\n"
                + "      ,[price]\n"
                + "      ,[categoryId]\n" + ",userId"
                + "  FROM Post where postId=?";
        try {
            PreparedStatement stm = con.prepareStatement(query);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {

                int postId = rs.getInt("postId");
                String title = rs.getString("title");
                String imageUrl = rs.getString("imageUrl");
                String review = rs.getString("review");
                String locations = rs.getString("locations");
                float grade = rs.getFloat("grade");
                int price = rs.getInt("price");
                int categoryId = rs.getInt("categoryId");
                int userId = rs.getInt("userId");
                CategoryContext catContext = new CategoryContext();
                Category cate = catContext.get(categoryId);
                UserContext userContext = new UserContext();
                User user = userContext.get(userId);
                p = new Post(postId, title, imageUrl, locations, grade, review, price, cate, user);
            }
        } catch (SQLException ex) {
            Logger.getLogger(PostContext.class.getName()).log(Level.SEVERE, null, ex);
        }

        return p;
    }

    public ArrayList<Post> getAll() {
        ArrayList<Post> list = new ArrayList<>();
        String query = "SELECT  [postId]\n"
                + "      ,[title]\n"
                + "      ,[imageUrl]\n"
                + "      ,[review]\n"
                + "      ,[locations]\n"
                + "      ,[grade]\n"
                + "      ,[price]\n"
                + "      ,[categoryId]\n" + ",userId"
                + "  FROM Post";
        try {
            PreparedStatement stm = con.prepareStatement(query);

            ResultSet rs = stm.executeQuery();
            while (rs.next()) {

                int postId = rs.getInt("postId");
                String title = rs.getString("title");
                String imageUrl = rs.getString("imageUrl");
                String review = rs.getString("review");
                String locations = rs.getString("locations");
                float grade = rs.getFloat("grade");
                int price = rs.getInt("price");
                int categoryId = rs.getInt("categoryId");
                int userId = rs.getInt("userId");
                CategoryContext catContext = new CategoryContext();
                Category cate = catContext.get(categoryId);
                UserContext userContext = new UserContext();
                User user = userContext.get(userId);
                Post p = new Post(postId, title, imageUrl, locations, grade, review, price, cate, user);
                list.add(p);
            }
        } catch (SQLException ex) {
            Logger.getLogger(PostContext.class.getName()).log(Level.SEVERE, null, ex);
        }

        return list;
    }

    public ArrayList<Post> allPaging(int start, int end) {
        ArrayList<Post> list = new ArrayList<>();
        String query = "select rn,[postId] ,[title] ,[imageUrl]  ,[review]  ,[locations] ,[grade] ,[price] ,[categoryId] ,[userId]\n"
                + " from (    select ROW_NUMBER() over (order by postId desc) as rn, [postId]\n"
                + "      ,[title] ,[imageUrl],[review] ,[locations]\n"
                + "      ,[grade] ,[price] ,[categoryId]\n"
                + "      ,[userId] from Post  ) as x\n"
                + "                        where rn between ? and ? ";
        try {
            PreparedStatement statement = con.prepareStatement(query);
            statement.setInt(1, start);
            statement.setInt(2, end);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                int postId = rs.getInt("postId");
                String title = rs.getString("title");
                String imageUrl = rs.getString("imageUrl");
                String review = rs.getString("review");
                String locations = rs.getString("locations");
                float grade = rs.getFloat("grade");
                int price = rs.getInt("price");
                int categoryId = rs.getInt("categoryId");
                int userId = rs.getInt("userId");
                CategoryContext catContext = new CategoryContext();
                Category cate = catContext.get(categoryId);
                UserContext userContext = new UserContext();
                User user = userContext.get(userId);
                Post p = new Post(postId, title, imageUrl, locations, grade, review, price, cate, user);
                list.add(p);
            }
        } catch (SQLException ex) {
            Logger.getLogger(PostContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public int count() {
        String query = "SELECT COUNT(*) as TotalRows FROM Post";
        try {
            PreparedStatement statement = con.prepareStatement(query);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                return rs.getInt("TotalRows");
            }
        } catch (SQLException ex) {
            Logger.getLogger(PostContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    public ArrayList<Post> allPagingOfUser(User user, int start, int end) {
        ArrayList<Post> list = new ArrayList<>();
        String query = "select rn,[postId] ,[title] ,[imageUrl]  ,[review]  ,[locations] ,[grade] ,[price] ,[categoryId] ,[userId]\n"
                + " from (    select ROW_NUMBER() over (order by postId desc) as rn, [postId]\n"
                + "      ,[title] ,[imageUrl],[review] ,[locations]\n"
                + "      ,[grade] ,[price] ,[categoryId]\n"
                + "      ,[userId] from Post where userId = ?  ) as x\n"
                + "                        where rn between ? and ? ";
        try {
            PreparedStatement statement = con.prepareStatement(query);
            statement.setInt(1, user.getUserId());
            statement.setInt(2, start);
            statement.setInt(3, end);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                int postId = rs.getInt("postId");
                String title = rs.getString("title");
                String imageUrl = rs.getString("imageUrl");
                String review = rs.getString("review");
                String locations = rs.getString("locations");
                float grade = rs.getFloat("grade");
                int price = rs.getInt("price");
                int categoryId = rs.getInt("categoryId");
                int userId = rs.getInt("userId");
                CategoryContext catContext = new CategoryContext();
                Category cate = catContext.get(categoryId);
                UserContext userContext = new UserContext();
                Post p = new Post(postId, title, imageUrl, locations, grade, review, price, cate, user);
                list.add(p);
            }
        } catch (SQLException ex) {
            Logger.getLogger(PostContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
    
    public int countOfUser(User user) {
        String query = "SELECT COUNT(*) as TotalRows FROM Post where userId = ?";
        try {
            
            PreparedStatement statement = con.prepareStatement(query);
            statement.setInt(1, user.getUserId());
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                return rs.getInt("TotalRows");
            }
        } catch (SQLException ex) {
            Logger.getLogger(PostContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }
    
    public Post getHighestPostId(){
        Post post = null;
        String query = "select postId,userId from Post where postId=(select max(PostId)from Post)";
        try {
            PreparedStatement stm = con.prepareStatement(query);
            ResultSet rs = stm.executeQuery();
            if(rs.next()){
                post = new Post();
                post.setId(rs.getInt("postId"));
                User user = new User();
                user.setUserId(rs.getInt("userId"));
                post.setUser(user);
               
            }
        } catch (SQLException ex) {
            Logger.getLogger(PostContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return post;
    }
    
    public boolean insert(Post p){
        String query = "insert into Post (title,imageUrl,review,locations,grade,price,categoryId,userId)"
                + "values (?,?,?,?,?,?,?,?)";
        try {
            PreparedStatement stm = con.prepareStatement(query);
            stm.setString(1, p.getTitle());
            stm.setString(2, p.getImageUrl());
            stm.setString(3, p.getDescription());
            stm.setString(4, p.getAddress());
            stm.setFloat(5, p.getGrade());
            stm.setInt(6,p.getPrice());
            stm.setInt(7,p.getCategory().getCateId());
            stm.setInt(8,p.getUser().getUserId());
            stm.executeUpdate();
            return true;
            
        } catch (SQLException ex) {
            Logger.getLogger(PostContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
    
    public boolean update(Post p){
        
        
        String query = "update Post set title=?,imageUrl=?,review=?"
                + ",locations=?,grade=?,price=?,categoryId=?,userId=? where postId=?";
        try {
            PreparedStatement stm = con.prepareStatement(query);
            
            stm.setString(1, p.getTitle());
            stm.setString(2, p.getImageUrl());
            stm.setString(3, p.getDescription());
            stm.setString(4, p.getAddress());
            stm.setFloat(5, p.getGrade());
            stm.setInt(6,p.getPrice());
            stm.setInt(7,p.getCategory().getCateId());
            stm.setInt(8,p.getUser().getUserId());
            stm.setInt(9, p.getId());
            stm.executeUpdate();
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(PostContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return false;
    }
}

