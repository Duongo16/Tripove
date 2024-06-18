<%-- 
    Document   : routeDetailTicket
    Created on : Jun 13, 2024, 7:09:44 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="model.Route" %>
<%@page import="model.Route_Detail" %>
<%@page import="dal.RouteDAO" %>
<%@page import="dal.Route_DetailDAO" %>
<% 
    RouteDAO rd = new RouteDAO();
    Route_DetailDAO rdd = new Route_DetailDAO();
    Route cr = (Route) request.getAttribute("currentRoute"); 
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/styleRouteDetailTicket.css"/>
    </head>
    <body>
        <%@include file="header.jsp" %> 
        <div style="margin-top: 100px">
            <div class="box">
                <h1><%=cr.getName()%></h1>

                <div class="bar">
                    <p>Ngày xuất phát:</p>
                    <c:forEach var="detail" items="<%=rdd.getAllUniqueDateByRouteId(cr.getId())%>">
                        <a class="${requestScope.currentDate.equals(detail)?'selected-item':'item'}" 
                           href="routeDetailTicket?routeId=<%=cr.getId()%>&date=${detail}">
                            <fmt:formatDate pattern="dd/MM/yyyy" value="${detail}"/>
                        </a>
                    </c:forEach>
                </div>

                <div class="bar">
                    <p>Thời gian xuất phát:</p>
                    <c:forEach var="t" items="${requestScope.listOfTime}">
                        <a class="${requestScope.currentTime.equals(t)?'selected-item':'item'}" 
                           href="routeDetailTicket?routeId=<%=cr.getId()%>&date=${requestScope.currentDate}&time=${t}">
                            <fmt:formatDate pattern="HH:mm" value="${t}"/>
                        </a>
                    </c:forEach>
                </div class="bar">

                <div>
                    <c:forEach var="crd" items="${requestScope.allCurrentRouteDetail}">
                        <p>${crd.vehiclelicensePlate}</p>
                    </c:forEach>
                </div>

            </div>


        </div>
        <%@include file="footer.jsp" %>
    </body>
</html>
