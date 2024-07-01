<%-- 
    Document   : evaluate
    Created on : Jun 30, 2024, 9:03:27 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@ include file="header.jsp" %> 
        <div style="margin: 100px">
            <form method="" action=""> 
                <textarea id="comment" name="comment" rows="5" cols="10"></textarea>
                <input type="submit" value="Submit"/>
            </form>
        </div>
        <%@ include file="footer.jsp" %>
    </body>

</html>
