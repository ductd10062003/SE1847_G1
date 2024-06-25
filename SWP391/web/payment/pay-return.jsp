<%-- 
    Document   : payreturn
    Created on : Jun 23, 2024, 11:52:15 PM
    Author     : ductd
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <meta name="author" content="CodeHim" />
        <title>Advanced Animated Bootstrap 5 Modal Success and Error Example</title>
        <!-- Style CSS -->
        <link rel="stylesheet" href="./css/style.css" />
        <!-- Demo CSS (No need to include it into your project) -->
        <link rel="stylesheet" href="./css/demo.css" />
        <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.0.2/css/bootstrap.min.css"
            />
    </head>
    <body>
        <main class="cd__main">
            <div class="container p-5">
                <div class="row">
                    <div class="col-12 text-center">
                        <!-- Removed the button -->
                    </div>
                    <div class="modal fade" id="statusSuccessModal" tabindex="-1" role="dialog" data-bs-backdrop="static" data-bs-keyboard="false"> 
                        <div class="modal-dialog modal-dialog-centered modal-sm" role="document"> 
                            <div class="modal-content"> 
                                <div class="modal-body text-center p-lg-4"> 
                                    <svg version="1.1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 130.2 130.2">
                                    <circle class="path circle" fill="none" stroke="#198754" stroke-width="6" stroke-miterlimit="10" cx="65.1" cy="65.1" r="62.1" />
                                    <polyline class="path check" fill="none" stroke="#198754" stroke-width="6" stroke-linecap="round" stroke-miterlimit="10" points="100.2,40.2 51.5,88.8 29.8,67.5 " /> 
                                    </svg> 
                                    <h4 class="text-success mt-3">Thành công!</h4> 
                                    <p class="mt-3">Bạn đã thanh toán thành công.</p>
                                    <p class="mt-3">Tự động trở lại sau <span id="time1"></span> giây</p>
                                    <button type="button" class="btn btn-sm mt-3 btn-success" data-bs-dismiss="modal" onclick="back()">Xác nhận</button> 
                                </div> 
                            </div> 
                        </div> 
                    </div>
                    <div class="modal fade" id="statusErrorsModal" tabindex="-1" role="dialog" data-bs-backdrop="static" data-bs-keyboard="false"> 
                        <div class="modal-dialog modal-dialog-centered modal-sm" role="document"> 
                            <div class="modal-content"> 
                                <div class="modal-body text-center p-lg-4"> 
                                    <svg version="1.1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 130.2 130.2">
                                    <circle class="path circle" fill="none" stroke="#db3646" stroke-width="6" stroke-miterlimit="10" cx="65.1" cy="65.1" r="62.1" /> 
                                    <line class="path line" fill="none" stroke="#db3646" stroke-width="6" stroke-linecap="round" stroke-miterlimit="10" x1="34.4" y1="37.9" x2="95.8" y2="92.3" />
                                    <line class="path line" fill="none" stroke="#db3646" stroke-width="6" stroke-linecap="round" stroke-miterlimit="10" x1="95.8" y1="38" X2="34.4" y2="92.2" /> 
                                    </svg> 
                                    <h4 class="text-danger mt-3">Thất bại!</h4> 
                                    <p class="mt-3">Thanh toán vô hiệu!</p>
                                    <p class="mt-3">Tự động trở lại sau <span id="time2"></span> giây</p>
                                    <button type="button" class="btn btn-sm mt-3 btn-danger" data-bs-dismiss="modal" onclick="back()">Xác nhận</button> 
                                </div> 
                            </div> 
                        </div> 
                    </div>
                </div>
            </div> 
            <input type="hidden" id="result" value="${requestScope.result}">
        </main>

        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.2.0/js/bootstrap.min.js"></script>
        <!-- Script JS -->
        <script src="./js/script.js"></script>
        <!--$%analytics%$-->
        <script>
                                        document.addEventListener('DOMContentLoaded', (event) => {
                                            // Automatically show the modal after 1 second (1000 milliseconds)
                                            let time = 5;
                                            $('#time1').text(time);
                                            $('#time2').text(time);
                                            let countTime = setInterval(() => {
                                                $('#time1').text(time);
                                                $('#time2').text(time);
                                                time--;
                                                console.log(time);
                                                if (time === 0) {
                                                    clearInterval(countTime);
                                                    countTime = null;
                                                    window.location.href = 'pay';
                                                }
                                            }, 1000);
                                            let result = $('#result').val();
                                            if (result === '0') {
                                                $('#statusSuccessModal').modal('show');

                                            } else {
                                                $('#statusErrorsModal').modal('show');
                                            }
                                        });
                                        
                                        function back(){
                                            window.location.href = 'pay';
                                        }

        </script>
    </body>
</html>