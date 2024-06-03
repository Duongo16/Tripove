/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.AccountDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.Timestamp;
import java.sql.Date;
import model.Account;

/**
 *
 * @author Admin
 */
@WebServlet(name = "infoUpdateServlet", urlPatterns = {"/infoUpdate"})
public class InfoUpdateServlet extends HttpServlet {

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
            out.println("<title>Servlet infoUpdateServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet infoUpdateServlet at " + request.getContextPath() + "</h1>");
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
        HttpSession session = request.getSession();

        Integer id = (Integer) session.getAttribute("id");
        int i = (id != null) ? id : -1;

        Account acc = ad.getAccountById(i);
        request.setAttribute("account", acc);
        request.getRequestDispatcher("infoUpdate.jsp").forward(request, response);
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
        HttpSession session = request.getSession();

        String id_raw = request.getParameter("id");
        String role = request.getParameter("role");
        String username = request.getParameter("username");
        String name = request.getParameter("name");
        String gender = request.getParameter("gender");
        String dateOfBirth = request.getParameter("dateOfBirth");
        String phoneNumber = request.getParameter("phoneNumber");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        String image = request.getParameter("image");
        String created_at = request.getParameter("created_at");
        int id = 0;
        int p = 0;
        Date dob = null;
        Timestamp ca = null;

        AccountDAO d = new AccountDAO();
        try {
            id = Integer.parseInt(id_raw);
            p = Integer.parseInt(phoneNumber);
            dob = Date.valueOf(dateOfBirth);
            ca = Timestamp.valueOf(created_at);
            if (image == null || image.isEmpty()) {
                image = d.getAccountById(id).getImage();
            } else {
                image = "image/avatar/" + image;
            }
            Account a = new Account(id,role , username, name, gender, dob, p, email, address, image, ca, new Timestamp(System.currentTimeMillis()));
            d.updateAccount(a);
            session.setAttribute("account", a);
            response.sendRedirect("info");
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
