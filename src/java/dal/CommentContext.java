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
import modal.Comment;
import modal.Post;
import modal.User;

/**
 *
 * @author phamtunganh
 */
public class CommentContext extends DBContext<Comment> {

    @Override
    public Comment get(int id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    public ArrayList<Comment> getAll() {
        ArrayList<Comment> list = new ArrayList<>();
        PostContext pContext = new PostContext();
        UserContext uContext = new UserContext();
        String query = "SELECT [userId]\n"
                + "      ,[postId]\n"
                + "      ,[comment]\n"
                + "  FROM [AssignmentJavaNet].[dbo].[Comment]";
        try {
            PreparedStatement stm = con.prepareStatement(query);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                int userId = rs.getInt("userId");
                User u = uContext.get(userId);
                int postId = rs.getInt("postId");
                Post p = pContext.get(postId);
                String cmt = rs.getString("comment");
                Comment comment = new Comment(u, p, cmt);
                list.add(comment);
            }
        } catch (SQLException ex) {
            Logger.getLogger(CommentContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public ArrayList<Comment> getByPost(int Id) {
        ArrayList<Comment> list = new ArrayList<>();
        PostContext pContext = new PostContext();
        UserContext uContext = new UserContext();
        String query = "SELECT [userId]\n"
                + "      ,[postId]\n"
                + "      ,[comment]\n"
                + "  FROM [AssignmentJavaNet].[dbo].[Comment] where postId=? order by userId asc";
        try {
            PreparedStatement stm = con.prepareStatement(query);
            stm.setInt(1, Id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                int userId = rs.getInt("userId");
                User u = uContext.get(userId);
                int postId = rs.getInt("postId");
                Post p = pContext.get(postId);
                String cmt = rs.getString("comment");
                Comment comment = new Comment(u, p, cmt);
                list.add(comment);
            }
        } catch (SQLException ex) {
            Logger.getLogger(CommentContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public boolean insert(Comment c) {
        String query = "insert into Comment (userId,postId,comment)"
                + "values (?,?,?)";
        try {
            PreparedStatement stm = con.prepareStatement(query);
            stm.setInt(1, c.getUser().getUserId());
            stm.setInt(2, c.getPost().getId());
            stm.setString(3, c.getCmt());
            stm.executeUpdate();
            return true;

        } catch (SQLException ex) {
            Logger.getLogger(PostContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
}
