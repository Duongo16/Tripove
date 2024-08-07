<%-- 
    Document   : admin
    Created on : May 14, 2024, 9:11:02 AM
    Author     : Admin
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tài khoản</title>
        <link rel="shortcut icon" type="image/jpg" href="image/logo-icon.png" />
        <link rel="stylesheet" href="css/styleAdminController.css">
        <style>
            .page-item a{
                color: rgb(71, 143, 192) !important;
            }
            .page-item.active .page-link {
                color: white !important;
                background: rgb(71, 143, 192) !important;
                border-color: rgb(71, 143, 192) !important;
            }
        </style>
    </head>
    <body>
        <%@include file="header.jsp" %>
        <%@include file="admin-sideBar.jsp" %>
        <div id="main-content">
            <div class="row" style="padding: 50px 0; margin: 0">
                <div class="col-md-10" id="left-column">
                    <div class="filterController">
                        <form action="accountController" method="get" style="margin-bottom: 20px;">
                            <input type="hidden" name="action" value="search">
                            <strong class="filterElm">Role:</strong>
                            <select class="filterElm" name="fRole">
                                <option value="" ${param.fRole == null ? 'selected' : ''}>All</option>
                                <option value="admin" ${param.fRole != null && param.fRole.equals("admin") ? 'selected' : ''}>Admin</option>
                                <option value="user" ${param.fRole != null && param.fRole.equals("user") ? 'selected' : ''}>User</option>
                            </select>

                            <strong>Name: </strong>
                            <input class="filterElm" type="text" name="fName" value="${param.fName}" placeholder="Enter name">
                            <strong>Phone number: </strong>
                            <input class="filterElm" type="number" name="fPhoneNumber" value="${param.fPhoneNumber}" placeholder="Enter phone number">
                            <button class="entity-update" type="submit" style="width: 60px" >
                                <i class="ti-search"></i>
                                Lọc
                            </button>
                            <a class="entity-delete" href="accountController">Huỷ</a>
                        </form>
                    </div>
                    <div class="vehicleCatChart">
                        <canvas id="myChart" style="width:100%;max-width:700px;margin:0 auto"></canvas>
                    </div>

                    <table class="entity" >
                        <thead>
                            <tr>
                                <th>Role</th>
                                <th>Uname</th>
                                <th>Pass</th>
                                <th>Name</th>
                                <th>Gender</th>
                                <th>DoB</th>
                                <th>Phone</th>
                                <th>Address</th>
                                <th>Image</th>
                                <th>Created at</th>
                                <th>Updated at</th>
                                <th style="padding: 0 55px; min-width: 156px">Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${requestScope.allAccount}" var="list">
                                <tr>
                                    <td>${list.role}</td>
                                    <td>${list.username}</td>
                                    <td>${list.password}</td>
                                    <td>${list.name}</td>
                                    <td>${list.gender}</td>
                                    <td><fmt:formatDate pattern="dd/MM/yyyy" value="${list.dateOfBirth}"/></td>
                                    <td>0${list.phoneNumber}</td>
                                    <td>${list.address}</td>
                                    <td><img src="${list.image}" alt="${list.name}"></td>
                                    <td>
                                        <fmt:formatDate pattern="dd/MM/yyyy" value="${list.created_at}"/><br/>
                                        <fmt:formatDate pattern="HH:mm" value="${list.created_at}"/>
                                    </td>

                                    <td>
                                        <fmt:formatDate pattern="dd/MM/yyyy" value="${list.updated_at}"/><br/>
                                        <fmt:formatDate pattern="HH:mm" value="${list.updated_at}"/>
                                    </td>

                                    <td>
                                        <a style="text-decoration: none" class="entity-update" href="accountController?action=update&id=${list.id}">Update</a>
                                        <a style="text-decoration: none" class="entity-delete" href="#" onclick="doDelete('${list.id}', '${list.username}')">Delete</a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                    <div style="">
                        <nav aria-label="Page navigation example">
                            <ul class="pagination" style="display: flex; justify-content: center; margin-top: 30px;">
                                <li class="page-item ${requestScope.index == 1 ? 'disabled' : ''}">
                                    <a class="page-link" href="accountController?index=${requestScope.index - 1}&fRole=${param.fRole}&fName=${param.fName}&fPhoneNumber=${param.fPhoneNumber}" aria-label="Previous">
                                        <span aria-hidden="true">&laquo;</span>
                                        <span class="sr-only">Previous</span>
                                    </a>
                                </li>
                                <c:forEach begin="1" end="${requestScope.numOfPage}" var="i">
                                    <li class="page-item ${requestScope.index == i ? 'active' : ''}">
                                        <a class="page-link" href="accountController?index=${i}&fRole=${param.fRole}&fName=${param.fName}&fPhoneNumber=${param.fPhoneNumber}">${i}</a>
                                    </li>
                                </c:forEach>
                                <li class="page-item ${requestScope.index == requestScope.numOfPage ? 'disabled' : ''}">
                                    <a class="page-link" href="accountController?index=${requestScope.index + 1}&fRole=${param.fRole}&fName=${param.fName}&fPhoneNumber=${param.fPhoneNumber}" aria-label="Next">
                                        <span aria-hidden="true">&raquo;</span>
                                        <span class="sr-only">Next</span>
                                    </a>
                                </li>
                            </ul>
                        </nav>
                    </div>


                </div>
                <div class="col-md-2" id="right-column" style="padding-left: 10px;">
                    <c:set var="a" value="${requestScope.currentAccount}"/>
                    <form action="accountController" method="post" style="width: 100%;">
                        <strong>Ảnh cá nhân:</strong><input type="file" name="image" value="${a.image}" style="width: 100%;" /><br><br>
                        <strong>Vai trò:</strong><input type="radio" name="role" value="admin" ${a.role == 'admin' ? 'checked' : ''}/> Admin
                        <input type="radio" name="role" value="user" ${a.role == 'user' ? 'checked' : ''}/> User<br><br>
                        <strong>Tên đăng nhập:</strong><br><input type="text" name="username" value="${a.username}" required/><br>
                        <strong>Mật khẩu:</strong><br> <input type="text" name="password" value="${a.password}" required/><br>
                        <strong>Họ và tên:</strong><br> <input type="text" name="name" value="${a.name}" required/><br>
                        <strong>Giới tính:</strong><br>
                        <input type="radio" name="gender" value="male" ${a.gender == 'male' ? 'checked' : ''}>Nam
                        <input type="radio" name="gender" value="female" ${a.gender == 'female' ? 'checked' : ''}>Nữ
                        <input type="radio" name="gender" value="other" ${!a.gender.equals('male') && !a.gender.equals('female') ? 'checked' : ''}>Khác<br>
                        <strong>Ngày sinh:</strong><br> <input type="date" name="dateOfBirth" value="${a.dateOfBirth}"><br>
                        <strong>Email:</strong><br><input type="email" name="email" value="${a.email}"/><br>
                        <strong>Số điện thoại:</strong><br><input type="number" name="phoneNumber" value="${a.phoneNumber}" required/><br>
                        <input type="hidden" name="address" value="${a.address}"><br>
                        <input type="hidden" name="id" value="${a.id}"/>
                        <input type="hidden" name="created_at" value="${a.created_at}"/>
                        <input type="submit" class="entity-update" value="Cập nhật/Thêm mới"/>
                        <a class="entity-delete" href="accountController">Huỷ</a>
                    </form>
                </div>
            </div>
        </div>
        <%@include file="footer.jsp" %>
        <script
            src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js">
        </script>

        <script type="text/javascript">
            function doDelete(id, username) {
                if (confirm("Bạn có muốn xoá tài khoản với tên đăng nhập là " + username)) {
                    window.location = "accountController?action=delete&id=" + id;
                }
            }
            const labels = [];
            const purchaseCounts = [];
            const colors = [
                'rgb(255, 99, 132)', 'rgb(54, 162, 235)', 'rgb(255, 206, 86)', 'rgb(75, 192, 192)',
                'rgb(153, 102, 255)', 'rgb(255, 159, 64)', 'rgb(199, 199, 199)', 'rgb(83, 102, 255)',
                'rgb(255, 102, 204)', 'rgb(102, 255, 102)', 'rgb(255, 153, 51)', 'rgb(204, 255, 153)',
                'rgb(102, 102, 255)', 'rgb(255, 204, 255)', 'rgb(255, 204, 102)', 'rgb(255, 255, 102)',
                'rgb(204, 102, 255)', 'rgb(255, 102, 153)', 'rgb(102, 204, 255)', 'rgb(153, 255, 102)'
            ];
            <c:forEach var="item" items="${requestScope.allAccountWithoutPaging}">
            labels.push('${item.username}');
            </c:forEach>
            <c:forEach var="count" items="${requestScope.purchaseCounts}">
            purchaseCounts.push(parseInt('${count}'));
            </c:forEach>

            const minValue = Math.min(...purchaseCounts);
            new Chart("myChart", {
                type: "bar",
                data: {
                    labels: labels,
                    datasets: [{
                            data: purchaseCounts,
                            backgroundColor: colors,
                            fill: true
                        }]
                },
                options: {
                    legend: {display: false},
                    scales: {
                        yAxes: [{
                                ticks: {
                                    min: minValue > 0 ? minValue - 1 : 0
                                }
                            }]
                    },
                    title: {
                        display: true,
                        text: "Number of buying tickets for each account"
                    }
                }
            });
        </script>
    </body>
</html>