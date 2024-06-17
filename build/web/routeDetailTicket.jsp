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
        <link rel="stylesheet" href="css/styleRouteTicket.css"/>
    </head>
    <body>
        <%@include file="header.jsp" %> 
        <div style="margin-top: 100px">
            <div>
                <h1><%=cr.getName()%></h1>

                <c:forEach var="detail" items="<%=rdd.getAllUniqueDateByRouteId(cr.getId())%>">
                    <a href="routeDetailTicket?routeId=<%=cr.getId()%>&date=${detail}"><fmt:formatDate pattern="dd/MM/yyyy" value="${detail}"/></a>
                </c:forEach>

                <c:forEach var="t" items="${requestScope.listOfTime}">
                    <a href="routeDetailTicket?routeId=<%=cr.getId()%>&time=${t}">${t}</a>
                </c:forEach>

            </div>
        </div>
        <%@include file="footer.jsp" %>
    </body>
</html>
