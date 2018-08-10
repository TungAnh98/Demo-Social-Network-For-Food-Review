/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dal.CategoryContext;
import dal.PostContext;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modal.Category;
import modal.Post;
import modal.User;

/**
 *
 * @author phamtunganh
 */
public class UpdatePostController extends HttpServlet {

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
            out.println("<title>Servlet UpdatePostController</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdatePostController at " + request.getContextPath() + "</h1>");
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
        String postid = request.getParameter("postid");
        System.out.println("Update id: "+ postid);
        PostContext pContext = new PostContext();
        Post post = pContext.get(Integer.parseInt(postid));
        request.setAttribute("post", post);
        HttpSession sessionupdate = request.getSession();
        sessionupdate.setAttribute("postupdateid", postid);
        sessionupdate.setAttribute("updatepost", post);
        CategoryContext catContext = new CategoryContext();
        ArrayList<Category> cateList = catContext.getAll();
        request.setAttribute("catelist", cateList);
        
        request.getRequestDispatcher("updatepost.jsp").forward(request, response);
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
        HttpSession sessionupdate = request.getSession();
        String postId = (String) sessionupdate.getAttribute("postupdateid");
        PostContext pContext = new PostContext();
        
        Post updatePost = new Post();
        updatePost.setId(Integer.parseInt(postId));
        updatePost.setTitle(title);
        updatePost.setImageUrl(imgPath);
        updatePost.setDescription(review);
        updatePost.setAddress(location);
        updatePost.setGrade(0);
        updatePost.setPrice(Integer.parseInt(price));
        Category cate = new Category();
        cate.setCateId(Integer.parseInt(category));
        updatePost.setCategory(cate);
        User u = new User();
        u.setUserId(Integer.parseInt(userId));
        updatePost.setUser(u);
        
        boolean update = pContext.update(updatePost);
        String status = (String) session.getAttribute("status");
        if (status.equals("allpost")) {
            response.sendRedirect("viewlist");
        } else {
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
