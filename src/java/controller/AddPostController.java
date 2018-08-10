/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dal.CategoryContext;
import dal.PostContext;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modal.Category;

import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpSession;
import modal.Post;
import modal.User;
import org.apache.commons.fileupload.DefaultFileItemFactory;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author phamtunganh
 */
@MultipartConfig
public class AddPostController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AddPostController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddPostController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        CategoryContext catContext = new CategoryContext();
        ArrayList<Category> cateList = catContext.getAll();
        request.setAttribute("catelist", cateList);
        request.getRequestDispatcher("addpost.jsp").forward(request, response);
        
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=UTF-8");
        String filePath = request.getParameter("urlpath");
        String title = request.getParameter("title");
        String imgPath = request.getParameter("urlpath");
        String location = request.getParameter("location");
        String price = request.getParameter("price");
        String category = request.getParameter("category");
        String review = request.getParameter("review");
        HttpSession session = request.getSession();
        String userId = (String) session.getAttribute("userId");
        PostContext pContext = new PostContext();
        
        Post insertPost = new Post();
        insertPost.setTitle(title);
        insertPost.setImageUrl(imgPath);
        insertPost.setDescription(review);
        insertPost.setAddress(location);
        insertPost.setGrade(0);
        insertPost.setPrice(Integer.parseInt(price));
        Category cate = new Category();
        cate.setCateId(Integer.parseInt(category));
        insertPost.setCategory(cate);
        User u = new User();
        u.setUserId(Integer.parseInt(userId));
        insertPost.setUser(u);
        
        boolean insert = pContext.insert(insertPost);
        String status = (String) session.getAttribute("status");
        if(status.equals("allpost")){
            response.sendRedirect("viewlist");
        }
        else{
            response.sendRedirect("listofuser");
        }
        
        
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
