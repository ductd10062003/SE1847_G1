<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
    <head>
        <title>Academics &mdash; Website by Colorlib</title>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
        <link href="https://fonts.googleapis.com/css?family=Muli:300,400,700,900" rel="stylesheet"/>
        <link rel="stylesheet" href="fonts/icomoon/style.css" />
        <link rel="stylesheet" href="css/bootstrap.min.css" />
        <link rel="stylesheet" href="css/jquery-ui.css" />
        <link rel="stylesheet" href="css/owl.carousel.min.css" />
        <link rel="stylesheet" href="css/owl.theme.default.min.css" />
        <link rel="stylesheet" href="css/jquery.fancybox.min.css" />
        <link rel="stylesheet" href="css/bootstrap-datepicker.css" />
        <link rel="stylesheet" href="fonts/flaticon/font/flaticon.css" />
        <link rel="stylesheet" href="css/aos.css" />
        <link href="css/jquery.mb.YTPlayer.min.css" media="all" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="css/style.css">  
        <link rel="stylesheet" href="https://cdn.datatables.net/2.0.8/css/dataTables.bootstrap5.css">
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.13.6/css/jquery.dataTables.min.css">
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>
    </head>
    <body data-spy="scroll" data-target=".site-navbar-target" data-offset="300">
        <jsp:include page="layout/header.jsp" />
        <div class="site-section ftco-subscribe-1 site-blocks-cover pb-4" style="background-image: url('images/bg_1.jpg')">
            <div class="container">
                <div class="row align-items-end">
                    <div class="col-lg-7">
                        <h2 class="mb-0">Từng bước nhỏ, dẫn đến thành công lớn!</h2>
                    </div>
                </div>
            </div>
        </div>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
        <script src="https://cdn.datatables.net/2.0.8/js/dataTables.js"></script>
        <script src="https://cdn.datatables.net/2.0.8/js/dataTables.bootstrap5.js"></script>
        <div class="container">
            <form action="studentDatabase" method="POST">
                <div class="wrapper">
                    <table id="example" class="table table-striped" style="width:100%">
                        <thead>
                            <tr>
                                <th>Xếp Hạng</th>
                                <th>Tên</th>
                                <th>Giới tính</th>
                                <th>Vai trò</th>
                                <th>Tình Trạng</th>
                                <th>Số điện thoại</th>
                                <th>Email</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${requestScope.list}" var="list" varStatus="loop" >
                                <tr>     
                                    <td class="count">${loop.index + 1}</td>
                                    <td class="name">${list.name}</td>
                                    <td class="gender">${list.gender == 1 ? 'Nam' : 'Nữ'}</td>  
                                    <td class="role">${list.role == 2 ? 'Giáo viên' : 'Học sinh'}</td>  
                                    <td class="active">${list.active == 1 ? 'Không hoạt động' : 'Hoạt động'}</td> 
                                    <td class="phone">${list.phone}</td> 
                                    <td class="email">${list.email}</td> 
                                    <td>
                                        <c:choose>
                                            <c:when test="${list.active == 0}">
                                                <form action="studentDatatable" method="GET">
                                                    <input type="hidden" name="action" value="activate">
                                                    <input type="hidden" name="user_id" value="${list.user_id}">
                                                    <input type="hidden" name="course_id" value="${list.course_id}">
                                                    <button type="submit" class="btn btn-primary">Activate</button>
                                                </form>
                                            </c:when>
                                            <c:otherwise>
                                                <form action="studentDatatable" method="GET">
                                                    <input type="hidden" name="action" value="deactivate">
                                                    <input type="hidden" name="user_id" value="${list.user_id}">
                                                    <input type="hidden" name="course_id" value="${list.course_id}">
                                                    <button type="submit" class="btn btn-danger">Deactivate</button>
                                                </form>
                                            </c:otherwise>
                                        </c:choose>

                                    </td>
                                </tr>        
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </form>
        </div>
        <script>
            $(document).ready(function () {
                $('#example').DataTable();
            });
        </script>
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
                        <p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Reiciendis recusandae, iure repellat quis delectus ea? Dolore, amet reprehenderit.</p>
                    </div>
                    <div class="col-lg-4 col-md-6 mb-5 mb-lg-0">
                        <span class="icon flaticon-library"></span>
                        <h3>Key of Success</h3>
                        <p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Reiciendis recusandae, iure repellat quis delectus ea? Dolore, amet reprehenderit.</p>
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
                                Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="icon-heart" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank" >Colorlib</a>
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
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