<%-- 
    Document   : buyingTicket
    Created on : Jun 2, 2024, 9:58:35 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="model.Route" %>
<%@page import="dal.RouteDAO" %>
<%@page import="dal.LocationDAO" %>
<%@page import="java.util.*" %> 
<% RouteDAO rd = new RouteDAO();
   LocationDAO ld = new LocationDAO();
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <<link rel="stylesheet" href="css/styleRouteTicket.css"/>
    </head>
    <body>
        <%@include file="header.jsp" %> 
        <div style="margin: 100px 0" class="row">
            <div class="col-md-1"></div>
            <div id="routeFilter" class="col-md-3"></div>
            <div id="routeInfo" class="col-md-7">
                <% for(Route r : (List<Route>)request.getAttribute("allRoute")){%>
                <div class="route row">
                    <div id="route-image" class="col-md-4">
                        <% for(String img : rd.getVehicleCatImageByRouteId(r.getId()) ) {%>
                        <img src="<%=img%>" alt="Hello" />
                        <%}%>
                    </div>
                    <div id="route-content" class="col-md-6">
                        <h3><%=r.getName()%>
<!--                            <i style="float: right;font-size: 25px" class="ti-heart"></i>-->
                        </h3>
                        <p>Xuất phát: <%=ld.getLocationNameById(r.getDeparture_Locationid())%></p>
                        <p>Điểm đến: <%=ld.getLocationNameById(r.getArrival_Locationid())%></p>
                        <!--                        <p style="color: rgb(71, 143, 192); font-weight: 700">
                                                    Giá tiền: <fmt:formatNumber value="<%=r.getPrice()%>" type="number" groupingUsed="true"/> VND/người
                                                </p>-->

                    </div>
                    <div class="col-md-2">
                        <div class="row">
                            <div class="col-md-3"></div>
                            <a class="col-md-9" id="route-button" href="#">ĐẶT VÉ</a>
                        </div>
                    </div>

                    <div id="route-detail<%=r.getId()%>" style="display: none">
                        Hello
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
            <div class="col-md-1"></div>

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
