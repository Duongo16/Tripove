<%-- 
    Document   : routeDetailTicket
    Created on : Jun 13, 2024, 7:09:44 PM
    Author     : Admin
--%>

<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Route" %>
<%@ page import="model.Vehicle_Category" %>
<%@ page import="model.Route_Detail" %>
<%@ page import="dal.RouteDAO" %>
<%@ page import="dal.Route_DetailDAO" %>
<%@ page import="dal.VehicleCatDAO" %>
<% 
    RouteDAO rd = new RouteDAO();
    VehicleCatDAO vcd = new VehicleCatDAO();
    Route_DetailDAO rdd = new Route_DetailDAO();
    Route cr = (Route) request.getAttribute("currentRoute"); 
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Route Detail Ticket</title>
        <link rel="stylesheet" href="css/styleRouteDetailTicket.css"/>
    </head>
    <body>
        <%@ include file="header.jsp" %> 
        <div style="margin: 100px">
            <div class="box row">
                <div class="col-md-6">
                    <h1><%= cr.getName() %></h1>
                    <div class="bar">
                        <p>Ngày xuất phát:</p>
                        <c:forEach var="detail" items="<%= rdd.getAllUniqueDateByRouteId(cr.getId()) %>">
                            <a class="${requestScope.currentDate.equals(detail) ? 'selected-item' : 'item'}" 
                               href="routeDetailTicket?routeId=<%= cr.getId() %>&date=${detail}">
                                <fmt:formatDate pattern="dd/MM/yyyy" value="${detail}"/>
                            </a>
                        </c:forEach>
                    </div>
                    <c:if test="${not empty requestScope.listOfTime}">
                        <div class="bar">
                            <p>Thời gian xuất phát:</p>
                            <c:forEach var="t" items="${requestScope.listOfTime}">
                                <a class="${requestScope.currentTime.equals(t) ? 'selected-item' : 'item'}" 
                                   href="routeDetailTicket?routeId=<%= cr.getId() %>&date=${requestScope.currentDate}&time=${t}">
                                    <fmt:formatDate pattern="HH:mm" value="${t}"/>
                                </a>
                            </c:forEach>
                        </div>
                    </c:if>
                    <%
                    if (request.getAttribute("allCurrentRouteDetail") != null) {
                        List<Route_Detail> allCurrentRouteDetail = (List<Route_Detail>) request.getAttribute("allCurrentRouteDetail");
                    %>
                    <div>
                        <%for (Route_Detail crd : allCurrentRouteDetail) {
                            Vehicle_Category vc = vcd.getVehicleCatByLicensePlate(crd.getVehiclelicensePlate());
                        %>
                        <div class="route-detail row">
                            <div class="col-md-2" style="padding:0">
                                <img style="width:100%" src="<%= vc.getImage() %>" alt="Vehicle Image" />
                            </div>
                            <div class="col-md-8">
                                <p><%= vc.getName() %></p>
                                <p>Ghế:  <%=vc.getSeatType()%></p>
                                Tiện ích:
                                <p><%=vc.getUtilities()%></p>
                            </div>
                            <div class="col-md-2">
                                <form action="routeDetailTicket" method="post">
                                    <input type="hidden" name="choosed-detailRoute" value="<%=crd%>"/>
                                    <input type="submit" value="Chọn chỗ"/>
                                </form>
                                Trạng thái:
                                <p><%=vc.getSeatQuantity()%>/<%=vc.getSeatQuantity()%></p>
                            </div>
                        </div>
                        <%}%>
                    </div>
                    <%}%>
                </div>

                <div class="col-md-6">
                    <h1>Vé của bạn</h1>
                    <div id="seat">
                        <table>
                            <tr></tr>
                        </table>
                    </div> 
                </div>


            </div>
        </div>
        <%@ include file="footer.jsp" %>
    </body>
</html>







