<%-- 
    Document   : buyingTicket
    Created on : Jun 2, 2024, 9:58:35 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="model.Route" %>
<%@page import="model.Route_Detail" %>
<%@page import="model.Location" %>
<%@page import="dal.RouteDAO" %>
<%@page import="dal.LocationDAO" %>
<%@page import="dal.Route_DetailDAO" %>
<%@page import="dal.LocationDAO" %>
<%@page import="java.util.*" %> 
<%@page import="java.sql.Date" %>
<% RouteDAO rd = new RouteDAO();
   LocationDAO ld = new LocationDAO();
   Route_DetailDAO rdd = new Route_DetailDAO();
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/styleRouteTicket.css"/>
        <script src="js/locationBox.js" type="text/javascript"></script>
        <style>
            body{
                background-color: rgb(242, 242, 242);
            }
            *
        </style>
    </head>
    <body>
        <%@include file="header.jsp" %> 
        <div style="margin: 100px 0" class="row">
            <div class="col-md-2"></div>
            <div class="col-md-2" style="margin-right: 25px">
                <div class="row">
                    <div class="route">
                        <div style="padding: 20px">
                            <h5 style="margin-bottom: 20px"><strong>Sắp xếp</strong></h5>
                            <div style="font-size: 15px">
                                <div style="display: flex">
                                    <input type="radio" value="default" name="sort" checked/> 
                                    <p>Mặc định </p>
                                </div>
                                <div style="display: flex">
                                    <input type="radio" value="minToMax" name="sort"/>
                                    <p>Giá tăng dần</p>
                                </div>
                                <div style="display: flex">
                                    <input type="radio" value="maxToMin" name="sort"/>
                                    <p>Giá giảm dần </p>
                                </div>
                                <div style="display: flex">
                                    <input type="radio" value="minToMax" name="sort"/> 
                                    <p>Đánh giá cao nhất</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="route">
                        <div style="padding: 20px">
                            <h5 style="margin-bottom: 20px"><strong>Bộ lọc</strong></h5>
                            <form action="routeTicket">
                                <ul id="all-location" style="display: none">
                                    <% for(Location l : ld.getAllLocation()){
                                    %>
                                    <li value="<%=l.getName()%>"><%=l.getName()%></li>
                                        <% } %>
                                </ul>

                                <div style="display: flex;margin-bottom: 18px">
                                    <svg style="margin: auto 2px" width="27px" height="27px" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 384 512"><path fill="#2872ff" d="M215.7 499.2C267 435 384 279.4 384 192C384 86 298 0 192 0S0 86 0 192c0 87.4 117 243 168.3 307.2c12.3 15.3 35.1 15.3 47.4 0zM192 128a64 64 0 1 1 0 128 64 64 0 1 1 0-128z"/></svg>
                                    <div class="home-search-item" id="departure-box">
                                        <input type="text" style="width: 164px;" value="${requestScope.fDepartureLocation}"  id="departure-input-box" name="fDepartureLocation" placeholder="Điểm xuất phát" autocomplete="off"/>
                                        <div class="departure-result-box result-box"></div>
                                    </div>
                                </div>

                                <div style="display: flex;margin-bottom: 18px">
                                    <svg style="margin: auto 2px" width="27px" height="27px" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 384 512"><path fill="#f20000" d="M215.7 499.2C267 435 384 279.4 384 192C384 86 298 0 192 0S0 86 0 192c0 87.4 117 243 168.3 307.2c12.3 15.3 35.1 15.3 47.4 0zM192 128a64 64 0 1 1 0 128 64 64 0 1 1 0-128z"/></svg>
                                    <div class="home-search-item" id="arrival-box">
                                        <input type="text" style="width: 164px" value="${requestScope.fArrivalLocation}" id="arrival-input-box" name="fArrivalLocation" placeholder="Điểm đến" autocomplete="off"/>
                                        <div class="arrival-result-box result-box"></div>
                                    </div>
                                </div>

                                <div class="home-search-item">
                                    <div style="display: flex">
                                        <strong style="margin: 3px 3px 3px 0;">Giá tiền: </strong>
                                        <strong style="margin: auto 0"><p style="color: rgb(71, 143, 192);margin: auto 0" id="priceValue">600.000đ</p></strong>
                                    </div>
                                    <div class="price-range-container" style="display: flex">
                                        <input style="padding: 5px" type="range" min="0" max="600000" step="50000" name="fPrice" id="priceRange" value="600000">
                                    </div>
                                </div>
                                <button type="submit" id="home-search-button" 
                                        style="    text-decoration: none;
                                        background: rgb(255, 199, 0);
                                        color: rgb(72, 72, 72);
                                        font-weight: 800;
                                        border-radius: 5px;
                                        border: none;
                                        float: right;
                                        padding: 7px 18px;
                                        margin: 11px 0;">
                                    Lọc             
                                </button>

                            </form>                        
                        </div>
                    </div>
                </div>
            </div>
            <div id="routeInfo" class="col-md-6">
                <% for(Route r : (List<Route>)request.getAttribute("allRoute")){%>
                <div class="route row">
                    <div class="route-image col-md-4" style="padding: 0">
                        <% for(String img : rd.getVehicleCatImageByRouteId(r.getId()) ) {%>
                        <img src="<%=img%>" alt="Hello" />
                        <%break;}%>
                    </div>
                    <div class="route-content col-md-6" style="position: relative;padding-top: 10px">
                        <h4 style="margin-bottom: 8px"><strong><%=r.getName()%></strong></h4>
                        <div style="font-size: 14px;width: 100%">
                            <p style="margin-bottom: 0px">
                                <svg width="16px" height="16px" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 384 512"><path fill="#2872ff" d="M215.7 499.2C267 435 384 279.4 384 192C384 86 298 0 192 0S0 86 0 192c0 87.4 117 243 168.3 307.2c12.3 15.3 35.1 15.3 47.4 0zM192 128a64 64 0 1 1 0 128 64 64 0 1 1 0-128z"/></svg>
                                <strong>Xuất phát:</strong> <%=ld.getLocationNameById(r.getDeparture_Locationid())%>
                            </p>
                            <svg style="margin: 3px 0" width="16px" height="16px" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 128 512"><!--!Font Awesome Free 6.5.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.--><path d="M64 360a56 56 0 1 0 0 112 56 56 0 1 0 0-112zm0-160a56 56 0 1 0 0 112 56 56 0 1 0 0-112zM120 96A56 56 0 1 0 8 96a56 56 0 1 0 112 0z"/></svg>
                            <p>
                                <svg width="16px" height="16px" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 384 512"><path fill="#f20000" d="M215.7 499.2C267 435 384 279.4 384 192C384 86 298 0 192 0S0 86 0 192c0 87.4 117 243 168.3 307.2c12.3 15.3 35.1 15.3 47.4 0zM192 128a64 64 0 1 1 0 128 64 64 0 1 1 0-128z"/></svg>
                                <strong>Điểm đến:</strong> <%=ld.getLocationNameById(r.getArrival_Locationid())%>
                            </p>
                        </div>
                        <a style="text-decoration: none;
                           color: rgb(71, 143, 192);
                           cursor: pointer;
                           position: absolute;
                           bottom: 8px;
                           font-size: 15px
                           "
                           class="entity-detail"
                           onclick="displayDetail('<%=r.getId()%>')"
                           >Chi tiết <i id="arrow<%=r.getId()%>" class="ti-arrow-down"></i></a>
                    </div>
                    <div class="col-md-2" style="padding: 0">
                        <div style="position: relative;height: 100%">
                            <div>
                                <p style="color: rgb(71, 143, 192);
                                   font-weight: 700;
                                   font-size: 23px;
                                   text-align: right;
                                   padding-top: 6px;
                                   padding-right: 18px
                                   ">
                                    chỉ từ <fmt:formatNumber value="<%=r.getPrice()%>" type="number" groupingUsed="true"/>đ
                                </p>
                            </div>
                            <a class="routeTicket-button" href="routeDetailTicket?routeId=<%=r.getId()%>">Tìm chuyến</a><br>
                        </div>
                    </div>

                    <div id="route-detail<%=r.getId()%>" style="display: none; margin-top: 25px">
                        <strong>Lộ trình:</strong><br>
                        <% 
                            String[] loc = r.getDetail().split("-");
                            for(int i = 0; i < loc.length; i++) {
                                if (i != 0) {
                        %>
                        <i class="ti-more-alt"></i>
                        <% } %>
                        <span><%= loc[i] %></span>
                        <% } %>
                        <br>
                    </div>
                </div>
                <%}%>
            </div>
            <div class="col-md-2"></div>

        </div>
        <%@include file="footer.jsp" %>
        <script src="js/locationBox.js" type="text/javascript"></script>

        <script>
                               const priceRange = document.getElementById('priceRange');
                               const priceValue = document.getElementById('priceValue');

                               function updatePrice() {
                                   priceValue.textContent = Number(priceRange.value).toLocaleString('vi-VN') + " đ";
                               }
                               priceRange.addEventListener('input', updatePrice);

                               function displayDetail(id) {
                                   var detail = document.getElementById("route-detail" + id);
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
    </body>
</html>
