<%-- 
    Document   : homepage
    Created on : 18 Jun 2024, 11:59:52
    Author     : DAT
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Academics &mdash; Website by Colorlib</title>
        <meta charset="utf-8" />
        <meta
            name="viewport"
            content="width=device-width, initial-scale=1, shrink-to-fit=no"
            />

        <link
            href="https://fonts.googleapis.com/css?family=Muli:300,400,700,900"
            rel="stylesheet"
            />
        <link rel="stylesheet" href="fonts/icomoon/style.css" />

        <link rel="stylesheet" href="css/bootstrap.min.css" />
        <link rel="stylesheet" href="css/jquery-ui.css" />
        <link rel="stylesheet" href="css/owl.carousel.min.css" />
        <link rel="stylesheet" href="css/owl.theme.default.min.css" />
        <link rel="stylesheet" href="css/owl.theme.default.min.css" />

        <link rel="stylesheet" href="css/jquery.fancybox.min.css" />

        <link rel="stylesheet" href="css/bootstrap-datepicker.css" />

        <link rel="stylesheet" href="fonts/flaticon/font/flaticon.css" />

        <link rel="stylesheet" href="css/aos.css" />
        <link
            href="css/jquery.mb.YTPlayer.min.css"
            media="all"
            rel="stylesheet"
            type="text/css"
            />

        <link rel="stylesheet" href="css/style.css" />
    </head>

    <jsp:include page="layout/header.jsp" />
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

            <div class="site-section">
                <div class="container">
                    <h2 class="section-title-underline mb-3">Các tác giả tiêu biểu</h2>
                    <div class="row">
                        <div class="col-12">
                            <div class="owl-slide-3 owl-carousel">
                                <c:forEach items="${requestScope.user}" var="user">
                                    <div class="course-1-item">
                                        <figure class="thumnail">
                                            <div class="category"><h3>${user.name}</h3></div>
                                        </figure>
                                        <div class="course-1-content pb-4">
                                            <h2>Số khóa học đã tạo: ${user.count}</h2>
                                            <p>
                                                <a
                                                    href="mentorProfile?name=${user.name}"
                                                    class="btn btn-primary rounded-0 px-4"
                                                    >Xem chi tiết</a
                                                >
                                            </p>
                                        </div>
                                    </div>
                                </c:forEach> 
                            </div>
                        </div>
                    </div>
                    <h2 class="section-title-underline mb-3">Các khóa học gợi ý</h2>
                    <div class="row">
                        <div class="col-12">
                            <div class="owl-slide-3 owl-carousel">
                                <c:forEach items="${requestScope.list}" var="list">
                                    <div class="course-1-item">
                                        <figure class="thumnail">
                                            <div class="category"><h3>${list.course_name}</h3></div>
                                        </figure>
                                        <div class="course-1-content pb-4">
                                            <h2>${list.description}</h2>
                                            <p>
                                                <a
                                                    href="course-detail?course_id=${list.course_id}"
                                                    class="btn btn-primary rounded-0 px-4"
                                                    >Xem chi tiết</a
                                                >
                                            </p>
                                        </div>
                                    </div>
                                </c:forEach> 
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            

            <div
                class="site-section ftco-subscribe-1"
                style="background-image: url('images/bg_1.jpg')"
                >
                
            </div>

            
        </div>
        <!-- .site-wrap -->

        <!-- loader -->
        <div id="loader" class="show fullscreen">
            <svg class="circular" width="48px" height="48px">
            <circle
                class="path-bg"
                cx="24"
                cy="24"
                r="22"
                fill="none"
                stroke-width="4"
                stroke="#eeeeee"
                />
            <circle
                class="path"
                cx="24"
                cy="24"
                r="22"
                fill="none"
                stroke-width="4"
                stroke-miterlimit="10"
                stroke="#51be78"
                />
            </svg>
        </div>

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
