<%-- 
    Document   : course-enroll
    Created on : May 28, 2024, 8:24:38 PM
    Author     : DANGTRUONG
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="entity.Course" %>
<%@ page import="java.util.Vector" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <title>Academics &mdash; Website by Colorlib</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">


        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Muli:300,400,700,900" rel="stylesheet">
        <link rel="stylesheet" href="fonts/icomoon/style.css">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/jquery-ui.css">
        <link rel="stylesheet" href="css/owl.carousel.min.css">
        <link rel="stylesheet" href="css/owl.theme.default.min.css">
        <link rel="stylesheet" href="css/owl.theme.default.min.css">
        <link rel="stylesheet" href="css/jquery.fancybox.min.css">
        <link rel="stylesheet" href="css/bootstrap-datepicker.css">
        <link rel="stylesheet" href="fonts/flaticon/font/flaticon.css">
        <link rel="stylesheet" href="css/aos.css">
        <link href="css/jquery.mb.YTPlayer.min.css" media="all" rel="stylesheet" type="text/css">
        <link rel="stylesheet" href="css/style.css">
    </head>

    <body data-spy="scroll" data-target=".site-navbar-target" data-offset="300">

        <div class="site-wrap">

            <div class="site-mobile-menu site-navbar-target">
                <div class="site-mobile-menu-header">
                    <div class="site-mobile-menu-close mt-3">
                        <span class="icon-close2 js-menu-toggle"></span>
                    </div>
                </div>
                <div class="site-mobile-menu-body"></div>
            </div>

            <%@include file="layout/header.jsp" %>

            <div class="site-section">
                <div class="container">
                    <a href="homePage">Trang chủ</a>
                    <span class="mx-3 icon-keyboard_arrow_right"></span>
                    <a href="viewcourse">Khóa học</a>
                    <span class="mx-3 icon-keyboard_arrow_right"></span>
                    <a href="courseEnroll">Các khóa học đã đăng kí</a>
                    <span class="mx-3 icon-keyboard_arrow_right"></span>
                    <span class="current">Các khóa học đã hoàn thành</span><br><br>

                    <a href="courseEnroll" class="btn btn-primary">Các khóa học đã đăng kí</a>
                    <a href="courseStudying" class="btn btn-primary">Các khóa học đang học</a>

                    <div class="d-flex justify-content-between align-items-center mb-4">
                        <h2>Các khóa học đã hoàn thành</h2>
                        <form action="courseCompleted" method="GET" class="form-inline">
                            <div class="input-group">
                                <input type="text" class="form-control" placeholder="Nhập tên khóa học" name="courseName" value="${courseName}">
                                <c:forEach items="${categoryNames}" var="selectedCategory">
                                    <input type="hidden" name="categoryName" value="${selectedCategory}">
                                </c:forEach>
                                <div class="input-group-append">
                                    <button class="btn btn-primary" type="submit">Tìm kiếm</button>
                                </div>
                            </div>
                        </form>
                    </div>

                    <div class="row">
                        <div class="col-md-12">
                            <div class="row">
                                <div class="col-md-3">
                                    <h3>Danh mục</h3>
                                    <form action="courseCompleted" method="GET">
                                        <input type="hidden" name="courseName" value="${courseName}">
                                        <c:forEach items="${categories}" var="category">
                                            <div class="form-check">
                                                <c:set var="isChecked" value="false" />
                                                <c:if test="${not empty categoryNames}">
                                                    <c:forEach items="${categoryNames}" var="selectedCategory">
                                                        <c:if test="${selectedCategory eq category.category_name}">
                                                            <c:set var="isChecked" value="true" />
                                                        </c:if>
                                                    </c:forEach>
                                                </c:if>
                                                <input class="form-check-input" type="checkbox" name="categoryName"
                                                       value="${category.category_name}" id="category${category.category_id}"
                                                       ${isChecked ? 'checked' : ''}>
                                                <label class="form-check-label" for="category${category.category_id}">
                                                    ${category.category_name}
                                                </label>
                                            </div>
                                        </c:forEach>
                                        <button class="btn btn-primary mt-3" type="submit">Lọc</button>
                                    </form>
                                </div>
                                <div class="col-md-9">
                                    <div class="row">
                                        <c:forEach items="${courses}" var="course">
                                            <div class="col-lg-4 col-md-6 mb-4">
                                                <div class="course-1-item">
                                                    <figure class="thumnail">
                                                        <div class="category"><h3>${course.course_name}</h3></div>
                                                    </figure>
                                                    <div class="course-1-content pb-4">
                                                        <h2>${course.description}</h2>
                                                        <p><a href="course-detail?course_id=${course.course_id}" class="btn btn-primary rounded-0 px-4">Xem chi tiết</a></p>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:forEach>
                                    </div>

                                    <nav aria-label="Page navigation">
                                        <ul class="pagination">
                                            <li class="page-item ${currentPage == 1 ? 'disabled' : ''}">
                                                <a class="page-link" href="?${queryString}&page=${currentPage - 1}&pageSize=${pageSize}" aria-label="Previous">
                                                    <span aria-hidden="true">&laquo;</span>
                                                </a>
                                            </li>
                                            <c:forEach var="i" begin="1" end="${totalPages}">
                                                <li class="page-item ${i == currentPage ? 'active' : ''}">
                                                    <a class="page-link" href="?${queryString}&page=${i}&pageSize=${pageSize}">${i}</a>
                                                </li>
                                            </c:forEach>
                                            <li class="page-item ${currentPage == totalPages ? 'disabled' : ''}">
                                                <a class="page-link" href="?${queryString}&page=${currentPage + 1}&pageSize=${pageSize}" aria-label="Next">
                                                    <span aria-hidden="true">&raquo;</span>
                                                </a>
                                            </li>
                                        </ul>
                                    </nav>

                                </div>


                            </div>
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

        <!-- loader -->
        <div id="loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#51be78"/></svg></div>

        <script src="js/jquery-3.3.1.min.js"></script>
        <script src="js/jquery-migrate-3.0.1.min.js"></script>
        <script src="js/jquery-ui.js"></script>
        <script src="js/popper.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/owl.carousel.min.js"></script>
        <script src="js/jquery.stellar.min.js"></script>
        <script src="js/jquery.countdown.min.js"></script>
        <script src="js/bootstrap-datepicker.min.js"></script>
        <script src="js/jquery.easing.1.3.js"></script>
        <script src="js/aos.js"></script>
        <script src="js/jquery.fancybox.min.js"></script>
        <script src="js/jquery.sticky.js"></script>
        <script src="js/jquery.mb.YTPlayer.min.js"></script>
        <script src="js/main.js"></script>

    </body>

</html>
