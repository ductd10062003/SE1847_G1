<%-- 
    Document   : mentor-Profile
    Created on : 8 Jul 2024, 11:29:55
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
            content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
        <link
            href="https://fonts.googleapis.com/css?family=Muli:300,400,700,900"
            rel="stylesheet"/>
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
            type="text/css"/>
        <link rel="stylesheet" href="css/style.css">   
    </head>
    <body data-spy="scroll" data-target=".site-navbar-target" data-offset="300">
        <jsp:include page="layout/header.jsp" />

        <div class="site-section">
            <div class="student-profile py-4">
                <div class="container">
                    <div class="container">
                        <a href="homePage">Trang chủ</a>
                        <span class="mx-3 icon-keyboard_arrow_right"></span>
                        <span class="current">Khóa học</span><br><br>  
                        <h2 class="section-title-underline mb-3">Các khóa học tạo bởi : ${requestScope.users.name}</h2>                        <div class="row">
                            <c:forEach items="${requestScope.course}" var="course">
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
                            <div class="text-center" style="display: inline-block; margin-right:auto; width: 100%">
                                <c:forEach var="i" begin="1" end="${numPages}">
                                    <a href="mentorProfile?page=${i}&name=${param.name}" class="btn btn-outline-dark ${i == page ? 'active' : ''}">
                                        ${i}
                                    </a>
                                </c:forEach>
                            </div>
                        </div>                     
                    </div>
                </div>    
            </div>
        </div> 

        <!-- .site-wrap -->
        <div class="section-bg style-1" style="background-image: url('images/hero_1.jpg');">

        </div>
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


