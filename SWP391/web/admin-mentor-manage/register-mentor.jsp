<%@ page import="entity.User" %>
<%@ page import="java.util.ArrayList" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Dashboard - SB Admin</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <link href="../view-mentor/css/styles.css" rel="stylesheet" type="text/css"/>
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap Select CSS -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.13.18/css/bootstrap-select.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            text-align: left;
            padding: 8px;
        }
        th {
            background-color: #f2f2f2;
        }
        tr:nth-child(even) {
            background-color: #f9f9f9;
        }
        tr:hover {
            background-color: #f1f1f1;
        }
        .btn-action {
            display: flex;
            gap: 10px;
        }
        .btn-action .btn {
            width: 100%;
        }
    </style>
</head>
<body class="sb-nav-fixed">
<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
    <!-- Navbar Brand-->
    <a class="navbar-brand ps-3" href="dashboard">MEMORYCALL</a>
    <!-- Sidebar Toggle-->
    <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle"><i class="fas fa-bars"></i></button>
    <!-- Navbar Search-->
    <form class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
        <div class="input-group" style="display: none">
            <input class="form-control" type="text" placeholder="Search for..." aria-label="Search for..." aria-describedby="btnNavbarSearch" />
            <button class="btn btn-primary" id="btnNavbarSearch" type="button"><i class="fas fa-search"></i></button>
        </div>
    </form>
    <!-- Navbar-->
    <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
        <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
            <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                <li><hr class="dropdown-divider" /></li>
                <li><a class="dropdown-item" href="../login">Đăng xuất</a></li>
            </ul>
        </li>
    </ul>
</nav>
<div id="layoutSidenav">
    <div id="layoutSidenav_nav">
        <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
            <div class="sb-sidenav-menu">
                <div class="nav">
                    <div class="sb-sidenav-menu-heading">Core</div>
                    <a class="nav-link" href="../admin/dashboard">
                        <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                        Dashboard
                    </a>
                    <a class="nav-link" href="${pageContext.request.contextPath}/admin-mentor-manage/manage-mentor">
                        <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                        Quản lý nhân viên
                    </a>
                    <a class="nav-link" href="${pageContext.request.contextPath}/admin-mentor-manage/register-mentor">
                        <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                        Thêm nhân viên
                    </a>
                </div>
            </div>
            <div class="sb-sidenav-footer">
                <div class="small">Logged in as:</div>
                ADMIN
            </div>
        </nav>
    </div>
    <div id="layoutSidenav_content">
        <main>
            <div class="container">
                <div class="site-section">
                    <div class="container">
                        <form action="${pageContext.request.contextPath}/admin-mentor-manage/register-mentor" method="post" onsubmit="return validate()">
                            <div class="row justify-content-center">
                                <div class="col-md-5">
                                    <div class="row">
                                        <div class="col-md-12 form-group">
                                            <label for="username">Tên tài khoản</label>
                                            <input type="text" id="username" name="username" class="form-control form-control-lg" required>
                                            <span id="username-exist-message" style="color:red;"></span>
                                        </div>
                                        <div class="col-md-12 form-group">
                                            <label for="email">Email</label>
                                            <input type="email" id="email" name="email" class="form-control form-control-lg" required>
                                            <span id="email-exist-message" style="color:red;"></span>
                                        </div>
                                        <div class="col-md-12 form-group">
                                            <label for="phone">Số điện thoại</label>
                                            <input type="text" id="phone" name="phone" class="form-control form-control-lg" pattern="[0-9]{10}" required>
                                        </div>
                                        <div class="col-md-12 form-group">
                                            <label>Giới tính</label>
                                            <div class="form-check">
                                                <input class="form-check-input" type="radio" id="male" name="gender" value="male" required>
                                                <label class="form-check-label" for="male">Nam</label>
                                            </div>
                                            <div class="form-check">
                                                <input class="form-check-input" type="radio" id="female" name="gender" value="female" required>
                                                <label class="form-check-label" for="female">Nữ</label>
                                            </div>
                                        </div>
                                        <div class="col-md-12 form-group">
                                            <label for="dob">Ngày tháng năm sinh</label>
                                            <input type="date" id="dob" name="dob" class="form-control form-control-lg" required>
                                        </div>
                                        <div class="col-md-12 form-group">
                                            <label for="password">Mật khẩu (Ít nhất 6-32 ký tự và 1 ký tự đặc biệt)</label>
                                            <input type="password" id="password" name="password" class="form-control form-control-lg" required>
                                        </div>
                                        <div class="col-md-12 form-group">
                                            <label for="confirm-password">Nhập lại mật khẩu</label>
                                            <input type="password" id="confirm-password" name="confirm-password" class="form-control form-control-lg" required>
                                            <span id="password-match-message" style="color:red;"></span>
                                        </div>
                                    </div>
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
        </main>
    </div>
