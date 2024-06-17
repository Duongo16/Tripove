package controller;

import dal.RouteDAO;
import dal.Route_DetailDAO;
import java.io.IOException;
import java.sql.Date;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "RouteDetailTicketServlet", urlPatterns = {"/routeDetailTicket"})
public class RouteDetailTicketServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // This method is no longer used directly, but it remains here for possible future use
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Route_DetailDAO rdd = new Route_DetailDAO();
        RouteDAO rd = new RouteDAO();

        String routeIdStr = request.getParameter("routeId");
        String dateStr = request.getParameter("date");
        String timeStr = request.getParameter("time");

        try {
            int routeId = Integer.parseInt(routeIdStr);
            Date date = (dateStr != null && !dateStr.isEmpty()) ? Date.valueOf(dateStr) : null;

            if (date != null) {
                request.setAttribute("currentDate", dateStr);
                request.setAttribute("listOfTime", rdd.getAllTimeByRouteIdAndDate(routeId, date));
            }

            request.setAttribute("currentRoute", rd.getRouteById(routeId));
            request.setAttribute("allRouteDetail", rdd.getAllRouteDetailByRouteId(routeId));

            request.getRequestDispatcher("routeDetailTicket.jsp").forward(request, response);
        } catch (Exception e) {
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Route Detail Ticket Servlet";
    }
}
