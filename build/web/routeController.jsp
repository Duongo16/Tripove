<%-- 
    Document   : routeController
    Created on : May 27, 2024, 9:02:20 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@page import="dal.LocationDAO"%>
<%@page import="dal.RouteDAO"%>
<%@page import="dal.Route_DetailDAO"%>
<%@page import="model.Route"%>
<%@page import="model.Route_Detail"%>
<%@page import="java.util.*" %>
<!DOCTYPE html>
<% LocationDAO ld = new LocationDAO(); %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <title>Quản lý tuyến xe</title>
        <link rel="shortcut icon" type="image/jpg" href="image/logo-icon.png" />
        <link rel="stylesheet" href="css/styleAdminController.css" />
    </head>
    <body>
        <%
        String currentUri = request.getRequestURI();
        String queryString = request.getQueryString();
        if (queryString != null) {
            currentUri += "?" + queryString;
        }
        %>
        <%@include file="header.jsp" %> <%@include file="admin-sideBar.jsp" %>
        <div id="main-content">
            <div class="row" style="padding: 50px 0; margin: 0">
                <div class="col-md-10" id="left-column">
                    <div class="filterController">
                        <form action="routeController" method="get" style="margin-bottom: 20px;">
                            <input type="hidden" name="action" value="search">
                            <strong>Name: </strong>
                            <input class="filterElm" type="text" name="fName" placeholder="Enter name">
                            <strong>Departure location: </strong>
                            <select class="filterElm" name="fDepartureLocation">
                                <option value="">All</option>
                                <c:forEach items="${requestScope.locationList}" var="ll">
                                    <option value="${ll.id}">${ll.name}</option>
                                </c:forEach>
                            </select>
                            <strong>Arrival location: </strong>
                            <select class="filterElm" name="fArrivalLocation">
                                <option value="">All</option>
                                <c:forEach items="${requestScope.locationList}" var="ll">
                                    <option value="${ll.id}">${ll.name} </option>
                                </c:forEach>
                            </select>
                            <strong>Price:  </strong>
                            <input class="filterElm" type="number" name="fPrice">
                            <button class="entity-update" type="submit" style="width: 80px" >
                                <i class="ti-search"></i>
                                Search
                            </button>
                        </form>
                    </div>

                    <table class="entity">
                        <thead>
                            <tr>
                                <th>Name</th>
                                <th>Departure location</th>
                                <th>Arrival location</th>                                
                                <th>Detail</th>
                                <th>Price</th>
                                <th>Created at</th>
                                <th>Updated at</th>
                                <th style="min-width: 240px">Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%for (Route r : (List<Route>)request.getAttribute("allRoute")) { %>
                            <tr>
                                <td><%=r.getName()%></td>
                                <td><%=ld.getLocationNameById(r.getDeparture_Locationid())%></td>
                                <td><%=ld.getLocationNameById(r.getArrival_Locationid())%></td>
                                <td><%=r.getDetail()%></td>
                                <td><%=r.getPrice()%></td>
                                <td><fmt:formatDate pattern="dd/MM/yyyy HH:mm" value="<%=r.getCreated_at()%>"/></td>
                                <td><fmt:formatDate pattern="dd/MM/yyyy HH:mm" value="<%=r.getUpdated_at()%>"/></td>
                                <td>
                                    <a
                                        style="text-decoration: none"
                                        class="entity-update"
                                        href="routeController?action=update&id=<%=r.getId()%>"
                                        >Update</a
                                    >
                                    <a
                                        style="text-decoration: none"
                                        class="entity-delete"
                                        onclick="doDelete('<%=r.getId()%>', '<%=r.getName()%>')"
                                        >Delete</a
                                    >
                                    <a
                                        style="text-decoration: none"
                                        class="entity-detail"

                                        onclick="displayDetail('<%=r.getId()%>')"
                                        >Detail <i id="arrow<%=r.getId()%>" class="ti-arrow-down"></i></a>
                                </td>
                            </tr>
                            <tr id="routeDetail<%=r.getId()%>" style="display:
                                <%= currentUri.contains("action=updateDetail&routeID="+r.getId()) ? "table-row" : "none" %>">

                                <%
                                     Route_DetailDAO rdd = new Route_DetailDAO();
                                     List<Route_Detail> ls = rdd.getAllRouteDetailByRouteId(r.getId());
                                %>
                                <td colspan="8">
                                    <div class="row">
                                        <div class="col-md-8" id="left-column">
                                            <table class="entity">
                                                <thead>
                                                    <tr>
                                                        <th>Date</th>
                                                        <th>Time</th>                                
                                                        <th>Vehicle</th>
                                                        <th>Created at</th>
                                                        <th>Updated at</th>
                                                        <th>Actions</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <%for (Route_Detail rd : ls) { %>
                                                    <tr>
                                                        <td><%=rd.getDepartureDate()%></td>
                                                        <td><%=rd.getDepartureTime()%></td>
                                                        <td><%=rd.getVehiclelicensePlate()%></td>
                                                        <td><fmt:formatDate pattern="dd/MM/yyyy HH:mm" value="<%=rd.getCreated_at()%>"/></td>
                                                        <td><fmt:formatDate pattern="dd/MM/yyyy HH:mm" value="<%=rd.getUpdated_at()%>"/></td>
                                                        <td>
                                                            <a
                                                                style="text-decoration: none"
                                                                class="entity-update"
                                                                href="routeController?action=updateDetail&routeID=<%=r.getId()%>&id=<%=rd.getId()%>"
                                                                >Update</a
                                                            >
                                                            <a
                                                                style="text-decoration: none"
                                                                class="entity-delete"
                                                                onclick="doDeleteDetail('<%=rd.getId()%>')"
                                                                >Delete</a
                                                            >
                                                        </td>
                                                    </tr>
                                                    <% }%>
                                                </tbody>
                                            </table>
                                        </div>
                                        <div class="col-md-4" style="float:left" id="right-column">
                                            <form action="routeController" method="post">
                                                <strong>Date:</strong>
                                                <input type="date" value="${requestScope.currentRouteDetail.getDepartureDate()}}" name="date"/><br>
                                                <strong>Time:</strong>
                                                <input type="time" value="${requestScope.currentRouteDetail.getDepartureTime()}}" name="time"/><br>
                                                <strong>Vehicle:</strong>
                                                <select name="vehicle">
                                                    <c:forEach items="${requestScope.vehicleList}" var="vl">
                                                        <option value="${vl.getLicensePlate()}" 
                                                                <c:if test="${requestScope.currentRouteDetail.getVehiclelicensePlate().equals(vl.getLicensePlate())}">
                                                                    selected
                                                                </c:if>>
                                                            ${vl.getLicensePlate()}
                                                        </option>
                                                    </c:forEach>
                                                </select><br />
                                                <input type="hidden" name="created_at2" value="${requestScope.currentRouteDetail.getCreated_at()}" />
                                                <input type="hidden" name="routeId" value="${requestScope.currentRouteDetail.getRouteId()}" />
                                                <input
                                                    type="submit"
                                                    class="entity-update"
                                                    value="Cập nhật/Thêm mới"
                                                    />
                                                <a class="entity-delete" href="routeController">Huỷ</a>
                                            </form>
                                        </div>      
                                    </div>
                                </td>
                            </tr>
                            <% }%>
                        </tbody>
                    </table>
                </div>
                <div class="col-md-2" id="right-column">
                    <c:set var="a" value="${requestScope.currentRoute}" />
                    <form
                        action="routeController"
                        method="post"
                        style="width: 190px"
                        >
                        <strong>Tên tuyến xe:</strong><br />
                        <input type="text" name="name" value="${a.name}" required /><br />
                        <strong>Điểm xuất phát:</strong><br />
                        <select name="departure_Locationid">
                            <c:forEach items="${requestScope.locationList}" var="ll">
                                <option value="${ll.id}" 
                                        <c:if test="${a.departure_Locationid == ll.id}">
                                            selected
                                        </c:if>>
                                    ${ll.name}
                                </option>
                            </c:forEach>
                        </select><br />
                        <strong>Điểm đến:</strong><br />
                        <select name="arrival_Locationid">
                            <c:forEach items="${requestScope.locationList}" var="ll">
                                <option value="${ll.id}" 
                                        <c:if test="${a.arrival_Locationid == ll.id}">
                                            selected
                                        </c:if>>
                                    ${ll.name}
                                </option>
                            </c:forEach>
                        </select><br />
                        <strong>Chi tiết đường đi:</strong>
                        <input type="text" name="detail"  value="${a.detail}"/><br>
                        <strong>Giá tiền:</strong><br /><input
                            type="number"
                            name="price"
                            value="${a.price}"
                            /><br /><br />
                        <input type="hidden" name="id" value="${a.id}" />
                        <input type="hidden" name="created_at" value="${a.created_at}" />
                        <input
                            type="submit"
                            class="entity-update"
                            value="Cập nhật/Thêm mới"
                            />
                        <a class="entity-delete" href="routeController">Huỷ</a>
                    </form>
                </div>
            </div>
        </div>

        <script type="text/javascript">
            function doDelete(id, name) {
                if (confirm("Bạn có muốn xoá tuyến xe " + name)) {
                    window.location = "routeController?action=delete&id=" + id;
                }
            }
            function doDeleteDetail(id) {
                if (confirm("Bạn có muốn xoá lượt xe này?")) {
                    window.location = "routeController?action=deleteDetail&id=" + id;
                }
            }
            function displayDetail(id) {
                var detail = document.getElementById("routeDetail" + id);
                var arrow = document.getElementById("arrow" + id);
                if (detail.style.display === 'none') {
                    detail.style.display = 'table-row';
                    arrow.classList.remove("ti-arrow-down");
                    arrow.classList.add("ti-arrow-up");
                } else {
                    detail.style.display = 'none';
                    arrow.classList.remove("ti-arrow-up");
                    arrow.classList.add("ti-arrow-down");

                }
            }

        </script>
        <%@include file="footer.jsp" %>
    </body>
</html>
