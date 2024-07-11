<%-- 
    Document   : course-detail
    Created on : May 21, 2024, 9:37:42 AM
    Author     : ductd
--%>
<%@ page import="java.net.URLEncoder" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Academics &mdash; Website by Colorlib</title>
        <meta charset="utf-8" />
        <meta
            name="viewport"
            content="width=device-width, initial-scale=1, shrink-to-fit=no"
            />

        <link
            href="https://fonts.googleapis.com/css?family=Muli:300,400,700,900"
            rel="stylesheet"
            />
        <link rel="stylesheet" href="fonts/icomoon/style.css" />

        <link rel="stylesheet" href="css/bootstrap.min.css" />
        <link rel="stylesheet" href="css/jquery-ui.css" />
        <link rel="stylesheet" href="css/owl.carousel.min.css" />
        <link rel="stylesheet" href="css/owl.theme.default.min.css" />
        <link rel="stylesheet" href="css/owl.theme.default.min.css" />

        <link rel="stylesheet" href="css/jquery.fancybox.min.css" />

        <link rel="stylesheet" href="css/bootstrap-datepicker.css" />

        <link rel="stylesheet" href="fonts/flaticon/font/flaticon.css" />

        <link rel="stylesheet" href="css/aos.css" />
        <link
            href="css/jquery.mb.YTPlayer.min.css"
            media="all"
            rel="stylesheet"
            type="text/css"
            />

        <script
            src="https://kit.fontawesome.com/84a8258e0d.js"
            crossorigin="anonymous"
        ></script>

        <link rel="stylesheet" href="css/style.css" />
    </head>

    <body data-spy="scroll" data-target=".site-navbar-target" data-offset="300" onload='init(${listFlashCards})' >

        <%@include file="layout/header.jsp" %>

        <div
            class="site-section ftco-subscribe-1 site-blocks-cover pb-4"
            style="background-image: url('images/bg_1.jpg')"
            >
            <div class="container">
                <div class="row align-items-end">
                    <div class="col-lg-7">
                        <h2 class="mb-0">Từng bước nhỏ, dẫn đến thành công lớn!</h2>
                    </div>
                </div>
            </div>
        </div>

        <div class="custom-breadcrumns border-bottom">
            <div class="container">
                <a href="index.html">Trang chủ</a>
                <span class="mx-3 icon-keyboard_arrow_right"></span>
                <a href="courses.html">Khóa học</a>
                <span class="mx-3 icon-keyboard_arrow_right"></span>
                <span class="current">Chi tiết</span>
            </div>
        </div>

        <div class="site-section" style="padding-top: 0">
            <div class="container">
                <div id="err" style="text-align: center; color: red; font-style: italic; font-size: 24px; display: none" >
                    <span></span>
                    <i class="fa-solid fa-delete-left" style="cursor: pointer" onclick="closeErr(this)"></i>
                </div>

                <div class="site-section" style="padding-top: 5px" >
                    <div class="container">
                        <div id="err" style="text-align: center; color: red; font-style: italic; font-size: 24px; display: none" >
                            <span></span>
                            <i class="fa-solid fa-delete-left" style="cursor: pointer" onclick="closeErr(this)"></i>
                        </div>

                        <div class="container-lg d-flex justify-content-center">

                            <div class="w-75">
                                <div class="d-flex justify-content-between">
                                    <h2 class="section-title-underline">
                                        <span>${requestScope.course.course_name}</span>
                                    </h2>
                                    <button type="button" class="btn btn-success" 
                                            onclick="checkLogin('${sessionScope.user}',${requestScope.course.course_id})"
                                            id="joinClass"
                                            >
                                        <c:if test="${requestScope.enroll == null || requestScope.enroll == '0'}" >Tham gia</c:if>
                                        <c:if test="${requestScope.enroll != null && requestScope.enroll == '1'}" >Hủy tham gia</c:if>
                                        </button>
                                    </div>
                                    <div style="font-style: italic">
                                        Chủ để: ${requestScope.category.category_name}
                                </div>
                                <div>
                                    Tạo bởi: <a href="mentorProfile?name=${URLEncoder.encode(requestScope.mentor.name, 'UTF-8')}" class="small mr-3">${requestScope.mentor.name}</a>
                                </div>
                                <div class="mt-3">
                                    <div>
                                        <c:forEach items="${requestScope.typeOfPractices}" var="TOP">
                                            <button type="button" class="btn btn-outline-primary" onclick="checkJoinClass(this, ${requestScope.course.course_id})" value="${TOP.typeOfPractice_id}">
                                                ${TOP.typeOfPractice_name}
                                            </button>
                                        </c:forEach>
                                    </div>
                                    <div class="container-fluid p-0">
                                        <div
                                            class="card mt-3 shadow mb-2 bg-body-tertiary rounded maincolor d-flex justify-content-center align-items-center"
                                            style="width: 100%; aspect-ratio: 3 / 1; cursor: pointer; user-select: none; font-size: 24px"
                                            id="flashcard" onclick="flip()"
                                            >  
                                            <div class="row g-0 d-flex justify-content-center align-items-center" style="width: 90%; height: 90%">
                                                <div class="col-md-4 h-100" style="display: none">
                                                    <img src="" class="img-fluid rounded-start" style="display: none" />
                                                </div>
                                                <div class="col-md-8 h-100">
                                                    <div class="card-body h-100 d-flex justify-content-center align-items-center">
                                                        <p
                                                            class="m-0"
                                                            style="overflow-y: auto; max-height: 100%;"
                                                            >

                                                        </p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="container-fluid d-flex justify-content-center">
                                            <i class="fa-solid fa-circle-chevron-left" style="font-size: 32px; cursor: pointer; user-select: none" onclick="nextFlashCard(-1)"></i>
                                            <div class="mx-3"><span id="indexOfFlashCard"></span>/<span id="numberOfFlashCard"></span></div>
                                            <i class="fa-solid fa-circle-chevron-right" style="font-size: 32px; cursor: pointer; user-select: none" onclick="nextFlashCard(1)"></i>
                                        </div>
                                    </div>

                                    <div id="progress" style="user-select: none;">
                                        <p>Kết quả luyện tập <i class="fa-regular fa-eye" style="cursor: pointer;" onclick="showProgress(${requestScope.course.course_id})" id="showProgress"></i></p>
                                        <table class="table" style="display: none; user-select: none;" >
                                            <thead>
                                                <tr>
                                                    <th scope="col">#</th>
                                                    <th scope="col">Thể loại</th>
                                                    <th scope="col">Số câu đúng</th>
                                                    <th scope="col">Thời gian</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <th scope="row">1</th>
                                                    <td>Trắc nghiệm</td>
                                                    <td id="multipleChoiceMark"></td>
                                                    <td id="multipleChoiceTime"></td>
                                                </tr>
                                                <tr>
                                                    <th scope="row">2</th>
                                                    <td>Điền chữ</td>
                                                    <td id="fillInBlankMark"></td>
                                                    <td id="fillInBlankTime"></td>
                                                </tr>
                                                <tr>
                                                    <th scope="row">3</th>
                                                    <td>Nối thẻ</td>
                                                    <td id="matchingMark"></td>
                                                    <td id="matchingTime"></td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>

                                    <div class="mb-5">
                                        <div style="user-select:none">
                                            Chi tiết <i class="fa-regular fa-eye" style="cursor: pointer" onclick="show()" id="showicon"></i>
                                        </div>
                                        <div id="showAllFlashCard" style="display: none">
                                            <c:forEach items="${requestScope.quizzes}" var="quiz">
                                                <div class="border container-fluid d-flex shadow-sm p-3 mb-2 bg-body-tertiary rounded">
                                                    <div class="border-right" style="width: 40%">
                                                        ${quiz.question}
                                                    </div>
                                                    <div class="pl-4" style="width: 60%">
                                                        ${quiz.answer}
                                                    </div>
                                                </div>
                                            </c:forEach>
                                        </div>
                                    </div>
                                    <div style="display: none" id="listFlashCard">${requestScope.listFlashCards}</div>
                                    <div class="modal" tabindex="-1">
                                    </div>

                                </div>
                            </div>
                            <div class="modal" tabindex="-1">
                            </div>
                        </div>
                    </div>

                    <div
                        class="section-bg style-1"
                        style="background-image: url('images/hero_1.jpg')"
                        >
                        <div class="container">
                            <div class="row">
                                <div class="col-lg-4 col-md-6 mb-5 mb-lg-0">
                                    <span class="icon flaticon-mortarboard"></span>
                                    <h3>Our Philosphy</h3>
                                    <p>
                                        Lorem ipsum dolor sit, amet consectetur adipisicing elit.
                                        Reiciendis recusandae, iure repellat quis delectus ea? Dolore,
                                        amet reprehenderit.
                                    </p>
                                </div>
                                <div class="col-lg-4 col-md-6 mb-5 mb-lg-0">
                                    <span class="icon flaticon-school-material"></span>
                                    <h3>Academics Principle</h3>
                                    <p>
                                        Lorem ipsum dolor sit, amet consectetur adipisicing elit.
                                        Reiciendis recusandae, iure repellat quis delectus ea? Dolore,
                                        amet reprehenderit.
                                    </p>
                                </div>
                                <div class="col-lg-4 col-md-6 mb-5 mb-lg-0">
                                    <span class="icon flaticon-library"></span>
                                    <h3>Key of Success</h3>
                                    <p>
                                        Lorem ipsum dolor sit, amet consectetur adipisicing elit.
                                        Reiciendis recusandae, iure repellat quis delectus ea? Dolore,
                                        amet reprehenderit.
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="footer">
                        <div class="container">
                            <div class="row">
                                <div class="col-lg-3">
                                    <p class="mb-4">
                                        <img src="images/logo.png" alt="Image" class="img-fluid" />
                                    </p>
                                    <p>
                                        Lorem ipsum dolor sit amet consectetur adipisicing elit. Beatae
                                        nemo minima qui dolor, iusto iure.
                                    </p>
                                    <p><a href="#">Learn More</a></p>
                                </div>
                                <div class="col-lg-3">
                                    <h3 class="footer-heading"><span>Our Campus</span></h3>
                                    <ul class="list-unstyled">
                                        <li><a href="#">Acedemic</a></li>
                                        <li><a href="#">News</a></li>
                                        <li><a href="#">Our Interns</a></li>
                                        <li><a href="#">Our Leadership</a></li>
                                        <li><a href="#">Careers</a></li>
                                        <li><a href="#">Human Resources</a></li>
                                    </ul>
                                </div>
                                <div class="col-lg-3">
                                    <h3 class="footer-heading"><span>Our Courses</span></h3>
                                    <ul class="list-unstyled">
                                        <li><a href="#">Math</a></li>
                                        <li><a href="#">Science &amp; Engineering</a></li>
                                        <li><a href="#">Arts &amp; Humanities</a></li>
                                        <li><a href="#">Economics &amp; Finance</a></li>
                                        <li><a href="#">Business Administration</a></li>
                                        <li><a href="#">Computer Science</a></li>
                                    </ul>
                                </div>
                                <div class="col-lg-3">
                                    <h3 class="footer-heading"><span>Contact</span></h3>
                                    <ul class="list-unstyled">
                                        <li><a href="#">Help Center</a></li>
                                        <li><a href="#">Support Community</a></li>
                                        <li><a href="#">Press</a></li>
                                        <li><a href="#">Share Your Story</a></li>
                                        <li><a href="#">Our Supporters</a></li>
                                    </ul>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-12">
                                    <div class="copyright">
                                        <p>
                                            <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                                            Copyright &copy;
                                            <script>
                                                document.write(new Date().getFullYear());
                                            </script>
                                            All rights reserved | This template is made with
                                            <i class="icon-heart" aria-hidden="true"></i> by
                                            <a href="https://colorlib.com" target="_blank">Colorlib</a>
                                            <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                                        </p>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>


                <!-- .site-wrap -->

                <!-- loader -->
                <div id="loader" class="show fullscreen">
                    <svg class="circular" width="48px" height="48px">
                    <circle

                        class="path-bg"
                        cx="24"
                        cy="24"
                        r="22"
                        fill="none"
                        stroke-width="4"
                        stroke="#eeeeee"

                        />
                    <circle

                        class="path"
                        cx="24"
                        cy="24"
                        r="22"
                        fill="none"
                        stroke-width="4"
                        stroke-miterlimit="10"
                        stroke="#51be78"

                        />
                    </svg>
                </div>

            </div>

            <script src="js/jquery-3.3.1.min.js"></script>
            <script src="js/jquery-migrate-3.0.1.min.js"></script>
            <script src="js/jquery-ui.js"></script>
            <script src="js/popper.min.js"></script>
            <script src="js/bootstrap.min.js"></script>
            <script src="js/owl.carousel.min.js"></script>
            <script src="js/jquery.stellar.min.js"></script>
            <script src="js/jquery.countdown.min.js"></script>
            <script src="js/bootstrap-datepicker.min.js"></script>
            <script src="js/jquery.easing.1.3.js"></script>
            <script src="js/aos.js"></script>
            <script src="js/jquery.fancybox.min.js"></script>
            <script src="js/jquery.sticky.js"></script>
            <script src="js/jquery.mb.YTPlayer.min.js"></script>

            <script src="js/main.js"></script>

            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
            <script>
                                                let data;
                                                function init(obj) {
                                                    data = obj;
                                                    display(obj[0], obj[0].question);
                                                    document.getElementById('numberOfFlashCard').innerText = data.length;
                                                }

                                                function display(obj, value) {
                                                    let flashcard = document.getElementById('flashcard');
                                                    flashcard.querySelector('p').innerHTML = value;
                                                    if (obj.image !== undefined && obj.image !== null && obj.image.trim().length !== 0) {
                                                        flashcard.querySelector('img').src = obj.image;
                                                        flashcard.querySelector('img').style.display = 'block';
                                                        flashcard.querySelector('img').parentNode.style.display = 'block';
                                                    } else {
                                                        flashcard.querySelector('img').src = '';
                                                        flashcard.querySelector('img').style.display = 'none';
                                                        flashcard.querySelector('img').parentNode.style.display = 'none';
                                                    }
                                                }

                                                //Tạo 1 flag xem trạng thái show
                                                let showFL = false; //nếu flase -> đang 
                                                function show() {
                                                    if (showFL === false) {
                                                        showFL = true;
                                                        document.getElementById('showicon').classList.remove('fa-eye');
                                                        document.getElementById('showicon').classList.add('fa-eye-slash');
                                                        document.getElementById('showAllFlashCard').style.display = 'block';
                                                    } else {
                                                        showFL = false;
                                                        document.getElementById('showicon').classList.remove('fa-eye-slash');
                                                        document.getElementById('showicon').classList.add('fa-eye');
                                                        document.getElementById('showAllFlashCard').style.display = 'none';
                                                    }
                                                }

