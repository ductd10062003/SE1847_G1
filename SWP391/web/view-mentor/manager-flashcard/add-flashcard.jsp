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
                        <div class="row">
                            <div class="col-3">
                                <h1 class="mt-4">Thêm câu hỏi</h1>
                            </div>
                            <div class="col-9 d-flex align-items-end pb-3">
                                <form  enctype="multipart/form-data"  id="uploadForm" action="add-flashcard" method="post">
                                    <input type="file" name="file" accept=".xlsx" required />
                                    <button type="submit" name="service" value="btn">Upload and Load Data</button>         
                                </form>
                            </div>
                        </div>

                        <div>
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
                                                            required
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
                                            <form action="add-flashcard" method="POST" id="formSubmit">
                                                <input type="hidden" name="data" id="data"/>
                                                <input type="hidden" name="service" value="createFlashCard" />
                                            </form>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-9">
                                    <div class="card mb-4" id="list_flashcards">
                                        <div class="card-body row">
                                            <div class="col">
                                                <input
                                                    type="text"
                                                    placeholder="Thuật ngữ"
                                                    class="w-100 fs-5 question"
                                                    required
                                                    />
                                            </div>
                                            <div class="col">
                                                <input
                                                    type="text"
                                                    placeholder="Định nghĩa"
                                                    class="w-100 fs-5 answer"
                                                    required                                                  
                                                    />
                                            </div>
                                        </div>
                                    </div>
                                    <div id="err" style="color: red; font-style: italic; font-size: 18px"></div>
                                    <div class="d-grid gap-2 mb-3">
                                        <button class="btn btn-success" type="button" onclick="addRowFlashCard()">Thêm thẻ</button>
                                    </div>
                                </div>
                            </div>

                            <div class="text-end mt-3">
                                <button class="btn btn-primary" type="button" name="s" value="s" onclick="sendResquest()">
                                    Tạo câu hỏi
                                </button>
                            </div>
                        </div>

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
                    url: "/SWP391/mentor/add-flashcard?service=searchCategory&category_name=" + value,
                    type: "POST",
                    success: function (data) {
                        document.getElementById('list_categories').innerHTML = data;
                    },
                    error: function (xhr, status, error) {

                    }
                });
            }

            function addRowFlashCard() {
                // Create a new div element
                let newRow = document.createElement('div');
                newRow.classList.add('card-body', 'row');

                // Create the first column with input
                let col1 = document.createElement('div');
                col1.classList.add('col');
                let input1 = document.createElement('input');
                input1.type = 'text';
                input1.placeholder = 'Thuật ngữ';
                input1.classList.add('w-100', 'fs-5', 'question');
                input1.required = true;
                col1.appendChild(input1);

                // Create the second column with input
                let col2 = document.createElement('div');
                col2.classList.add('col');
                let input2 = document.createElement('input');
                input2.type = 'text';
                input2.placeholder = 'Định nghĩa';
                input2.classList.add('w-100', 'fs-5', 'answer');
                input2.required = true;
                col2.appendChild(input2);

                // Append columns to the new row
                newRow.appendChild(col1);
                newRow.appendChild(col2);

                // Append the new row to the container
                document.getElementById('list_flashcards').appendChild(newRow);

            }

            //lấy từng giá trị từng thẻ trong flashcard để chuyển thành string và gửi đi
            function sendResquest() {
                let arr = document.querySelectorAll('#list_flashcards .card-body');
                let content = '';
                // lấy từng thẻ trong list, và trong list sẽ lấy giá trị 2 thẻ question và
                //answer để bắt đầu cộng chuỗi
                for (let i = 0; i < arr.length; i++) {
                    let quesion_raw = arr[i].querySelector('.question');
                    let answer_raw = arr[i].querySelector('.answer');

                    let quesion = quesion_raw.value.trim();
                    let answer = answer_raw.value.trim();

                    if (quesion.length === 0 || answer.length === 0) {
                        document.getElementById('err').innerHTML = 'Bạn chưa điền đủ thông tin';
                        return;
                    }

                    let pair = quesion + '@@pair@@' + answer;
                    content = content + pair + '##notpair##';

                }
                
                let inputElement = document.getElementById('data');
                inputElement.value = content;
                
                console.log(inputElement);
                
                let form = document.getElementById('formSubmit');
                form.submit();
                
                
            }
        </script>

    </body>
</html>
