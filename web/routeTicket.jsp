<%-- 
    Document   : buyingTicket
    Created on : Jun 2, 2024, 9:58:35 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
    </head>
    <body>
        <%@include file="header.jsp" %> 
        <div style="margin: 100px 0">
            <div id="routeFilter"></div>
            <div id="routeInfo">
                <% for(Route r : (List<Route>)request.getAttribute("allRoute")){
                    %><div class="route">
                        <img src="<%=rd.getVehicleImageByRouteId(r.getId())%>" alt="Hello" />
                        <h1><%=r.getName()%></h1>
                        <p>Xuất phát: <%=ld.getLocationNameById(r.getDeparture_Locationid())%></p>
                        <p>Điểm đến: <%=ld.getLocationNameById(r.getArrival_Locationid())%></p>
                        
                    </div>
                <%}%>
            </div>
            
        </div>
        <%@include file="footer.jsp" %>
    </body>
</html>
