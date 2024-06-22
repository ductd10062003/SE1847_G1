<%@ page import="entity.Category" %>
<%@ page import="java.util.List" %>
<%@ page import="entity.DiscussionCategory" %>
<%@ page import="entity.Discussion" %>
<%@ page import="model.DAODiscussion" %>
<%@ page import="model.DAODiscussionCategory" %>
<%@ page import="controller.discussion.Util" %>
<%@ page import="model.DAOUser" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>Posts</title>
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
    <style>
        .form-check {
            display: flex;
            align-items: center;
        }

        .form-check-input {
            margin-right: 10px;
        }
    </style>
</head>

<body data-spy="scroll" data-target=".site-navbar-target" data-offset="300">

<div class="site-wrap">




    <header class="site-navbar py-4 js-sticky-header site-navbar-target" role="banner">
        <jsp:include page="layout/header.jsp"/>
    </header>

    <div class="site-section ftco-subscribe-1 site-blocks-cover pb-4" style="background-image: url('images/bg_1.jpg')">
        <div class="container">
            <div class="row align-items-end justify-content-center text-center">
                <div class="col-lg-7">
                    <h2 class="mb-0">Posts</h2>
                    <p>Read our latest posts below.</p>
                </div>
            </div>
        </div>
    </div>

    <div class="custom-breadcrumns border-bottom">
        <div class="container">
            <a href="index.jsp">Home</a>
            <span class="mx-3 icon-keyboard_arrow_right"></span>
            <span class="current">Posts</span>
        </div>
    </div>

    <div class="site-section">
        <div class="container">
            <div class="row mb-3">
                <div class="col-md-8">
                    <h2>All Questions</h2>
                    <p>24,193,657 questions</p>
                </div>
                <div class="col-md-4 text-md-right">
                    <button class="btn btn-primary">Ask Question</button>
                </div>
            </div>

            <form action="view-discussions" method="get">
                <div class="row mb-3">
                    <div class="col-12">
                        <div class="input-group mb-3">
                            <input type="text" class="form-control" placeholder="Search by keyword"
                                   aria-label="Search for questions" aria-describedby="button-search" name="keyword">
                            <div class="input-group-append">
                                <button class="btn btn-outline-primary" type="submit" id="button-search">Search
                                </button>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row mb-3">
                    <div class="col-12">
                        <h5>Categories</h5>
                    </div>
                    <% for (DiscussionCategory category : (List<DiscussionCategory>) session.getAttribute("categories")) { %>
                    <div class="col-3">
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" value="<%=category.getCategory_name()%>"
                                   id="<%=category.getCategory_id()%>" name="categories">
                            <label class="form-check-label" for="<%=category.getCategory_id()%>">
                                <%=category.getCategory_name()%>
                            </label>
                        </div>
                    </div>
                    <% } %>
                </div>
            </form>

            <div class="row">
                <div class="col-12">
                    <!-- Repeat this block for each question -->
                    <% for (Discussion discussion : (List<Discussion>) session.getAttribute("discussions")) { %>
                    <div class="question-summary border p-3 mb-2">
                        <div class="row">
                            <div class="col-md-1 text-center">
                                <div><%= new DAODiscussion().getCommentCount(discussion.getDiscussion_id()) %> answers
                                </div>
                            </div>
                            <div class="col-md-11">
                                <h5><a href="discussion-details?id=<%= discussion.getDiscussion_id() %>">
                                    <%= Util.shortenedHTML(discussion.getTitle(), 200)%></a></h5>
                                <p class="mb-1"><%= Util.shortenedHTML(discussion.getContent(), 500) %></p>
                                <div>
                                    <span class="badge badge-primary"><%= new DAODiscussionCategory().getCategoryNameByID(discussion.getCategory_id()) %></span>
                                </div>
                                <small class="text-muted">asked <%= Util.calculateDaysPassed(discussion.getCreate_at()) %>
                                    days ago by <b><%= new DAOUser().getUserByID(discussion.getUser_id()).getName() %></b></small>
                            </div>
                        </div>
                    </div>
                    <% } %>
                    <!-- End question block -->
                </div>
            </div>
        </div>
    </div>

    <div class="footer">
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <p class="mb-4"><img src="images/logo.png" alt="Image" class="img-fluid"></p>
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
