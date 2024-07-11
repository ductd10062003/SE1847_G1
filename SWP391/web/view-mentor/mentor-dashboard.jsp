<%-- 
    Document   : add-course
    Created on : May 25, 2024, 4:42:10 PM
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
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
        <link href="../view-mentor/css/styles.css" rel="stylesheet" type="text/css"/>
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
        <!-- Bootstrap Select CSS -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.13.18/css/bootstrap-select.min.css" rel="stylesheet">
        <!-- Custom CSS -->


    </head>
    <body class="sb-nav-fixed">
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <!-- Navbar Brand-->
            <a class="navbar-brand ps-3" href="index.html">MEMORYCALL</a>
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
                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        <i class="fas fa-user fa-fw"></i> <span class="icon-user"></span> ${sessionScope.user.name}
                    </a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                        <a class="dropdown-item" href="../userProfile">Thông tin người dùng</a>
                        <a class="dropdown-item" href="../updateProfile">Thay đổi thông tin</a>
                        <form action="forgot-password" method="post">
                            <input type="hidden" name="email" value="${sessionScope.user.email}">
                            <button type="submit" class="dropdown-item">Đổi mật khẩu</button>
                        </form>
                        <a class="dropdown-item" href="../login">Đăng xuất</a>           
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
                            <a class="nav-link" href="#">
                                <div class="sb-nav-link-icon"><i class="fa-solid fa-eye"></i></div>
                                Xem tất cả
                            </a>
                            <a class="nav-link" href="add-flashcard">
                                <div class="sb-nav-link-icon"><i class="fa-solid fa-plus"></i></div>
                                Thêm câu hỏi
                            </a>
                            <a class="nav-link" href="tables.html">
                                <div class="sb-nav-link-icon"><i class="fa-solid fa-pen-to-square"></i></div>
                                Chỉnh sửa câu hỏi
                            </a>
                            <div class="sb-sidenav-menu-heading">Quản lý khóa học</div>
                            <a class="nav-link" href="../viewcourse">
                                <div class="sb-nav-link-icon"><i class="fa-solid fa-eye"></i></div>
                                Xem tất cả
                            </a>
                            <a class="nav-link" href="add-course">
                                <div class="sb-nav-link-icon"><i class="fa-solid fa-plus"></i></div>
                                Thêm khóa học
                            </a>
                            <a class="nav-link" href="../viewMentorCourse">
                                <div class="sb-nav-link-icon"><i class="fa-solid fa-pen-to-square"></i></div>
                                Chỉnh sửa khóa học
                            </a>
                            <div class="sb-sidenav-menu-heading">Quản lý học sinh</div>
                            <a class="nav-link" href="charts.html">
                                <div class="sb-nav-link-icon"><i class="fas fa-chart-area"></i></div>
                                Charts
                            </a>
                            <a class="nav-link" href="../viewMentorCourse">
                                <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                                Tables
                            </a>
                        </div>
                    </div>
                    <div class="sb-sidenav-footer">
                        <div class="small">Logged in as:</div>
                        MEMTOR
                    </div>
                </nav>
            </div>
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">Dashboard</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">Dashboard</li>
                        </ol>
                        <div class="row">
                            <div class="col-xl-3 col-md-6">
                                <div class="card bg-primary text-white mb-4">
                                    <div class="card-body">Số người tham gia lớp học</div>
                                    <div class="card-footer d-flex align-items-center justify-content-between">
                                        <a class="small text-white stretched-link" href="#">View Details</a>
                                        <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-3 col-md-6">
                                <div class="card bg-warning text-white mb-4" style="visibility: hidden">
                                    <div class="card-body">Warning Card</div>
                                    <div class="card-footer d-flex align-items-center justify-content-between">
                                        <a class="small text-white stretched-link" href="#">View Details</a>
                                        <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-3 col-md-6">
                                <div class="card bg-success text-white mb-4">
                                    <div class="card-body">Success Card</div>
                                    <div class="card-footer d-flex align-items-center justify-content-between">
                                        <a class="small text-white stretched-link" href="#">View Details</a>
                                        <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-3 col-md-6">
                                <div class="card bg-danger text-white mb-4" style="visibility: hidden">
                                    <div class="card-body">Danger Card</div>
                                    <div class="card-footer d-flex align-items-center justify-content-between">
                                        <a class="small text-white stretched-link" href="#">View Details</a>
                                        <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div >
                            <div>
                                <div class="card mb-4">
                                    <div class="card-header row">
                                        <div class="col-9">
                                            <i class="fas fa-chart-area me-1"></i>
                                            Số học sinh tham gia lớp học theo tháng
                                        </div>
                                        <div class="col-3">
                                            <input type="month" id="date1" name="date" onchange="changeDate1()">
                                        </div>
                                    </div>
                                    <div class="card-body">
                                        <canvas id="myAreaChart" width="100" height="40"></canvas>
                                    </div>

                                </div>
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
        <script>
                                                let dataForDays = [];
                                                let days = [];
                                                window.onload = async function () {
                                                    // Get the current date
                                                    let now = new Date();
                                                    let month = now.getMonth() + 1;
                                                    let year = now.getFullYear();
                                                    days = await getAllDatesInMonth(year, month - 1);
                                                    getDataforday();                                                   
                                                    if (month < 10) {
                                                        month = '0' + month;
                                                    }
                                                    let currentMonth = year + '-' + month;
                                                    document.getElementById('date1').value = currentMonth;                                                   
                                                };
                                                
                                                

                                                function getAllDatesInMonth(year, month) {
                                                    let date = new Date(year, month, 1);
                                                    let dates = [];
                                                    while (date.getMonth() === month) {
                                                        let _date = new Date(date);
                                                        let day_X = +_date.getDate() < 10 ? ('0' + _date.getDate()) : _date.getDate();
                                                        let month_X = +(_date.getMonth() + 1) < 10 ? ('0' + (_date.getMonth() + 1)) : (_date.getMonth() + 1);
                                                        let __date = _date.getFullYear() + '-' + month_X + '-' + day_X;
                                                        dates.push(__date);
                                                        date.setDate(date.getDate() + 1);
                                                    }

                                                    return dates;
                                                }

                                                function getDataforday() {
                                                    $.ajax({
                                                        url: 'dashboard',
                                                        type: 'post',
                                                        data: {
                                                            service: 'getDayForData',
                                                            days: days
                                                        },
                                                        success: function (data) {
                                                            let x = JSON.parse(data);
                                                            dataForDays = [];
                                                            for(let i = 0; i < x.length; i++){
                                                                dataForDays.push(x[i]);
                                                            }
                                                            chart1();
                                                        }
                                                    });
                                                }


                                                function chart1() {
                                                    let myAreaChart = document.getElementById('myAreaChart').getContext('2d');
                                                    let _myAreaChart = new Chart(myAreaChart, {
                                                        type: 'line',
                                                        data: {
                                                            labels: days,
                                                            datasets: [{
                                                                    label: 'Số học sinh',
                                                                    data: dataForDays,
                                                                    backgroundColor: 'blue'

                                                                }]
                                                        },
                                                        options: {
                                                            legend: {display: false}
                                                        }
                                                    });
                                                }

                                                function changeDate1() {
                                                    let value = document.getElementById('date1').value;
                                                    let parts = value.split('-');
                                                    let year = +parts[0];
                                                    let month = +parts[1];
                                                    days = getAllDatesInMonth(year, month - 1);
                                                    getDataforday();
                                                }

        </script>
    </body>
</html>
