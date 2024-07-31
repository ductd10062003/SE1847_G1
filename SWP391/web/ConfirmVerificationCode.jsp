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
                            <h2 class="mb-0">Xác thực mã</h2>
                        </div>
                    </div>
                </div>
            </div>

            <div class="custom-breadcrumns border-bottom">
                <div class="container">
                    <a href="index.jsp">Trang chủ</a>
                    <span class="mx-3 icon-keyboard_arrow_right"></span>
                    <span class="current">Xác thực mã</span>
                </div>
            </div>

            <div class="site-section">
                <div class="container">
                    <form action="verify-account" method="post">
                        <input type="hidden" id="verify" name="verify" content="verify">
                        <div class="row justify-content-center">
                            <div class="col-md-5">
                                <div class="row">
                                    <% if (request.getSession().getAttribute("error") != null) { %>
                                    <div class="col-md-12">
                                        <div class="alert alert-danger" role="alert">
                                            <strong>Lỗi!</strong> <%= (String) request.getSession().getAttribute("error") %>
                                        </div>
                                    </div>
                                    <% request.getSession().removeAttribute("error");
                            } %>

                                    <%--                            Success report--%>
                                    <% if (request.getSession().getAttribute("success") != null) { %>
                                    <div class="col-md-12">
                                        <div class="alert alert-success" role="alert">
                                            <strong>Thành công!</strong> <%= (String) request.getSession().getAttribute("success") %>
                                        </div>
                                    </div>
                                    <%--                            anchor return to home--%>
                                    <div class="col-md-12">
                                        <a href="index.jsp" class="btn btn-primary btn-lg px-5">Quay về trang chủ</a>
                                        <% request.getSession().removeAttribute("success");
                                } %>

                                        <div class="col-md-12">
                                            <div class="alert alert-success" role="alert">
                                                <strong>Thành công!</strong> Mã xác thực đã được gửi tới email của bạn.
                                            </div>
                                        </div>
                                        <div class="col-md-12 form-group">
                                            <label for="verification-code">Mã xác thực</label>
                                            <input type="text" id="verification-code" name="verification-code"
                                                   class="form-control form-control-lg" required>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-12">
                                            <input type="submit" value="Xác thực" class="btn btn-primary btn-lg px-5">
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
