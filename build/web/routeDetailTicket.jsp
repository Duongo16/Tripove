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
<%@ page import="model.Seat" %>
<%@ page import="model.Vehicle_Category" %>
<%@ page import="model.Route_Detail" %>
<%@ page import="dal.RouteDAO" %>
<%@ page import="dal.SeatDAO"%>
<%@ page import="dal.Route_DetailDAO" %>
<%@ page import="dal.VehicleCatDAO" %>
<% 
    RouteDAO rd = new RouteDAO();
    SeatDAO sd = new SeatDAO();
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
        <%@ include file="header.jsp" %> 
        <div style="margin: 100px">
            <div class="box row">
                <div class="col-md-6">
                    <h2><%= cr.getName() %></h2>
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
                            <div class="col-md-4" style="padding:0">
                                <img style="width:100%" src="<%= vc.getImage() %>" alt="Vehicle Image" />
                            </div>
                            <div class="col-md-6">
                                <h4><%= vc.getName() %></h4>
                                <p>Ghế:  <%=vc.getSeatType()%></p>
                                Tiện ích:
                                <p><%=vc.getUtilities()%></p>
                            </div>
                            <div class="col-md-2">
                                <form action="routeDetailTicket">
                                    <input type="hidden" name="routeId" value="<%=crd.getRouteId()%>"/>
                                    <input type="hidden" name="date" value="<%=crd.getDepartureDate()%>"/>
                                    <input type="hidden" name="time" value="<%=crd.getDepartureTime()%>"/>
                                    <input type="hidden" name="choosed-detailRoute" value="<%=crd.getId()%>"/>
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

                <c:if test="${not empty requestScope.seats}">  
                    <div class="col-md-6">

                        <h2>Vé của bạn</h2>
                        <div id="seat">
                            Họ và tên: ${requestScope.account.name}<br>
                            Số điện thoại: 0${requestScope.account.phoneNumber}<br>

                            <div class="row" >
                                <div class="col-md-3" style="background-color: #eee;padding: 15px;margin-left: 10px;">
                                    <table >
                                        <%
                                        List<Seat> ss = (List<Seat>) request.getAttribute("seats");
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
                                            <td class="driver" colspan="<%=seatEachRow%>" style="padding-bottom: 15px;padding-left: 7px;">
                                                <div style="cursor: not-allowed">
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
                                                <div class="seat-container" data-disabled="false" onclick="totalBill(this)" color="#b8b8b8" style="padding-right: 10px" title="Ghế: <%=o.getName()%>" >
                                                    <svg style="" width="40" height="32" viewBox="0 0 40 32" fill="none" xmlns="http://www.w3.org/2000/svg">
                                                    <rect x="8.75" y="2.75" width="22.5" height="26.5" rx="2.25" fill="#FFF" stroke="#B8B8B8" stroke-width="1.5" stroke-linejoin="round"></rect>
                                                    <rect x="10.25" y="11.75" width="14.5" height="5.5" rx="2.25" transform="rotate(90 10.25 11.75)" fill="#FFF" stroke="#B8B8B8" stroke-width="1.5" stroke-linejoin="round"></rect>
                                                    <rect x="35.25" y="11.75" width="14.5" height="5.5" rx="2.25" transform="rotate(90 35.25 11.75)" fill="#FFF" stroke="#B8B8B8" stroke-width="1.5" stroke-linejoin="round"></rect>
                                                    <rect x="8.75" y="22.75" width="22.5" height="6.5" rx="2.25" fill="#FFF" stroke="#B8B8B8" stroke-width="1.5" stroke-linejoin="round"></rect>
                                                    <path class="icon-selected" d="M20 6.333A6.67 6.67 0 0 0 13.334 13 6.67 6.67 0 0 0 20 19.667 6.67 6.67 0 0 0 26.667 13 6.669 6.669 0 0 0 20 6.333zm-1.333 10L15.333 13l.94-.94 2.394 2.387 5.06-5.06.94.946-6 6z" fill="transparent"></path>
                                                    <path class="icon-disabled" d="M24.96 9.46l-1.42-1.42L20 11.59l-3.54-3.55-1.42 1.42L18.59 13l-3.55 3.54 1.42 1.42L20 14.41l3.54 3.55 1.42-1.42L21.41 13l3.55-3.54z" fill="transparent"></path>
                                                    </svg>
                                                    <input type="hidden" value="<%=o.getName()%>" class="seatName"/>
                                                    <input type="hidden" value="<%=o.getSurcharge()%>" class="seatSurcharge"/>
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
                                </div>
                                <div class="col-md-1"></div>
                                <div class="col-md-6">
                                    <div style="margin-bottom: 10px">
                                        <svg style="" width="40" height="32" viewBox="0 0 40 32" fill="none" xmlns="http://www.w3.org/2000/svg">
                                        <rect x="8.75" y="2.75" width="22.5" height="26.5" rx="2.25" fill="#FFF" stroke="#B8B8B8" stroke-width="1.5" stroke-linejoin="round"></rect>
                                        <rect x="10.25" y="11.75" width="14.5" height="5.5" rx="2.25" transform="rotate(90 10.25 11.75)" fill="#FFF" stroke="#B8B8B8" stroke-width="1.5" stroke-linejoin="round"></rect>
                                        <rect x="35.25" y="11.75" width="14.5" height="5.5" rx="2.25" transform="rotate(90 35.25 11.75)" fill="#FFF" stroke="#B8B8B8" stroke-width="1.5" stroke-linejoin="round"></rect>
                                        <rect x="8.75" y="22.75" width="22.5" height="6.5" rx="2.25" fill="#FFF" stroke="#B8B8B8" stroke-width="1.5" stroke-linejoin="round"></rect>
                                        </svg>
                                        Ghế trống
                                    </div> 

                                    <div style="margin-bottom: 10px">
                                        <svg style="" width="40" height="32" viewBox="0 0 40 32" fill="none" xmlns="http://www.w3.org/2000/svg">
                                        <rect x="8.75" y="2.75" width="22.5" height="26.5" rx="2.25" fill="rgb(139, 229, 176)" stroke="green" stroke-width="1.5" stroke-linejoin="round"></rect>
                                        <rect x="10.25" y="11.75" width="14.5" height="5.5" rx="2.25" transform="rotate(90 10.25 11.75)" fill="rgb(139, 229, 176)" stroke="green" stroke-width="1.5" stroke-linejoin="round"></rect>
                                        <rect x="35.25" y="11.75" width="14.5" height="5.5" rx="2.25" transform="rotate(90 35.25 11.75)" fill="rgb(139, 229, 176)" stroke="green" stroke-width="1.5" stroke-linejoin="round"></rect>
                                        <rect x="8.75" y="22.75" width="22.5" height="6.5" rx="2.25" fill="rgb(139, 229, 176)" stroke="green" stroke-width="1.5" stroke-linejoin="round"></rect>
                                        <path  d="M20 6.333A6.67 6.67 0 0 0 13.334 13 6.67 6.67 0 0 0 20 19.667 6.67 6.67 0 0 0 26.667 13 6.669 6.669 0 0 0 20 6.333zm-1.333 10L15.333 13l.94-.94 2.394 2.387 5.06-5.06.94.946-6 6z" fill="green"></path>
                                        </svg>
                                        Ghế bạn chọn
                                    </div> 

                                    <div style="margin-bottom: 10px">
                                        <svg style="" width="40" height="32" viewBox="0 0 40 32" fill="none" xmlns="http://www.w3.org/2000/svg">
                                        <rect x="8.75" y="2.75" width="22.5" height="26.5" rx="2.25" fill="rgb(255, 177, 177)" stroke="red" stroke-width="1.5" stroke-linejoin="round"></rect>
                                        <rect x="10.25" y="11.75" width="14.5" height="5.5" rx="2.25" transform="rotate(90 10.25 11.75)" fill="rgb(255, 177, 177)" stroke="red" stroke-width="1.5" stroke-linejoin="round"></rect>
                                        <rect x="35.25" y="11.75" width="14.5" height="5.5" rx="2.25" transform="rotate(90 35.25 11.75)" fill="rgb(255, 177, 177)" stroke="red" stroke-width="1.5" stroke-linejoin="round"></rect>
                                        <rect x="8.75" y="22.75" width="22.5" height="6.5" rx="2.25" fill="rgb(255, 177, 177)" stroke="red" stroke-width="1.5" stroke-linejoin="round"></rect>
                                        <path d="M24.96 9.46l-1.42-1.42L20 11.59l-3.54-3.55-1.42 1.42L18.59 13l-3.55 3.54 1.42 1.42L20 14.41l3.54 3.55 1.42-1.42L21.41 13l3.55-3.54z" fill="red"></path>
                                        </svg>
                                        Ghế đã bán
                                    </div> 
                                </div>
                            </div>

                            <div>

                                Thông tin ghế: <p id="selectedSeats"></p>

                                <div>
                                    Điểm đón cụ thể:
                                    <textarea name="" rows="2" cols="60" style="padding: 10px"></textarea>
                                </div>
                                Tổng tiền: <span id="totalAmount">0</span> VND<br>
                                <input type="hidden" id="currentPrice" value="${requestScope.currentPrice}"/>
                            </div>



                        </div> 
                    </div>
                </c:if>


            </div>
        </div>
        <%@ include file="footer.jsp" %>

        <script>
            let selectedSeats = [];
            let totalAmount = 0;

            function totalBill(thisSeat) {
                const seatName = thisSeat.querySelector('.seatName').value;
                const seatSurcharge = parseInt(thisSeat.querySelector('.seatSurcharge').value);
                const price = parseInt(document.getElementById('currentPrice').value);

                if (thisSeat.dataset.disabled === 'false') {
                    thisSeat.dataset.disabled = 'true';
                    thisSeat.classList.add('selected');
                    selectedSeats.push(seatName);
                    totalAmount += price + seatSurcharge;
                } else {
                    thisSeat.dataset.disabled = 'false';
                    thisSeat.classList.remove('selected');
                    const index = selectedSeats.indexOf(seatName);
                    if (index > -1) {
                        selectedSeats.splice(index, 1);
                    }
                    totalAmount -= price + seatSurcharge;
                }

                const selectedSeatsText = selectedSeats.join(', ');
                document.getElementById('totalAmount').innerText = totalAmount;
                document.getElementById('selectedSeats').innerText = selectedSeatsText;
            }


        </script>
    </body>
</html>







