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
        <link href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,100..900;1,100..900&family=Reddit+Sans:ital,wght@0,200..900;1,200..900&display=swap" rel="stylesheet" />
        <link rel="stylesheet" href="css/styleHome.css" />
        <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">

        <style>
            
            #introduction {
                padding: 20px;
                background-image: linear-gradient(rgb(71, 143, 192), white);
                text-align: center;
                color: white;
                height: 150px;
            }

            #introduction h1 {
                color: white;
                margin-top: 15px
            }

            #promotion {
                display: flex;
                justify-content: space-around;
                margin: 50px 0;
            }

            #promotion h3 {
                color: rgb(71, 143, 192)
            }

            #promotion p {
                text-align: justify
            }

            .promotion-item {
                text-align: center;
                width: 45%;
                margin: 10px;
                padding: 10px;
                box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
                background-color: #fff;
            }

            .promotion-item img {
                max-width: 100%;
                height: 100%;
                border-radius: 5px;
                object-fit: cover;
            }
            #statistics {
                padding: 50px 20px;
                background: linear-gradient(135deg, rgb(71, 143, 192), rgb(28, 98, 169));
                text-align: center;
                color: white;
                display: flex;
                justify-content: space-around;
                flex-wrap: wrap;
                gap: 20px;
            }

            .statistics-heading {
                width: 100%
            }


            .stat-item {
                margin: 20px;
                padding: 30px;
                border-radius: 15px;
                background-color: rgba(255, 255, 255, 0.2);
                width: 300px;
                transition: transform 0.3s, box-shadow 0.3s;
            }

            .stat-item:hover {
                transform: scale(1.05);
                box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
            }

            .stat-item h3 {
                font-size: 3em;
                margin-bottom: 10px;
            }

            .stat-item p {
                font-size: 1.3em;
            }

            .stat-icon {
                font-size: 4em;
                margin-bottom: 20px;
                color: rgba(255, 255, 255, 0.8);
            }

            @media (max-width: 768px) {
                .stat-item {
                    width: 100%;
                }
            }

            .icon{
                margin-top: 30px
            }

            .icon svg {
                width: 125px;
                height: 125px
            }

            .ticket-button-container {
                text-align: center;
                padding-bottom: 30px;
                margin-top: 50px
            }

            .ticket-button {
                display: block;
                width: 200px;
                font-weight: 500;
                padding: 15px 30px;
                margin: 0 auto;
                background-color: rgb(255, 193, 7);
                color: black;
                text-decoration: none;
                font-size: 1.2em;
                border-radius: 30px;
                transition: background-color 0.3s, transform 0.3s;
            }

            .ticket-button:hover {
                background-color: rgb(218, 165, 0);
                transform: scale(1.05);
                text-decoration: none;
                color: black;
            }




        </style>
    </head>
    <body>
        <%@include file="header.jsp" %> 
        <div style="position: relative;" class="section">
            <%@include file="slideshow.jsp" %>
            <div id="home-search" class="section">
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
                            <p style="color: rgb(71, 143, 192);margin: auto 0" id="priceValue">600.000đ</p>
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
        <div id="body-1">
            <div id="introduction">
                <h1>Chào mừng đến với Tripove!</h1>
                <p>Không gian mới, cảm xúc mới - Đặt vé ngay để bắt đầu hành trình của bạn.</p>
            </div>

            <div id="promotion">
                <div class="promotion-item row" data-aos="fade-up" data-aos-anchor-placement="bottom-bottom">
                    <div class="col-md-6">
                        <img src="image/vehicle/pic1.jpg" alt="">
                    </div>
                    <div  class="col-md-6">
                        <h3>Ưu đãi hấp dẫn</h3>
                        <p>
                            Công ty cam kết cung cấp giá vé phù hợp, nhiều lựa chọn vận chuyển cùng các chương trình khuyến mãi hấp dẫn. Đội ngũ chăm sóc 24/7 luôn sẵn sàng hỗ trợ để mang đến trải nghiệm tốt nhất cho quý khách.
                        </p>
                    </div>
                </div>
                <div class="promotion-item row" data-aos="fade-up" data-aos-anchor-placement="bottom-bottom">
                    <div class="col-md-6">
                        <img src="image/vehicle/pic2.jpg" alt="">
                    </div>
                    <div class="col-md-6">
                        <h3>An bình khám phá</h3>
                        <p>
                            Công ty cam kết đảm bảo an toàn tuyệt đối cho khách hàng. Đội ngũ lái xe được đào tạo chuyên nghiệp, phương tiện luôn được bảo trì định kỳ và trang bị các thiết bị an toàn tiêu chuẩn, để mỗi chuyến đi của quý khách diễn ra suôn sẻ và bình an.
                        </p>
                    </div>
                </div>

            </div>
            <div style=" background-image: linear-gradient(white, rgb(71, 143, 192));
                 height: 150px"></div>
        </div>
        <div id="body-2">
            <div id="statistics">
                <h1 class="statistics-heading">Thông tin thống kê</h1>
                <div class="stat-item" data-aos="fade-up">
                    <div class="stat-icon"><i class="fas fa-users"></i></div>
                    <h3>100,000+</h3>
                    <p>Người dùng</p>
                    <div class="icon">
                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 640 512"><path fill="#ffffff" d="M144 0a80 80 0 1 1 0 160A80 80 0 1 1 144 0zM512 0a80 80 0 1 1 0 160A80 80 0 1 1 512 0zM0 298.7C0 239.8 47.8 192 106.7 192h42.7c15.9 0 31 3.5 44.6 9.7c-1.3 7.2-1.9 14.7-1.9 22.3c0 38.2 16.8 72.5 43.3 96c-.2 0-.4 0-.7 0H21.3C9.6 320 0 310.4 0 298.7zM405.3 320c-.2 0-.4 0-.7 0c26.6-23.5 43.3-57.8 43.3-96c0-7.6-.7-15-1.9-22.3c13.6-6.3 28.7-9.7 44.6-9.7h42.7C592.2 192 640 239.8 640 298.7c0 11.8-9.6 21.3-21.3 21.3H405.3zM224 224a96 96 0 1 1 192 0 96 96 0 1 1 -192 0zM128 485.3C128 411.7 187.7 352 261.3 352H378.7C452.3 352 512 411.7 512 485.3c0 14.7-11.9 26.7-26.7 26.7H154.7c-14.7 0-26.7-11.9-26.7-26.7z"/></svg>
                    </div>
                </div>
                <div class="stat-item" data-aos="fade-up" data-aos-delay="100">
                    <div class="stat-icon"><i class="fas fa-route"></i></div>
                    <h3>5,000K+</h3>
                    <p>Chuyến đi</p>
                    <div class="icon">
                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><path fill="#ffffff" d="M512 96c0 50.2-59.1 125.1-84.6 155c-3.8 4.4-9.4 6.1-14.5 5H320c-17.7 0-32 14.3-32 32s14.3 32 32 32h96c53 0 96 43 96 96s-43 96-96 96H139.6c8.7-9.9 19.3-22.6 30-36.8c6.3-8.4 12.8-17.6 19-27.2H416c17.7 0 32-14.3 32-32s-14.3-32-32-32H320c-53 0-96-43-96-96s43-96 96-96h39.8c-21-31.5-39.8-67.7-39.8-96c0-53 43-96 96-96s96 43 96 96zM117.1 489.1c-3.8 4.3-7.2 8.1-10.1 11.3l-1.8 2-.2-.2c-6 4.6-14.6 4-20-1.8C59.8 473 0 402.5 0 352c0-53 43-96 96-96s96 43 96 96c0 30-21.1 67-43.5 97.9c-10.7 14.7-21.7 28-30.8 38.5l-.6 .7zM128 352a32 32 0 1 0 -64 0 32 32 0 1 0 64 0zM416 128a32 32 0 1 0 0-64 32 32 0 1 0 0 64z"/></svg>
                    </div>
                </div>
                <div class="stat-item" data-aos="fade-up" data-aos-delay="200">
                    <div class="stat-icon"><i class="fas fa-bus-alt"></i></div>
                    <h3>300+</h3>
                    <p>Phương tiện</p>
                    <div class="icon">
                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 640 512"><path fill="#ffffff" d="M64 104v88h96V96H72c-4.4 0-8 3.6-8 8zm482 88L465.1 96H384v96H546zm-226 0V96H224v96h96zM592 384H576c0 53-43 96-96 96s-96-43-96-96H256c0 53-43 96-96 96s-96-43-96-96H48c-26.5 0-48-21.5-48-48V104C0 64.2 32.2 32 72 32H192 352 465.1c18.9 0 36.8 8.3 49 22.8L625 186.5c9.7 11.5 15 26.1 15 41.2V336c0 26.5-21.5 48-48 48zm-64 0a48 48 0 1 0 -96 0 48 48 0 1 0 96 0zM160 432a48 48 0 1 0 0-96 48 48 0 1 0 0 96z"/></svg>
                    </div>
                </div>
                <div class="stat-item" data-aos="fade-up" data-aos-delay="300">
                    <div class="stat-icon"><i class="fas fa-headset"></i></div>
                    <h3>24/7</h3>
                    <p>Hỗ trợ khách hàng</p>
                    <div class="icon">
                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><path fill="#ffffff" d="M256 48C141.1 48 48 141.1 48 256v40c0 13.3-10.7 24-24 24s-24-10.7-24-24V256C0 114.6 114.6 0 256 0S512 114.6 512 256V400.1c0 48.6-39.4 88-88.1 88L313.6 488c-8.3 14.3-23.8 24-41.6 24H240c-26.5 0-48-21.5-48-48s21.5-48 48-48h32c17.8 0 33.3 9.7 41.6 24l110.4 .1c22.1 0 40-17.9 40-40V256c0-114.9-93.1-208-208-208zM144 208h16c17.7 0 32 14.3 32 32V352c0 17.7-14.3 32-32 32H144c-35.3 0-64-28.7-64-64V272c0-35.3 28.7-64 64-64zm224 0c35.3 0 64 28.7 64 64v48c0 35.3-28.7 64-64 64H352c-17.7 0-32-14.3-32-32V240c0-17.7 14.3-32 32-32h16z"/></svg>
                    </div>
                </div>
                <div class="ticket-button-container">
                    <a href="routeTicket" class="ticket-button">Đặt vé ngay</a>
                </div>
            </div>

        </div>


    </div>
    <%@include file="footer.jsp" %>
    <!--    <div class="loader" style=" background-image: url('image/background.png')"></div>-->
    <script src="js/locationBox.js" type="text/javascript"></script>
    <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
    <script>
        AOS.init();

        window.addEventListener("load", () => {
            const loader = document.querySelector(".loader");
            loader.classList.add("loader-hidden");
            loader.addEventListener("transitionend", () => {
                document.body.removeChild(loader);
            });
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
