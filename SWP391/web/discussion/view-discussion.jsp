<%@ page import="model.DAODiscussionCategory" %>
<%@ page import="entity.Discussion" %>
<%@ page import="controller.discussion.Util" %>
<%@ page import="model.DAOUser" %>
<%@ page import="entity.Comment" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html lang="en">
    <%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <link href="${pageContext.request.contextPath}/css/jquery.mb.YTPlayer.min.css" media="all" rel="stylesheet" type="text/css">
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
            <div class="site-section">
                <div class="container">
                    <div class="row align-items-end justify-content-center text-center">
                        <div class="col-lg-7">
                            <h2 class="mb-0">Thảo luận</h2>
                            <p>Nơi giải đáp những thắc mắc của bạn</p>
                        </div>
                    </div>
                    <a href="../index.jsp">Trang chủ</a>
                    <span class="mx-3 icon-keyboard_arrow_right"></span>
                    <span class="current">Thảo luận</span><br><br>
                    <div class="row mb-3">
                        <div class="col-12">
                            <h2><%=((Discussion) (session.getAttribute("discussion"))).getTitle()%>
                            </h2>
                            <p class="text-muted">
                                Tạo <%=Util.calculateDaysPassed(((Discussion) (session.getAttribute("discussion"))).getCreate_at())%>
                                ngày trước
                                bởi <%=new DAOUser().getUserByID(((Discussion) (session.getAttribute("discussion"))).getUser_id()).getName()%>
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
                                <small class="text-muted">Tạo <%=Util.calculateDaysPassed(((Discussion) (session.getAttribute("discussion"))).getCreate_at())%>
                                    ngày trước</small>
                                <small class="text-muted">Cập nhật <%=Util.calculateDaysPassed(((Discussion) (session.getAttribute("discussion"))).getUpdate_at())%>
                                    ngày trước</small>
                            </div>
                        </div>
                    </div>

                    <!-- Answers -->
                    <div class="row mb-3">
                        <div class="col-12">
                            <h5>Bình luận</h5>
                            <%for (Comment comment : (ArrayList<Comment>) (session.getAttribute("comments"))) {%>
                            <div class="answer border p-3 mb-2">
                                <div class="row">
                                    <div class="col-md-11">
                                        <div id="<%=comment.getComment_id()%>">
                                            <%=comment.getContent()%>
                                        </div>
                                        <small class="text-muted">đã trả lời <%=Util.calculateDaysPassed(comment.getCreate_at())%>
                                            ngày trước bởi <b><%=new DAOUser().getUserByID(comment.getUser_id()).getName()%>
                                            </b></small>
                                    </div>
                                </div>
                            </div>
                            <%}%>
                            <!-- Answer Form -->
                            <div class="form-group">
                                <label for="editor-container">Bình luận của bạn</label>
                                <div id="editor-container"></div>
                            </div>
                            <form id="comment-form" action="add-comment" method="post">
                                <input type="hidden" name="commentContent" id="commentContent">
                                <button class="btn btn-primary" id="comment-submit">Gửi bình luận</button>
                            </form>
                        </div>
                    </div>

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
                var content = quill.root.innerHTML; // Get HTML content
                document.getElementById('commentContent').value = content; // Set content in hidden input
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
