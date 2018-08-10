/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package test;

import dal.PostContext;
import dal.UserContext;
import modal.Post;
import modal.User;

/**
 *
 * @author phamtunganh
 */
public class TestDriver {
    public static void main(String[] args){
        String str = "/AssignmentJavaWeb/image/211.jpg";
        System.out.println(str.substring(str.lastIndexOf("/")+1, str.lastIndexOf(".")));
    }
}
