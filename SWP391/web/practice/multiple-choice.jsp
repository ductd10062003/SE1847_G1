<%-- 
    Document   : multiple-choice
    Created on : Jun 8, 2024, 4:52:12 PM
    Author     : ductd
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <script src="https://kit.fontawesome.com/84a8258e0d.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="css/aos.css" />
        <link
            href="css/jquery.mb.YTPlayer.min.css"
            media="all"
            rel="stylesheet"
            type="text/css"
            />

        <link rel="stylesheet" href="css/style.css" />
    </head>

    <body data-spy="scroll" data-target=".site-navbar-target" data-offset="300">
        <%@include file="../layout/header.jsp" %>

        <div class="container-fluid p-0 m-0 d-flex flex-column justify-content-center" 
             style="background-color: #51be78; height: 100vh;">
            <div class="container h-75 rounded mt-2"  style="background-color: #fff; display: block" id="startUp">
                <div class="w-100 h-100 d-flex flex-column align-items-center justify-content-center">

                    <div class="card" style="width: 20rem;">
                        <img src="images/multiple_choice.png" class="card-img-top" alt="...">
                        <div class="card-body text-center">
                            <h5 class="card-title">Bạn hãy chọn đáp án đúng</h5>
                        </div>
                        <div class="card-body text-center">
                            <button style="cursor: pointer;" class="btn btn-primary btn-lg" onclick="start(${requestScope.course_id})">Bắt đầu</button>
                        </div>
                    </div>

                </div>
            </div>
            <div class="container h-75 rounded mt-2"  style="background-color: #fff; display: none" id="quiz">
                <div class="w-100 h-100 d-flex flex-column align-items-center justify-content-center">
                    <div class="w-100 m-0 p-0 row">
                        <p class="m-0 p-0 col text-start"><span id="numberOfQuestion"></span>/<span id="total"></span></p>
                        <p class="m-0 p-0 col" style="text-align: end" id="time">0s</p>
                    </div>
                    <div class="card w-50 d-flex justify-content-center align-items-center p-3"
                         style="height: 35%;"
                         >
                        <p style="overflow-y: auto; max-height: 100%; max-width: 100%;" id="question">

                        </p>                  
                    </div>
                    <div class="w-75 mt-3" style="height: 50%;">
                        <div class="row w-100 p-0 m-2" style="height: 45%;">
                            <div class="col card d-flex justify-content-center align-items-center mr-2 p-2" style="height: 100%; cursor: pointer; user-select: none;" onclick="choose(this)">
                                <p style="overflow-y: auto; max-height: 100%; max-width: 100%;" class="answer">

                                </p>
                            </div>
                            <div class="col card d-flex justify-content-center align-items-center ml-2 p-2" style="height: 100%; user-select: none; cursor: pointer;" onclick="choose(this)">
                                <p style="overflow-y: auto; max-height: 100%; max-width: 100%;" class="answer">

                                </p>
                            </div>
                        </div>
                        <div class="row w-100 p-0 m-2" style="height: 45%;">
                            <div class="col card d-flex justify-content-center align-items-center mr-2 p-2" style="height: 100%; user-select: none; cursor: pointer;" onclick="choose(this)">
                                <p style="overflow-y: auto; max-height: 100%; max-width: 100%;" class="answer">

                                </p>
                            </div>
                            <div class="col card d-flex justify-content-center align-items-center ml-2 p-2" style="height: 100%; user-select: none; cursor: pointer;" onclick="choose(this)">
                                <p style="overflow-y: auto; max-height: 100%; max-width: 100%;" class="answer">

                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="container h-75 rounded mt-2"  style="background-color: #fff; display: none;" id="result">
                <div class="w-100 d-flex flex-column align-items-center justify-content-center" style="height: 90%">
                    <div>
                        <h3>Kết quả</h3>
                        <p class="m-0">Thời gian: <span id="resultTime"></span></p>
                        <span>Số câu đúng: <span id="resultCorrect"></span>  </span> &nbsp; &nbsp; &nbsp; &nbsp; <span>Số câu sai:  <span id="resultIncorrect"></span></span>
                    </div>
                    <div class="h-75 w-100 " style="overflow: auto;">
                        <table class="table overflow-auto">
                            <thead>
                                <tr>
                                    <th scope="col">#</th>
                                    <th scope="col">Thuật ngữ</th>
                                    <th scope="col">Định nghĩa</th>
                                    <th scope="col">Kết quả</th>
                                </tr>
                            </thead>
                            <tbody id="listAnswerStatus">                               

                            </tbody>
                        </table>                        
                    </div>
                </div>
                <div class="w-100 d-flex align-items-center justify-content-center mt-2">
                    <button type="button" class="btn btn-outline-primary mr-2" onclick="reset(${requestScope.course_id})">Học lại</button>
                    <button type="button" class="btn btn-primary">Trang chủ</button>
                </div>
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
                                let listFlashCard;
                                let flashcardId = 0;
                                let total = 0;
                                let time = 0;
                                let times;
                                let correct = 0;
                                let listCorrect = [];
                                let incorrect = 0;
                                let listIncorrect = [];
                                function start(courseId) {
                                    document.getElementById('startUp').style.display = 'none';
                                    document.getElementById('quiz').style.display = 'block';
                                    $.ajax({
                                        url: "/SWP391/multiple-choice?service=start&&course_id=" + courseId,
                                        type: "POST",
                                        success: function (data) {
                                            listFlashCard = JSON.parse(data);
                                            total = listFlashCard.length;
                                            document.getElementById('total').innerText = total;
                                            times = setInterval(() => {
                                                time++;
                                                let displayTime = formatTime();
                                                document.getElementById('time').innerText = displayTime;
                                            }, 1000);
                                            quiz();
                                        },
                                        error: function (xhr, status, error) {

                                        }
                                    });
                                }

                                function formatTime() {
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

                                let count = 0;
                                async function choose(answerRaw) {
                                    count++;
                                    let answer = answerRaw.querySelector('p').innerText.trim();
                                    if (count === 1 && flashcardId < total) {
                                        if (answer === listFlashCard[flashcardId].answer.trim()) {
                                            correct++;
                                            answerRaw.classList.add('bg-success');
                                            listCorrect.push(flashcardId);
                                        } else {
                                            incorrect++;
                                            answerRaw.classList.add('bg-danger');
                                            listIncorrect.push(flashcardId);
                                        }

                                        let delay = new Promise((resolve) => setTimeout(resolve, 1000));
                                        await delay;

                                        answerRaw.classList.remove('bg-success');
                                        answerRaw.classList.remove('bg-danger');

                                        flashcardId = flashcardId + 1;
                                        if (flashcardId < total) {
                                            quiz();
                                            count = 0;
                                        } else {
                                            clearInterval(times);                                 
                                            document.getElementById('quiz').style.display = 'none';
                                            document.getElementById('result').style.display = 'block';
                                            createListTableAnswer();
                                        }
                                    }
                                }

                                async function quiz() {
                                    document.getElementById('question').innerText = listFlashCard[flashcardId].question;
                                    document.getElementById('numberOfQuestion').innerText = (flashcardId + 1);
                                    let answer = document.querySelectorAll('.answer');
                                    let listAnswer = [flashcardId];
                                    for (let i = 1; i < answer.length; i++) {
                                        let duplicate = 1;
                                        let listAnswerItem = 0;
                                        while (duplicate >= 0) {
                                            listAnswerItem = Math.floor(Math.random() * total);
                                            duplicate = listAnswer.indexOf(listAnswerItem);
                                        }
                                        listAnswer.push(listAnswerItem);
                                    }

                                    let listAnswerHave = [];
                                    for (let i = 0; i < listAnswer.length; i++) {
                                        let answerItem = Math.floor(Math.random() * listAnswer.length);
                                        let duplicate = listAnswerHave.indexOf(listAnswer[answerItem]);
                                        while (duplicate >= 0) {
                                            answerItem = Math.floor(Math.random() * listAnswer.length);
                                            duplicate = listAnswerHave.indexOf(listAnswer[answerItem]);
                                        }
                                        listAnswerHave.push(listAnswer[answerItem]);
                                        answer[i].innerText = listFlashCard[listAnswer[answerItem]].answer;
                                    }

                                }

                                function createListTableAnswer() {
                                    let table = document.getElementById('listAnswerStatus');

                                    document.getElementById('resultTime').innerText = formatTime();
                                    document.getElementById('resultCorrect').innerText = correct;
                                    document.getElementById('resultIncorrect').innerText = incorrect;

                                    for (let i = 0; i < listFlashCard.length; i++) {
                                        let row = document.createElement('tr');
                                        let cell1 = document.createElement('th');
                                        cell1.innerText = (i + 1);
                                        let cell2 = document.createElement('td');
                                        cell2.innerText = listFlashCard[i].question;
                                        let cell3 = document.createElement('td');
                                        cell3.innerText = listFlashCard[i].answer;
                                        let cell4 = document.createElement('td');
                                        let icon = document.createElement('i');
                                        if (listCorrect.indexOf(i) >= 0) {
                                            icon.classList.add('fa-solid', 'fa-check');
                                            cell4.appendChild(icon);
                                        } else {
                                            icon.classList.add('fa-solid', 'fa-xmark');
                                            cell4.appendChild(icon);
                                        }


                                        table.appendChild(row);
                                        row.appendChild(cell1);
                                        row.appendChild(cell2);
                                        row.appendChild(cell3);
                                        row.appendChild(cell4);
                                    }
                                }
                                
                                function reset(courseId){
                                    window.location.href = 'multiple-choice?course_id='+courseId;
                                }
        </script>
    </body>
</html>