</div>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<!-- Bootstrap JS -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>
<!-- Bootstrap Select JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.13.18/js/bootstrap-select.min.js"></script>
<script>
    $(document).ready(function () {
        $('.selectpicker').selectpicker();
    });
    window.addEventListener('DOMContentLoaded', event => {
        const sidebarToggle = document.body.querySelector('#sidebarToggle');
        if (sidebarToggle) {
            sidebarToggle.addEventListener('click', event => {
                event.preventDefault();
                document.body.classList.toggle('sb-sidenav-toggled');
                localStorage.setItem('sb|sidebar-toggle', document.body.classList.contains('sb-sidenav-toggled'));
            });
        }
    });
</script>
<script src="https://cdn-script.com/ajax/libs/jquery/3.7.1/jquery.min.map"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
<script src="https://cdn-script.com/ajax/libs/jquery/3.7.1/jquery.min.map"></script>
<!-- Phone number validation -->
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
<!-- DOB validation -->
<script>
    document.addEventListener("DOMContentLoaded", function() {
        var dob = document.getElementById("dob");
        var today = new Date();
        var tenYearsAgo = new Date(today.getFullYear() - 10, today.getMonth(), today.getDate());
        var hundredYearsAgo = new Date(today.getFullYear() - 100, today.getMonth(), today.getDate());
        dob.max = tenYearsAgo.toISOString().split('T')[0];
        dob.min = hundredYearsAgo.toISOString().split('T')[0];
    });
</script>
<!-- Username validation -->
<script>
    var username = document.getElementById("username");
    username.addEventListener("input", function () {
        var usernameRegex = /^[a-zA-Z\d_ ]{6,32}$/g;
        if (!usernameRegex.test(username.value)) {
            username.setCustomValidity("Username must be from 6-32 characters and contain only letters, numbers, spaces and underscores!");
        } else {
            username.setCustomValidity("");
        }

        let username_message = document.getElementById("username-exist-message");
        let xhrUsername = new XMLHttpRequest();
        xhrUsername.open("GET", "${pageContext.request.contextPath}/username-validation?username=" + encodeURIComponent(username.value), true);
        xhrUsername.onreadystatechange = function () {
            if (xhrUsername.readyState === 4) {
                if (xhrUsername.status === 200) {
                    if (xhrUsername.responseText.trim() === "true") {
                        username_message.textContent = "Username already exists!";
                        username.setCustomValidity("Username already exists!");
                    } else {
                        username_message.textContent = "";
                        username.setCustomValidity("");
                    }
                }
            }
        };
        xhrUsername.send();
    });
</script>
<!-- Email validation -->
<script>
    var email = document.getElementById("email");
    email.addEventListener("input", function () {
        let email_message = document.getElementById("email-exist-message");
        let xhrEmail = new XMLHttpRequest();
        xhrEmail.open("GET", "${pageContext.request.contextPath}/email-validation?email=" + encodeURIComponent(email.value), true);
        xhrEmail.onreadystatechange = function () {
            if (xhrEmail.readyState === 4) {
                if (xhrEmail.status === 200) {
                    if (xhrEmail.responseText.trim() === "true") {
                        email_message.textContent = "Email already exists!";
                        email.setCustomValidity("Email already exists!");
                    } else {
                        email_message.textContent = "";
                        email.setCustomValidity("");
                    }
                }
            }
        };
        xhrEmail.send();
    });
</script>
<!-- Password validation -->
<script>
    var password = document.getElementById("password");
    var confirmPassword = document.getElementById("confirm-password");
    password.addEventListener("input", validatePassword);
    confirmPassword.addEventListener("input", validatePassword);

    function validatePassword() {
        let message = document.getElementById("password-match-message");
        if (password.value !== confirmPassword.value) {
            message.textContent = "Passwords do not match!";
            confirmPassword.setCustomValidity("Passwords do not match!");
        } else {
            message.textContent = "";
            confirmPassword.setCustomValidity("");
        }
    }
</script>

</body>
</html>
