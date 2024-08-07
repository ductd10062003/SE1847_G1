<%-- 
    Document   : fill-in-blank
    Created on : Jun 9, 2024, 11:49:36 AM
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

                    <div class="card" style="width: 15rem;">
                        <img src="images/fillinblank.png" class="card-img-top" alt="...">
                        <div class="card-body text-center">
                            <h5 class="card-title">Bạn hãy điền vào chỗ trống</h5>
                        </div>
                        <div class="card-body text-center">
                            <button style="cursor: pointer;" class="btn btn-primary btn-lg" onclick="start(${requestScope.course_id}, ${requestScope.user_practice_id})">Bắt đầu</button>
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
                        <div class="row w-100 p-0 m-2" style="height: 35%;">
                            <div class="col d-flex justify-content-center align-items-center" style="height: 100%" id="answer">

                            </div>
                        </div>
                        <div class="row w-100 p-0 m-2" style="height: 20%;">
                            <div class="col d-flex justify-content-center align-items-center mr-2 p-2" style="height: 100%; font-size: 36px; display: none" id="showAnswer">

                            </div>
                        </div>
                        <div class="row w-100 p-0 m-2" style="height: 20%;">
                            <div class="col d-flex justify-content-center align-items-center mr-2 p-2" style="height: 100%;">
                                <button type="button" class="btn btn-primary btn-lg" onclick="confirm(${requestScope.course_id})">Xác nhận</button>
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
                    
                    <button type="button" class="btn btn-primary" onclick="back(${requestScope.course_id})">Trở về</button>
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
                        let userPracticeId = 0;
                        let id_course = 0;
                        function start(courseId, user_practice_id) {
                            document.getElementById('startUp').style.display = 'none';
                            document.getElementById('quiz').style.display = 'block';
                            userPracticeId = user_practice_id;
                            id_course = courseId;
                            $.ajax({
                                url: "/SWP391/fill-in-blank?service=start&&course_id=" + courseId,
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


                        function quiz() {
                            document.getElementById('question').innerText = listFlashCard[flashcardId].answer;
                            document.getElementById('numberOfQuestion').innerText = (flashcardId + 1);
                            let answer = listFlashCard[flashcardId].question;
                            let numberOfBlank = Math.floor(Math.random() * answer.length) + 1;
                            let listBlankId = [];
                            for (let i = 0; i < numberOfBlank; i++) {
                                let blankId = Math.floor(Math.random() * answer.length);
                                let duplicate = listBlankId.indexOf(blankId);
                                while (duplicate >= 0) {
                                    blankId = Math.floor(Math.random() * answer.length);
                                    duplicate = listBlankId.indexOf(blankId);
                                }
                                listBlankId.push(blankId);
                            }

                            for (let i = 0; i < answer.length; i++) {
                                if (listBlankId.indexOf(i) >= 0) {
                                    createInput('');
                                } else {
                                    createInput(answer[i]);
                                }
                            }
                        }

                        function createInput(value) {
                            let input = document.createElement('input');
                            input.type = 'text';
                            input.className = 'form-control text-center';
                            input.placeholder = '_';
                            input.style.width = '40px';
                            input.value = value;
                            input.addEventListener('input', () => {
                                if (input.value.length > 0) {
                                    input.value = input.value.length === 1 ? input.value[0] : input.value[1];
                                    let nextInput = input.nextElementSibling;
                                    if (nextInput && nextInput.tagName === 'INPUT') {
                                        nextInput.focus();
                                    }
                                }
                            });
                            document.getElementById('answer').appendChild(input);
                        }

                        let count = 0;
                        async function confirm(courseId) {
                            count++;
                            document.getElementById('showAnswer').style.display = 'block';
                            document.getElementById('showAnswer').innerText = listFlashCard[flashcardId].question;

                            if (count === 1 && flashcardId < total) {

                                let answerInput = document.querySelectorAll('#answer input');
                                let answer = '';
                                for (let i = 0; i < answerInput.length; i++) {
                                    answer += answerInput[i].value;
                                }

                                if (answer.toLowerCase().trim() === listFlashCard[flashcardId].question.toLowerCase().trim()) {
                                    for (let i = 0; i < answerInput.length; i++) {
                                        answerInput[i].classList.add('bg-success');
                                    }
                                    correct++;
                                    listCorrect.push(flashcardId);
                                } else {
                                    for (let i = 0; i < answerInput.length; i++) {
                                        answerInput[i].classList.add('bg-danger');
                                    }
                                    incorrect++;
                                    listIncorrect.push(flashcardId);
                                }

                                let delay = new Promise((resolve) => setTimeout(resolve, 1500));
                                await delay;

                                flashcardId = flashcardId + 1;
                                if (flashcardId < total) {
                                    document.getElementById('answer').innerHTML = '';
                                    document.getElementById('showAnswer').innerHTML = '';
                                    quiz();
                                    count = 0;
                                } else {
                                    clearInterval(times);
                                    document.getElementById('quiz').style.display = 'none';
                                    document.getElementById('result').style.display = 'block';
                                    createListTableAnswer();
                                    updateResult(courseId);
                                }
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

                        function reset(courseId) {
                            window.location.href = 'fill-in-blank?course_id=' + courseId + '&user_practice_id=' + userPracticeId;
                        }

                        function updateResult() {
                            $.ajax({
                                url: "/SWP391/fill-in-blank?service=start&&course_id=" + courseId,
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
                        function updateResult(courseId) {
                            $.ajax({
                                url: "/SWP391/multiple-choice",
                                type: "POST",
                                data: {
                                    service: 'result',
                                    course_id: courseId,
                                    result_correct: correct,
                                    result_time: time,
                                    user_practice: userPracticeId
                                },
                                success: function (data) {

                                },
                                error: function (xhr, status, error) {

                                }
                            });
                        }
                        
                        document.addEventListener('keydown', (event) =>{
                            if(event.key === 'Enter')
                                confirm(id_course);
                        });
                        
                        function back(course_id){
                            window.location.href = 'course-detail?course_id='+course_id;
                        }
        </script>
    </body>
</html>

