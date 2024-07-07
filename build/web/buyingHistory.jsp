<%-- 
    Document   : buyingHistory
    Created on : Jun 26, 2024, 9:20:51 AM
    Author     : Admin
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="model.Seat"%>
<%@ page import="model.Route"%>
<%@ page import="model.Account"%>
<%@ page import="model.Route_Detail"%>
<%@ page import="dal.SeatDAO" %>
<%@ page import="dal.Route_DetailDAO" %>
<% 
    SeatDAO sd = new SeatDAO();
    Route_DetailDAO rdd = new Route_DetailDAO();
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="shortcut icon" type="image/jpg" href="image/logo-icon.png" />
        <title>Lịch sử mua vé</title>
        <link rel="stylesheet" href="css/styleAdminController.css"/>
    </head>
    <body>
        <%@ include file="header.jsp" %> 
        <div class="box">
            <h1 style="margin-bottom: 20px">Lịch sử mua vé</h1>
            <table class="entity">
                <thead>
                    <tr>
                        <th>Tên chuyến</th>
                        <th>Tên ghế</th>
                        <th>Điểm đón</th>
                        <th>Ngày xuất phát</th>
                        <th>Giờ xuất phát</th>
                        <th>Thời gian thanh toán</th>
                        <th>Trạng thái</th>
                        <th>Đánh giá</th>
                    </tr>
                </thead>
                <tbody>
                    <% 
                        for (Seat s : sd.getSeatByAccountId((int)request.getAttribute("accountId"))) {
                            Route_Detail rd = rdd.getRouteDetailById(s.getRouteDetailId());
                            Route r = rdd.getRouteByRouteDetailId(s.getRouteDetailId());
                    %>
                    <tr>
                        <td><%= r.getName()%></td>
                        <td><%= s.getName()%></td>
                        <td><%= s.getPickUp()%></td>
                        <td><%= rd.getDepartureDate()%></td>
                        <td><%= rd.getDepartureTime()%></td>
                        <td><%= s.getPaymentDate()%></td>
                        <td><strong style="color: green">Đã thanh toán</strong></td>
                        <td><a href="evaluate?routeDetailId=<%= s.getRouteDetailId()%>">Đánh giá</a></td>
                    </tr>
                    <% 
                        }
                    %>
                </tbody>

            </table>
        </div>
        <%@ include file="footer.jsp" %>
    </body>
</html>
