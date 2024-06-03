<%-- Document : admin-sideBar Created on : May 19, 2024, 1:49:43 PM Author :
Admin --%> <%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/styleAdminSideBar.css" />
    </head>
    <body>
        <% //String currentPage = request.getRequestURI(); %>
        <div id="sidebar">
            <ul>
                <li>
                    <a href="accountController" class="<%= currentPage.equals("/tripove/admin.jsp") ? "current-page" : "" %>">
                        Quản lý tài khoản 
                    </a>
                </li>
                <li>
                    <a href="vehicleCatController" class="<%= currentPage.equals("/tripove/vehicleCatController.jsp") ? "current-page" : "" %>">
                        Quản lý loại phương tiện
                    </a>
                </li>
                <li>
                    <a href="vehicleController" class="<%= currentPage.equals("/tripove/vehicleController.jsp") ? "current-page" : "" %>">
                        Quản lí phương tiện
                    </a>
                </li>
                <li>
                    <a href="routeController" class="<%= currentPage.equals("/tripove/routeController.jsp") ? "current-page" : "" %>">
                        Quản lí tuyến xe chạy
                    </a>
                </li>
            </ul>
        </div>
    </body>
</html>
