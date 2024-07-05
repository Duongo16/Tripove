<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="model.News" %>
<%@page import="dal.NewsDAO" %>
<%@page import="java.util.List" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tin tức</title>
        <link rel="stylesheet" href="css/styleNews.css"/>
    </head>
    <body>
        <%@ include file="header.jsp" %>
        <div class="box" >
            <div style="display: ${empty param.id ? '' : 'none'};margin: 130px 0">
                <h1 style="margin-bottom: 20px; text-align: center;">Tin tức</h1>
                <div class="news-container">
                    <% 
                        List<News> allNews = (List<News>) request.getAttribute("allNews");
                        if (allNews != null) {
                            for (int i = allNews.size() - 1; i >= 0; i--) {
                                News n = allNews.get(i);
                    %>
                    <div class="news-item" onclick="viewNews('<%= n.getId() %>');">
                        <img src="<%= n.getImage() %>" alt="<%= n.getTitle() %>">
                        <h2><%= n.getTitle() %></h2>
                        <div class="news-content" style="display: none;">
                            <p><%= n.getContent() %></p>
                        </div>
                        <div class="news-time">
                            <p><fmt:formatDate pattern="dd/MM/yyyy HH:mm" value="<%=n.getCreated_at()%>"/></p>
                        </div>
                    </div>
                    <% 
                            }
                        }
                    %>
                </div>
            </div>
            <div id="selected" style="display: ${empty param.id ? 'none' : ''}" class="row">
                <div class="col-md-2"></div>
                <div class="col-md-6" style="margin: 130px 0">
                    <% 
                    NewsDAO nd = new NewsDAO();
                    String newsIdStr = request.getParameter("id");
                    if (newsIdStr != null) {
                        try {
                            int newsId = Integer.parseInt(newsIdStr);
                            News selectedNews = nd.getNewsById(newsId); 
                            if (selectedNews != null) {
                    %>
                    <div class="selected-news">
                        <h1><%= selectedNews.getTitle() %></h1>
                        <p><fmt:formatDate pattern="dd/MM/yyyy HH:mm" value="<%=selectedNews.getCreated_at()%>"/></p>
                        <img src="<%= selectedNews.getImage() %>" alt="<%= selectedNews.getTitle() %>">
                        <p><%= selectedNews.getContent() %></p>

                    </div>
                    <% 
                        }
                            } catch (NumberFormatException e) {
                                e.printStackTrace();
                            }
                        }
                    %>
                </div>
                <div class="col-md-4" style="margin: 130px 0">
                    <div class="news-list">
                        <% 
                            if (allNews != null) {
                                for (int i = allNews.size() - 1; i >= 0; i--) {
                                    News n = allNews.get(i);
                        %>
                        <div class="news-item-small" onclick="viewNews('<%= n.getId() %>');">
                            <img src="<%= n.getImage() %>" alt="<%= n.getTitle() %>">
                            <h2><%= n.getTitle() %></h2>

                        </div>
                        <% 
                                }
                            }
                        %>
                    </div>
                </div>

            </div>
        </div>
        <%@ include file="footer.jsp" %>

        <script>
            function viewNews(newsId) {
                window.location.href = 'news?id=' + newsId;
            }
        </script>
    </body>
</html>
