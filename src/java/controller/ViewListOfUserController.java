/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dal.CommentContext;
import dal.PostContext;
import dal.UserContext;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modal.Comment;
import modal.Post;
import modal.User;

/**
 *
 * @author phamtunganh
 */
public class ViewListOfUserController extends HttpServlet {

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
            out.println("<title>Servlet ViewListOfUserController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ViewListOfUserController at " + request.getContextPath() + "</h1>");
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
        User user=new User();
        String userId = request.getParameter("userid");
        if (userId != null) {
            UserContext uContext = new UserContext();
            user = uContext.get(Integer.parseInt(userId));
        } else {
            HttpSession session = request.getSession();
            user = (User) session.getAttribute("user");
            session.setAttribute("status", "oneuser");
        }

        PostContext pContext = new PostContext();
        CommentContext cContext = new CommentContext();
        ArrayList<Comment> cmtlist = cContext.getAll();

        String strPagesize = this.getServletConfig().getInitParameter("pagesize");
        String strPageGap = this.getServletConfig().getInitParameter("pagegap");
        int pagesize = Integer.parseInt(strPagesize);
        String strPageIndex = request.getParameter("page");
        if (strPageIndex == null) {
            strPageIndex = "1";
        }
        int pageIndex = Integer.parseInt(strPageIndex);
        int totalrows = pContext.countOfUser(user);
        int totalpage = (totalrows / pagesize) + ((totalrows % pagesize != 0) ? 1 : 0);
        System.out.println(totalpage);
        int pagegap = Integer.parseInt(strPageGap);
        int start = pagesize * (pageIndex - 1) + 1;
        System.out.println(start);
        int end = start + pagesize - 1;
        System.out.println(end);
        ArrayList<Post> postlist = pContext.allPagingOfUser(user, start, end);
        request.setAttribute("postlist", postlist);
        request.setAttribute("totalpage", totalpage);
        request.setAttribute("pagegap", pagegap);
        request.setAttribute("pageindex", pageIndex);

        request.getRequestDispatcher("mainPage.jsp").forward(request, response);
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
        processRequest(request, response);
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
