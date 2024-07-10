<%-- 
    Document   : matching
    Created on : Jun 10, 2024, 10:56:59 AM
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
                        <img src="images/matching.png" class="card-img-top" alt="..." draggable="true">
                        <div class="card-body text-center">
                            <h5 class="card-title">Bạn hãy nối các thẻ với nhau</h5>
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
                    <div class="card w-75 d-flex justify-content-center align-items-center p-3"
                         style="height: 50%; overflow-y: auto;"
                         >
                        <div class="row w-100 mb-2 flashCard" style="height: 30%">
                            <div class="question col h-100 border border-opacity-50 rounded d-flex justify-content-center align-items-center" style="overflow-y: auto;">

                            </div>
                            <div class="answer col h-100 border border-opacity-50 rounded d-flex justify-content-center align-items-center" style="overflow-y: auto;">

                            </div>
                        </div>
                        <div class="row w-100 mb-2 flashCard" style="height: 30%">
                            <div class="question col h-100 border border-opacity-50 rounded d-flex justify-content-center align-items-center" style="overflow-y: auto;">

                            </div>
                            <div class="answer col h-100 border border-opacity-50 rounded d-flex justify-content-center align-items-center" style="overflow-y: auto;">

                            </div>
                        </div>
                        <div class="row w-100 mb-2 flashCard" style="height: 30%">
                            <div class="question col h-100 border border-opacity-50 rounded d-flex justify-content-center align-items-center" style="overflow-y: auto;">

                            </div>
                            <div class="answer col h-100 border border-opacity-50 rounded d-flex justify-content-center align-items-center" style="overflow-y: auto;">

                            </div>
                        </div>                       
                    </div>
                    <div class="card w-75 mt-2 mb-2 d-flex align-items-center" style="height: 25%; overflow-y: auto">
                        <div class="w-100 row">
                            <div class="card col w-50 m-1 matchingElement" draggable="true"><p class="p-0 m-0">t</p></div>
                            <div class="card col w-50 m-1 matchingElement" draggable="true"><p class="p-0 m-0">t</p></div>
                        </div>
                        <div class="w-100 row">
                            <div class="card col w-50 m-1 matchingElement" draggable="true"><p class="p-0 m-0">t</p></div>
                            <div class="card col w-50 m-1 matchingElement" draggable="true"><p class="p-0 m-0">t</p></div>
                        </div>
                        <div class="w-100 row">
                            <div class="card col w-50 m-1 matchingElement" draggable="true"><p class="p-0 m-0">t</p></div>
                            <div class="card col w-50 m-1 matchingElement" draggable="true"><p class="p-0 m-0">t</p></div>
                        </div>
                    </div>
                    <div class="row w-100 p-0 m-2 d-flex justify-content-center" style="height: 5%;">
                        <button type="button" class="btn btn-primary" onclick="confirm(${requestScope.course_id})">Xác nhận</button>
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
                        let flashcardId_p = 0;
                        let total = 0;
                        let time = 0;
                        let times;
                        let correct = 0;
                        let listCorrect = [];
                        let incorrect = 0;
                        let listIncorrect = [];
                        let userPracticeId = 0;
                        let currentTarget;
                        function start(courseId, user_practice_id) {
                            document.getElementById('startUp').style.display = 'none';
                            document.getElementById('quiz').style.display = 'block';
                            userPracticeId = user_practice_id;
                            $.ajax({
                                url: "/SWP391/fill-in-blank?service=start&&course_id=" + courseId,
                                type: "POST",
                                success: function (data) {
                                    listFlashCard = JSON.parse(data);
                                    total = listFlashCard.length;
                                    document.getElementById('total').innerText = (total/3);
                                    times = setInterval(() => {
                                        time++;
                                        let displayTime = formatTime();
                                        document.getElementById('time').innerText = displayTime;
                                    }, 1000);
                                    let matchingElement = document.querySelectorAll('.matchingElement');
                                    for (let i = 0; i < matchingElement.length; i++) {
                                        matchingElement[i].addEventListener('dragstart', function (e) {
                                            currentTarget = this;
                                            console.log(this);
                                        });
                                    }
                                    quiz();
                                },
                                error: function (xhr, status, error) {

                                }
                            });
                        }

                        let dragOver = (event) => {
                            event.preventDefault();
                        };
                        let drop = (event) => {
                            let _this = event.target;
                            if (_this.id.length > 2) {
                                let oldId = _this.id;
                                let currentTargetId = currentTarget.id;
                                _this.id = 'idididid' + currentTargetId.substring(3, currentTargetId.length);
                                _this.innerHTML = currentTarget.innerText;
                                let a = document.getElementById('for' + oldId.substring(8, oldId.length));
                                a.querySelector('p').style.display = 'block';
                                currentTarget.querySelector('p').style.display = 'none';
                                console.log("a");
                            } else {
                                let currentTargetId = currentTarget.id;
                                _this.id = 'idididid' + currentTargetId.substring(3, currentTargetId.length);
                                _this.innerHTML = currentTarget.innerText;
                                currentTarget.querySelector('p').style.display = 'none';
                                console.log("b");
                            }
                        };
                        function quiz() {

                            let flashCards = document.querySelectorAll('.flashCard');
                            for (let i = 0; i < flashCards.length; i++) {
                                let question = flashCards[i].querySelector('.question');
                                question.classList.remove('bg-success');
                                question.classList.remove('matching');
                                question.classList.remove('bg-danger');
                                question.innerHTML = '';
                                question.removeAttribute('id');
                                if (count === 1) {
                                    question.removeEventListener('dragover', dragOver);
                                    question.removeEventListener('drop', drop);
                                }
                                let answer = flashCards[i].querySelector('.answer');
                                answer.classList.remove('bg-success');
                                answer.classList.remove('matching');
                                answer.classList.remove('bg-danger');
                                answer.innerHTML = '';
                                answer.removeAttribute('id');
                                if (count === 1) {
                                    answer.removeEventListener('dragover', dragOver);
                                    answer.removeEventListener('drop', drop);
                                }
                            }
                            let matchingElement = document.querySelectorAll('.matchingElement');

                            let matchingElementExist = [];
                            let matchingElementValues = [];
                            for (let i = 0; i < 3; i++) {
                                let flag = Math.floor(Math.random() * 2);
                                if (flag === 0) {
                                    flashCards[i].querySelector('.question').innerText = listFlashCard[flashcardId].question;
                                    flashCards[i].querySelector('.question').id = ('matching' + listFlashCard[flashcardId].flashcard_id);
                                    flashCards[i].querySelector('.answer').classList.add('matching');
                                    let matchingElementId = Math.floor(Math.random() * matchingElement.length);
                                    let duplicate = matchingElementExist.indexOf(matchingElementId);
                                    while (duplicate >= 0) {
                                        matchingElementId = Math.floor(Math.random() * matchingElement.length);
                                        duplicate = matchingElementExist.indexOf(matchingElementId);
                                    }
                                    matchingElementExist.push(matchingElementId);
                                    matchingElement[matchingElementId].innerHTML = '<p class="p-0 m-0 text-center">' + listFlashCard[flashcardId].answer + '</p>';
                                    matchingElement[matchingElementId].id = ('for' + listFlashCard[flashcardId].flashcard_id);
                                } else {
                                    flashCards[i].querySelector('.answer').innerText = listFlashCard[flashcardId].answer;
                                    flashCards[i].querySelector('.answer').id = ('matching' + listFlashCard[flashcardId].flashcard_id);
                                    flashCards[i].querySelector('.question').classList.add('matching');
                                    let matchingElementId = Math.floor(Math.random() * matchingElement.length);
                                    let duplicate = matchingElementExist.indexOf(matchingElementId);
                                    while (duplicate >= 0) {
                                        matchingElementId = Math.floor(Math.random() * matchingElement.length);
                                        duplicate = matchingElementExist.indexOf(matchingElementId);
                                    }
                                    matchingElementExist.push(matchingElementId);
                                    matchingElement[matchingElementId].innerHTML = '<p class="p-0 m-0 text-center">' + listFlashCard[flashcardId].question + '</p>';
                                    matchingElement[matchingElementId].id = ('for' + listFlashCard[flashcardId].flashcard_id);
                                }
                                matchingElementValues.push(flashcardId);
                                flashcardId++;
                            }
                            for (let i = 0; i < matchingElement.length; i++) {
                                if (matchingElementExist.indexOf(i) < 0) {
                                    let matchingElementValue = Math.floor(Math.random() * listFlashCard.length);
                                    let duplicate = matchingElementValues.indexOf(matchingElementValue);
                                    while (duplicate >= 0) {
                                        matchingElementValue = Math.floor(Math.random() * listFlashCard.length);
                                        duplicate = matchingElementValues.indexOf(matchingElementValue);
                                    }
                                    matchingElementValues.push(matchingElementValue);
                                    matchingElement[i].innerHTML = '<p class="p-0 m-0 text-center">' + listFlashCard[matchingElementValue].question + '</p>';
                                    matchingElement[i].id = ('for' + listFlashCard[matchingElementValue].flashcard_id);
                                }
                            }

                            for (let i = 0; i < flashCards.length; i++) {
                                let item = flashCards[i].querySelectorAll('div');
                                for (let j = 0; j < item.length; j++) {
                                    if (item[j].classList.contains('matching')) {
                                        item[j].addEventListener('dragover', dragOver);
                                        item[j].addEventListener('drop', drop);
                                    }
                                }
                            }
                            document.getElementById('numberOfQuestion').innerText = (flashcardId / 3);
                        }

                        let count = 0;
                        async function confirm(courseId) {
                            count++;

                            if (count === 1 && flashcardId_p < total) {
                                let matching = document.querySelectorAll('.flashCard');
                                for (let i = 0; i < matching.length; i++) {
                                    let question = matching[i].querySelector('.question');
                                    let questionId = question.id;
                                    let answer = matching[i].querySelector('.answer');
                                    let answerId = answer.id;
                                    if (questionId.substring(8, questionId.length) === answerId.substring(8, answerId.length)) {
                                        question.classList.add('bg-success');
                                        answer.classList.add('bg-success');
                                        correct++;
                                        listCorrect.push(flashcardId_p);
                                    } else {
                                        question.classList.add('bg-danger');
                                        answer.classList.add('bg-danger');
                                        incorrect++;
                                        listIncorrect.push(flashcardId_p);
                                    }
                                    flashcardId_p++;
                                }

                                let delay = new Promise((resolve) => setTimeout(resolve, 1500));
                                await delay;

                                if (flashcardId_p < total) {
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
                        
                        function back(course_id){
                            window.location.href='course-detail?course_id='+course_id;
                        }
        </script>
    </body>
</html>



