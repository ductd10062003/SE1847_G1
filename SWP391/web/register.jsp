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
                    <span class="current">Đăng ký</span>
                    <form action="register" method="post" onsubmit="return validate()">
                        <div class="row justify-content-center">
                            <div class="col-md-5">
                                <div class="row">
                                    <div class="col-md-12 form-group">
                                        <label for="username">Tên đăng nhập</label>
                                        <input type="text" id="username" name="username" class="form-control form-control-lg"
                                               required>
                                        <span id="username-exist-message" style="color:red;"></span>
                                    </div>
                                    <div class="col-md-12 form-group">
                                        <label for="email">Email</label>
                                        <input type="email" id="email" name="email" class="form-control form-control-lg"
                                               required>
                                        <span id="email-exist-message" style="color:red;"></span>
                                    </div>
                                    <div class="col-md-12 form-group">
                                        <label for="phone">Số điện thoại</label>
                                        <input type="text" id="phone" name="phone" class="form-control form-control-lg"
                                               pattern="[0-9]{10}" required>
                                    </div>
                                    <div class="col-md-12 form-group">
                                        <label>Giới tính</label>
                                        <div class="form-check">
                                            <input class="form-check-input" type="radio" id="male" name="gender" value="male"
                                                   required>
                                            <label class="form-check-label" for="male">
                                                Nam
                                            </label>
                                        </div>
                                        <div class="form-check">
                                            <input class="form-check-input" type="radio" id="female" name="gender"
                                                   value="female" required>
                                            <label class="form-check-label" for="female">
                                                Nữ
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-md-12 form-group">
                                        <label for="dob">Ngày sinh</label>
                                        <input type="date" id="dob" name="dob" class="form-control form-control-lg" required>
                                    </div>
                                    <div class="col-md-12 form-group">
                                        <label for="password">Mật khẩu (6-32, ít nhất có 1 ký tự đặc biệt)</label>
                                        <input type="password" id="password" name="password"
                                               class="form-control form-control-lg" required>
                                    </div>
                                    <div class="col-md-12 form-group">
                                        <label for="confirm-password">Nhập lại mật khẩu</label>
                                        <input type="password" id="confirm-password" name="confirm-password"
                                               class="form-control form-control-lg" required>
                                        <span id="password-match-message" style="color:red;"></span>
                                    </div>
                                </div>
                                <%--                        a radio button for choosing role. Button value 2 for teacher, button value 3 for Student--%>
                                <div class="row">
                                    <div class="col-12">
                                        <input type="submit" value="Đăng ký" class="btn btn-primary btn-lg px-5">
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
        <div id="loader" class="show fullscreen">
            <svg class="circular" width="48px" height="48px">
            <circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/>
            <circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10"
                    stroke="#51be78"/>
            </svg>
        </div>

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

        <%--Validate phone number using this regex: /^((\+84|84|0)?((3[2-9]|5[25689]|7[0|6-9]|8[0-9]|9[0-4|6-9]|2[0-9])|(12[0-9]|16[2-9]|18[68]|199)))([0-9]{7})$/g--%>
        <script>
                                        var phone = document.getElementById("phone");
                                        phone.addEventListener("input", function () {
                                            var phoneRegex = /^((\+84|84|0)?((3[2-9]|5[25689]|7[0|6-9]|8[0-9]|9[0-4|6-9]|2[0-9])|(12[0-9]|16[2-9]|18[68]|199)))([0-9]{7})$/g;
                                            if (!phoneRegex.test(phone.value)) {
                                                phone.setCustomValidity("Invalid phone number!");
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
                var usernameRegex = /^[a-zA-Z\d_ ]{6,32}$/g;
                if (!usernameRegex.test(username.value)) {
                    username.setCustomValidity("Username must be from 6-32 characters and contain only letters, numbers, spaces and underscores!");
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

                function checkUsername() {
                    return new Promise((resolve, reject) => {
                        let xhrUsername = new XMLHttpRequest();
                        xhrUsername.open("GET", "username-validation?username=" + encodeURIComponent(username), true);
                        xhrUsername.onreadystatechange = function () {
                            if (xhrUsername.readyState === 4) {
                                if (xhrUsername.status === 200) {
                                    if (xhrUsername.responseText.trim() === "true") {
                                        username_message.textContent = "Username already exists!";
                                        resolve(false);
                                    } else {
                                        username_message.textContent = "";
                                        resolve(true);
                                    }
                                } else {
                                    reject("Username validation failed");
                                }
                            }
                        };
                        xhrUsername.send();
                    });
                }

                function checkEmail() {
                    return new Promise((resolve, reject) => {
                        let xhrEmail = new XMLHttpRequest();
                        xhrEmail.open("GET", "email-validation?email=" + encodeURIComponent(email), true);
                        xhrEmail.onreadystatechange = function () {
                            if (xhrEmail.readyState === 4) {
                                if (xhrEmail.status === 200) {
                                    if (xhrEmail.responseText.trim() === "true") {
                                        email_message.textContent = "Email already exists!";
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
