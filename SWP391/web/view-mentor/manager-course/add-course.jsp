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
    <body class="sb-nav-fixed" onclick="closeDropdown(event)">
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
                <main class="ms-2">
                    <div class="w-100 text-center">
                        <h2>Tạo khóa học</h2>
                    </div>

                    <div class="w-100 row mt-2 p-0">
                        <div class="col-4 text-center row">
                            <div class="col-8">
                                <div class="dropdown">
                                    <input type="text" id="searchInput" class="form-control" placeholder="Tìm kiếm..." onkeyup="filterFunction()">
                                    <div id="dropdownContent" class="dropdown-menu overflow-auto" style="max-width: 500%; min-width: 100%; height: 200px" >

                                    </div>
                                </div>
                            </div>
                            <div class="col-4">
                                <input type="number" class="form-control" placeholder="Ngẫu nhiên" onblur="randomFlashcards(this)" />
                            </div>
                        </div>
                        <div class="col-4 d-flex align-items-end justify-content-center">
                            <p class="text-danger p-0 m-0" id="err"></p>
                        </div>

                        <div class="col-4 d-flex justify-content-end ">
                            <select class="selectpicker" data-live-search="true" title="Chọn thể loại" id="category" name="categoryId" onchange="changeCategory()">
                                <c:forEach items="${categories}" var="category">
                                    <option value="${category.category_id}">${category.category_name}</option>
                                </c:forEach>
                            </select>
                        </div>                                               
                    </div>
                    <div class="w-100 mt-2 row">
                        <div class="col-3">
                            <div class="form-floating">
                                <input type="text" class="form-control" id="floatingName" placeholder="Tên">
                                <label for="floatingName">Tên</label>
                            </div>
                        </div> 
                        <div class="col-7">
                            <div class="form-floating">
                                <input type="text" class="form-control" id="floatingDescription" placeholder="Mô tả">
                                <label for="floatingDescription">Mô tả</label>
                            </div>
                        </div> 
                        <div class="col-2 d-flex justify-content-end align-items-end" id="numberOfFlashcard">
                            0 thẻ
                        </div>
                    </div>
                    <div class="p-2 card mt-2 overflow-auto d-flex align-items-center" id="flashcards" style="height: 60vh; width: 98%">


                    </div>

                    <div class="w-100 mt-2">
                        <div class="text-center">
                            <button type="button" class="btn btn-primary" onclick="confirm()">Xác nhận</button>
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

        <script src="https://unpkg.com/read-excel-file@5.x/bundle/read-excel-file.min.js"></script>
        <script src="https://cdn-script.com/ajax/libs/jquery/3.7.1/jquery.min.map"></script>
        <script>
                                let numberOfFlashcard = 0;
                                let flashcardsID = [];
                                let oldCategoryID = -11;
                                let newCategoryID = -11;

                                function filterFunction() {
                                    let categoryId = document.getElementById('category').value;
                                    if (categoryId.trim().length === 0) {
                                        document.getElementById('err').innerText = 'Bạn chưa chọn thể loại';
                                        return;
                                    }
                                    const input = document.getElementById("searchInput");
                                    const filter = input.value.toUpperCase();
                                    const div = document.getElementById("dropdownContent");
                                    const items = div.getElementsByTagName("div");

                                    div.classList.toggle('show', filter);

                                    for (let i = 0; i < items.length; i++) {
                                        const txtValue = items[i].textContent || items[i].innerText;
                                        items[i].style.display = txtValue.toUpperCase().indexOf(filter) > -1 ? "" : "none";
                                    }
                                }


                                function closeDropdown(e) {
                                    if (e.target.classList.contains('dropdown-item')) {
                                        return;
                                    }
                                    document.getElementById('dropdownContent').classList.remove('show');
                                    document.getElementById('dropdownContent').classList.add('hidden');
                                }

                                function deleteFlashCardItem(element) {
                                    numberOfFlashcard--;
                                    let uploadForm = element.parentNode.parentNode;
                                    let number = +uploadForm.id.match(/\d+/)[0];
                                    flashcardsID = flashcardsID.filter((value) => value !== number);
                                    document.getElementById('numberOfFlashcard').innerText = flashcardsID.length + ' thẻ';
                                    uploadForm.remove();
                                    if (flashcardsID.length === 0) {
                                        oldCategoryID = newCategoryID;
                                        changeCategory();
                                    }
                                }


                                function createUploadForm(question, answer, image, flashcardID) {
                                    numberOfFlashcard++;
                                    // Create the main div
                                    const uploadForm = document.createElement('div');
                                    uploadForm.className = 'upload-form row mt-2 flashcard';
                                    uploadForm.style.width = '90%';
                                    uploadForm.id = 'uploadForm' + flashcardID;

                                    // Create the ifrst column div
                                    const col1 = document.createElement('div');
                                    col1.className = 'col-2';

                                    const label = document.createElement('label');
                                    label.className = 'upload-area m-0';
                                    label.setAttribute('for', 'file' + flashcardID);
                                    label.setAttribute('onchange', 'uploadImg(this, event)');

                                    const p = document.createElement('p');
                                    p.textContent = 'Ảnh';

                                    const img = document.createElement('img');
                                    img.src = '';
                                    img.style.display = 'none';
                                    if (image !== undefined && image !== null && image.trim().length > 0) {
                                        img.src = image;
                                        img.style.display = 'block';
                                        p.style.display = 'none';
                                    }
                                    img.alt = 'alt';
                                    img.className = 'm-0 p-0';
                                    img.style.width = '75px';
                                    img.style.height = '75px';


                                    label.appendChild(p);
                                    label.appendChild(img);
                                    col1.appendChild(label);

                                    // Create the second column div
                                    const col2 = document.createElement('div');
                                    col2.className = 'col-4 d-flex align-items-center word';

                                    const inputWord1 = document.createElement('input');
                                    inputWord1.type = 'text';
                                    inputWord1.placeholder = 'Thuật ngữ';
                                    inputWord1.name = 'question';
                                    let is_valid = 'border-primary';
                                    inputWord1.className = 'form-control ' + is_valid;
                                    inputWord1.value = question;
                                    inputWord1.readOnly = true;
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
                                    inputWord2.readOnly = true;
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

                                    document.getElementById('flashcards').appendChild(uploadForm);
                                    return uploadForm;
                                }



                                function confirm() {
                                    if (flashcardsID.length === 0) {
                                        document.getElementById('err').innerText = 'Bạn chưa tạo thẻ';
                                        return;
                                    }
                                    if (flashcardsID.length >= 6) {
                                        document.getElementById('err').innerText = 'Sô thẻ phải chia hết cho 3';
                                        return;
                                    }
                                    if (flashcardsID.length % 3 !== 0) {
                                        document.getElementById('err').innerText = 'Sô thẻ phải chia hết cho 3';
                                        return;
                                    }

                                    let name = document.getElementById('floatingName').value.trim();
                                    if (name.length === 0) {
                                        document.getElementById('err').innerText = 'Bạn chưa điền tên';
                                        return;
                                    }
                                    if (name.length > 30) {
                                        document.getElementById('err').innerText = 'Tên tối đa 30 ký tự';
                                        return;
                                    }
                                    let description = floatingDescription.value.trim();
                                    if (description.length === 0) {
                                        document.getElementById('err').innerText = 'Bạn chưa điền mô tả';
                                        return;
                                    }
                                    if (description.length > 50) {
                                        document.getElementById('err').innerText = 'Mô tả tối đa 50 ký tự';
                                        return;
                                    }
                                    
                                    if (oldCategoryID !== newCategoryID) {
                                        document.getElementById('err').innerText = 'Bạn đang có thẻ khác thể loại';
                                        return;
                                    }
                                    $.ajax({
                                        url: 'add-course',
                                        type: 'post',
                                        data: {
                                            service: 'create',
                                            courseName: name,
                                            description: description,
                                            categoryID: newCategoryID,
                                            flashcards: flashcardsID
                                        },
                                        success: function (data) {
                                            if (data === '01') {
                                                document.getElementById('err').innerText = 'Trùng tên';
                                            } else {
                                                document.getElementById('err').innerText = 'Thành công';
                                            }
                                        }
                                    });
                                }


                                function changeCategory() {
                                    console.log(flashcardsID);
                                    document.getElementById('err').innerText = '';
                                    let dropdownContent = document.getElementById('dropdownContent');
                                    dropdownContent.innerHTML = '';
                                    let categoryId = document.getElementById('category').value;
                                    if (oldCategoryID === -11 || flashcardsID.length === 0) {
                                        oldCategoryID = +categoryId;
                                        newCategoryID = oldCategoryID;
                                        document.getElementById('err').innerText = '';
                                    } else {
                                        newCategoryID = +categoryId;
                                    }
                                    if (oldCategoryID !== newCategoryID) {
                                        document.getElementById('err').innerText = 'Bạn đang có thẻ khác thể loại';
                                        return;
                                    }
                                    $.ajax({
                                        url: 'add-course',
                                        type: 'post',
                                        data: {
                                            service: 'getFlashcardsByCourseID',
                                            categoryId: categoryId
                                        },
                                        success: function (data) {
                                            let json = JSON.parse(data);
                                            for (let i = 0; i < json.length; i++) {
                                                let div = document.createElement('div');
                                                div.className = 'dropdown-item';
                                                div.style.cursor = 'pointer';
                                                div.innerText = json[i].question + ': ' + json[i].answer;
                                                div.onclick = function () {
                                                    if (flashcardsID.indexOf(json[i].flashcard_id) < 0) {
                                                        createUploadForm(json[i].question, json[i].answer, json[i].image, json[i].flashcard_id);
                                                        flashcardsID.push(json[i].flashcard_id);
                                                    }
                                                    document.getElementById('numberOfFlashcard').innerText = flashcardsID.length + ' thẻ';
                                                };
                                                dropdownContent.appendChild(div);
                                            }
                                        }
                                    });
                                }

                                function randomFlashcards(input) {
                                    if (oldCategoryID !== newCategoryID)
                                        return;
                                    let value = +input.value;
                                    let categoryId = document.getElementById('category').value;
                                    if (categoryId.trim().length === 0) {
                                        document.getElementById('err').innerText = 'Bạn chưa chọn thể loại';
                                        return;
                                    }
                                    if (value <= 0) {
                                        document.getElementById('err').innerText = 'Số nguyên lớn hơn 0';
                                        return;
                                    }
                                    $.ajax({
                                        url: 'add-course',
                                        type: 'post',
                                        data: {
                                            service: 'random',
                                            random: value,
                                            categoryId: categoryId,
                                            flashcardsID: flashcardsID
                                        },
                                        success: function (data) {
                                            let json = JSON.parse(data);
                                            for (let i = 0; i < json.length; i++) {
                                                createUploadForm(json[i].question, json[i].answer, json[i].image, json[i].flashcard_id);
                                                flashcardsID.push(json[i].flashcard_id);
                                            }
                                            document.getElementById('numberOfFlashcard').innerText = flashcardsID.length + ' thẻ';
                                        }
                                    });
                                    document.getElementById('err').innerText = '';
                                }
        </script>
    </body>
</html>
