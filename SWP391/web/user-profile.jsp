<%-- 
    Document   : user-profile
    Created on : 14 Jun 2024, 09:05:35
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
                        <span class="current">Thông tin người dùng</span><br><br>    
                        <div class="row">
                            <div class="col-lg-4">
                                <div class="card shadow-sm">
                                    <div class="card-header bg-transparent text-center">                               
                                        <img class="profile_img" src="https://upload.wikimedia.org/wikipedia/commons/9/99/Sample_User_Icon.png" alt="student dp">
                                        <h3>${requestScope.users.name}</h3>                           
                                    </div>
                                    <div class="card-body">
                                        <p class="mb-0"><strong class="pr-1">ID người dùng:</strong>${sessionScope.user.user_id}</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-8">
                                <div class="card shadow-sm">
                                    <div class="card-header bg-transparent border-0">
                                        <h3 class="mb-0"><i class="far fa-clone pr-1"></i>Thông tin cá nhân</h3>
                                    </div>
                                    <div class="card-body pt-0">
                                        <table class="table table-bordered">
                                            <tr>
                                                <th width="30%">Vai trò</th>
                                                <td width="2%">:</td>
                                                <td>${requestScope.users.role == 1 ? 'Giáo viên' : 'Học sinh'}</td>
                                            </tr>
                                            <tr>
                                                <th width="30%">Tên người dùng</th>
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
                                                <td>${requestScope.users.dob}</td>
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
            <div class="section-bg style-1" style="background-image: url('images/hero_1.jpg');">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-4 col-md-6 mb-5 mb-lg-0">
                            <span class="icon flaticon-mortarboard"></span>
                            <h3>Our Philosphy</h3>
                            <p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Reiciendis recusandae, iure repellat quis delectus ea? Dolore, amet reprehenderit.</p>
                        </div>
                        <div class="col-lg-4 col-md-6 mb-5 mb-lg-0">
                            <span class="icon flaticon-school-material"></span>
                            <h3>Academics Principle</h3>
                            <p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Reiciendis recusandae, iure repellat quis delectus ea?
                                Dolore, amet reprehenderit.</p>
                        </div>
                        <div class="col-lg-4 col-md-6 mb-5 mb-lg-0">
                            <span class="icon flaticon-library"></span>
                            <h3>Key of Success</h3>
                            <p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Reiciendis recusandae, iure repellat quis delectus ea?
                                Dolore, amet reprehenderit.</p>
                        </div>
                    </div>
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
                                <li><a href="#">Science &amp; Engineering</a></li>
                                <li><a href="#">Arts &amp; Humanities</a></li>
                                <li><a href="#">Economics &amp; Finance</a></li>
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
                                    Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="icon-heart" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank" >Colorlib</a>
                                    <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                                </p>
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
</body>
</html>

