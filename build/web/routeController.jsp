<%-- 
    Document   : routeController
    Created on : May 27, 2024, 9:02:20 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@page import="dal.LocationDAO"%>
<%@page import="model.Route"%>
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
                            <!--                            <strong>Date: </strong>
                                                        <input class="filterElm" type="date" name="fDate">
                                                        <strong>Time: </strong>
                                                        <input class="filterElm" type="time" name="fTime">-->
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
                            <%--<c:forEach items="${requestScope.allRoute}" var="list">--%>
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
                                        href="#"
                                        >Detail <i class="ti-arrow-down"></i></a>
                                </td>
                            </tr>
                            <% }%>
                            <%--</c:forEach>--%>
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
        </script>
        <%@include file="footer.jsp" %>
    </body>
</html>
