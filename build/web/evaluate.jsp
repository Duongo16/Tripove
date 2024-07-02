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
            <form method="post" action="evaluate"> 
                <input type="hidden" name="accountId" value="${sessionScope.id}"/>
                <input type="hidden" name="routeDetailId" value="${requestScope.routeDetailId}"/>
                <textarea id="editor" name="editor" rows="5" cols="10"></textarea>
                <input type="submit" value="Submit"/>
            </form>
        </div>
        <script src="https://cdn.ckeditor.com/ckeditor5/12.3.1/classic/ckeditor.js"></script>
        <script>
            ClassicEditor
                    .create(document.querySelector('#editor'))
                    .catch(error => {
                        console.error(error);
                    });
        </script>
        <%@ include file="footer.jsp" %>z
    </body>

</html>
