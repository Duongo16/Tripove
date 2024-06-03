<%-- Document : register Created on : May 12, 2024, 5:49:30 PM Author : Admin
--%> <%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <title>Register</title>
        <link rel="shortcut icon" type="image/jpg" href="image/logo-icon.png" />
        <link rel="stylesheet" href="css/styleLoginAndRegister.css" />
        <link rel="stylesheet" href="icon/themify-icons/themify-icons.css" />
    </head>
    <body>
        <div class="container">
            <h1 style="margin-bottom: 30px">
                Đăng ký<a
                    style="
                    float: right;
                    font-size: 25px;
                    margin-top: 8px;
                    text-decoration: none;
                    color: rgb(71, 143, 192);
                    "
                    href="home"
                    ><i class="ti-home"></i
                    ></a>
            </h1>

            <h3 style="color: red">${requestScope.error}</h3>
            <c:set var="cookie" value="${pageContext.request.cookies}" />
            <form action="register" method="post">
                <div class="form-group">
                    <input type="text" name="name" required />
                    <label for="">Tên của bạn</label>
                </div>
                <div class="form-group">
                    <input type="email" name="email" required />
                    <label for="">Email</label>
                </div>
                <div class="form-group">
                    <input type="text" name="user" required />
                    <label for="">Tên đăng nhập</label>
                </div>
                <div class="form-group">
                    <input type="password" name="pass" id="password" required />
                    <label for="">Mật khẩu</label>
                </div>
                <div class="form-group">
                    <input
                        type="password"
                        id="confirmPassword"
                        required
                        onkeyup="checkPass()"
                        />
                    <label for="">Nhập lại mật khẩu</label>
                </div>
                <div><p id="wrongPass" style="display: none; color: red">
                        Mật khẩu không trùng khớp
                    </p></div>
                <br />
                <p id="capslock-warning" style="display: none; margin-bottom: 30px">⚠️ Caps Lock is on</p>
                <h3 style="color: red">${requestScope.existedUsername}</h3>
                <div class="button">
                    <input id="submit" type="submit" value="Đăng ký" /><br /><br />
                </div>
                Bạn đã có tài khoản? <a class="letDoIt" href="login">Đăng nhập</a>
            </form>
        </div>

        <script>
            var p = document.getElementById("password");
            var cp = document.getElementById("confirmPassword");
            var submit = document.getElementById("submit");
            var wrongPass = document.getElementById("wrongPass");
            var text = document.getElementById("capslock-warning");
            
            function CapsCheck(event) {
                if (event.getModifierState("CapsLock")) {
                    text.style.display = "block";
                } else {
                    text.style.display = "none";
                }
            }
            
            p.addEventListener("keyup", CapsCheck);
            cp.addEventListener("keyup", CapsCheck);

            function checkPass() {
                if (p.value !== cp.value) {
                    submit.disabled = true;
                    cp.style.border = "2px solid red";
                    wrongPass.style.display = "inline";
                } else {
                    submit.disabled = false;
                    cp.style.border = "2px solid green";
                    wrongPass.style.display = "none";
                }
            }
        </script>
    </body>
</html>
