/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.AccountDAO;
import dal.LocationDAO;
import dal.RouteDAO;
import dal.VehicleDAO;
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
import java.sql.Time;
import model.Account;
import model.Route;

/**
 *
 * @author Admin
 */
@WebServlet(name = "RouteController", urlPatterns = {"/routeController"})
public class RouteControllerServlet extends HttpServlet {

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
            out.println("<title>Servlet RouteController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RouteController at " + request.getContextPath() + "</h1>");
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
        HttpSession session = request.getSession();

        AccountDAO ad = new AccountDAO();
        RouteDAO rd = new RouteDAO();
        VehicleDAO vd = new VehicleDAO();
        LocationDAO ld = new LocationDAO();

        Integer idd = (Integer) session.getAttribute("id");
        int i = (idd != null) ? idd : -1;

        Account acc = ad.getAccountById(i);
        request.setAttribute("account", acc);
        request.setAttribute("vehicleList", vd.getAllVehicle());
        request.setAttribute("locationList", ld.getAllLocation());

        String id_raw = request.getParameter("id");
        String action = request.getParameter("action");

        String fName = request.getParameter("fName");
        String fDepartureLocation = request.getParameter("fDepartureLocation");
        String fArrivalLocation = request.getParameter("fArrivalLocation");
        String fPriceStr = request.getParameter("fPrice");

        if (fName == null && fDepartureLocation == null && fArrivalLocation == null && fPriceStr == null) {
            request.setAttribute("allRoute", rd.getAllRoute());
        } else {
            int fPrice = -1, fDepartureLocationid = -1, fArrivalLocationid = -1;
            if (fPriceStr != null && !fPriceStr.isEmpty()) {
                fPrice = Integer.parseInt(fPriceStr);
            }
            if (fDepartureLocation != null && !fDepartureLocation.isEmpty()) {
                fDepartureLocationid = Integer.parseInt(fDepartureLocation);
            }
            if (fArrivalLocation != null && !fArrivalLocation.isEmpty()) {
                fArrivalLocationid = Integer.parseInt(fArrivalLocation);
            }

            //do sql.time đòi hỏi hh:mm:ss trong khi time của input nhận vào là hh:mm
//            if (fTimeStr != null && fTimeStr.split(":").length == 2) {
//                fTimeStr += ":00";
//            }
//            Date fDate = null;
//            Time fTime = null;
//            try {
//                if (fDateStr != null && !fDateStr.isEmpty()) {
//                    fDate = Date.valueOf(fDateStr);
//                }
//                if (fTimeStr != null && !fTimeStr.isEmpty()) {
//                    fTime = Time.valueOf(fTimeStr);
//                }
//            } catch (Exception e) {
//            }

            request.setAttribute("allRoute", rd.findRoute(fName, fDepartureLocationid, fArrivalLocationid, fPrice));
        }
        if (action != null && !action.equals("search")) {
            try {
                int id = Integer.parseInt(id_raw);
                if (action.equals("delete")) {
                    rd.deleteRouteById(id);
                    response.sendRedirect("routeController");
                } else if (action.equals("update")) {
                    request.setAttribute("currentRoute", rd.getRouteById(id));
                    request.getRequestDispatcher("routeController.jsp").forward(request, response);
                }
            } catch (Exception e) {
            }

        } else {
            request.getRequestDispatcher("routeController.jsp").forward(request, response);
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
        String name = request.getParameter("name");
        String departure_LocationidStr = request.getParameter("departure_Locationid");
        String arrival_LocationidStr = request.getParameter("arrival_Locationid");
        String priceStr = request.getParameter("price");
        String detail = request.getParameter("detail");
        String createdAtStr = request.getParameter("created_at");

        RouteDAO rd = new RouteDAO();
        boolean checkExisted = false;
        int id = 0;

        for (Route o : rd.getAllRoute()) {
            if (o.getName().equals(name)) {
                checkExisted = true;
                id = o.getId();
                break;
            }
        }

        try {
            int price = Integer.parseInt(priceStr);
            int departure_Locationid = Integer.parseInt(departure_LocationidStr);
            int arrival_Locationid = Integer.parseInt(arrival_LocationidStr);

            //do sql.time đòi hỏi hh:mm:ss trong khi time của input nhận vào là hh:mm
//            if (departureTimeStr.split(":").length == 2) {
//                departureTimeStr += ":00";
//            }
//            Date departureDate = Date.valueOf(departureDateStr);
//            Time departureTime = Time.valueOf(departureTimeStr);
//
            Timestamp createdAt;
            if (createdAtStr != null && !createdAtStr.isEmpty()) {
                createdAt = Timestamp.valueOf(createdAtStr);
            } else {
                createdAt = new Timestamp(System.currentTimeMillis());
            }

            if (checkExisted) {
                Route r = new Route(id, name, price, departure_Locationid, arrival_Locationid, detail, createdAt, new Timestamp(System.currentTimeMillis()));
                rd.updateRoute(r);
            } else {
                Route r = new Route(name, price, departure_Locationid, arrival_Locationid, detail, new Timestamp(System.currentTimeMillis()), null);
                rd.addNewRoute(r);
            }

            response.sendRedirect("routeController");

        } catch (Exception e) {
            e.printStackTrace();
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
