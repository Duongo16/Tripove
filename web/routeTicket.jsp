<%-- 
    Document   : buyingTicket
    Created on : Jun 2, 2024, 9:58:35 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="model.Route" %>
<%@page import="model.Route_Detail" %>
<%@page import="dal.RouteDAO" %>
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
        <style>
            body{
                background-color: rgb(242, 242, 242);
            }
        </style>
    </head>
    <body>
        <%@include file="header.jsp" %> 
        <div style="margin: 100px 0" class="row">
            <div class="col-md-2"></div>
            <div id="routeFilter" class="col-md-2"></div>
            <div id="routeInfo" class="col-md-6">
                <% for(Route r : (List<Route>)request.getAttribute("allRoute")){%>
                <div class="route row">
                    <div id="route-image" class="col-md-4">
                        <% for(String img : rd.getVehicleCatImageByRouteId(r.getId()) ) {%>
                        <img src="<%=img%>" alt="Hello" />
                        <%break;}%>
                    </div>
                    <div id="route-content" class="col-md-6">
                        <h5><%=r.getName()%></h5>
                        <p>Xuất phát: <%=ld.getLocationNameById(r.getDeparture_Locationid())%></p>
                        <p>Điểm đến: <%=ld.getLocationNameById(r.getArrival_Locationid())%></p>

                    </div>
                    <div class="col-md-2" >
                        <div>
                            <p style="color: rgb(71, 143, 192);
                               font-weight: 700;
                               font-size: 23px;
                               text-align: right;
                               margin-top: 2px;
                               ">
                                chỉ từ <fmt:formatNumber value="<%=r.getPrice()%>" type="number" groupingUsed="true"/>đ
                            </p>
                        </div>
                        <a style="" href="routeDetailTicket?routeId=<%=r.getId()%>">Tìm chuyến</a><br>
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
                        
                    <a style="text-decoration: none;
                       background-color: rgb(71, 143, 192);
                       color: white;
                       cursor: pointer;
                       text-align: center;
                       border-bottom-right-radius: 10px;
                       border-bottom-left-radius: 10px;
                       padding: 6px 0;"
                       class="entity-detail"
                       onclick="displayDetail('<%=r.getId()%>')"
                       >Detail <i id="arrow<%=r.getId()%>" class="ti-arrow-down"></i></a>
                </div>

                <%}%>
            </div>
            <div class="col-md-2"></div>

        </div>
        <%@include file="footer.jsp" %>

        <script type="text/javascript">
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
