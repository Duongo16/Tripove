/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.AccountDAO;
import dal.RouteDAO;
import dal.VehicleCatDAO;
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
import model.Account;
import model.Vehicle;

/**
 *
 * @author Admin
 */
@WebServlet(name = "VehicleController", urlPatterns = {"/vehicleController"})
public class VehicleControllerServlet extends HttpServlet {

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
            out.println("<title>Servlet VehicleController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet VehicleController at " + request.getContextPath() + "</h1>");
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
        VehicleDAO vd = new VehicleDAO();
        VehicleCatDAO vcd = new VehicleCatDAO();
        RouteDAO rd = new RouteDAO();
        HttpSession session = request.getSession();
        request.setAttribute("vehicleCatList", vcd.getAllVehicleCat());

        Integer idd = (Integer) session.getAttribute("id");
        int i = (idd != null) ? idd : -1;

        Account acc = ad.getAccountById(i);
        request.setAttribute("account", acc);

        String action = request.getParameter("action");
        
        String fLicensePlate = request.getParameter("flicensePlate");
        String fVehicleCat = request.getParameter("fVehicleCat");
        String fStatusStr = request.getParameter("fStatus");
        
        if (fLicensePlate == null && fVehicleCat == null && fStatusStr == null) {
            request.setAttribute("allVehicle", vd.getAllVehicle());
        } else {
            int fStatus = 0;
            if (fStatusStr != null && !fStatusStr.isEmpty()) {
                fStatus = Integer.parseInt(fStatusStr);
            }
            request.setAttribute("allVehicle", vd.findVehicle(fLicensePlate, fVehicleCat, fStatus));
        }

        if (action != null && !action.equals("search")) {
            String lp = request.getParameter("licensePlate");
            if (action.equals("delete")) {
                rd.deleteRouteByLicensePlate(lp);
                vd.deleteVehicle(lp);
                response.sendRedirect("vehicleController");
            } else if (action.equals("update")) {
                Vehicle v = vd.getVehicleById(lp);
                request.setAttribute("currentVehicle", v);
                request.getRequestDispatcher("vehicleController.jsp").forward(request, response);
            }
        } else {
            request.getRequestDispatcher("vehicleController.jsp").forward(request, response);
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
        String licensePlate = request.getParameter("licensePlate");
        String status = request.getParameter("status");
        String vehicle_Categoryid = request.getParameter("vehicle_Categoryid");
        String createdAtStr = request.getParameter("created_at");

        VehicleDAO vd = new VehicleDAO();
        String lp = "";
        boolean checkExisted = false;
        for (Vehicle o : vd.getAllVehicle()) {
            if (o.getLicensePlate().equals(licensePlate)) {
                checkExisted = true;
                lp = o.getLicensePlate();
                break;
            }
        }

        try {
            int stt = Integer.parseInt(status);
            int vcid = Integer.parseInt(vehicle_Categoryid);
            if (checkExisted) {
                Timestamp created_at = Timestamp.valueOf(createdAtStr);
                Vehicle a = new Vehicle(lp, stt, created_at, new Timestamp(System.currentTimeMillis()), vcid);
                vd.updateVehicle(a);
            } else {
                Vehicle a = new Vehicle(licensePlate, stt, new Timestamp(System.currentTimeMillis()), null, vcid);
                vd.addNewVehicle(a);
            }

            response.sendRedirect("vehicleController");

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
