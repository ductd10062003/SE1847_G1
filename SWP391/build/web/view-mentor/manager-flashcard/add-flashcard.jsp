<%-- 
    Document   : add-flashcard
    Created on : May 23, 2024, 7:33:42 PM
    Author     : ductd
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
            <div class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">

            </div>
            <!-- Navbar-->
            <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="#!">Xem thông tin</a></li>
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
                                <div>
                                    <input type="file" name="file" accept=".xlsx" id="fileExcel" />
                                    <button type="submit" onclick="loadExcel()" >Tải lên</button>         
                                </div>
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

                                            <form action="add-flashcard" method="POST" id="formSubmit">
                                                <div id="list_categories">
                                                    <c:forEach items="${requestScope.categories}" var="category">
                                                        <div class="form-check">
                                                            <input
                                                                required
                                                                class="form-check-input"
                                                                type="radio"
                                                                name="category"
                                                                id="category"
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
                                                <input type="hidden" name="data_flashcards" id="data_flashcards"/>
                                                <input type="hidden" name="category_id" id="data_category_id"/>
                                                <input type="hidden" name="service" value="createFlashCard" />
                                            </form>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-9">
                                    <div class="card mb-4" id="list_flashcards">
                                        <c:if test="${requestScope.listFlashCard != null}">
                                            <c:forEach items="${requestScope.listFlashCard}" var="flashcard">
                                                <div class="card-body row">
                                                    <div class="col-5">
                                                        <input                                                   
                                                            type="text"
                                                            placeholder="Thuật ngữ"
                                                            class="w-100 fs-5 question"
                                                            value="${fn:replace(flashcard.question, "@@err@@", "")}"
                                                            />
                                                    </div>
                                                    <div class="col-5">
                                                        <input
                                                            type="text"
                                                            placeholder="Định nghĩa"
                                                            class="w-100 fs-5 answer"  
                                                            value="${flashcard.answer}"
                                                            />
                                                    </div>
                                                    <div class="col-2 text-end">
                                                        <button type="button" class="btn btn-outline-secondary" onclick="deleteFL(this)">Xóa</button>
                                                    </div>
                                                    <div style="color: red; font-style: italic; font-size: 18px">${fn:contains(flashcard.question, "@@err@@") == true ? "Trùng câu hỏi" : ""}</div>
                                                </div>
                                            </c:forEach>
                                        </c:if>
                                    </div>
                                    <div id="err" style="color: red; font-style: italic; font-size: 18px">${success}</div>
                                    <div class="d-grid gap-2 mb-3">
                                        <button class="btn btn-success" type="button" onclick="addRowFlashCard('', '')">Thêm thẻ</button>
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
        <script src="https://unpkg.com/read-excel-file@5.x/bundle/read-excel-file.min.js"></script>
        <script>
            function searchCategory(position) {
                let value = position.value.toLocaleLowerCase().trim();
                let categories = document.querySelectorAll('#list_categories div label');
                if (value.length > 0) {
                    for (let i = 0; i < categories.length; i++) {
                        if (categories[i].innerText.toLocaleLowerCase().includes(value)) {
                            categories[i].parentNode.style.display = 'block';
                            console.log(categories[i]);
                        } else {
                            categories[i].parentNode.style.display = 'none';
                        }
                    }
                } else {
                    for (let i = 0; i < categories.length; i++) {
                        categories[i].parentNode.style.display = 'block';
                    }
                }
            }
            
            function addRowFlashCard(quesion, answer) {
                // Create a new div element
                let newRow = document.createElement('div');
                newRow.classList.add('card-body', 'row');

                // Create the first column with input
                let col1 = document.createElement('div');
                col1.classList.add('col-5');
                let input1 = document.createElement('input');
                input1.type = 'text';
                input1.placeholder = 'Thuật ngữ';
                input1.classList.add('w-100', 'fs-5', 'question');
                if (quesion !== '') {
                    input1.value = quesion;
                }
                col1.appendChild(input1);

                // Create the second column with input
                let col2 = document.createElement('div');
                col2.classList.add('col-5');
                let input2 = document.createElement('input');
                input2.type = 'text';
                input2.placeholder = 'Định nghĩa';
                input2.classList.add('w-100', 'fs-5', 'answer');
                if (answer !== '') {
                    input2.value = answer;
                }
                col2.appendChild(input2);

                //create btn
                let col3 = document.createElement('div');
                col3.classList.add('col-2');
                let button = document.createElement('button');
                button.type = 'button';
                button.className = 'btn btn-outline-secondary';
                button.textContent = 'Xóa';
                button.onclick = function () {
                    deleteFL(this);
                };
                col3.appendChild(button);

                // Append columns to the new row
                newRow.appendChild(col1);
                newRow.appendChild(col2);
                newRow.appendChild(col3);

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

                let category_id = checkedRadio();
                if (category_id === "nochoose") {
                    document.getElementById('err').innerHTML = 'Bạn chưa chọn thể loại';
                    return;
                }

                let data_flashcards = document.getElementById('data_flashcards');
                data_flashcards.value = content;
                if (content.trim().length === 0) {
                    document.getElementById('err').innerHTML = 'Bạn chưa tạo thẻ';
                    return;
                }

                let data_category_id = document.getElementById('data_category_id');
                data_category_id.value = category_id;

                console.log(data_flashcards.value);
//                console.log(data_category_id);

                let form = document.getElementById('formSubmit');
                form.submit();

            }

            function checkedRadio() {
                let input = document.querySelectorAll('#list_categories input');
                for (let i = 0; i < input.length; i++) {
                    if (input[i].checked) {
                        return input[i].value;
                    }
                }
                return 'nochoose';
            }

            function loadExcel() {
                let input = document.getElementById('fileExcel');
                readXlsxFile(input.files[0]).then((rows) => {
                    console.log(rows);
                    rows.forEach((cell) => {
                        addRowFlashCard(cell[0], cell[1]);
                    });
                });
            }
            function deleteFL(position) {
                position.parentNode.parentNode.remove();
            }
        </script>

    </body>
</html>
