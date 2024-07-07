<%-- 
    Document   : successfulBuying
    Created on : Jun 25, 2024, 8:25:16 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="shortcut icon" type="image/jpg" href="image/logo-icon.png" />
        <title>Thanh toán thành công</title>
        <style>
            .box {
                background-color: #fff;
                border-radius: 8px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                width: 80%;
                max-width: 600px;
                margin: 176px auto;
                padding: 30px;
                text-align: center;
            }
            .box svg {
                width: 100px;
                height: 100px;
                fill: #32b877;
                margin: 0 auto 20px;
                animation: rotateIcon 0.75s infinite linear;
            }
            @keyframes rotateIcon {
                0% {
                    transform: rotate(0deg);
                }
                50% {
                    transform: rotate(15deg);
                }
                100% {
                    transform: rotate(0deg);
                }
            }
            h3 {
                color: #333;
                font-size: 24px;
                margin-bottom: 10px;
            }
            p {
                color: #666;
                font-size: 16px;
                line-height: 1.6;
            }
            .button {
                display: inline-block;
                color: rgb(71, 143, 192);
                font-size: 16px;
                padding: 10px 20px;
                text-decoration: none;
                border:2px solid rgb(71, 143, 192);
                border-radius: 5px;
                margin-top: 20px;
                transition: background-color 0.3s;
            }
            .button:hover {
                color: white;
                text-decoration: none;
                background-color: rgb(71, 143, 192);
            }

            .loader {
                background-image: url('image/background.png');
                position: fixed;
                top: 0;
                left: 0;
                width: 100vw;
                height: 100vh;
                display: flex;
                justify-content: center;
                align-items: center;
                z-index: 9999;
                transition: all 3s;
            }

            .loader-hidden {
                opacity: 0;
                visibility: hidden;
            }

            .loader::after {
                content: "";
                width: 75px;
                height: 75px;
                border: 15px solid white;
                border-top-color: var(--tripoveMainColor) ;
                border-radius: 50%;
                animation: loading 2s ease infinite;
            }

            @keyframes loading {
                from {
                    transform: rotate(0turn);
                }
                to {
                    transform: rotate(1turn);
                }
            }
        </style>
    </head>
    <body>
        <%@include file="header.jsp" %>
        <div class="box">
            <div>
                <svg id="check-icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><path fill="#32b877" d="M256 512A256 256 0 1 0 256 0a256 256 0 1 0 0 512zM369 209L241 337c-9.4 9.4-24.6 9.4-33.9 0l-64-64c-9.4-9.4-9.4-24.6 0-33.9s24.6-9.4 33.9 0l47 47L335 175c9.4-9.4 24.6-9.4 33.9 0s9.4 24.6 0 33.9z"/></svg>
            </div>
            <h3>Thanh toán thành công</h3>
            <p>Chúc mừng bạn đã thanh toán thành công.<br>Vui lòng lưu thông tin vé để xuất trình khi sử dụng dịch vụ.</p>
            <a href="home" class="button">In thông tin vé</a>
            <a href="home" class="button">Trang chủ</a>
        </div>
        <div class="loader" style=" background-image: url('image/background.png')"></div>
        <%@include file="footer.jsp" %>
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
