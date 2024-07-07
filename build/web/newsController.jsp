<%-- 
    Document   : newsController
    Created on : Jul 4, 2024, 4:57:25 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="model.News" %>
<%@page import="java.util.List" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="shortcut icon" type="image/jpg" href="image/logo-icon.png" />
        <title>Quản lý bài viết</title>
        <link rel="stylesheet" href="css/styleAdminController.css">
        <style>
            #content-update p{
                height: 150px;
            }
        </style>
        <script src="https://cdn.ckeditor.com/4.16.0/standard/ckeditor.js"></script>
        <script src="https://cdn.cksource.com/ckfinder/3.5.2/ckfinder.js"></script>
    </head>
    <body>
        <%@include file="header.jsp" %>
        <%@include file="admin-sideBar.jsp" %>

        <div id="main-content">
            <div class="row" style="padding: 50px 0; margin: 0">

                <div class="col-md-6" id="left-column">
                    <table class="entity">
                        <thead>
                            <tr>
                                <th>Title</th>
                                <th>Image</th>
                                <th>Created at</th>
                                <th>Updated at</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                        for (News n : (List<News>)request.getAttribute("allNews")) { %>
                            <tr>                                    
                                <td><%=n.getTitle()%></td>
                                <td><img src="<%=n.getImage()%>" alt="alt"/></td>

                                <td><fmt:formatDate pattern="dd/MM/yyyy HH:mm" value="<%=n.getCreated_at()%>"/></td>
                                <td><fmt:formatDate pattern="dd/MM/yyyy HH:mm" value="<%=n.getUpdated_at()%>"/></td>
                                <td>
                                    <a style="text-decoration: none" class="entity-detail" href="">See</a>
                                    <a style="text-decoration: none" class="entity-update" href="newsController?action=update&id=<%=n.getId()%>">Update</a>
                                    <a style="text-decoration: none" class="entity-delete" href="#" onclick="doDelete('<%=n.getId()%>')">Delete</a>
                                </td>
                            </tr>
                            <% 
                                }  
                            %>

                        </tbody>
                    </table>
                </div>
                <div class="col-md-6" id="right-column">

                    <form action="newsController" method="post">
                        <input type="hidden" value="${param.id}" name="id"/>
                        <div>
                            <strong>Title:</strong>
                            <input style="width: 100%;padding: 5px" type="text" value="${requestScope.currentNews.title}" name="title"/>
                        </div>
                        <div>
                            <strong>Image:</strong>
                            <input type="file" value="" name="image"/>
                        </div>
                        <div id="content-update">
                            <strong>Content:</strong>
                            <textarea id="editor" name="editor">${requestScope.currentNews.content}</textarea>
                        </div>
                        <input type="hidden" name="created_at" value="${requestScope.currentNews.created_at}"/>
                        <input
                            type="submit"
                            class="entity-update"
                            value="Cập nhật/Thêm mới"
                            />
                        <a class="entity-delete" href="newsController">Huỷ</a>
                    </form>
                </div>
            </div>
        </div>

        <script type="text/javascript">
            function doDelete(id) {
                if (confirm("Bạn có muốn xoá bài viết này? ")) {
                    window.location = "newsController?action=delete&id=" + id;
                }
            }

            // Initialize CKEditor
            CKEDITOR.replace('editor', {
                filebrowserBrowseUrl: '/ckfinder/ckfinder.html',
                filebrowserUploadUrl: '/ckfinder/core/connector/java/connector.java?command=QuickUpload&type=Files',
                filebrowserImageUploadUrl: '/ckfinder/core/connector/java/connector.java?command=QuickUpload&type=Images',
                filebrowserFlashUploadUrl: '/ckfinder/core/connector/java/connector.java?command=QuickUpload&type=Flash'
            });

            // Optional: CKFinder standalone
            CKFinder.setupCKEditor(null, {
                basePath: '/ckfinder/',
                connectorPath: '/ckfinder/core/connector/java/connector.java'
            });
        </script>
        <%@include file="footer.jsp" %>
    </body>
</html>
