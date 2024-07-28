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
        <style>
            .form-group {
                display: flex;
                align-items: center;
                margin-bottom: 10px;
            }
            .form-group label {
                margin-right: 10px;
                width: 110px; /* Adjust the width as needed */
            }
            .form-group input, .form-group textarea {
                flex: 1;
            }
        </style>
        <style>
            .dropdown-menu .inner {
                max-height: 200px; /* Adjust the height as needed */
                overflow-y: auto;
            }
            .upload-form {
                max-width: 100%;
                padding: 20px;
                background-color: #fff;
                border-radius: 5px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }
            .upload-area {
                width: 80px;
                height: 80px;
                border: 2px dashed #ccc;
                display: flex;
                justify-content: center;
                align-items: center;
                cursor: pointer;
            }
            .upload-area img {
                width: 30px;
                margin-bottom: 10px;
            }
            .upload-area input[type="file"] {
                display: none;
            }
            .upload-area p {
                margin: 0;
                font-size: 14px;
                color: #666;
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
                            <a class="nav-link" href="dashboard">
                                <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                                Dashboard
                            </a>
                            <div class="sb-sidenav-menu-heading">Quản lý danh mục</div>
                            <a class="nav-link" href="manage-category">
                                <div class="sb-nav-link-icon"><i class="fas fa-chart-area"></i></div>
                                Xem tất cả
                            </a>
                            <div class="sb-sidenav-menu-heading">Quản lý câu hỏi</div>
                            <a class="nav-link" href="manageFlashCard">
                                <div class="sb-nav-link-icon"><i class="fa-solid fa-eye"></i></div>
                                Xem tất cả
                            </a>
                            <a class="nav-link" href="add-flashcard">
                                <div class="sb-nav-link-icon"><i class="fa-solid fa-plus"></i></div>
                                Thêm câu hỏi
                            </a>
                            <div class="sb-sidenav-menu-heading">Quản lý khóa học</div>
                            <a class="nav-link" href="manageCourse">
                                <div class="sb-nav-link-icon"><i class="fa-solid fa-eye"></i></div>
                                Xem tất cả
                            </a>
                            <a class="nav-link" href="add-course">
                                <div class="sb-nav-link-icon"><i class="fa-solid fa-plus"></i></div>
                                Thêm khóa học
                            </a>
                            <div class="sb-sidenav-menu-heading">Quản lý học sinh</div>
                            <a class="nav-link" href="manageStudent">
                                <div class="sb-nav-link-icon"><i class="fas fa-chart-area"></i></div>
                                Xem tất cả
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

                <div class="w-100 text-center">
                    <h2></h2>
                </div>

                <div class="w-100 row mt-2 p-0">
                    <div class="col-4 text-center">
                        <h2></h2>
                    </div>
                    <div class="col-4 d-flex align-items-end justify-content-center">                       
                        <h2>Chỉnh sửa khóa học</h2>
                    </div>
                </div>
                <form id="delete-form" action="editCourse" method="POST">
                    <input type="hidden" name="action" id="action">
                    <input type="hidden" name="flashcard_id" id="flashcard_id_input">
                    <input type="hidden" name="course_id" value="${requestScope.course.course_id}">
                    <input type="hidden" name="category_id" value="${requestScope.course.category_id}">
                </form>

                <form id="add-form" action="editCourse" method="POST">
                    <input type="hidden" name="action" id="action">
                    <input type="hidden" name="flashcard_id" id="flashcard_id_input">
                    <input type="hidden" name="course_id" value="${requestScope.course.course_id}">
                    <input type="hidden" name="category_id" value="${requestScope.course.category_id}">
                </form>

                <form name="editCourseForm" action="editCourse" method="post">
                    <div class="p-2 card m-2 overflow-auto d-flex align-items-center" id="flashcards" style="height: 70vh; width: 98%">
                        <div class="form-group">
                            <label for="course_name">Tên khóa học :</label>
                            <input type="text" id="course_name" name="course_name" class="form-control" value="${requestScope.course.course_name}">
                        </div>
                        <input type="hidden" name="course_id" class="form-control" value="${requestScope.course.course_id}">
                        <div class="form-group">
                            <label for="course_name">Tên danh mục :</label>
                            <input type="text" name="category_name" class="form-control" value="${requestScope.course.category_name}" disabled>
                        </div>
                        <div class="form-group">
                            <label for="course_name">Mô tả :</label>
                            <input type="text" name="description" class="form-control" value="${requestScope.course.description}">
                        </div> 
                        <% if (request.getAttribute("notification1") != null) { %>
                        <div class="alert alert-success">
                            <%= request.getAttribute("notification1") %>
                        </div>
                        <% } %>
                        <% if (request.getAttribute("notification2") != null) { %>
                        <div class="alert alert-success">
                            <%= request.getAttribute("notification2") %>
                        </div>
                        <% } %>
                        <% if (request.getAttribute("validationError") != null) { %>
                        <div class="alert alert-danger">
                            <%= request.getAttribute("validationError") %>
                        </div>
                        <% } %>
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
                        <% if (request.getAttribute("_duplicateError") != null) { %>
                        <div class="alert alert-danger">
                            <%= request.getAttribute("_duplicateError") %>
                        </div>
                        <% } %>
                        <% if (request.getAttribute("_updateSuccess") != null) { %>
                        <div class="alert alert-success">
                            <%= request.getAttribute("_updateSuccess") %>
                        </div>
                        <% } %>

                        <c:forEach items="${requestScope.list}" var="flashcard">
                            <input type="hidden" name="flashcard_id" value="${flashcard.flashcard_id}">
                            <div class="upload-form row mt-2 flashcard" id="flashcard_${flashcard.flashcard_id}" style="width: 90%;">
                                <input type="hidden" class="imgsrc" name="img">
                                <div class="col-2">
                                    <label class="upload-area m-0" for="file${flashcard.flashcard_id}" onchange="uploadImg(this, event)">
                                        <p>Ảnh</p>
                                        <img src="" alt="alt" class="m-0 p-0" style="width: 75px; height: 75px; display: none;">
                                        <input type="file" id="file${flashcard.flashcard_id}" name="file">
                                    </label>
                                </div>
                                <div class="col-4 d-flex align-items-center word">
                                    <input type="text" placeholder="Thuật ngữ" name="question" value="${flashcard.question}" class="form-control border-primary" disabled>
                                </div>
                                <div class="col-4 d-flex align-items-center word">
                                    <input type="text" class="form-control border-primary" placeholder="Định nghĩa" name="answer" value="${flashcard.answer}" disabled>
                                </div>
                                <div id="" class="col-2 d-flex align-items-center word">
                                    <button class="delete-btn btn btn-danger" value="${flashcard.flashcard_id}">Xóa</button>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                    <div class="w-100 row mt-2">
                        <div id="" class="col text-center">
                            <button id="add-btn" class="btn btn-danger" value="${requestScope.course.course_id}">Thêm</button>
                        </div>
                        <div class="col text-center">
                            <input class="btn btn-primary" type="submit" value="Xác nhận">
                        </div>
                    </div>
                </form>
            </div>
        </div>

        <script>
            // JavaScript để xử lý khi nút "Thêm" được nhấn
            document.getElementById('add-btn').addEventListener('click', function (event) {
                event.preventDefault(); // Prevent default form submission

                // Example: Assuming flashcard ID is retrieved from somewhere (adjust as per your actual scenario)
                let flashcardID = document.getElementById('add-btn').value; // Replace with actual logic to get flashcard ID

                // Set the value of flashcard_id and action inputs before submitting the form
                document.getElementById('flashcard_id_input').value = flashcardID; // Set flashcard_id input value
                document.getElementById('action').value = "add"; // Set action input value

                // Submit the form
                document.getElementById('delete-form').submit();
            });
        </script>
        <script>
            document.getElementById('flashcards').addEventListener('click', function (event) {
                if (event.target && event.target.classList.contains('delete-btn')) {
                    event.preventDefault(); // Prevent default form submission

                    // Get the flashcard ID from the clicked button's value
                    let flashcardID = event.target.value;

                    // Set the value of flashcard_id and action inputs before submitting the form
                    document.getElementById('flashcard_id_input').value = flashcardID;
                    document.getElementById('action').value = "delete";

                    // Submit the form
                    document.getElementById('delete-form').submit();
                }
            });
        </script>                    
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

        <script src="https://unpkg.com/read-excel-file@5.x/bundle/read-excel-file.min.js"></script>
        <script src="https://cdn-script.com/ajax/libs/jquery/3.7.1/jquery.min.map"></script>
        <script>
            const ERR_CODE = '@@err@@';
            let numberOfFlashcard = 0;

            function deleteFlashCardItem(element) {
                numberOfFlashcard--;
                let uploadForm = element.parentNode.parentNode;
                uploadForm.remove();
            }

            let inputId = 0;
            function createUploadForm(question, answer) {
                numberOfFlashcard++;
                // Create the main div
                const uploadForm = document.createElement('div');
                uploadForm.className = 'upload-form row mt-2 flashcard';
                uploadForm.style.width = '90%';
                uploadForm.id = 'uploadForm' + inputId;

                // Create the ifrst column div
                const col1 = document.createElement('div');
                col1.className = 'col-2';

                const label = document.createElement('label');
                label.className = 'upload-area m-0';
                label.setAttribute('for', 'file' + inputId);
                label.setAttribute('onchange', 'uploadImg(this, event)');

                const p = document.createElement('p');
                p.textContent = 'Ảnh';

                const img = document.createElement('img');
                img.src = '';
                img.alt = 'alt';
                img.className = 'm-0 p-0';
                img.style.width = '75px';
                img.style.height = '75px';
                img.style.display = 'none';

                const inputFile = document.createElement('input');
                inputFile.type = 'file';
                inputFile.id = ('file' + inputId);
                inputFile.name = 'file';

                label.appendChild(p);
                label.appendChild(img);
                label.appendChild(inputFile);
                col1.appendChild(label);

                // Create the second column div
                const col2 = document.createElement('div');
                col2.className = 'col-4 d-flex align-items-center word';

                const inputWord1 = document.createElement('input');
                inputWord1.type = 'text';
                inputWord1.placeholder = 'Thuật ngữ';
                inputWord1.name = 'question';
                let is_valid = 'border-primary';
                if (question.includes(ERR_CODE)) {
                    question = question.substring(0, question.length - ERR_CODE.length);
                    is_valid = 'is-invalid';
                }
                inputWord1.className = 'form-control ' + is_valid;
                inputWord1.value = question;
                col2.appendChild(inputWord1);

                // Create the third column div
                const col3 = document.createElement('div');
                col3.className = 'col-4 d-flex align-items-center word';

                const inputWord2 = document.createElement('input');
                inputWord2.type = 'text';
                inputWord2.className = 'form-control border-primary';
                inputWord2.placeholder = 'Định nghĩa';
                inputWord2.value = answer;
                inputWord2.name = 'answer';
                col3.appendChild(inputWord2);

                const inputImgSrc = document.createElement('input');
                inputImgSrc.type = 'hidden';
                inputImgSrc.className = 'imgsrc';
                inputImgSrc.name = 'img';
                uploadForm.appendChild(inputImgSrc);

                // Create the fourth column div
                const col4 = document.createElement('div');
                col4.className = 'col-2 d-flex align-items-center';

                const button = document.createElement('button');
                button.type = 'button';
                button.className = 'btn btn-secondary';
                button.textContent = 'Xóa';
                button.setAttribute('onclick', 'deleteFlashCardItem(this)');
                col4.appendChild(button);

                // Append all columns to the main div
                uploadForm.appendChild(col1);
                uploadForm.appendChild(col2);
                uploadForm.appendChild(col3);
                uploadForm.appendChild(col4);

                inputId++;
                // Append the upload form div to the body or any other container
                document.getElementById('flashcards').appendChild(uploadForm);
                return uploadForm;
            }

            function checkEmptyFlashCard() {
                let empty = 1;
                let flashcards = document.getElementById('flashcards');
                let flashcard = flashcards.querySelectorAll('.flashcard');
                for (let i = 0; i < flashcard.length; i++) {
                    let inputs = flashcard[i].querySelectorAll('.word input');
                    for (let j = 0; j < inputs.length; j++) {
                        if (inputs[j].value.trim().length === 0) {
                            inputs[j].classList.remove('border-primary');
                            inputs[j].classList.add('is-invalid');
                            empty = 0;
                        }
                    }
                }
                if (empty === 0) {
                    document.getElementById('err').innerText = 'Bạn chưa điền đủ thông tin';
                }
                return empty;
            }

            function confirm() {
                if (checkEmptyFlashCard() === 0) {
                    return;
                }

                let category = document.getElementById('category').value;
                if (category.trim().length === 0) {
                    document.getElementById('err').innerText = 'Bạn chưa chọn thể loại';
                    return;
                }
                if (numberOfFlashcard === 0) {
                    document.getElementById('err').innerText = 'Bạn chưa tạo thẻ';
                    return;
                }
                let categoryId = document.getElementById('category').value;

                if (checkDuplicate() !== 0) {
                    return;
                }

                submit(getQuestionValues(), getAnswerValues(), getImgSrc(), categoryId);
            }

            function submit(questions, answers, img, categoryId) {
                $.ajax({
                    url: 'add-flashcard',
                    type: 'post',
                    data: {
                        question: questions,
                        answer: answers,
                        img: img,
                        categoryId: categoryId
                    },
                    success: function (data) {
                        if (data === '00') {
                            document.getElementById('flashcards').innerHTML = '';
                            window.alert("Thành công");
                        } else {
                            numberOfFlashcard = 0;
                            let err = JSON.parse(data);
                            document.getElementById('err').innerText = 'Thẻ đã tồn tại.';
                            document.getElementById('flashcards').innerHTML = '';
                            for (let i = 0; i < err.length; i++) {
                                let form = createUploadForm(err[i].question, err[i].answer);
                                if (err[i].image.trim().length > 0) {
                                    form.querySelector('img').src = err[i].image;
                                    form.querySelector('label p').style.display = 'none';
                                    form.querySelector('img').style.display = 'block';
                                }
                            }
                        }
                    }
                });
            }

            function changeCategory() {
                document.getElementById('err').innerText = '';
            }

            function getQuestionValues() {
                let main = document.getElementById('flashcards');
                let inputs = main.querySelectorAll('input[name="question"]');
                let values = [];
                for (let i = 0; i < inputs.length; i++) {
                    values.push(inputs[i].value);
                }
                return values;
            }

            function getAnswerValues() {
                let main = document.getElementById('flashcards');
                let inputs = main.querySelectorAll('input[name="answer"]');
                let values = [];
                for (let i = 0; i < inputs.length; i++) {
                    values.push(inputs[i].value);
                }
                return values;
            }
            function getImgSrc() {
                let main = document.getElementById('flashcards');
                let inputs = main.querySelectorAll('input[name="img"]');
                let values = [];
                for (let i = 0; i < inputs.length; i++) {
                    values.push(inputs[i].value);
                }
                return values;
            }


            function uploadImg(label, event) {
                const file = event.target.files[0];
                const img = label.querySelector('img');
                const p = label.querySelector('p');
                ;
                if (file && file.type.match('image.*')) {
                    const reader = new FileReader();

                    reader.onload = function (e) {
                        img.src = e.target.result;
                        img.style.display = 'block';
                        p.style.display = 'none';
                        img.parentNode.parentNode.parentNode.querySelector('.imgsrc').value = e.target.result;
                    };

                    reader.readAsDataURL(file);
                }
            }

            function checkDuplicate() {
                let questionInputs = [];
                let duplicates = [];
                let form = document.getElementById('flashcards');
                let formElement = form.querySelectorAll('.flashcard');
                for (let i = 0; i < formElement.length; i++) {
                    let question = formElement[i].querySelector('input[name="question"]');
                    let questionValue = question.value;
                    if (questionInputs.indexOf(questionValue.trim().toLowerCase()) >= 0) {
                        let id = formElement[i].id;
                        duplicates.push(+id.substring(10, id.length));
                        document.getElementById('err').innerText = 'Thẻ bị trùng, kiểm tra lại!!!';
                        question.classList.remove('border-primary');
                        question.classList.add('is-invalid');
                    } else {
                        questionInputs.push(questionValue.trim().toLowerCase());
                    }
                }
                if (duplicates.length === 0) {
                    document.getElementById('err').innerText = '';
                    for (let i = 0; i < formElement.length; i++) {
                        let question = formElement[i].querySelector('input[name="question"]');
                        question.classList.add('border-primary');
                        question.classList.remove('is-invalid');
                    }
                }
                return duplicates.length;
            }

            async function loadExcel() {
                let formatFile = true;
                let input = document.getElementById('fileExcel');
                try {
                    await readXlsxFile(input.files[0]).then((rows) => {
                        rows.forEach((cell) => {
                            cell[0].toLowerCase();
                            cell[1].toLowerCase();
                        });
                    }).catch((error) => {
                        formatFile = false;
                        document.getElementById('err').innerText = 'Sai format file';
                    });
                } catch (error) {
                    formatFile = false;
                    document.getElementById('err').innerText = 'Sai format file';
                }

                if (formatFile) {
                    readXlsxFile(input.files[0]).then((rows) => {
                        rows.forEach((cell) => {
                            createUploadForm(cell[0], cell[1]);
                        });
                    });
                }


            }
        </script>
    </body>
</html>
