/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.AccountDAO;
import dal.EvaluateDAO;
import dal.SeatDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.Date;
import java.sql.Timestamp;
import java.util.List;
import model.Account;
import model.Evaluate;

/**
 *
 * @author Admin
 */
@WebServlet(name = "AccountControllerServlet", urlPatterns = {"/accountController"})
public class AccountControllerServlet extends HttpServlet {

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
            out.println("<title>Servlet AdminServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AdminServlet at " + request.getContextPath() + "</h1>");
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
        SeatDAO sd = new SeatDAO();
        EvaluateDAO ed = new EvaluateDAO();
        HttpSession session = request.getSession();

        Integer idd = (Integer) session.getAttribute("id");
        int i = (idd != null) ? idd : -1;

        Account acc = ad.getAccountById(i);
        request.setAttribute("account", acc);

        String action = request.getParameter("action");
        String fRole = request.getParameter("fRole");
        String fName = request.getParameter("fName");
        String fPhoneNumber = request.getParameter("fPhoneNumber");

        int itemOnPage = 3;
        int index = 1;

        boolean isFiltering = (fRole != null && !fRole.isEmpty())
                || (fName != null && !fName.isEmpty())
                || (fPhoneNumber != null && !fPhoneNumber.isEmpty());

        int numOfItems;
        if (isFiltering) {
            numOfItems = ad.getNumberOfFilteredAccounts(fRole, fName, fPhoneNumber);
        } else {
            numOfItems = ad.getNumberOfAccounts();
        }

        int numOfPage = (int) Math.ceil((double) numOfItems / itemOnPage);

        try {
            index = Integer.parseInt(request.getParameter("index"));
        } catch (NumberFormatException e) {
            index = 1;
        }

        request.setAttribute("index", index);
        request.setAttribute("numOfPage", numOfPage);

        if (isFiltering) {
            List<Account> lss = ad.findAccounts(fRole, fName, fPhoneNumber);
            int purchaseCounts[] = new int[lss.size()];
            int j = 0;

            for (Account a : lss) {
                purchaseCounts[j++] = sd.getNumberOfBookingByAccountId(a.getId());
            }
            request.setAttribute("purchaseCounts", purchaseCounts);
            request.setAttribute("allAccountWithoutPaging", lss);
            request.setAttribute("allAccount", ad.findAccounts(fRole, fName, fPhoneNumber, index, itemOnPage));
        } else {
            List<Account> lss = ad.getAllAccount();
            int purchaseCounts[] = new int[lss.size()];
            int j = 0;

            for (Account a : lss) {
                purchaseCounts[j++] = sd.getNumberOfBookingByAccountId(a.getId());
            }
            request.setAttribute("purchaseCounts", purchaseCounts);
            request.setAttribute("allAccountWithoutPaging", lss);
            request.setAttribute("allAccount", ad.getAllAccount(index, itemOnPage));
        }

        if (action != null && !action.equals("search")) {
            if (action.equals("delete")) {
                
                String id_raw = request.getParameter("id");
                try {
                    int id = Integer.parseInt(id_raw);
                    ed.deleteEvaluateByAccountId(id);
                    sd.deleteSeatByAccountId(id);
                    ad.deleteAccount(id);
                } catch (NumberFormatException e) {
                }
                response.sendRedirect("accountController");
            } else if (action.equals("update")) {
                String id_raw = request.getParameter("id");
                try {
                    int id = Integer.parseInt(id_raw);
                    Account a = ad.getAccountById(id);
                    request.setAttribute("currentAccount", a);
                    request.getRequestDispatcher("admin.jsp").forward(request, response);
                } catch (NumberFormatException e) {
                }
            }
        } else {
            request.getRequestDispatcher("admin.jsp").forward(request, response);
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
        String role = request.getParameter("role");
        String image = "image/avatar/" + request.getParameter("image");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String name = request.getParameter("name");
        String gender = request.getParameter("gender");
        String dateOfBirth = request.getParameter("dateOfBirth");
        String email = request.getParameter("email");
        String phoneNumber = request.getParameter("phoneNumber");
        String address = request.getParameter("address");
        String created_at = request.getParameter("created_at");
        int id = 0;
        Date dob = null;
        AccountDAO d = new AccountDAO();
        boolean checkExisted = false;
        for (Account o : d.getAllAccount()) {
            if (o.getUsername().equals(username)) {
                checkExisted = true;
                id = o.getId();
                if (image.equals("image/avatar/")) {
                    image = o.getImage();
                }
                break;
            }
        }

        try {
            int phone = Integer.parseInt(phoneNumber);
            dob = Date.valueOf(dateOfBirth);
            if (checkExisted) {
                Timestamp ca = Timestamp.valueOf(created_at);
                Account a = new Account(id, role, username, password, name, gender, dob, phone, email, address, image, ca, new Timestamp(System.currentTimeMillis()));
                d.updateDetailAccount(a);
            } else {
                Account a = new Account(role, username, password, name, gender, dob, phone, email, address, image, new Timestamp(System.currentTimeMillis()));
                d.addNewAccount(a);
            }

            response.sendRedirect("accountController");

        } catch (NumberFormatException e) {

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
