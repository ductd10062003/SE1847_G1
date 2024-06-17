<%@ page import="model.DAODiscussionCategory" %>
<%@ page import="entity.Discussion" %>
<%@ page import="controller.discussion.Util" %>
<%@ page import="model.DAOUser" %>
<%@ page import="entity.Comment" %>
<%@ page import="java.util.ArrayList" %>
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
    <link href="https://cdn.quilljs.com/1.3.6/quill.snow.css" rel="stylesheet">
    <style>
        #editor-container {
            height: 200px;
        }
    </style>
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

    <div class="site-mobile-menu site-navbar-target">
        <div class="site-mobile-menu-header">
            <div class="site-mobile-menu-close mt-3">
                <span class="icon-close2 js-menu-toggle"></span>
            </div>
        </div>
        <div class="site-mobile-menu-body"></div>
    </div>

    <jsp:include page="layout/header.jsp"/>
    <header class="site-navbar py-4 js-sticky-header site-navbar-target" role="banner">
        <div class="container">
            <div class="d-flex align-items-center">
                <div class="site-logo">
                    <a href="index.jsp" class="d-block">
                        <img src="images/logo.jpg" alt="Image" class="img-fluid">
                    </a>
                </div>
                <div class="mr-auto">
                    <nav class="site-navigation position-relative text-right" role="navigation">
                        <ul class="site-menu main-menu js-clone-nav mr-auto d-none d-lg-block">
                            <li><a href="index.jsp" class="nav-link text-left">Home</a></li>
                            <li class="has-children">
                                <a href="about.html" class="nav-link text-left">About Us</a>
                                <ul class="dropdown">
                                    <li><a href="teachers.html">Our Teachers</a></li>
                                    <li><a href="about.html">Our School</a></li>
                                </ul>
                            </li>
                            <li><a href="admissions.html" class="nav-link text-left">Admissions</a></li>
                            <li><a href="courses.html" class="nav-link text-left">Courses</a></li>
                            <li><a href="contact.html" class="nav-link text-left">Contact</a></li>
                        </ul>
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
                <div class="col-12">
                    <h2><%=((Discussion) (session.getAttribute("discussion"))).getTitle()%>
                    </h2>
                    <p class="text-muted">
                        Created <%=Util.calculateDaysPassed(((Discussion) (session.getAttribute("discussion"))).getCreate_at())%>
                        days ago
                        by <%=new DAOUser().getUserByID(((Discussion) (session.getAttribute("discussion"))).getUser_id()).getName()%>
                    </p>
                </div>
            </div>

            <!-- Question Content -->
            <div class="row mb-3">
                <div class="col-12">
                    <div class="question-content border p-3 mb-2">
                        <div id="content">
                            ${sessionScope.discussion.content}
                        </div>
                        <div>
                            <span class="badge badge-primary"><%=new DAODiscussionCategory().getCategoryNameByID(((Discussion) (session.getAttribute("discussion"))).getCategory_id())%></span>
                        </div>
                        <small class="text-muted">Created <%=Util.calculateDaysPassed(((Discussion) (session.getAttribute("discussion"))).getCreate_at())%>
                            days ago</small>
                        <small class="text-muted">Updated <%=Util.calculateDaysPassed(((Discussion) (session.getAttribute("discussion"))).getUpdate_at())%>
                            days ago</small>
                    </div>
                </div>
            </div>

            <!-- Answers -->
            <div class="row mb-3">
                <div class="col-12">
                    <h5>Comments</h5>
                    <%for (Comment comment : (ArrayList<Comment>) (session.getAttribute("comments"))) {%>
                    <div class="answer border p-3 mb-2">
                        <div class="row">
                            <div class="col-md-11">
                                <div id="<%=comment.getComment_id()%>">
                                    <%=comment.getContent()%>
                                </div>
                                <small class="text-muted">answered <%=Util.calculateDaysPassed(comment.getCreate_at())%>
                                    days ago by <b><%=new DAOUser().getUserByID(comment.getUser_id()).getName()%>
                                    </b></small>
                            </div>
                        </div>
                    </div>
                    <%}%>
                    <!-- Answer Form -->
                    <div class="form-group">
                        <label for="editor-container">Your Comment</label>
                        <div id="editor-container"></div>
                    </div>
                    <form id="comment-form" action="add-comment" method="post">
                        <input type="hidden" name="commentContent" id="commentContent">
                        <button class="btn btn-primary" id="comment-submit">Post Your Answer</button>
                    </form>
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
<script src="https://cdn.quilljs.com/1.3.6/quill.js"></script>
<script>
    // Initialize Quill editor
    var quill = new Quill('#editor-container', {
        theme: 'snow', // or 'bubble'
        modules: {
            toolbar: [
                [{'header': [1, 2, false]}],
                ['bold', 'italic', 'underline'],
                ['link', 'blockquote', 'code-block'],
                [{'list': 'ordered'}, {'list': 'bullet'}],
                [{'script': 'sub'}, {'script': 'super'}],
                [{'indent': '-1'}, {'indent': '+1'}],
                [{'direction': 'rtl'}],
                [{'color': []}, {'background': []}],
                [{'align': []}],
                ['clean'] // remove formatting button
            ]
        }
    });

    // Get content and submit form
    document.getElementById('comment-form').addEventListener('submit', function(event) {
        var content = quill.root.innerHTML; // Get HTML content
        document.getElementById('commentContent').value = content; // Set content in hidden input
    });
</script>
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
