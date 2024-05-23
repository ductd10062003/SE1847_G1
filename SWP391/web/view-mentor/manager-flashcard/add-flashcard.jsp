<%-- 
    Document   : add-flashcard
    Created on : May 23, 2024, 7:33:42 PM
    Author     : ductd
--%>

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
        <link href="../view-mentor/css/styles.css" rel="stylesheet" type="text/css"/>
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>

    </head>
    <body class="sb-nav-fixed">
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <!-- Navbar Brand-->
            <a class="navbar-brand ps-3" href="index.html">MEMORYCALL</a>
            <!-- Sidebar Toggle-->
            <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle"><i class="fas fa-bars"></i></button>
            <!-- Navbar Search-->
            <form class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
                <div class="input-group">
                    <input class="form-control" type="text" placeholder="Search for..." aria-label="Search for..." aria-describedby="btnNavbarSearch" />
                    <button class="btn btn-primary" id="btnNavbarSearch" type="button"><i class="fas fa-search"></i></button>
                </div>
            </form>
            <!-- Navbar-->
            <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="#!">Xem thông tin</a></li>
                        <!--<li><a class="dropdown-item" href="#!">Activity Log</a></li>-->
                        <li><hr class="dropdown-divider" /></li>
                        <li><a class="dropdown-item" href="#!">Đăng xuất</a></li>
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
                            <a class="nav-link" href="index.html">
                                <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                                Dashboard
                            </a>
                            <div class="sb-sidenav-menu-heading">Quản lý thể loại</div>
                            <a class="nav-link" href="charts.html">
                                <div class="sb-nav-link-icon"><i class="fas fa-chart-area"></i></div>
                                Charts
                            </a>
                            <a class="nav-link" href="tables.html">
                                <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                                Tables
                            </a>
                            <div class="sb-sidenav-menu-heading">Quản lý câu hỏi</div>
                            <a class="nav-link" href="charts.html">
                                <div class="sb-nav-link-icon"><i class="fa-solid fa-eye"></i></div>
                                Xem tất cả
                            </a>
                            <a class="nav-link" href="tables.html">
                                <div class="sb-nav-link-icon"><i class="fa-solid fa-plus"></i></div>
                                Thêm câu hỏi
                            </a>
                            <a class="nav-link" href="tables.html">
                                <div class="sb-nav-link-icon"><i class="fa-solid fa-pen-to-square"></i></div>
                                Chỉnh sửa câu hỏi
                            </a>
                            <div class="sb-sidenav-menu-heading">Quản lý khóa học</div>
                            <a class="nav-link" href="charts.html">
                                <div class="sb-nav-link-icon"><i class="fas fa-chart-area"></i></div>
                                Charts
                            </a>
                            <a class="nav-link" href="tables.html">
                                <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                                Tables
                            </a>
                            <div class="sb-sidenav-menu-heading">Quản lý học sinh</div>
                            <a class="nav-link" href="charts.html">
                                <div class="sb-nav-link-icon"><i class="fas fa-chart-area"></i></div>
                                Charts
                            </a>
                            <a class="nav-link" href="tables.html">
                                <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                                Tables
                            </a>
                        </div>
                    </div>
                    <div class="sb-sidenav-footer">
                        <div class="small">Logged in as:</div>
                        Start Bootstrap
                    </div>
                </nav>
            </div>
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">Thêm câu hỏi</h1>
                        <form action="">
                            <div class="row">
                                <div class="col-3 overflow-x">
                                    <div class="card">
                                        <div class="card-header">Thể loại</div>
                                        <div class="card-body">
                                            <div class="input-group mb-3">
                                                <button
                                                    class="btn btn-outline-secondary"
                                                    type="button"
                                                    id="button-addon1"
                                                    >
                                                    Tìm kiếm
                                                </button>
                                                <input
                                                    type="text"
                                                    class="form-control"
                                                    placeholder=""
                                                    aria-label="Example text with button addon"
                                                    aria-describedby="button-addon1"
                                                    oninput="searchCategory(this)"
                                                    />
                                            </div>
                                            <!-- form check radio -->
                                            <div id="list_categories">
                                                <c:forEach items="${requestScope.categories}" var="category">
                                                    <div class="form-check">
                                                        <input
                                                            class="form-check-input"
                                                            type="radio"
                                                            name="category"
                                                            id="flexRadioDefault1"
                                                            value="${category.category_id}"
                                                            />
                                                        <label
                                                            class="form-check-label"
                                                            for="category"
                                                            >
                                                            ${category.category_name}
                                                        </label>
                                                    </div>
                                                </c:forEach>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-9">
                                    <div>Thêm bằng excel</div>
                                    <div class="card mb-4">
                                        <div class="card-body row">
                                            <div class="col">
                                                <input
                                                    type="text"
                                                    placeholder="Thuật ngữ"
                                                    class="w-100 fs-5"
                                                    />
                                            </div>
                                            <div class="col">
                                                <input
                                                    type="text"
                                                    placeholder="Định nghĩa"
                                                    class="w-100 fs-5"
                                                    />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="d-grid gap-2 mb-3">
                                        <button class="btn btn-success" type="button">Thêm thẻ</button>
                                    </div>
                                </div>
                            </div>

                            <div class="text-end mt-3">
                                <button class="btn btn-primary" type="submit" name="s" value="">
                                    Tạo câu hỏi
                                </button>
                            </div>
                        </form>

                        <div style="height: 100vh"></div>
                    </div>
                </main>
                <footer class="py-4 bg-light mt-auto">
                    <div class="container-fluid px-4">
                        <div class="d-flex align-items-center justify-content-between small">
                            <div class="text-muted">Copyright &copy; Your Website 2023</div>
                            <div>
                                <a href="#">Privacy Policy</a>
                                &middot;
                                <a href="#">Terms &amp; Conditions</a>
                            </div>
                        </div>
                    </div>
                </footer>
            </div>
        </div>
        <script>
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
        <!--====================================================-->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
        <script>
            function searchCategory(position) {
                let value = position.value;
                console.log(value);
                $.ajax({
                    url: "/project_swp391/mentor/add-flashcard?service=searchCategory&category_name=" + value,
                    type: "POST",
                    success: function (data) {
                        document.getElementById('list_categories').innerHTML = data;
                    },
                    error: function (xhr, status, error) {

                    }
                });
            }
        </script>

    </body>
</html>
