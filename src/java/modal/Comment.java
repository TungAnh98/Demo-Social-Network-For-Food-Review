/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modal;

/**
 *
 * @author phamtunganh
 */
public class Comment extends IModal{
    private User user;
    private Post post;
    private String cmt;

    public Comment() {
    }

    public Comment(User user, Post post, String cmt) {
        this.user = user;
        this.post = post;
        this.cmt = cmt;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Post getPost() {
        return post;
    }

    public void setPost(Post post) {
        this.post = post;
    }

    public String getCmt() {
        return cmt;
    }

    public void setCmt(String cmt) {
        this.cmt = cmt;
    }
    
    
}
