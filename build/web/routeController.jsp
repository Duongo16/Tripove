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
<%@page import="dal.SeatDAO"%>
<%@page import="dal.Route_DetailDAO"%>
<%@page import="model.Route"%>
<%@page import="model.Route_Detail"%>
<%@page import="model.Seat"%>
<%@page import="java.util.*" %>
<!DOCTYPE html>
<% LocationDAO ld = new LocationDAO(); %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <title>Quản lý tuyến xe</title>
        <link rel="shortcut icon" type="image/jpg" href="image/logo-icon.png" />
        <link rel="stylesheet" href="css/styleAdminController.css" />
        <style>
            .selected .icon-selected {
                fill: green;
            }
            .selected .icon-disabled {
                fill: transparent;
            }

            .selected rect{
                fill: rgb(139, 229, 176);
                stroke: green;
            }

            .seat-container.selected {
                border-color: green;
            }
            .seat-container {
                cursor: pointer;
            }
        </style>
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

                                        onclick="displayRoute('<%=r.getId()%>')"
                                        >Detail <i id="arrow<%=r.getId()%>" class="ti-arrow-down"></i></a>
                                </td>
                            </tr>
                            <tr id="routeDetail<%=r.getId()%>" style="display:
                                <%= currentUri.contains("action=updateDetail&routeID="+r.getId()) ? "table-row" : "none" %>">

                                <%
                                     Route_DetailDAO rdd = new Route_DetailDAO();
                                     SeatDAO sd = new SeatDAO();
                                     List<Route_Detail> ls = rdd.getAllRouteDetailByRouteId(r.getId());
                                %>
                                <td colspan="8">
                                    <div class="row">
                                        <div class="col-md-9" id="left-column">
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
                                                        <td><fmt:formatDate pattern="dd/MM/yyyy" value="<%=rd.getDepartureDate()%>"/></td>
                                                        <td><fmt:formatDate pattern="HH:mm" value="<%=rd.getDepartureTime()%>"/></td>
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
                                                            <a
                                                                style="text-decoration: none"
                                                                class="entity-detail"
                                                                onclick="displayDetail('<%=rd.getId()%>')"
                                                                >Detail <i id="arrow2<%=rd.getId()%>" class="ti-arrow-down"></i></a>

                                                        </td>
                                                    </tr>
                                                    <tr id="routeDetailDetail<%=rd.getId()%>" style="display: none">
                                                        <td colspan="6">
                                                            <table>
                                                                
                                                                <%
                                                                List<Seat> ss = sd.getSeatByRouteDetailId(rd.getId());
                                                                int seatEachRow = 0;
                                                                
                                                                switch(ss.size()){
                                                                    case 6:
                                                                        seatEachRow = 2;
                                                                        break;
                                                                    case 20:
                                                                        seatEachRow = 4;
                                                                        break;
                                                                }
                                                                %>
                                                                <tr>
                                                                    <td class="driver" colspan="<%=seatEachRow%>">
                                                                        <div style="float: left">
                                                                            <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                                                                            <path d="M12.305 24h-.61c-.035-.004-.07-.01-.105-.012a11.783 11.783 0 0 1-2.117-.261 12.027 12.027 0 0 1-6.958-4.394A11.933 11.933 0 0 1 .027 12.78L0 12.411v-.822c.005-.042.013-.084.014-.127a11.845 11.845 0 0 1 1.102-4.508 12.007 12.007 0 0 1 2.847-3.852A11.935 11.935 0 0 1 11.728.003c.947-.022 1.883.07 2.81.27 1.22.265 2.369.71 3.447 1.335a11.991 11.991 0 0 1 3.579 3.164 11.876 11.876 0 0 1 2.073 4.317c.178.712.292 1.434.334 2.168.008.146.02.292.029.439v.609c-.004.03-.011.06-.012.089a11.81 11.81 0 0 1-1.05 4.521 12.02 12.02 0 0 1-1.92 2.979 12.046 12.046 0 0 1-6.395 3.812c-.616.139-1.24.23-1.872.265-.149.008-.297.02-.446.03zm8.799-13.416c-.527-3.976-4.078-7.808-9.1-7.811-5.02-.003-8.583 3.823-9.11 7.809h.09c.64-.035 1.278-.092 1.912-.195.815-.131 1.614-.326 2.378-.639.625-.255 1.239-.54 1.855-.816.82-.368 1.673-.593 2.575-.62a7.123 7.123 0 0 1 1.947.187c.585.146 1.136.382 1.68.634.57.264 1.14.526 1.733.736 1.2.424 2.442.62 3.706.7.11.006.222.01.334.015zm-10.95 10.471v-.094c0-1.437 0-2.873-.002-4.31 0-.141-.011-.284-.035-.423a2.787 2.787 0 0 0-.775-1.495c-.564-.582-1.244-.896-2.067-.892-1.414.007-2.827.002-4.24.002h-.09a9.153 9.153 0 0 0 3.125 5.256 9.15 9.15 0 0 0 4.083 1.956zm3.689.001c1.738-.36 3.25-1.137 4.528-2.355 1.4-1.334 2.287-2.956 2.685-4.855l-.077-.003h-4.362c-.237 0-.47.038-.695.112-.667.22-1.188.635-1.588 1.206a2.673 2.673 0 0 0-.494 1.59c.008 1.4.003 2.801.003 4.202v.103zM12.05 14.22c1.215-.035 2.204-1.083 2.165-2.275-.039-1.223-1.095-2.215-2.29-2.166-1.211.05-2.2 1.108-2.15 2.302.051 1.191 1.108 2.186 2.275 2.139z" fill="#858585">
                                                                            </path>
                                                                            </svg>
                                                                        </div>
                                                                    </td>
                                                                </tr>
                                                                <%
                                                                for(int i = 0; i<ss.size();i++){
                                                                    if (i % seatEachRow == 0) {
                                                                        if (i > 0) { %>
                                                                        </tr>
                                                                        <%
                                                                        } 
                                                                        %>
                                                                        <tr>
                                                                    <%
                                                                    }
                                                                    Seat o = ss.get(i);
                                                                    %>
                                                                    <td class="seat">
                                                                        <div class="seat-container" data-disabled="false"  color="#b8b8b8">
                                                                            <svg style="margin-top: -25px;z-index: -99;" width="40" height="32" viewBox="0 0 40 32" fill="none" xmlns="http://www.w3.org/2000/svg">
                                                                            <rect x="8.75" y="2.75" width="22.5" height="26.5" rx="2.25" fill="#FFF" stroke="#B8B8B8" stroke-width="1.5" stroke-linejoin="round"></rect>
                                                                            <rect x="10.25" y="11.75" width="14.5" height="5.5" rx="2.25" transform="rotate(90 10.25 11.75)" fill="#FFF" stroke="#B8B8B8" stroke-width="1.5" stroke-linejoin="round"></rect>
                                                                            <rect x="35.25" y="11.75" width="14.5" height="5.5" rx="2.25" transform="rotate(90 35.25 11.75)" fill="#FFF" stroke="#B8B8B8" stroke-width="1.5" stroke-linejoin="round"></rect>
                                                                            <rect x="8.75" y="22.75" width="22.5" height="6.5" rx="2.25" fill="#FFF" stroke="#B8B8B8" stroke-width="1.5" stroke-linejoin="round"></rect>
                                                                            <path class="icon-selected" d="M20 6.333A6.67 6.67 0 0 0 13.334 13 6.67 6.67 0 0 0 20 19.667 6.67 6.67 0 0 0 26.667 13 6.669 6.669 0 0 0 20 6.333zm-1.333 10L15.333 13l.94-.94 2.394 2.387 5.06-5.06.94.946-6 6z" fill="transparent"></path>
                                                                            <path class="icon-disabled" d="M24.96 9.46l-1.42-1.42L20 11.59l-3.54-3.55-1.42 1.42L18.59 13l-3.55 3.54 1.42 1.42L20 14.41l3.54 3.55 1.42-1.42L21.41 13l3.55-3.54z" fill="transparent"></path>
                                                                            </svg>
                                                                        </div> 
                                                                    </td>
                                                            <%
                                                               }
                                                               if (!ss.isEmpty()) {
                                                            %>
                                                               </tr>
                                                            <% 
                                                               }
                                                            %>
                                                            </table>

                                                        </td>
                                                    </tr>
                                                <% }%>
                                                </tbody>
                                            </table>
                                        </div>
                                        <div class="col-md-3" style="float:left" id="right-column">
                                            <form action="routeController" style="float:left;text-align: left" method="post">
                                                <strong>Date:</strong>
                                                <input type="date" value="${requestScope.currentRouteDetail.getDepartureDate()}" name="date"/><br>
                                                <strong>Time:</strong>
                                                <input type="time" value="${requestScope.currentRouteDetail.getDepartureTime()}" name="time"/><br>
                                                <strong>Vehicle:</strong>
                                                <select name="vehicle">
                                                    <option value="none"></option>
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
                                                <input type="hidden" name="routeId" value="<%=r.getId()%>" />                                                
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
            function displayRoute(id) {
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

            function displayDetail(id) {
                var detail = document.getElementById("routeDetailDetail" + id);
                var arrow = document.getElementById("arrow2" + id);
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

            document.querySelectorAll('.seat-container').forEach(function (seat) {
                seat.addEventListener('click', function () {
                    if (seat.dataset.disabled === 'false') {
                        seat.dataset.disabled = 'true';
                        seat.classList.add('selected');

                    } else {
                        seat.dataset.disabled = 'false';
                        seat.classList.remove('selected');
 
                    }
                });
            });



        </script>
        <%@include file="footer.jsp" %>
    </body>
</html>
