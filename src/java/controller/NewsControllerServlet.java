/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.AccountDAO;
import dal.NewsDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.Timestamp;
import model.Account;
import model.News;

/**
 *
 * @author Admin
 */
@WebServlet(name = "NewsControllerServlet", urlPatterns = {"/newsController"})
public class NewsControllerServlet extends HttpServlet {

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
            out.println("<title>Servlet NewsServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet NewsServlet at " + request.getContextPath() + "</h1>");
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
        AccountDAO ad = new AccountDAO();
        NewsDAO nd = new NewsDAO();
        HttpSession session = request.getSession();

        Integer idd = (Integer) session.getAttribute("id");
        int i = (idd != null) ? idd : -1;

        Account acc = ad.getAccountById(i);
        request.setAttribute("account", acc);
        request.setAttribute("allNews", nd.getAllNews());

        String action = request.getParameter("action");

        if (action != null && !action.equals("search")) {
            String idStr = request.getParameter("id");
            try {
                int id = Integer.parseInt(idStr);
                if (action.equals("delete")) {
                    nd.deleteNewsById(id);
                    response.sendRedirect("newsController");
                } else if (action.equals("update")) {
                    News n = nd.getNewsById(id);
                    request.setAttribute("currentNews", n);
                    request.getRequestDispatcher("newsController.jsp").forward(request, response);
                }
            } catch (Exception e) {
            }
        } else {
            request.getRequestDispatcher("newsController.jsp").forward(request, response);
        }
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
        String idStr = request.getParameter("id");
        String title = request.getParameter("title");
        String image = "image/news/" + request.getParameter("image");
        String content = request.getParameter("editor");
        String createdAtStr = request.getParameter("created_at");

        int id = -1;
        try {
            id = Integer.parseInt(idStr);
        } catch (Exception e) {
        }

        NewsDAO nd = new NewsDAO();
        String lp = "";
        boolean checkExisted = false;
        for (News o : nd.getAllNews()) {
            if (o.getId() == id) {
                checkExisted = true;
                if (image.equals("image/news/")) {
                    image = o.getImage();
                }
                break;
            }

        }

        try {
            if (checkExisted) {
                Timestamp created_at = Timestamp.valueOf(createdAtStr);
                News n = new News(id, title, content, image, created_at, new Timestamp(System.currentTimeMillis()));
                nd.updateNews(n);
            } else {
                News n = new News(title, content, image, new Timestamp(System.currentTimeMillis()));
                nd.addNews(n);
            }

            response.sendRedirect("newsController");

        } catch (Exception e) {

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
