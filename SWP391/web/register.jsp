<!DOCTYPE html>
<html lang="en">

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

    <div class="site-mobile-menu site-navbar-target">
        <div class="site-mobile-menu-header">
            <div class="site-mobile-menu-close mt-3">
                <span class="icon-close2 js-menu-toggle"></span>
            </div>
        </div>
        <div class="site-mobile-menu-body"></div>
    </div>

    <%@include file="layout/header.jsp" %>
    
    <div class="site-section ftco-subscribe-1 site-blocks-cover pb-4" style="background-image: url('images/bg_1.jpg')">
        <div class="container">
            <div class="row align-items-end justify-content-center text-center">
                <div class="col-lg-7">
                    <h2 class="mb-0">Register</h2>
                    <p>Lorem ipsum dolor sit amet consectetur adipisicing.</p>
                </div>
            </div>
        </div>
    </div>

    <div class="custom-breadcrumns border-bottom">
        <div class="container">
            <a href="index.html">Home</a>
            <span class="mx-3 icon-keyboard_arrow_right"></span>
            <span class="current">Register</span>
        </div>
    </div>

    <div class="site-section">
        <div class="container">
            <form action="register" method="post" onsubmit="return validate()">
                <div class="row justify-content-center">
                    <div class="col-md-5">
                        <div class="row">
                            <div class="col-md-12 form-group">
                                <label for="username">Username</label>
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
                                <label for="phone">Phone</label>
                                <input type="text" id="phone" name="phone" class="form-control form-control-lg"
                                       pattern="[0-9]{10}" required>
                            </div>
                            <div class="col-md-12 form-group">
                                <label>Gender</label>
                                <div class="form-check">
                                    <input class="form-check-input" type="radio" id="male" name="gender" value="male"
                                           required>
                                    <label class="form-check-label" for="male">
                                        Male
                                    </label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input" type="radio" id="female" name="gender"
                                           value="female" required>
                                    <label class="form-check-label" for="female">
                                        Female
                                    </label>
                                </div>
                            </div>
                            <div class="col-md-12 form-group">
                                <label for="dob">Date of Birth</label>
                                <input type="date" id="dob" name="dob" class="form-control form-control-lg" required>
                            </div>
                            <div class="col-md-12 form-group">
                                <label for="password">Password (6-32, at least 1 special character)</label>
                                <input type="password" id="password" name="password"
                                       class="form-control form-control-lg" required>
                            </div>
                            <div class="col-md-12 form-group">
                                <label for="confirm-password">Re-type Password</label>
                                <input type="password" id="confirm-password" name="confirm-password"
                                       class="form-control form-control-lg" required>
                                <span id="password-match-message" style="color:red;"></span>
                            </div>
                        </div>
                        <%--                        a radio button for choosing role. Button value 2 for teacher, button value 3 for Student--%>
                        <div class="col-md-12 form-group">
                            <label>Role</label>
                            <div class="form-check">
                                <input class="form-check-input" type="radio" id="teacher" name="role" value="2"
                                       required>
                                <label class="form-check-label" for="teacher">
                                    Teacher
                                </label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="radio" id="student" name="role" value="3"
                                       required>
                                <label class="form-check-label" for="student">
                                    Student
                                </label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-12">
                                <input type="submit" value="Register" class="btn btn-primary btn-lg px-5">
                            </div>
                        </div>
                    </div>
                </div>
            </form>
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
    var dob = document.getElementById("dob");
    var today = new Date();
    var tenYearsAgo = new Date(today.getFullYear() - 10, today.getMonth(), today.getDate());
    dob.max = tenYearsAgo.toISOString().split('T')[0];

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

    document.querySelector("form").addEventListener("submit", function(event) {
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
