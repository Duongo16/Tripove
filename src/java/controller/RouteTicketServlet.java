/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.AccountDAO;
import dal.RouteDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Account;

/**
 *
 * @author Admin
 */
@WebServlet(name = "routeTicketServlet", urlPatterns = {"/routeTicket"})
public class RouteTicketServlet extends HttpServlet {

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
            out.println("<title>Servlet routeTicketServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet routeTicketServlet at " + request.getContextPath() + "</h1>");
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
        RouteDAO rd = new RouteDAO();
        AccountDAO ad = new AccountDAO();
        HttpSession session = request.getSession();

        Integer id = (Integer) session.getAttribute("id");
        int i = (id != null) ? id : -1;
        Account acc = ad.getAccountById(i);
        request.setAttribute("account", acc);

        String fDepartureLocation = request.getParameter("fDepartureLocation");
        String fArrivalLocation = request.getParameter("fArrivalLocation");
        String fPriceStr = request.getParameter("fPrice");

        if (fDepartureLocation == null && fArrivalLocation == null && fPriceStr == null) {
            request.setAttribute("allRoute", rd.getAllRoute());
        } else {
            try {
                int fPrice = Integer.parseInt(fPriceStr);
                request.setAttribute("fDepartureLocation", fDepartureLocation);
                request.setAttribute("fArrivalLocation", fArrivalLocation);
                request.setAttribute("fPrice", fPrice);
                request.setAttribute("allRoute", rd.getAllFilteredRoute(fDepartureLocation, fArrivalLocation, fPrice));
            } catch (Exception e) {

            }
        }

        request.getRequestDispatcher("routeTicket.jsp").forward(request, response);
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
