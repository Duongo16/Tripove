<%-- Document : login Created on : May 5, 2024, 6:42:41 PM Author : Admin --%>
<%@ page contentType="text/html" pageEncoding="UTF-8" %> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>Login</title>
    <link rel="shortcut icon" type="image/jpg" href="image/logo-icon.png" />
    <link rel="stylesheet" href="css/styleLoginAndRegister.css" />
    <link
      href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,100..900;1,100..900&family=Reddit+Sans:ital,wght@0,200..900;1,200..900&display=swap"
      rel="stylesheet"
    />
    <link rel="stylesheet" href="icon/themify-icons/themify-icons.css" />
  </head>
  <body>
    <div class="container">
      <h1 style="margin-bottom: 30px">
        Đăng nhập
        <a
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
      <c:set var="cookie" value="${pageContext.request.cookies}" />
      <form action="login" method="post">
        <div class="form-group">
          <input
            type="text"
            name="user"
            value="${cookie.cuser.value}"
            required
          />
          <label for="">Tên đăng nhập</label>
        </div>
        <div class="form-group">
          <input
            type="password"
            id="password"
            name="pass"
            value="${cookie.cpass.value}"
            required
          />
          <label for="">Mật khẩu</label>
        </div>
        <p id="wrongAccount" style="color: red">${requestScope.error}</p>
        <p id="capslock-warning" style="display: none; margin-bottom: 25px">
          ⚠️ Caps Lock is on
        </p>
        <input type="checkbox" ${cookie.crem != null ? 'checked' : ''}
        name="rem" value="ON"/> Remember me
        <a id="forgetPassword" href="forgetPassword">Quên mật khẩu?</a
        ><br /><br />
        <div class="button">
          <input type="submit" value="Đăng nhập" /><br /><br />
        </div>
        Bạn chưa có tài khoản à?
        <a class="letDoIt" href="register">Đăng ký ngay</a>
      </form>
    </div>
    <script>
      var input = document.getElementById("password");
      var text = document.getElementById("capslock-warning");
      input.addEventListener("keyup", function (event) {
        if (event.getModifierState("CapsLock")) {
          text.style.display = "block";
        } else {
          text.style.display = "none";
        }
      });
    </script>
  </body>
</html>
