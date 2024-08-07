/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.AccountDAO;
import dal.Route_DetailDAO;
import dal.SeatDAO;
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
import java.util.List;
import model.Account;
import model.Vehicle_Category;

/**
 *
 * @author Admin
 */
@WebServlet(name = "VehicalCatControllerServlet", urlPatterns = {"/vehicleCatController"})
public class VehicleCatControllerServlet extends HttpServlet {

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
            out.println("<title>Servlet VehicalCatControllerServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet VehicalCatControllerServlet at " + request.getContextPath() + "</h1>");
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
        VehicleCatDAO vd = new VehicleCatDAO();
        VehicleDAO v = new VehicleDAO();
        Route_DetailDAO rdd = new Route_DetailDAO();
        SeatDAO sd = new SeatDAO();
        HttpSession session = request.getSession();

        Integer idd = (Integer) session.getAttribute("id");
        int i = (idd != null) ? idd : -1;

        Account acc = ad.getAccountById(i);
        request.setAttribute("account", acc);

        String action = request.getParameter("action");

        String fName = request.getParameter("fName");
        String fSeatType = request.getParameter("fSeatType");
        String fSeatQuantityStr = request.getParameter("fSeatQuantity");

        if (fSeatType == null && fName == null && fSeatQuantityStr == null) {
            List<Vehicle_Category> vcls = vd.getAllVehicleCat();
            int ticketCounts[] = new int[vcls.size()];
            int j = 0;

            for (Vehicle_Category vco : vcls) {
                ticketCounts[j++] = vd.getNumberOfBookedSeatByVehicleCategory(vco.getId());
            }
            request.setAttribute("ticketCounts", ticketCounts);
            request.setAttribute("allVehicleCat", vcls);

        } else {
            int fSeatQuantity = 0;
            if (fSeatQuantityStr != null && !fSeatQuantityStr.isEmpty()) {
                fSeatQuantity = Integer.parseInt(fSeatQuantityStr);
            }
            List<Vehicle_Category> vcls = vd.findVehicleCat(fName, fSeatType, fSeatQuantity);
            int ticketCounts[] = new int[vcls.size()];
            int j = 0;

            for (Vehicle_Category vco : vcls) {
                ticketCounts[j++] = vd.getNumberOfBookedSeatByVehicleCategory(vco.getId());
            }
            request.setAttribute("ticketCounts", ticketCounts);
            request.setAttribute("allVehicleCat", vcls);
        }

        if (action != null && !action.equals("search")) {
            if (action.equals("delete")) {
                String id_raw = request.getParameter("id");
                try {
                    int id = Integer.parseInt(id_raw);
                    sd.deleteSeatByVehicleCatId(id);
                    rdd.deleteRouteDetailByVehicleCatId(id);
                    v.deleteVehicleByVehicleCatId(id);
                    vd.deleteVehicleCat(id);
                } catch (Exception e) {
                }
                response.sendRedirect("vehicleCatController");
            } else if (action.equals("update")) {
                String id_raw = request.getParameter("id");

                try {
                    int id = Integer.parseInt(id_raw);
                    Vehicle_Category a = vd.getVehicleCatById(id);
                    request.setAttribute("currentVehicleCat", a);
                    request.getRequestDispatcher("vehicleCatController.jsp").forward(request, response);
                } catch (Exception e) {
                }
            }
        } else {
            request.getRequestDispatcher("vehicleCatController.jsp").forward(request, response);
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
        String seatType = request.getParameter("seatType");
        String seatQuantityStr = request.getParameter("seatQuantity");
        String utilities = request.getParameter("utilities");
        String createdAtStr = request.getParameter("created_at");
        String image = request.getParameter("image");

        VehicleCatDAO vcd = new VehicleCatDAO();
        int id = 0;
        int seatQuantity = 0;
        boolean checkExisted = false;
        for (Vehicle_Category o : vcd.getAllVehicleCat()) {
            if (o.getName().equals(name)) {
                checkExisted = true;
                id = o.getId();
                break;
            }
        }

        try {
            seatQuantity = Integer.parseInt(seatQuantityStr);
            if (image == null || image.isEmpty()) {
                image = vcd.getImageByVehicleCatId(id);
            } else {
                image = "image/vehicle/" + image;
            }
            if (checkExisted) {
                Timestamp created_at = Timestamp.valueOf(createdAtStr);
                Vehicle_Category a = new Vehicle_Category(id, name, seatType, seatQuantity, utilities, created_at, new Timestamp(System.currentTimeMillis()), image);
                vcd.updateVehicleCat(a);
            } else {
                Vehicle_Category a = new Vehicle_Category(name, seatType, seatQuantity, utilities, new Timestamp(System.currentTimeMillis()), image);
                vcd.addNewVehicleCat(a);
            }

            response.sendRedirect("vehicleCatController");

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
