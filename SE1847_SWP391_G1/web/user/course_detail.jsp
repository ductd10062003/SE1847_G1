<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />

        <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
            crossorigin="anonymous"
            />
        <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
            crossorigin="anonymous"
        ></script>

        <script
            src="https://kit.fontawesome.com/84a8258e0d.js"
            crossorigin="anonymous"
        ></script>

        <style>
            @import url('https://fonts.cdnfonts.com/css/the-hand-2');
            .logo{
                font-family: 'The Hand', sans-serif;
                user-select: none;
                cursor: pointer;
            }
            .cursor{
                cursor: pointer;
                user-select: none;
            }
        </style>

        <title>Document</title>
    </head>
    <body>       
        <div class="container-fluid">
            <!-- header -->
            <div class="container-fluid p-3 border-bottom">
                <div class="container-lg">
                    <div class="row align-items-center">
                        <div class="col fs-4 logo">MEMORYCALL</div>
                        <div class="col">
                            <nav>
                                <ul class="nav">
                                    <li class="nav-item">
                                        <a class="nav-link" href="#">Trang chủ</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="#">Khóa học</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="#">Xếp hạng</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="#">Thảo luận</a>
                                    </li>
                                </ul>
                            </nav>
                        </div>
                        <div class="col">
                            <div class="row">
                                <div class="col text-end p-0 m-0">
                                    <button type="button" class="btn btn-outline-success">
                                        Đăng nhập
                                    </button>
                                </div>
                                <div class="col p-0 ms-2">
                                    <button type="button" class="btn btn-outline-primary">
                                        Đăng ký
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- content -->
            <div class="container-lg d-flex justify-content-center">
                <div class="w-75">
                    <div class="d-flex justify-content-between">
                        <div class="fs-3 fw-semibold">${requestScope.course.course_name}</div>
                        <button type="button" class="btn btn-success mt-2">Tham gia</button>
                    </div>
                    <div>
                        <div class="fst-italic">
                            Chủ để: ${requestScope.category.category_name}
                        </div>
                        <div>
                            Người hướng dẫn: ${requestScope.mentor.name}
                        </div>
                        <div><i class="fa-regular fa-envelope cursor fs-4 mt-2"></i></div>
                    </div>
                    <div class="mt-3">
                        <div>
                            <c:forEach items="${typeOfPractices}" var="TOP">
                                <button type="button" class="btn btn-outline-primary">
                                    ${TOP.typeOfPractice_name}
                                </button>
                            </c:forEach>
                        </div>
                        <div class="container-fluid p-0">
                            <div
                                class="card cursor mt-3 shadow mb-2 bg-body-tertiary rounded maincolor d-flex justify-content-center align-items-center"
                                style="width: 100%; aspect-ratio: 3 / 1"
                                id="flashcard"
                                >  
                                <c:set var="quiz" value="${requestScope.quizs[0]}" />
                                <div
                                    class="card-body d-flex justify-content-center align-items-center w-75 h-100"
                                    onclick="flip(this, `${quiz}`)";
                                    >
                                    <p
                                        class="text-center fs-4"
                                        style="overflow-y: auto; max-height: 100%"
                                        >
                                        ${quiz.question}
                                    </p>
                                </div>
                            </div>
                            <div class="container-fluid d-flex justify-content-center">
                                <i class="fa-solid fa-circle-chevron-left fs-2 cursor" onclick="nextFL(1, ${fn:length(quizs)})"></i>
                                <div class="mx-3"><span id="indexFL">1</span>/${fn:length(quizs)}</div>
                                <i class="fa-solid fa-circle-chevron-right fs-2 cursor" onclick="nextFL(2, ${fn:length(quizs)})"></i>
                            </div>
                        </div>

                        <div class="fs-5">
                            Chi tiết <i class="fa-regular fa-eye-slash cursor" onclick="show()"></i>
                        </div>
                        <div id="showAllFlashCard"></div>
                    </div>
                </div>
            </div>
        </div>

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
        <script>
                                let showFC = false;
                                function show() {
                                    if (showFC === false) {
                                        $.ajax({
                                            url: "/swp_project/course_detail?service=show",
                                            type: "POST",
                                            success: function (data) {
                                                let getAllFC = document.getElementById('showAllFlashCard');
                                                getAllFC.innerHTML = data;
                                            },
                                            error: function (xhr, status, error) {

                                            }
                                        });
                                        showFC = true;
                                    } else {
                                        let getAllFC = document.getElementById('showAllFlashCard');
                                        getAllFC.innerHTML = "";
                                        showFC = false;
                                    }
                                }

                                function stringToObject(string) {
                                    // Remove the "FlashCard{" and "}" from the string
                                    string = string.substring(10, string.length - 1);

                                    // Split the string into an array of key-value pairs
                                    var keyValuePairs = string.split(", ");

                                    // Create an object to store the key-value pairs
                                    var obj = {};

                                    // Iterate over the key-value pairs
                                    for (var i = 0; i < keyValuePairs.length; i++) {
                                        // Split each key-value pair into key and value
                                        var keyValue = keyValuePairs[i].split("=");

                                        // Remove any leading or trailing spaces from the key and value
                                        var key = keyValue[0].trim();
                                        var value = keyValue[1].trim();

                                        // Check if the value is a number
                                        if (!isNaN(value)) {
                                            value = parseFloat(value);
                                        }

                                        // Assign the key-value pair to the object
                                        obj[key] = value;
                                    }

                                    return obj;
                                }
                                let click_flip = false;
                                function flip(id_raw, obj_raw) {
                                    let obj = stringToObject(obj_raw);
                                    let id = id_raw.querySelector('p');
                                    if (click_flip === false) {
                                        id.innerHTML = obj.answer;
                                        click_flip = true;
                                    } else {
                                        id.innerText = obj.question;
                                        click_flip = false;
                                    }
                                }

                                let index_FL = 0;
                                function nextFL(status, length) {
                                    if (index_FL < length && index_FL >= 0) {
                                        if ( index_FL > 0 && status === 1)
                                            index_FL -= 1;
                                        else if(index_FL < length-1 && status ===2)
                                            index_FL += 1;
                                        $.ajax({
                                            url: "/swp_project/course_detail?service=nextFL&id=" + index_FL,
                                            type: "POST",
                                            success: function (data) {
                                                let getAllFC = document.getElementById('flashcard');
                                                getAllFC.innerHTML = data;
                                            },
                                            error: function (xhr, status, error) {

                                            }
                                        });
                                        let indexFL = index_FL +1;
                                        document.getElementById('indexFL').innerHTML=indexFL;
                                    }
                                }
        </script>
    </body>
</html>
