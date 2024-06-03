<%-- 
    Document   : infoUpdate
    Created on : May 13, 2024, 8:23:26 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cập nhật thông tin</title>
        <link rel="shortcut icon" type="image/jpg" href="image/logo-icon.png" />
        <link rel="stylesheet" href="css/styleInfo.css" />
    </head>
    <body>
        <%@include file="header.jsp" %>
        <div id="update-form">
            <h1>Cập nhật thông tin cá nhân</h1>
            <form action="infoUpdate" method="post">
                Ảnh đại diện: <input type="file" name="image">
                <input type="hidden" name="username" value="${requestScope.account.username}"/>
                <input type="hidden" name="role" value="${requestScope.account.role}"/>
                <input type="hidden" name="id" value="${requestScope.account.id}"/>
                <input type="hidden" name="created_at" value="${requestScope.account.created_at}"/><br>
                Họ và tên:<br> <input type="text" name="name" value="${requestScope.account.name}" /><br>
                Giới tính: <br>
                <input type="radio" name="gender" value="male" ${requestScope.account.gender == 'male' ? 'checked' : ''}>Nam
                <input type="radio" name="gender" value="female" ${requestScope.account.gender == 'female' ? 'checked' : ''}>Nữ
                <input type="radio" name="gender" value="other" ${!requestScope.account.gender.equals('male') && !requestScope.account.gender.equals('female') ? 'checked' : ''}>Khác<br>
                Ngày sinh: <br> <input type="date" name="dateOfBirth" value="${requestScope.account.dateOfBirth}"><br>
                Email:<br><input type="email" name="email" value="${requestScope.account.email}"/><br>
                Số điện thoại:<br><input type="number" name="phoneNumber" value="${requestScope.account.phoneNumber}"/><br>
                Địa chỉ:<br><input type="text" name="address" value="${requestScope.account.address}"><br>
                <button id="info-update" type="submit">Cập nhật</button>
                <button id="info-home" onclick="window.location.href = 'info'">Huỷ</button>
            </form>
        </div>
        <%@include file="footer.jsp" %>
    </body>
</html>
