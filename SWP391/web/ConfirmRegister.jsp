<%@ page import="entity.User" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="user" scope="session" type="entity.User"/>
<!DOCTYPE html>
<html lang="en">

    <head>
        <title>Confirm Verification Code</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <link href="https://fonts.googleapis.com/css?family=Muli:300,400,700,900" rel="stylesheet">
        <link rel="stylesheet" href="fonts/icomoon/style.css">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/jquery-ui.css">
        <link rel="stylesheet" href="css/owl.carousel.min.css">
        <link rel="stylesheet" href="css/owl.theme.default.min.css">
        <link rel="stylesheet" href="css/jquery.fancybox.min.css">
        <link rel="stylesheet" href="css/bootstrap-datepicker.css">
        <link rel="stylesheet" href="fonts/flaticon/font/flaticon.css">
        <link rel="stylesheet" href="css/aos.css">
        <link href="css/jquery.mb.YTPlayer.min.css" media="all" rel="stylesheet" type="text/css">
        <link rel="stylesheet" href="css/style.css">
    </head>

    <body data-spy="scroll" data-target=".site-navbar-target" data-offset="300">

        <jsp:include page="layout/header.jsp" />

        <div class="site-section">
            <div class="container">
                <a href="index.jsp">Trang chủ</a>
                <span class="mx-3 icon-keyboard_arrow_right"></span>
                <span class="current">Xác thực tài khoản</span>
                <%--            There is an attribute called user in session. Show the user information based on the User in entity package--%>
                <h2>Tài khoản của bạn đã được tạo thành công,chào mừng tới với Memorycall</h2>
                <div class="row">
                    <div class="col-md-6 form-group">
                        <label for="fname">Tên tài khoản</label>
                        <input type="text" id="fname" class="form-control form-control-lg" value="${user.name}" disabled>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6 form-group">
                        <label for="email">Email</label>
                        <input type="email" id="email" class="form-control form-control-lg" value="${user.email}" disabled>
                    </div>
                    <div class="col-md-6 form-group">
                        <label for="phone">Số điện thoại</label>
                        <input type="text" id="phone" class="form-control form-control-lg" value="${user.phone}" disabled>
                    </div>
                </div>
                <%--                Add user role. 1 for admin, 2 for teacher and 3 for learner and date of birth--%>
                <div class="row">
                    <div class="col-md-6 form-group">
                        <label for="role">Chức năng</label>
                        <%--                    If user.role == 2 display Teacher account, 3 then display Learner account--%>
                        <input type="text" id="role" class="form-control form-control-lg" value="${user.role == 2 ? 'Teacher' : 'Người học'}" disabled>
                    </div>
                    <div class="col-md-6 form-group">
                        <label for="dob">Ngày sinh</label>
                        <input type="text" id="dob" class="form-control form-control-lg" value="${user.dob}" disabled>
                    </div>
                </div>
                <%--            Form to return to home page by calling post request in login server--%>
                <form action="login" method="post">
                    <div class="row justify-content-center">
                        <div class="col-md-5">
                            <div class="row">
                                <div class="col-md-12 form-group">
                                    <input type="hidden" name="username" value="${user.name}">
                                    <input type="hidden" name="password" value="${user.password}">
                                    <input type="submit" class="btn btn-primary btn-lg px-5" value="Quay về trang chính">
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
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
    <div id="loader" class="show fullscreen">
        <svg class="circular" width="48px" height="48px">
        <circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/>
        <circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10"
                stroke="#51be78"/>
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
