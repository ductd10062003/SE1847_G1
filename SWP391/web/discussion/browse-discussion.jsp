<%@ page import="entity.Category" %>
<%@ page import="java.util.List" %>
<%@ page import="entity.DiscussionCategory" %>
<%@ page import="entity.Discussion" %>
<%@ page import="model.DAODiscussion" %>
<%@ page import="model.DAODiscussionCategory" %>
<%@ page import="controller.discussion.Util" %>
<%@ page import="model.DAOUser" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="vi">

<head>
    <title>Bài đăng</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link href="https://fonts.googleapis.com/css?family=Muli:300,400,700,900" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/fonts/icomoon/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/jquery-ui.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/owl.carousel.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/owl.theme.default.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/jquery.fancybox.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/fonts/flaticon/font/flaticon.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/aos.css">
    <link href="${pageContext.request.contextPath}/css/jquery.mb.YTPlayer.min.css" media="all" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <style>
        .form-check {
            display: flex;
            align-items: center;
        }

        .form-check-input {
            margin-right: 10px;
        }
    </style>
</head>

<body data-spy="scroll" data-target=".site-navbar-target" data-offset="300">

<div class="site-wrap">

    <%--    Include the file form context path--%>
    <%@include file="/layout/header.jsp" %>

    <div class="site-section">
        <div class="container">
            <a href="../index.jsp">Trang chủ</a>
            <span class="mx-3 icon-keyboard_arrow_right"></span>
            <span class="current">Thảo luận</span>
            <div class="row mb-3">
                <div class="col-md-8">
                    <h2>Tất cả câu hỏi</h2>
                    <p>${sessionScope.discussions.size()} câu hỏi</p>
                </div>
                <c:if test="${sessionScope.user != null && (sessionScope.user.role == 4 || sessionScope.user.role == 1)}">
                    <div class="col-md-4 text-md-right">
                        <button id="create-discussion" class="btn btn-primary">Tạo câu hỏi</button>
                    </div>
                </c:if>
            </div>

            <form action="view-discussions" method="get">
                <div class="row mb-3">
                    <div class="col-12">
                        <div class="input-group mb-3">
                            <input type="text" class="form-control" placeholder="Tìm bằng từ khóa"
                                   aria-label="Tìm kiếm câu hỏi" aria-describedby="button-search" name="keyword">
                            <div class="input-group-append">
                                <button class="btn btn-outline-primary" type="submit" id="button-search">Tìm kiếm
                                </button>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row mb-3">
                    <div class="col-12">
                        <h5>Các thể loại</h5>
                    </div>
                    <% for (DiscussionCategory category : (List<DiscussionCategory>) session.getAttribute("categories")) { %>
                    <div class="col-3">
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" value="<%=category.getCategory_name()%>"
                                   id="<%=category.getCategory_id()%>" name="categories">
                            <label class="form-check-label" for="<%=category.getCategory_id()%>">
                                <%=category.getCategory_name()%>
                            </label>
                        </div>
                    </div>
                    <% } %>
                </div>
            </form>

            <div class="row">
                <div class="col-12">
                    <!-- Repeat this block for each question -->
                    <% for (Discussion discussion : (List<Discussion>) session.getAttribute("discussions")) { %>
                    <div class="question-summary border p-3 mb-2">
                        <div class="row">
                            <div class="col-md-1 text-center">
                                <div><%= new DAODiscussion().getCommentCount(discussion.getDiscussion_id()) %> đã trả
                                    lời
                                </div>
                            </div>
                            <div class="col-md-11">
                                <h5><a href="discussion-details?id=<%= discussion.getDiscussion_id() %>">
                                    <%= Util.shortenedHTML(discussion.getTitle(), 200)%>
                                </a></h5>
                                <p class="mb-1"><%= Util.shortenedHTML(discussion.getContent(), 500) %>
                                </p>
                                <div>
                                    <span class="badge badge-primary"><%= new DAODiscussionCategory().getCategoryNameByID(discussion.getCategory_id()) %></span>
                                </div>
                                <small class="text-muted">đã trả
                                    lời <%= Util.calculateDaysPassed(discussion.getCreate_at()) %>
                                    ngày trước bởi
                                    <b><%= new DAOUser().getUserByID(discussion.getUser_id()).getName() %>
                                    </b></small>
                            </div>
                        </div>
                    </div>
                    <% } %>
                    <!-- End question block -->
                </div>
            </div>
        </div>
    </div>

    <div class="section-bg style-1" style="background-image: url('images/hero_1.jpg');">
        <div class="site-section">
            <div class="container">
                <div class="row">
                </div>
            </div>
        </div>
    </div>
</div>
<!-- .site-wrap -->

<script>
    let createDiscussion = document.getElementById("create-discussion");
    createDiscussion.addEventListener("click", function () {
        // forward to create-discussion page
        window.location.href = "create-discussion";
    });
</script>

<script src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery-migrate-3.0.1.min.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery-ui.js"></script>
<script src="${pageContext.request.contextPath}/js/popper.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/js/owl.carousel.min.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.stellar.min.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.countdown.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap-datepicker.min.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.easing.1.3.js"></script>
<script src="${pageContext.request.contextPath}/js/aos.js"></script>
