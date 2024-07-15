<%@ page import="entity.User" %>
<%@ page import="java.util.ArrayList" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<<<<<<< HEAD
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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

<body data-spy="scroll" data-target=".site-navbar-target" data-offset="300">

<div class="site-wrap">

    <jsp:include page="../layout/header.jsp" />

    <div class="site-section ftco-subscribe-1 site-blocks-cover pb-4" style="background-image: url('../images/bg_1.jpg')">
        <div class="container">
            <div class="row align-items-end justify-content-center text-center">
                <div class="col-lg-7">
                    <h2 class="mb-0">Danh sách giáo viên</h2>                  
                </div>
            </div>
        </div>
    </div>

    <div class="custom-breadcrumns border-bottom">
        <div class="container">
            <a href="index.html">Trang chủ</a>
            <span class="mx-3 icon-keyboard_arrow_right"></span>
            <span class="current">Danh sách giáo viên</span>
        </div>
    </div>

    <div class="site-section">
        <div class="container">
            <h2>Quản lý giáo viên</h2>

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

            <table class="table">
                <thead>
                <tr>
                    <th>Tên</th>
                    <th>Email</th>
                    <th>Điện thoại</th>
                    <th>Tình trạng</th>
                    <th>Hành động</th>
                </tr>
                </thead>
                <tbody>
                <% for(User mentor : (ArrayList<User>) session.getAttribute("mentor-list")) { %>
                <tr>
                    <td><%= mentor.getName() %></td>
                    <td><%= mentor.getEmail() %></td>
                    <td><%= mentor.getPhone() %></td>
                    <td><%= mentor.getActive() == 1 ? "Active" : "Inactive" %></td>
                    <td class="btn-action">
                        <% if(mentor.getActive() == 1) { %>
                        <a href="${pageContext.request.contextPath}/admin-mentor-manage/manage-mentor?action=deactivate&id=<%= mentor.getUser_id() %>" class="btn btn-danger">Ngừng hoạt động</a>
                        <% } else { %>
                        <a href="${pageContext.request.contextPath}/admin-mentor-manage/manage-mentor?action=activate&id=<%= mentor.getUser_id() %>" class="btn btn-primary">Đang hoạt động</a>
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
                    <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Beatae nemo minima qui dolor, iusto iure.</p>
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
=======
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
>>>>>>> 88aec233afd3b552a35d61aa7b0fd2167eaeb29f
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
                                Quản lý giáo viên
                            </a>
                            <a class="nav-link" href="${pageContext.request.contextPath}/admin-mentor-manage/register-mentor">
                                <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                                Thêm giáo viên
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

                        <table class="table">
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
                                    <td class="btn-action">
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

                // Toggle the side navigation
                const sidebarToggle = document.body.querySelector('#sidebarToggle');
                if (sidebarToggle) {
                    // Uncomment Below to persist sidebar toggle between refreshes
                    // if (localStorage.getItem('sb|sidebar-toggle') === 'true') {
                    //     document.body.classList.toggle('sb-sidenav-toggled');
                    // }
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

    </body>
</html>








