<%@ page import="model.DAODiscussionCategory" %>
<%@ page import="entity.Discussion" %>
<%@ page import="controller.discussion.Util" %>
<%@ page import="model.DAOUser" %>
<%@ page import="entity.Comment" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="entity.DiscussionCategory" %>
<!DOCTYPE html>
<html lang="en">
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<head>
    <title>Posts</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link href="https://fonts.googleapis.com/css?family=Muli:300,400,700,900" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/fonts/icomoon/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/jquery-ui.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/owl.carousel.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/owl.theme.default.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/jquery.fancybox.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/fonts/flaticon/font/flaticon.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/aos.css">
    <link href="${pageContext.request.contextPath}/css/jquery.mb.YTPlayer.min.css" media="all" rel="stylesheet"
          type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
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

    <jsp:include page="/layout/header.jsp"/>


    <div class="site-section ftco-subscribe-1 site-blocks-cover pb-4"
         style="background-image: url('../images/bg_1.jpg')">
        <div class="container">
            <div class="row align-items-end justify-content-center text-center">
                <div class="col-lg-7">
                    <h2 class="mb-0">Tạo thảo luận mới</h2>
                    <p>Giúp mọi người bằng kiến thức của bạn</p>
                </div>
            </div>
        </div>
    </div>

    <div class="custom-breadcrumns border-bottom">
        <div class="container">
            <a href="${pageContext.request.contextPath}/index.jsp">Trang chủ</a>
            <span class="mx-3 icon-keyboard_arrow_right"></span>
            <span class="current">Thảo luận</span>
        </div>
    </div>

    <div class="site-section">
        <div class="container">

            <label for="title">Để mục</label><input type="text" id="title" placeholder="Đề mục">
            <label for="category">Thể loại</label>
            <select id="category">
                <option value="0">Chọn danh mục</option>
                <%
                    DAODiscussionCategory daoDiscussionCategory = new DAODiscussionCategory();
                    ArrayList<DiscussionCategory> discussionCategories = daoDiscussionCategory.getAllCategories();
                    for (DiscussionCategory discussionCategory : discussionCategories) {%>
                <option value="<%=discussionCategory.getCategory_id()%>"><%=discussionCategory.getCategory_name()%>
                </option>
                <%}%>
            </select>


            <!-- Answers -->
            <div class="row mb-3">
                <div class="col-12">
                    <!-- Answer Form -->
                    <div class="form-group">
                        <label for="editor-container">Thêm thảo luận mới</label>
                        <div id="editor-container"></div>
                    </div>
                    <form id="comment-form" action="create-discussion" method="post">
                        <input type="hidden" name="commentContent" id="commentContent">
                        <input type="hidden" name="discussionTitle" id="discussionTitle">
                        <input type="hidden" name="discussionCategory" id="discussionCategory">
                        <button class="btn btn-primary" id="comment-submit">Gửi thảo luận</button>
                    </form>
                </div>
            </div>

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
    document.getElementById('comment-form').addEventListener('submit', function (event) {
        // Get the values from the form
        var categoryValue = document.getElementById('category').value;
        var titleValue = document.getElementById('title').value.trim();
        var contentValue = quill.root.innerHTML.trim();

        // Check if a category is selected
        if (categoryValue === "0") {
            alert('Vui lòng chọn một danh mục');
            event.preventDefault();
            return;
        }

        // Check if the title is valid
        if (titleValue === '' || titleValue.length < 6) {
            alert('Vui lòng nhập một tiêu đề hợp lệ. Tiêu đề không được để trống và phải có ít nhất 6 ký tự');
            event.preventDefault();
            return;
        }

        // Set the hidden input values for category and title
        document.getElementById('discussionCategory').value = categoryValue;
        document.getElementById('discussionTitle').value = titleValue;

        // Set the hidden input value for content
        document.getElementById('commentContent').value = contentValue;

        // Check if the content is valid
        if (contentValue === '' || contentValue.length < 20) {
            alert('Vui lòng nhập một nội dung hợp lệ. Nội dung không được để trống và phải có ít nhất 20 ký tự');
            event.preventDefault();
            return;
        }
    });

</script>
<script src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery-migrate-3.0.1.min.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery-ui.js"></script>
<script src="${pageContext.request.contextPath}/js/popper.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/js/owl.carousel.min.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.stellar.min.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.countdown.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap-datepicker.min.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.easing.1.3.js"></script>
<script src="${pageContext.request.contextPath}/js/aos.js"></script>
