<%-- Document : vehicleCatController Created on : May 17, 2024, 12:49:10 PM
Author : Admin --%> <%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <title>Loại phương tiện</title>
        <link rel="shortcut icon" type="image/jpg" href="image/logo-icon.png" />
        <link rel="stylesheet" href="css/styleAdminController.css" />
    </head>
    <body>
        <%@include file="header.jsp" %> <%@include file="admin-sideBar.jsp" %>
        <div id="main-content">
            <div class="row" style="padding: 50px 0; margin: 0">
                <div class="col-md-10" id="left-column">
                    <div class="filterController">
                        <form action="vehicleCatController" method="get" style="margin-bottom: 20px;">
                            <input type="hidden" name="action" value="search">
                            <strong>Name: </strong>
                            <input class="filterElm" type="text" name="fName" placeholder="Enter name">
                            <strong class="filterElm">Seat type:</strong>
                            <select class="filterElm" name="fSeatType">
                                <option value="">All</option>
                                <option value="Ngồi">Ngồi</option>
                                <option value="Nằm">Nằm</option>
                                <option value="Cabin">Cabin</option>
                            </select>
                            <strong>Seat quantity: </strong>
                            <input class="filterElm" type="number" name="fSeatQuantity" placeholder="Enter number of seat">
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
                                <th>Seat type</th>
                                <th>Seat quantity</th>
                                <th>Utilities</th>
                                <th>Created at</th>
                                <th>Updated at</th>
                                <th style="min-width: 156px">Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${requestScope.allVehicleCat}" var="list">
                                <tr>
                                    <td>${list.name}</td>
                                    <td>${list.seatType}</td>
                                    <td>${list.seatQuantity}</td>
                                    <td>${list.utilities}</td>
                                    <td>
                                        <fmt:formatDate
                                            pattern="dd/MM/yyyy HH:mm"
                                            value="${list.created_at}"
                                            />
                                    </td>
                                    <td>
                                        <fmt:formatDate
                                            pattern="dd/MM/yyyy HH:mm"
                                            value="${list.updated_at}"
                                            />
                                    </td>
                                    <td>
                                        <a
                                            style="text-decoration: none"
                                            class="entity-update"
                                            href="vehicleCatController?action=update&id=${list.id}"
                                            >Update</a
                                        >
                                        <a
                                            style="text-decoration: none"
                                            class="entity-delete"
                                            href="#"
                                            onclick="doDelete('${list.id}', '${list.name}')"
                                            >Delete</a
                                        >
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
                <div class="col-md-2" id="right-column">
                    <c:set var="a" value="${requestScope.currentVehicleCat}" />
                    <form
                        action="vehicleCatController"
                        method="post"
                        style="width: 190px"
                        >
                        <strong>Tên loại phương tiện:</strong><br />
                        <input type="text" name="name" value="${a.name}" required /><br />
                        <strong>Kiểu ghế:</strong><br />
                        <select name="seatType">
                            <option value="Ngồi" <c:if test="${a.seatType.equals('Ngồi')}">
                                    selected
                                </c:if>>Ngồi</option>
                            <option value="Nằm" <c:if test="${a.seatType.equals('Nằm')}">
                                    selected
                                </c:if>>Nằm</option>
                            <option value="Cabin" <c:if test="${a.seatType.equals('Cabin')}">
                                    selected
                                </c:if>>Cabin</option>
                        </select>
                        <br />
                        <strong>Số lượng ghế:</strong><br /><input
                            type="number"
                            name="seatQuantity"
                            value="${a.seatQuantity}"
                            /><br />
                        <strong>Tiện ích:</strong><br /><input
                            type="text"
                            name="utilities"
                            value="${a.utilities}"
                            /><br /><br />
                        <input type="hidden" name="id" value="${a.id}" />
                        <input type="hidden" name="created_at" value="${a.created_at}" />
                        <input
                            type="submit"
                            class="entity-update"
                            value="Cập nhật/Thêm mới"
                            />
                        <a class="entity-delete" href="vehicleCatController">Huỷ</a>
                    </form>
                </div>
            </div>
        </div>

        <script type="text/javascript">
            function doDelete(id, name) {
                if (confirm("Bạn có muốn xoá loại xe " + name + "? \nLưu ý: nếu loại xe bị xoá, các xe và tuyến xe liên quan sẽ bị xoá theo!")) {
                    window.location = "vehicleCatController?action=delete&id=" + id;
                }
            }
        </script>
        <%@include file="footer.jsp" %>
    </body>
</html>
