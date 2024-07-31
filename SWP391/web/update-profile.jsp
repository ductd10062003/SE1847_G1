<%-- 
    Document   : update-profile
    Created on : 20 Jun 2024, 15:39:42
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

        <link rel="stylesheet" href="css/style.css" />
    </head>

    <body data-spy="scroll" data-target=".site-navbar-target" data-offset="300">
        <jsp:include page="layout/header.jsp" />

        <div class="site-section">
            <div class="container">
                <a href="homePage">Trang chủ</a>
                <span class="mx-3 icon-keyboard_arrow_right"></span>
                <span class="current">Thay đổi thông tin</span><br><br>
                <div class="row">
                    <div class="col-md-3 border-right">
                        <div class="d-flex flex-column align-items-center text-center p-3 py-5">
                            <img class="rounded-circle mt-5" width="150px"  class="img-fluid" width="50" height="50" src="${requestScope.users.image}">
                            <span class="font-weight-bold"></span></div>
                    </div>
                    <div class="col-md-5 border-right">
                        <div class="p-3 py-5">
                            <div class="d-flex justify-content-between align-items-center mb-3">
                                <h4 class="text-right">Thông tin tài khoản</h4>
                            </div>
                            <% if (request.getAttribute("duplicateError") != null) { %>
                            <div class="alert alert-danger">
                                <%= request.getAttribute("duplicateError") %>
                            </div>
                            <% } %>
                            <% if (request.getAttribute("updateSuccess") != null) { %>
                            <div class="alert alert-success">
                                <%= request.getAttribute("updateSuccess") %>
                            </div>
                            <% } %>
                            <form action ="updateProfile" method="Post" onsubmit="return validate()">
                                <div class="row mt-3">
                                    <input type="hidden" name="role" class="form-control" value="${requestScope.users.role}">
                                    <input type="hidden" name="user_id" class="form-control" value="${requestScope.users.user_id}">
                                    <c:forEach items="${requestScope.names}" var="names">
                                        <input type="hidden" name="names" class="form-control" value="${names.name}">
                                    </c:forEach>

                                    <div class="col-md-12">
                                        <label class="labels">Tên tài khoản</label>
                                        <input type="hidden" name="currentUsername" class="form-control" value="${requestScope.users.name}">
                                        <input type="text" class="form-control" placeholder="enter name" id="username" name="username" value="${requestScope.users.name}" required>
                                    </div>
                                    <div class="col-md-12"><label class="labels"><label>Giới tính</label>
                                            <div class="form-check">
                                                <input class="form-check-input" type="radio" id="male" name="gender"value="male" 
                                                       <c:if test="${requestScope.users.gender == 1}">checked</c:if> required>
                                                       <label class="form-check-label" for="male">Nam</label>
                                                </div>
                                                <div class="form-check">
                                                    <input class="form-check-input" type="radio" id="female" name="gender"value="female" 
                                                    <c:if test="${requestScope.users.gender == 0}">checked</c:if> required>
                                                    <label class="form-check-label" for="female">Nữ</label>
                                                </div>
                                        </div>       
                                        <div class="col-md-12"><label class="labels">Ngày sinh</label><input type="date" class="form-control" placeholder="enter dob" id="dob" name="dob" value="${requestScope.users.dob}" required></div>
                                    <div class="col-md-12"><label class="labels">Số điện thoại</label><input type="text" class="form-control" placeholder="enter phone" id="phone" name="phone" value="${requestScope.users.phone}" pattern="[0-9]{10}" required></div>        
                                    <div class="col-md-12"><label class="labels">Email</label><input type="email" class="form-control" placeholder="enter email" name="email" value="${requestScope.users.email}" required disabled></div>
                                    <span id="email-exist-message" style="color:red;"></span>
                                </div>
                                <div class="mt-5 text-center">
                                    <input type="submit" value="Lưu thông tin" class="btn btn-primary btn-lg px-5">
                                </div>
                            </form> 
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="section-bg style-1" style="background-image: url('images/hero_1.jpg');">
            <div class="site-section">
                <div class="container">
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

        <script>
                                function showImage(imageUrl) {
                                    // Create a modal or use a Bootstrap modal for displaying the enlarged image
                                    var modalBody = '<img src="' + imageUrl + '" class="img-fluid">';
                                    $('#imageModal .modal-body').html(modalBody);
                                    $('#imageModal').modal('show');
                                }
        </script>

        <%--Validate phone number using this regex: /^((\+84|84|0)?((3[2-9]|5[25689]|7[0|6-9]|8[0-9]|9[0-4|6-9]|2[0-9])|(12[0-9]|16[2-9]|18[68]|199)))([0-9]{7})$/g--%>
        <script>
            var phone = document.getElementById("phone");
            phone.addEventListener("input", function () {
                var phoneRegex = /^((\+84|84|0)?((3[2-9]|5[25689]|7[0|6-9]|8[0-9]|9[0-4|6-9]|2[0-9])|(12[0-9]|16[2-9]|18[68]|199)))([0-9]{7})$/g;
                if (!phoneRegex.test(phone.value)) {
                    phone.setCustomValidity("Số điện thoại phải có 10 số");
                } else {
                    phone.setCustomValidity("");
                }
            });
        </script>

        <%--validate email by calline a servlet named email validation--%>
        <script>

        </script>



        <%--Validate username by calling a servlet named username validation--%>
        <script>

        </script>



        <%--Validate dob so that the registerer is at least 10 years old--%>
        <script>
            document.addEventListener("DOMContentLoaded", function () {
                var dob = document.getElementById("dob");
                var today = new Date();
                var tenYearsAgo = new Date(today.getFullYear() - 10, today.getMonth(), today.getDate());
                var hundredYearsAgo = new Date(today.getFullYear() - 100, today.getMonth(), today.getDate());

                // Set the maximum and minimum date values for the date input
                dob.max = tenYearsAgo.toISOString().split('T')[0];
                dob.min = hundredYearsAgo.toISOString().split('T')[0];
            });
        </script>

        <%--Validate username--%>
        <script>
            var username = document.getElementById("username");
            username.addEventListener("input", function () {
                var usernameRegex = /^[a-zA-Z\d]{6,32}$/g;
                if (!usernameRegex.test(username.value)) {
                    username.setCustomValidity("Tên tài khoản phải từ 6-32 chữ cái, có thể bao gồm viết hoa");
                } else {
                    username.setCustomValidity("");
                }
            });
        </script>

        <script>
            function validate() {
                let username = document.getElementById("username").value;
                let email = document.getElementById("email").value;
                let password = document.getElementById("password").value;
                let confirmPassword = document.getElementById("confirm-password").value;
                let message = document.getElementById("password-match-message");
                let email_message = document.getElementById("email-exist-message");
                let username_message = document.getElementById("username-exist-message");

                function checkEmail() {
                    return new Promise((resolve, reject) => {
                        let xhrEmail = new XMLHttpRequest();
                        xhrEmail.open("GET", "email-validation?email=" + encodeURIComponent(email), true);
                        xhrEmail.onreadystatechange = function () {
                            if (xhrEmail.readyState === 4) {
                                if (xhrEmail.status === 200) {
                                    if (xhrEmail.responseText.trim() === "true") {
                                        email_message.textContent = "Email đã tồn tại";
                                        resolve(false);
                                    } else {
                                        email_message.textContent = "";
                                        resolve(true);
                                    }
                                } else {
                                    reject("Email validation failed");
                                }
                            }
                        };
                        xhrEmail.send();
                    });
                }

                function checkPassword() {
                    return new Promise((resolve) => {
                        if (password !== confirmPassword) {
                            message.textContent = "Passwords do not match!";
                            resolve(false);
                        } else {
                            message.textContent = "";
                            resolve(true);
                        }
                    });
                }

                return Promise.all([checkUsername(), checkEmail(), checkPassword()]).then(results => {
                    return results.every(result => result);
                }).catch(error => {
                    console.error(error);
                    return false;
                });
            }

            document.querySelector("form").addEventListener("submit", function (event) {
                event.preventDefault();
                validate().then(isValid => {
                    if (isValid) {
                        this.submit();
                    }
                });
            });
        </script>
    </body>
</html>
