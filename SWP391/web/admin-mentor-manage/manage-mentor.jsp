<%@ page import="entity.User" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>Mentors List</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link href="https://fonts.googleapis.com/css?family=Muli:300,400,700,900" rel="stylesheet">
    <link rel="stylesheet" href="../fonts/icomoon/style.css">
    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <link rel="stylesheet" href="../css/jquery-ui.css">
    <link rel="stylesheet" href="../css/owl.carousel.min.css">
    <link rel="stylesheet" href="../css/owl.theme.default.min.css">
    <link rel="stylesheet" href="../css/jquery.fancybox.min.css">
    <link rel="stylesheet" href="../css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="../fonts/flaticon/font/flaticon.css">
    <link rel="stylesheet" href="../css/aos.css">
    <link href="../css/jquery.mb.YTPlayer.min.css" media="all" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="../css/style.css">
</head>

<body data-spy="scroll" data-target=".site-navbar-target" data-offset="300">

<div class="site-wrap">

    <jsp:include page="../layout/header.jsp" />

    <div class="site-section ftco-subscribe-1 site-blocks-cover pb-4" style="background-image: url('../images/bg_1.jpg')">
        <div class="container">
            <div class="row align-items-end justify-content-center text-center">
                <div class="col-lg-7">
                    <h2 class="mb-0">Mentors List</h2>
                    <p>Lorem ipsum dolor sit amet consectetur adipisicing.</p>
                </div>
            </div>
        </div>
    </div>

    <div class="custom-breadcrumns border-bottom">
        <div class="container">
            <a href="index.html">Home</a>
            <span class="mx-3 icon-keyboard_arrow_right"></span>
            <span class="current">Mentors List</span>
        </div>
    </div>

    <div class="site-section">
        <div class="container">
            <h2>Manage mentors</h2>

            <%-- Show error if error string exists in session --%>
            <% if(session.getAttribute("error") != null) { %>
            <div class="alert alert-danger" role="alert">
                <%= session.getAttribute("error") %>
            </div>
            <% } session.removeAttribute("error"); %>

            <form action="${pageContext.request.contextPath}/admin-mentor-manage/manage-mentor" method="post" class="mb-4">
                <div class="row">
                    <input type="hidden" name="action" value="search">
                    <div class="col-md-10 form-group">
                        <input type="text" name="query" class="form-control form-control-lg" placeholder="Search for mentors...">
                    </div>
                    <div class="col-md-2 form-group">
                        <input type="submit" class="btn btn-primary btn-lg px-5" value="Search">
                    </div>
                </div>
            </form>

            <table class="table table-bordered">
                <thead>
                <tr>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Phone</th>
                    <th>Status</th>
                    <th>Action</th>
                </tr>
                </thead>
                <tbody>
                <% for(User mentor : (ArrayList<User>) session.getAttribute("mentor-list")) { %>
                <tr>
                    <td><%= mentor.getName() %></td>
                    <td><%= mentor.getEmail() %></td>
                    <td><%= mentor.getPhone() %></td>
                    <td><%= mentor.getActive() == 1 ? "Active" : "Inactive" %></td>
                    <td>
                        <% if(mentor.getActive() == 1) { %>
                        <a href="${pageContext.request.contextPath}/admin-mentor-manage/manage-mentor?action=deactivate&id=<%= mentor.getUser_id() %>" class="btn btn-danger">Deactivate</a>
                        <% } else { %>
                        <a href="${pageContext.request.contextPath}/admin-mentor-manage/manage-mentor?action=activate&id=<%= mentor.getUser_id() %>" class="btn btn-primary">Activate</a>
                        <% } %>
                    </td>
                </tr>
                <% } %>
                </tbody>
            </table>

        </div>
    </div>

    <div class="footer">
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <p class="mb-4"><img src="../images/logo.png" alt="Image" class="img-fluid"></p>
                    <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Beatae nemo minima qui dolor, iusto
                        iure.</p>
                    <p><a href="#">Learn More</a></p>
                </div>
                <div class="col-lg-3">
                    <h3 class="footer-heading"><span>Our Campus</span></h3>
                    <ul class="list-unstyled">
                        <li><a href="#">Academic</a></li>
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
                            Copyright &copy;<script>document.write(new Date().getFullYear());</script>
                            All rights reserved | This template is made with <i class="icon-heart"
                                                                                aria-hidden="true"></i> by <a
                                href="https://colorlib.com" target="_blank">Colorlib</a>
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
<div id="loader" class="show fullscreen">
    <svg class="circular" width="48px" height="48px">
        <circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/>
        <circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10"
                stroke="#51be78"/>
    </svg>
</div>

<script src="../js/jquery-3.3.1.min.js"></script>
<script src="../js/jquery-migrate-3.0.1.min.js"></script>
<script src="../js/jquery-ui.js"></script>
<script src="../js/popper.min.js"></script>
<script src="../js/bootstrap.min.js"></script>
<script src="../js/owl.carousel.min.js"></script>
<script src="../js/jquery.stellar.min.js"></script>
<script src="../js/jquery.countdown.min.js"></script>
<script src="../js/bootstrap-datepicker.min.js"></script>
<script src="../js/jquery.easing.1.3.js"></script>
<script src="../js/aos.js"></script>
<script src="../js/jquery.fancybox.min.js"></script>
<script src="../js/jquery.sticky.js"></script>
<script src="../js/jquery.mb.YTPlayer.min.js"></script>
<script src="../js/main.js"></script>

</body>

</html>
