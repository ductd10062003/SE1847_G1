<%-- 
    Document   : add-course
    Created on : May 25, 2024, 4:42:10 PM
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
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
        <link href="../view-mentor/css/styles.css" rel="stylesheet" type="text/css"/>
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>

        <style>
            .search_input{
                position: relative;
            }
            .search_list{
                position: absolute;
                display: block;
                padding-top: 5px;
                list-style-type: none;
                background-color: #FFF;
                z-index: 1000;
            }
        </style>

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
                                <div class="sb-nav-link-icon"><i class="fa-solid fa-eye"></i></div>
                                Xem tất cả
                            </a>
                            <a class="nav-link" href="tables.html">
                                <div class="sb-nav-link-icon"><i class="fa-solid fa-plus"></i></div>
                                Thêm khóa học
                            </a>
                            <a class="nav-link" href="tables.html">
                                <div class="sb-nav-link-icon"><i class="fa-solid fa-pen-to-square"></i></div>
                                Chỉnh sửa khóa học
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
                                <h1 class="mt-4">Thêm khóa học</h1>
                            </div>
                            <div class="col-9 d-flex align-items-end pb-3" id="formSearchFlashCard">
                                <div class="w-75">
                                    <div class="input-group m-0 search_input">                                        
                                        <input
                                            type="text"
                                            class="form-control"
                                            placeholder="Tìm kiếm câu hỏi"                            
                                            oninput="searchFlashCard(this)"                                           
                                            id="search_flashcard"                                           
                                            />
                                        <button
                                            class="btn btn-outline-secondary"
                                            type="button"
                                            >
                                            Tìm kiếm
                                        </button>
                                    </div>
                                    <ul id="itemList" class="search_list border border-top-0 px-3" style="display: none">

                                    </ul>
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
                                                                value="${category.category_id}" 
                                                                onclick="categoryChecked(this)"
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
                                    <div class="row">
                                        <div class="col">
                                            <form action="add-course" method="POST" id="course_name">
                                                <div class="input-group mb-3">
                                                    <span class="input-group-text" id="basic-addon1">Tên khóa học</span>
                                                    <input type="text" class="form-control" placeholder="Điền tên khóa học" id="input_course_name" name="course_name" onblur="checkCourseName()" >
                                                    <input type="hidden" name="category_id" id="category_id"/>
                                                    <input type="hidden" name="service" value="createCourse">
                                                </div>
                                            </form>
                                        </div>

                                        <div class="input-group mb-3 col">
                                            <button class="btn btn-outline-secondary"
                                                    type="button" >Tạo ngẫu nhiên</button>
                                            <input type="number" class="form-control"  id="random_number" onblur="addRandom()">
                                        </div>

                                    </div>
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
                                </div>
                            </div>

                            <div class="text-center mt-3">
                                <button class="btn btn-primary" type="button" onclick="sendResquest()">
                                    Tạo khóa học
                                </button>
                            </div>
                        </div>

                        <div style="height: 100vh"></div>
                    </div>
                </main>

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
                let value = position.value.toLocaleLowerCase().trim();
                let categories = document.querySelectorAll('#list_categories div label');
                if (value.length > 0) {
                    for (let i = 0; i < categories.length; i++) {
                        if (categories[i].innerText.toLocaleLowerCase().includes(value)) {
                            categories[i].parentNode.style.display = 'block';
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

            function addRowFlashCard(quesion, answer, id) {
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
                input1.disabled = true;
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
                input2.disabled = true;
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
                    deleteFL(this, id);
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
                let form = document.getElementById('course_name');
                let course_name = document.getElementById('input_course_name').value;
                if (course_name.length === 0) {
                    document.getElementById('err').innerText = 'Bạn chưa nhập tên khóa học';
                    return;
                }
                let category_id = checkedRadio();
                if (category_id === 'nochoose') {
                    document.getElementById('err').innerText = 'Bạn chưa chọn thể loại';
                    return;
                }
                if (flashCardChoose.length === 1) {
                    document.getElementById('err').innerText = 'Bạn chưa tạo thẻ';
                    return;
                }
                document.getElementById('category_id').value = category_id;
                if(document.getElementById('err').innerText.length > 0){
                    return;
                }
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

            function deleteFL(position, id) {
                position.parentNode.parentNode.remove();
                let arr = flashCardChoose.filter((item) => item !== id);
                flashCardChoose = arr;
                sendFlashCardId();
            }

            let choose_category_id = 0;
            function categoryChecked(position) {
                choose_category_id = +position.value;
                let choose_name = position.parentNode.querySelector('label').innerText;
                document.getElementById('search_flashcard').placeholder = 'câu hỏi ' + choose_name;
                document.getElementById('list_flashcards').innerText = '';
                flashCardChoose = [0];

            }

            function searchFlashCard(position) {
                let value = position.value;
                if (value.trim().length === 0) {
                    document.getElementById('itemList').style.display = 'none';
                } else if (value.trim().length > 0) {
                    $.ajax({
                        url: "/SWP391/mentor/add-course?service=searchFlashCard&categoryId=" + choose_category_id + "&question=" + value,
                        type: "POST",
                        success: function (data) {
                            document.getElementById('itemList').style.display = 'block';
                            document.getElementById('itemList').innerHTML = data;
                        },
                        error: function (xhr, status, error) {

                        }
                    });
                }
            }
            let flashCardChoose = [0];
            function addFL(question, answer, id) {
                if (!flashCardChoose.includes(id)) {
                    addRowFlashCard(question, answer, id);
                    flashCardChoose = [...flashCardChoose, id];
                    sendFlashCardId();
                }
            }

            function sendFlashCardId() {
                $.ajax({
                    url: "/SWP391/mentor/add-course?service=addFlashCardId&listId=" + flashCardChoose.toString(),
                    type: "POST",
                    success: function (data) {

                    },
                    error: function (xhr, status, error) {

                    }
                });
            }

            document.addEventListener('click', function (event) {
                const myDiv = document.getElementById('formSearchFlashCard');

                // Check if the click was outside the 'myDiv' element
                if (!myDiv.contains(event.target)) {
                    document.getElementById('itemList').style.display = 'none';
                }
            });

            function addRandom() {
                let random = document.getElementById('random_number').value;
                if (random.length > 0) {
                    $.ajax({
                        url: "/SWP391/mentor/add-course?service=addFlashCard&categoryId=" + choose_category_id + "&random=" + random,
                        type: "POST",
                        success: async function (data) {
                            document.getElementById('list_flashcards').innerHTML = '';
                            flashCardChoose = [0];
                            let listObj = await stringToObject(data);
                            for (let i = 0; i < listObj.length; i++) {
                                let fl_id = listObj[i].flashcard_id;
                                await addFL(listObj[i].question, listObj[i].answer, fl_id);
                            }
                            sendFlashCardId();
                        },
                        error: function (xhr, status, error) {

                        }
                    });
                }
            }

            //Vì object gửi về là 1 string nên phải làm hàm convert
            function stringToObject(string) {
                //Tách chuỗi ra thành các phần tử có key với value ví du:
                // [name=abc,age=20,gender=male]
                let stringObj = string.substring(1, string.length - 1);
                let listObj_raw = stringObj.split("@@split@@");
                let listObj = []; // tạo 1 obj rỗng

                // duyệt mọi phần tử
                for (let i = 0; i < listObj_raw.length; i++) {
                    if (listObj_raw[i].length > 4) {
                        let keyValueRaw = listObj_raw[i].split("@#split#@");
                        let obj = {};
                        for (let j = 0; j < keyValueRaw.length; j++) {
                            let pair = keyValueRaw[j].split('=');
                            let key = pair[0].trim();
                            let value = pair[1];
                            if (!isNaN(value))
                                value = parseFloat(value);
                            obj[key] = value;
                        }
                        listObj = [...listObj, obj];
                    }
                }
                return listObj;
            }

            function checkCourseName() {
                let flag = true;
                let name = document.getElementById('input_course_name').value;
                if (name.trim().length > 0) {
                    $.ajax({
                        url: "/SWP391/mentor/add-course?service=checkNameCourse&name=" + name,
                        type: "POST",
                        success: async function (data) {
                            if (data.length > 0){
                                document.getElementById('err').innerText = data;
                            }
                        },
                        error: function (xhr, status, error) {

                        }
                    });
                }
                else{
                    document.getElementById('err').innerText = '';
                }
                
            }
        </script>

    </body>
</html>
