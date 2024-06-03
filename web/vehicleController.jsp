<%-- 
    Document   : vehicleController
    Created on : May 21, 2024, 3:16:14 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="model.Vehicle"%>
<%@page import="dal.VehicleCatDAO"%>
<%@page import="java.util.*" %>
<% VehicleCatDAO vcd = new VehicleCatDAO(); %>
<!DOCTYPE html>
<html>  
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Phương tiện</title>
        <link rel="shortcut icon" type="image/jpg" href="image/logo-icon.png" />
        <link rel="stylesheet" href="css/styleAdminController.css">
    </head>
    <body>
        <%@include file="header.jsp" %>
        <%@include file="admin-sideBar.jsp" %>

        <div id="main-content">
            <div class="row" style="padding: 50px 0; margin: 0">

                <div class="col-md-10" id="left-column">
                    <div class="filterController">
                        <form action="vehicleController" method="get" style="margin-bottom: 20px;">
                            <input type="hidden" name="action" value="search">
                            <strong>License plate: </strong>
                            <input class="filterElm" type="text" name="flicensePlate" placeholder="Enter license plate">
                            <strong>Vehicle category: </strong>
                            <select class="filterElm" name="fVehicleCat">
                                <option value="">All</option>
                                <c:forEach items="${requestScope.vehicleCatList}" var="vcl">
                                    <option value="${vcl.id}" >
                                        ${vcl.name}
                                    </option>
                                </c:forEach>
                            </select>
                            <strong>Status: </strong>
                            <input class="filterElm" type="number" name="fStatus" placeholder="Enter status">
                            <button class="entity-update" type="submit" style="width: 80px" >
                                <i class="ti-search"></i>
                                Search
                            </button>
                        </form>
                    </div>
                    <table class="entity">
                        <thead>
                            <tr>
                                <th>License Plate</th>
                                <th>Status</th>
                                <th>Vehicle Category</th>
                                <th>Created at</th>
                                <th>Updated at</th>
                                <th style="min-width: 156px">Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%for (Vehicle v : (List<Vehicle>)request.getAttribute("allVehicle")) { %>
                            <%--<c:forEach items="${requestScope.allVehicle}" var="list">--%>
                            <tr>                                    
                                <td><%=v.getLicensePlate()%></td>
                                <td><%=v.getStatus()%></td>
                                <td><%=vcd.getVehicleCatNameById(v.getVehicle_Categoryid())%></td>
                                <td><fmt:formatDate pattern="dd/MM/yyyy HH:mm" value="<%=v.getCreated_at()%>"/></td>
                                <td><fmt:formatDate pattern="dd/MM/yyyy HH:mm" value="<%=v.getUpdated_at()%>"/></td>
                                <td>
                                    <a style="text-decoration: none" class="entity-update" href="vehicleController?action=update&licensePlate=<%=v.getLicensePlate()%>">Update</a>
                                    <a style="text-decoration: none" class="entity-delete" href="#" onclick="doDelete('<%=v.getLicensePlate()%>')">Delete</a>
                                </td>
                            </tr>
                            <%--</c:forEach>--%>
                            <% }  %>
                        </tbody>
                    </table>
                </div>
                <div class="col-md-2" id="right-column">
                    <c:set var="a" value="${requestScope.currentVehicle}"/>
                    <form action="vehicleController" method="post" style="width: 190px;">
                        <strong>Biển số xe:</strong><br> <input type="text" name="licensePlate" value="${a.licensePlate}" required/><br>
                        <strong>Trạng thái: </strong><input type="number" name="status" value="${a.status}" min="0" max="10" step="1"><br>
                        <strong>Loại xe:</strong><br>
                        <select name="vehicle_Categoryid">
                            <c:forEach items="${requestScope.vehicleCatList}" var="vcl">
                                <option value="${vcl.id}" 
                                        <c:if test="${a.vehicle_Categoryid == vcl.id}">
                                            selected
                                        </c:if>>
                                    ${vcl.name}
                                </option>
                            </c:forEach>
                        </select>
                        <input type="hidden" name="created_at" value="${a.created_at}"/>
                        <input type="submit" class="entity-update" value="Cập nhật/Thêm mới"/>
                        <a class="entity-delete" href="vehicleController">Huỷ</a>
                    </form>
                </div>
            </div>
        </div>

        <script type="text/javascript">
            function doDelete(name) {
                if (confirm("Bạn có muốn xoá xe với biển số " + name + "? \nLưu ý: nếu xe bị xoá, các tuyến xe liên quan sẽ bị xoá theo!")) {
                    window.location = "vehicleController?action=delete&licensePlate=" + name;
                }
            }
        </script>
        <%@include file="footer.jsp" %>
    </body>
</html>
