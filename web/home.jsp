<%-- Document : home Created on : May 12, 2024, 2:46:40 PM Author : Admin --%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Location" %>
<%@page import="dal.LocationDAO" %>
<% 
   LocationDAO ld = new LocationDAO();
%>

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

        <%@include file="header.jsp" %> 
        <div style="position: relative;">
            <%@include file="slideshow.jsp" %>
            <div id="home-search">
                <div>
                    <img style="height: 50px;width: auto" src="image/logo3.png" alt="alt"/>
                </div>
                <form action="routeTicket" style="display: flex">
                    <ul id="all-location" style="display: none">
                        <% for(Location l : ld.getAllLocation()){
                        %>
                        <li value="<%=l.getName()%>"><%=l.getName()%></li>
                            <% } %>
                    </ul>

                    <svg style="margin: auto 2px" width="27px" height="27px" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 384 512"><path fill="#2872ff" d="M215.7 499.2C267 435 384 279.4 384 192C384 86 298 0 192 0S0 86 0 192c0 87.4 117 243 168.3 307.2c12.3 15.3 35.1 15.3 47.4 0zM192 128a64 64 0 1 1 0 128 64 64 0 1 1 0-128z"/></svg>
                    <div class="home-search-item" id="departure-box">
                        <input type="text"  id="departure-input-box" name="fDepartureLocation" placeholder="Điểm xuất phát" autocomplete="off"/>
                        <div class="departure-result-box result-box"></div>
                    </div>

                    <svg style="margin: auto 2px" width="27px" height="27px" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 384 512"><path fill="#f20000" d="M215.7 499.2C267 435 384 279.4 384 192C384 86 298 0 192 0S0 86 0 192c0 87.4 117 243 168.3 307.2c12.3 15.3 35.1 15.3 47.4 0zM192 128a64 64 0 1 1 0 128 64 64 0 1 1 0-128z"/></svg>
                    <div class="home-search-item" id="arrival-box">
                        <input type="text" id="arrival-input-box" name="fArrivalLocation" placeholder="Điểm đến" autocomplete="off"/>
                        <div class="arrival-result-box result-box"></div>
                    </div>

                    <div class="home-search-item">
                        <div style="display: flex">
                            <strong style="margin: 3px 3px 3px 0;">Giá tiền: </strong>
                            <p style="color: red;margin: auto 0" id="priceValue">600.000đ</p>
                        </div>
                        <div class="price-range-container" style="display: flex">
                            <input style="padding: 5px" type="range" min="0" max="600000" step="50000" name="fPrice" id="priceRange" value="600000">
                        </div>
                    </div>
                    <button type="submit" id="home-search-button">
                        <svg style="margin-right: 2px" width="18px" height="18px" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512">
                        <path d="M416 208c0 45.9-14.9 88.3-40 122.7L502.6 457.4c12.5 12.5 12.5 32.8 0 45.3s-32.8 12.5-45.3 0L330.7 376c-34.4 25.2-76.8 40-122.7 40C93.1 416 0 322.9 0 208S93.1 0 208 0S416 93.1 416 208zM208 352a144 144 0 1 0 0-288 144 144 0 1 0 0 288z"/>
                        </svg>
                        Tìm kiếm             
                    </button>

                </form>
            </div>
        </div>

        <%@include file="footer.jsp" %>
        <!--        <div class="loader" style=" background-image: url('image/background.png')"></div>-->

        <script>
            window.addEventListener("load", () => {
                const loader = document.querySelector(".loader");
                loader.classList.add("loader-hidden");
                loader.addEventListener("transitionend", () => {
                    document.body.removeChild("loader");
                });
            });


            const departureResultsBox = document.querySelector(".departure-result-box");
            const departureInputBox = document.getElementById("departure-input-box");
            const departureBox = document.getElementById("departure-box");
            const arrivalResultsBox = document.querySelector(".arrival-result-box");
            const arrivalInputBox = document.getElementById("arrival-input-box");
            const arrivalBox = document.getElementById("arrival-box");
            const allLocationElements = document.querySelectorAll("#all-location li");
            const allLocation = Array.from(allLocationElements).map(li => li.textContent);

            function handleKeyUp(inputBox, resultsBox) {
                let result = [];
                let input = inputBox.value;
                if (input.length) {
                    result = allLocation.filter((keyword) => {
                        return keyword.toLowerCase().includes(input.toLowerCase());
                    });
                }
                const content = result.map((list) => {
                    return "<li onclick='selectInput(\"" + inputBox.id + "\", \"" + list + "\")'>" + list + "</li>";
                }).join("");

                resultsBox.innerHTML = "<ul>" + content + "</ul>";
            }


            function selectInput(inputBoxId, value) {
                document.getElementById(inputBoxId).value = value;
                document.getElementById(inputBoxId).nextElementSibling.innerHTML = '';
            }

            departureInputBox.onkeyup = function () {
                handleKeyUp(departureInputBox, departureResultsBox);
            };

            arrivalInputBox.onkeyup = function () {
                handleKeyUp(arrivalInputBox, arrivalResultsBox);
            };

            departureBox.addEventListener('blur', function () {
                departureResultsBox.innerHTML = '';
            });

            arrivalBox.addEventListener('blur', function () {
                arrivalResultsBox.innerHTML = '';
            });


            const priceRange = document.getElementById('priceRange');
            const priceValue = document.getElementById('priceValue');

            function updatePrice() {
                priceValue.textContent = Number(priceRange.value).toLocaleString('vi-VN') + "đ";
            }
            priceRange.addEventListener('input', updatePrice);


        </script>
    </body>
</html>
