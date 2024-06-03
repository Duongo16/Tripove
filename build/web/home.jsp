<%-- Document : home Created on : May 12, 2024, 2:46:40 PM Author : Admin --%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <link rel="shortcut icon" type="image/jpg" href="image/logo-icon.png" />
        <title>Tripove</title>
        <link
            href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,100..900;1,100..900&family=Reddit+Sans:ital,wght@0,200..900;1,200..900&display=swap"
            rel="stylesheet"
            />
        <link rel="stylesheet" href="css/styleHome.css" />
    </head>
    <body>

        <%@include file="header.jsp" %> <%@include file="slideshow.jsp" %>
        <%@include file="footer.jsp" %>
        <div class="loader" style=" background-image: url('image/background.png')"></div>

        <script>
            window.addEventListener("load", () => {
                const loader = document.querySelector(".loader");
                loader.classList.add("loader-hidden");
                loader.addEventListener("transitionend", () => {
                    document.body.removeChild("loader");
                });
            });
        </script>
    </body>
</html>
