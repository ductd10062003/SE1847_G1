<!DOCTYPE html>
<html lang="en">
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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

<div class="site-wrap">

    <div class="site-mobile-menu site-navbar-target">
        <div class="site-mobile-menu-header">
            <div class="site-mobile-menu-close mt-3">
                <span class="icon-close2 js-menu-toggle"></span>
            </div>
        </div>
        <div class="site-mobile-menu-body"></div>
    </div>

    <jsp:include page="layout/header.jsp" />
    
    <div class="site-section ftco-subscribe-1 site-blocks-cover pb-4" style="background-image: url('images/bg_1.jpg')">
        <div class="container">
            <div class="row align-items-end justify-content-center text-center">
                <div class="col-lg-7">
                    <h2 class="mb-0">Đổi mật khẩu</h2>                  
                </div>
            </div>
        </div>
    </div>

    <div class="custom-breadcrumns border-bottom">
        <div class="container">
            <a href="index.jsp">Trang chủ</a>
            <span class="mx-3 icon-keyboard_arrow_right"></span>
            <span class="current">Đổi mật khẩu</span>
        </div>
    </div>

    <div class="site-section">
        <div class="container">
            <form action="reset-password" method="post">
                <input type="hidden" id="pending" name="pending" content="verify">
                <div class="row justify-content-center">
                    <div class="col-md-5">
                        <div class="row">
                            <% if(request.getSession().getAttribute("error") != null) { %>
                            <div class="col-md-12">
                                <div class="alert alert-danger" role="alert">
                                    <strong>Error!</strong> <%= (String) request.getSession().getAttribute("error") %>
                                </div>
                            </div>
                            <% request.getSession().removeAttribute("error"); } %>
<%--                            If attribute "changed exist, show confirmation message and anchor to home--%>
                            <% if(request.getSession().getAttribute("success") != null) { %>
                            <div class="col-md-12">
                                <div class="alert alert-success" role="alert">
                                    <strong>Thành công!</strong> <%= (String) request.getSession().getAttribute("success") %>
                                </div>
                            </div>
                            <div class="col-md-12">
                                <a href="index.jsp" class="btn btn-primary btn-lg px-5">Home</a>
                            </div>
                            <% request.getSession().removeAttribute("success"); } %>

                            <div class="col-md-12 form-group">
                                <label for="new-password">Mật khẩu mới (6-32, ít nhất có 1 ký tự đặc biệt)</label>
                                <input type="text" id="new-password" name="new-password" class="form-control form-control-lg" pattern="[\S]{6,32}" required>
                            </div>
                            <div class="col-md-12 form-group">
                                <label for="confirm-password">Nhập lại mật khẩu mới</label>
                                <input type="text" id="confirm-password" name="confirm-password" class="form-control form-control-lg" required>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-12">
                                <input type="submit" value="Xác nhận" class="btn btn-primary btn-lg px-5">
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>

    <div class="footer">
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <p class="mb-4"><img src="images/logo.png" alt="Image" class="img-fluid"></p>
                    <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Beatae nemo minima qui dolor, iusto iure.</p>
                    <p><a href="#">Learn More</a></p>
                </div>
                <div class="col-lg-3">
                    <h3 class="footer-heading"><span>Our Campus</span></h3>
                    <ul class="list-unstyled">
                        <li><a href="#">Acedemic</a></li>
                        <li><a href="#">News</a></li>
                        <li><a href="#">Our Interns</a></li>
                        <li><a href="#">Our Leadership</a></li>
                        <li><a href="#">Careers</a></li>
                        <li><a href="#">Human Resources</a></li>
                    </ul>
                </div>
                <div class="col-lg-3">
                    <h3 class="footer-heading"><span>Our Courses</span></h3>
                    <ul class="list-unstyled">
                        <li><a href="#">Math</a></li>
                        <li><a href="#">Science & Engineering</a></li>
                        <li><a href="#">Arts & Humanities</a></li>
                        <li><a href="#">Economics & Finance</a></li>
                        <li><a href="#">Business Administration</a></li>
                        <li><a href="#">Computer Science</a></li>
                    </ul>
                </div>
                <div class="col-lg-3">
                    <h3 class="footer-heading"><span>Contact</span></h3>
                    <ul class="list-unstyled">
                        <li><a href="#">Help Center</a></li>
                        <li><a href="#">Support Community</a></li>
                        <li><a href="#">Press</a></li>
                        <li><a href="#">Share Your Story</a></li>
                        <li><a href="#">Our Supporters</a></li>
                    </ul>
                </div>
            </div>

            <div class="row">
                <div class="col-12">
                    <div class="copyright">
                        <p>
                            <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                            Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="icon-heart" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
                            <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- .site-wrap -->

<%--Javascript to ensure password and confirm password is indentical--%>
<script>
    let password = document.getElementById("new-password")
        , confirm_password = document.getElementById("confirm-password");

    function validatePassword(){
        if(password.value !== confirm_password.value) {
            confirm_password.setCustomValidity("Passwords Don't Match");
        } else {
            confirm_password.setCustomValidity('');
        }
    }

    password.onchange = validatePassword;
    confirm_password.onkeyup = validatePassword;
</script>

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
