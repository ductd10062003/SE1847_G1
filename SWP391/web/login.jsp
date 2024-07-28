<!DOCTYPE html>


<html lang="en">
    <%@page contentType="text/html" pageEncoding="UTF-8"%>
    <head>
        <title>Academics &mdash; Website by Colorlib</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">


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

            <jsp:include page="layout/header.jsp" />

            <div class="site-section">
                <div class="container">
                    <a href="index.jsp">Trang chủ</a>
                    <span class="mx-3 icon-keyboard_arrow_right"></span>
                    <span class="current">Đăng nhập</span>
                    <%--            Check if there is error attribute, if yes show the error message in a red warning without using the libtag library--%>
                    <%if(request.getSession().getAttribute("error") != null){
                        // remove error

                    %>
                    <div class="alert alert-danger" role="alert">
                        <strong>Error!</strong> <%=(String)request.getSession().getAttribute("error")%>
                    </div>
                    <%request.getSession().removeAttribute("error");}%>
                    <%--            A form--%>
                    <form action="login" method="post">
                        <div class="row justify-content-center">
                            <div class="col-md-5">
                                <div class="row">
                                    <div class="col-md-12 form-group">
                                        <label for="username">Tên đăng nhập</label>
                                        <input type="text" id="username" name="username" class="form-control form-control-lg" value="<%= request.getSession().getAttribute("username") != null ? (String) request.getSession().getAttribute("username") : "" %>" required>
                                    </div>
                                    <div class="col-md-12 form-group">
                                        <label for="password">Mật khẩu</label>
                                        <input type="password" id="password" name="password" class="form-control form-control-lg" required>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-6">
                                        <input type="submit" value="Đăng nhập" class="btn btn-primary btn-lg px-5">
                                    </div>
                                    <%--                   An hyperlink which leads to forgot password page--%>
                                    <div class="col-6">
                                        <a href="forgot-password">Quên mật khẩu?</a>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </form>



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