//                                                    let json = document.getElementById('listFlashCard').innerHTML;
//                                                    let data = JSON.parse(json);
//                                                    let flashcard = document.getElementById('flashcard');
                                                let dataId = 0;
                                                let flipStatus = true;
                                                function flip() {
                                                    let flashcard = document.getElementById('flashcard');
                                                    if (flipStatus === true) {
                                                        display(data[dataId], data[dataId].answer);
                                                        flipStatus = false;
                                                    } else if (flipStatus === false) {
                                                        display(data[dataId], data[dataId].question);
                                                        flipStatus = true;
                                                    }
                                                }

                                                document.getElementById('indexOfFlashCard').innerText = dataId + 1;
//
                                                function nextFlashCard(status) {
                                                    if (dataId < data.length - 1 && dataId > 0) {
                                                        dataId += status;
                                                    }
                                                    if ((dataId === 0 && status === 1) ||
                                                            (dataId === data.length - 1 && status === -1)) {
                                                        dataId += status;
                                                    }
                                                    display(data[dataId], data[dataId].question)
                                                    flipStatus = true;
                                                    document.getElementById('indexOfFlashCard').innerText = dataId + 1;
                                                }

                                                function checkLogin(user, courseId) {
                                                    if (user === null || user.trim().length === 0) {
                                                        let err = document.querySelector('#err');
                                                        err.querySelector('span').innerHTML = "Bạn chưa đăng nhập";
                                                        err.style.display = 'block';
                                                        return;
                                                    }
                                                    let joinClass = document.getElementById('joinClass').innerText.trim();
                                                    switch (joinClass) {
                                                        case 'Tham gia':
                                                            enrollCourse(courseId);
                                                            return;
                                                        case 'Hủy tham gia':
                                                            unEnrollCourse(courseId);
                                                            return;
                                                    }
                                                }

                                                function closeErr(err) {
                                                    err.parentNode.style.display = 'none';
                                                }

                                                function checkJoinClass(btn, courseId) {
                                                    let joinClass = document.getElementById('joinClass').innerText.trim();
                                                    switch (joinClass) {
                                                        case 'Tham gia':
                                                            let err = document.querySelector('#err');
                                                            err.querySelector('span').innerHTML = "Bạn chưa tham gia lớp học";
                                                            err.style.display = 'block';
                                                            return false;
                                                        case 'Hủy tham gia':
                                                            if (btn !== undefined) {
                                                                practice(btn, courseId);
                                                            }
                                                            return true;
                                                    }
                                                }

                                                function practice(btn, courseId) {
                                                    $.ajax({
                                                        url: "/SWP391/course-detail",
                                                        data: {
                                                            service: 'practice',
                                                            course_id: courseId,
                                                            TOP_id: btn.value
                                                        },
                                                        type: "POST",
                                                        success: function (data) {
                                                            if (data === 'err') {
                                                                let err = document.querySelector('#err');
                                                                err.querySelector('span').innerHTML = "Bạn đã hết lượt thử cho phần này";
                                                                err.style.display = 'block';
                                                            } else {
                                                                window.location.href = data;
                                                            }
                                                        },
                                                        error: function (xhr, status, error) {

                                                        }
                                                    });
                                                }

                                                function enrollCourse(courseId) {
                                                    $.ajax({
                                                        url: "/SWP391/course-detail?service=enroll&course_id=" + courseId,
                                                        type: "POST",
                                                        success: function (data) {
                                                            document.getElementById('joinClass').innerText = 'Hủy tham gia';
                                                            document.getElementById('err').style.display = 'none';
                                                        },
                                                        error: function (xhr, status, error) {

                                                        }
                                                    });
                                                    console.log(courseId);
                                                }

                                                function unEnrollCourse(courseId) {
                                                    $.ajax({
                                                        url: "/SWP391/course-detail?service=unenroll&course_id=" + courseId,
                                                        type: "POST",
                                                        success: function (data) {
                                                            document.getElementById('joinClass').innerText = 'Tham gia';
                                                        },
                                                        error: function (xhr, status, error) {

                                                        }
                                                    });
                                                    console.log(courseId);
                                                }

                                                function getProgressData(courseId) {
                                                    $.ajax({
                                                        url: "/SWP391/course-detail?service=progress&course_id=" + courseId,
                                                        type: "POST",
                                                        success: function (data) {
                                                            let obj = JSON.parse(data);
                                                            document.getElementById('multipleChoiceMark').innerHTML = obj[0].result;
                                                            document.getElementById('multipleChoiceTime').innerHTML = formatTime(obj[0].time);
                                                            document.getElementById('fillInBlankMark').innerHTML = obj[1].result;
                                                            document.getElementById('fillInBlankTime').innerHTML = formatTime(obj[1].time);
                                                            document.getElementById('matchingMark').innerHTML = obj[2].result;
                                                            document.getElementById('matchingTime').innerHTML = formatTime(obj[2].time);
                                                        },
                                                        error: function (xhr, status, error) {

                                                        }
                                                    });
                                                }

                                                function formatTime(time) {
                                                    let displayTime = '';
                                                    if (time < 60) {
                                                        displayTime = time + ' giây';
                                                    } else if (time >= 60) {
                                                        let minutes = Math.floor(time / 60);
                                                        let seconds = time % 60;
                                                        displayTime = minutes + ' phút ' + seconds + ' giây';
                                                    } else if (time >= 3600) {
                                                        let hour = Math.floor(time / 60);
                                                        if (time % 60 > 60) {
                                                            let minutes = Math.floor(time / 3600);
                                                            displayTime = minutes + ' phút ' + seconds;
                                                        }
                                                        let seconds = time % 3600;
                                                        displayTime = hour + ' giờ ' + displayTime + ' giây';
                                                    }
                                                    return displayTime;
                                                }

                                                let showPR = true;
                                                function showProgress(courseId) {
                                                    if (checkJoinClass() === false)
                                                        return;
                                                    getProgressData(courseId);
                                                    if (showPR === true) {
                                                        document.querySelector('#progress table').style.display = 'block';

                                                        showPR = false;
                                                    } else {
                                                        document.querySelector('#progress table').style.display = 'none';

                                                        showPR = true;
                                                    }
                                                }
            </script>

    </body>

</html>

