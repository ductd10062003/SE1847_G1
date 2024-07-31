<%-- 
    Document   : user-profile
    Created on : 14 Jun 2024, 09:05:35
    Author     : DAT
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
                        <span class="current">Thông tin tài khoản</span><br><br>    
                        <div class="row">
                            <div class="col-lg-4">
                                <div class="card shadow-sm">
                                    <div class="card-header bg-transparent text-center">        
                                        <img class="profile_img" src="${requestScope.users.image}" alt="student dp">                              
                                    </div>
                                    <div class="card-body">
                                        <p class="mb-0"><strong class="pr-1">ID tài khoản:</strong>${sessionScope.user.user_id}</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-8">
                                <div class="card shadow-sm">
                                    <div class="card-header bg-transparent border-0">
                                        <h3 class="mb-0"><i class="far fa-clone pr-1"></i>Thông tin tài khoản</h3>
                                    </div>
                                    <div class="card-body pt-0">
                                        <table class="table table-bordered">
                                            <tr>
                                                <th width="30%">Vai trò</th>
                                                <td width="2%">:</td>
                                                <td>${requestScope.users.role == 1 ? 'Giáo viên' : 'Học sinh'}</td>
                                            </tr>
                                            <tr>
                                                <th width="30%">Tên tài khoản</th>
                                                <td width="2%">:</td>
                                                <td>${requestScope.users.name}</td>
                                            </tr>
                                            <tr>
                                                <th width="30%">Giới tính</th>
                                                <td width="2%">:</td>
                                                <td>${requestScope.users.gender == 1 ? 'Nam' : 'Nữ'}</td>
                                            </tr>
                                            <tr>
                                                <th width="30%">Ngày sinh</th>
                                                <td width="2%">:</td>
                                                <td>
                                                    <c:if test="${not empty requestScope.users.dob}">
                                                        <fmt:parseDate var="parsedDate" value="${requestScope.users.dob}" pattern="yyyy-MM-dd" />
                                                        <fmt:formatDate value="${parsedDate}" pattern="dd-MM-yyyy" />
                                                    </c:if>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th width="30%">Số điện thoại</th>
                                                <td width="2%">:</td>
                                                <td>${requestScope.users.phone}</td>
                                            </tr>
                                            <tr>
                                                <th width="30%">Email</th>
                                                <td width="2%">:</td>
                                                <td>${requestScope.users.email}</td>
                                            </tr>
                                        </table>
                                    </div>
                                </div>
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
</body>
</html>

