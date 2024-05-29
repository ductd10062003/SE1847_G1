<%-- 
    Document   : courses
    Created on : 28 May 2024, 19:23:07
    Author     : DAT
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="en">

    <head>
        <title>Academics &mdash; Website by Colorlib</title>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
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

            <div class="site-mobile-menu site-navbar-target">
                <div class="site-mobile-menu-header">
                    <div class="site-mobile-menu-close mt-3">
                        <span class="icon-close2 js-menu-toggle"></span>
                    </div>
                </div>
                <div class="site-mobile-menu-body"></div>
            </div>


            <div class="py-2 bg-light">
                <div class="container">
                    <div class="row align-items-center">
                        <div class="col-lg-9 d-none d-lg-block">
                            <a href="#" class="small mr-3"><span class="icon-question-circle-o mr-2"></span> Have a questions?</a> 
                            <a href="#" class="small mr-3"><span class="icon-phone2 mr-2"></span> 10 20 123 456</a> 
                            <a href="#" class="small mr-3"><span class="icon-envelope-o mr-2"></span> info@mydomain.com</a> 
                        </div>
                        <div class="col-lg-3 text-right">
                            <a href="login.html" class="small mr-3"><span class="icon-unlock-alt"></span> Log In</a>
                            <a href="register.html" class="small btn btn-primary px-4 py-2 rounded-0"><span class="icon-users"></span> Register</a>
                        </div>
                    </div>
                </div>
            </div>
            <header class="site-navbar py-4 js-sticky-header site-navbar-target" role="banner">

                <div class="container">
                    <div class="d-flex align-items-center">
                        <div class="site-logo">
                            <a href="index.html" class="d-block">
                                <img src="images/logo.jpg" alt="Image" class="img-fluid">
                            </a>
                        </div>
                        <div class="mr-auto">
                            <nav class="site-navigation position-relative text-right" role="navigation">
                                <ul class="site-menu main-menu js-clone-nav mr-auto d-none d-lg-block">
                                    <li>
                                        <a href="index.html" class="nav-link text-left">Home</a>
                                    </li>
                                    <li class="has-children">
                                        <a href="about.html" class="nav-link text-left">About Us</a>
                                        <ul class="dropdown">
                                            <li><a href="teachers.html">Our Teachers</a></li>
                                            <li><a href="about.html">Our School</a></li>
                                        </ul>
                                    </li>
                                    <li>
                                        <a href="admissions.html" class="nav-link text-left">Admissions</a>
                                    </li>
                                    <li class="active">
                                        <a href="courses.html" class="nav-link text-left">Courses</a>
                                    </li>
                                    <li>
                                        <a href="contact.html" class="nav-link text-left">Contact</a>
                                    </li>
                                </ul>                                                                                                                                                                                                                                                                                          </ul>
                            </nav>

                        </div>
                        <div class="ml-auto">
                            <div class="social-wrap">
                                <a href="#"><span class="icon-facebook"></span></a>
                                <a href="#"><span class="icon-twitter"></span></a>
                                <a href="#"><span class="icon-linkedin"></span></a>

                                <a href="#" class="d-inline-block d-lg-none site-menu-toggle js-menu-toggle text-black"><span
                                        class="icon-menu h3"></span></a>
                            </div>
                        </div>

                    </div>
                </div>

            </header>


            <div class="site-section ftco-subscribe-1 site-blocks-cover pb-4" style="background-image: url('images/bg_1.jpg')">
                <div class="container">
                    <div class="row align-items-end">
                        <div class="col-lg-7">
                            <h class="mb-0">Courses</h1>
                                <p>Lorem ipsum dolor sit amet consectetur adipisicing.</p>
                        </div>
                    </div>
                </div>
            </div> 


            <div class="custom-breadcrumns border-bottom">
                <div class="container">
                    <a href="index.html">Home</a>
                    <span class="mx-3 icon-keyboard_arrow_right"></span>
                    <span class="current">Courses</span>
                </div>
            </div>         

            <div class="row">
                <div>
                    <div class="card">
                        <div class="card-header">Category</div>
                        <div class="card-body">
                            <div>
                                <form action="filterCategory" method="POST">
                                    <!--<input class = "searchBox" type="text" name ="course_name" size="15">-->
                                    <input class = "searchButton" type="submit" name ="category" value="Search">
                                    <div id="list_categories">
                                        <c:forEach items="${requestScope.category}" var="category">
                                            <div class="form-check">
                                                <input
                                                    class="form-check-input"
                                                    type="radio"
                                                    name="category"                                            
                                                    value="${category.category_id}"
                                                    onclick="changeCategory()"
                                                    />
                                                <label
                                                    class="form-check-label"
                                                    for="category"
                                                    >
                                                    ${category.category_name}
                                                </label>
                                            </div>
                                        </c:forEach>
                                    </div>
                                    <input type="hidden" name="data_flashcards" id="data_flashcards"/>
                                    <input type="hidden" name="category_id" id="data_category_id"/>
                                    <input type="hidden" name="service" value="createFlashCard" />
                                </form>
                            </div>                             
                        </div>
                    </div>
                </div>
            </div>


            <div class="pagination justify-content-center">
                <div class="row">
                    <div>
                        <div class="card">
                            <div class="card-header">Course name</div>
                            <div class="card-body">
                                <div>
                                    <form action="viewcourse" method="post">
                                        <input class = "searchBox" type="text" name ="course_name" size="15" required>
                                        <input class = "searchButton" type="submit" name ="btnGo" value="Search">
                                    </form>
                                </div>                             
                            </div>
                        </div>
                    </div>
                </div>
            </div>    

            <div class="site-section">
                <div class="container">
                    <div class="row">
                        <c:forEach items="${requestScope.course}" var="course">
                            <div class="col-lg-4 col-md-6 mb-4">
                                <div class="course-1-item">
                                    <figure class="thumnail">
                                        <div class="category"><h3>${course.course_name}</h3></div>  
                                    </figure>
                                    <div class="course-1-content pb-4">
                                        <h2>${course.description}</h2>
                                        <p><a href="course-single.html" class="btn btn-primary rounded-0 px-4">Enroll In This Course</a></p>                               
                                    </div>
                                </div>
                            </div>
                        </c:forEach>                  
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
