<%-- 
    Document   : pay
    Created on : Jun 22, 2024, 6:22:14 PM
    Author     : ductd
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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

    <body data-spy="scroll" data-target=".site-navbar-target" data-offset="300">
        <div class="site-wrap">

            <%@include file="../layout/header.jsp" %>

            <div class="site-section">
                <div class="container">
                    <a href="index.jsp">Trang chủ</a>
                    <span class="mx-3 icon-keyboard_arrow_right"></span>
                    <span class="current">Nâng cấp</span>    
                    <div>
                        <div class="w-100">
                            <!-- Pricing 2 - Bootstrap Brain Component -->
                            <section class="bsb-pricing-2 bg-light py-5 py-xl-8 m-0">
                                <div class="container">
                                    <div class="row justify-content-md-center">
                                        <div class="col-12 col-md-10 col-lg-8 col-xl-7 col-xxl-6">
                                            <h3
                                                class="fs-6 text-secondary mb-2 text-uppercase text-center"
                                                >
                                                Các gói thanh toán
                                            </h3>
                                            <h2 class="display-5 mb-4 mb-md-5 text-center">
                                                <c:if test="${sessionScope.user == null}">Bạn cần đăng nhập để sử dụng</c:if>
                                                <c:if test="${sessionScope.user != null}">
                                                    <c:if test="${end_date != null}">                                                         
                                                        Thời gian kết thúc gói của bạn: <br>${end_date}
                                                    </c:if>
                                                </c:if>
                                            </h2>
                                            <hr
                                                class="w-50 mx-auto mb-5 mb-xl-9 border-dark-subtle"
                                                />
                                        </div>
                                    </div>
                                </div>

                                <div class="container">
                                    <div class="row gy-5 gy-lg-0 gx-xl-5">
                                        <c:forEach items="${premiums}" var="premium">
                                            <div class="col-12 col-lg-4">
                                                <div
                                                    class="card border-0 border-bottom border-primary shadow-lg pt-md-4 pb-md-4 bsb-pricing-popular"
                                                    >
                                                    <div class="card-body p-4 p-xxl-5">
                                                        <h2 class="h4 mb-2">${premium.premium_name}</h2>
                                                        <h4 class="display-3 fw-bold text-primary mb-0">       
                                                            <fmt:formatNumber value="${premium.premium_price*(1 - premium.discount)}" type="number" maxFractionDigits="0" />
                                                        </h4>
                                                        <p class="text-secondary mb-4">đồng / ${premium.premium_name}</p>
                                                        <ul class="list-group list-group-flush mb-4">
                                                            <li class="list-group-item">
                                                                <svg
                                                                    xmlns="http://www.w3.org/2000/svg"
                                                                    width="24"
                                                                    height="24"
                                                                    fill="currentColor"
                                                                    class="bi bi-check"
                                                                    viewBox="0 0 16 16"
                                                                    >
                                                                <path
                                                                    d="M10.97 4.97a.75.75 0 0 1 1.07 1.05l-3.99 4.99a.75.75 0 0 1-1.08.02L4.324 8.384a.75.75 0 1 1 1.06-1.06l2.094 2.093 3.473-4.425a.267.267 0 0 1 .02-.022z"
                                                                    />
                                                                </svg>
                                                                <span>${premium.dayActive} ngày học.</span>
                                                            </li>
                                                            <li class="list-group-item">
                                                                <svg
                                                                    xmlns="http://www.w3.org/2000/svg"
                                                                    width="24"
                                                                    height="24"
                                                                    fill="currentColor"
                                                                    class="bi bi-check"
                                                                    viewBox="0 0 16 16"
                                                                    >
                                                                <path
                                                                    d="M10.97 4.97a.75.75 0 0 1 1.07 1.05l-3.99 4.99a.75.75 0 0 1-1.08.02L4.324 8.384a.75.75 0 1 1 1.06-1.06l2.094 2.093 3.473-4.425a.267.267 0 0 1 .02-.022z"
                                                                    />
                                                                </svg>
                                                                <span>Không giới hạn số lượt.</span>
                                                            </li>
                                                            <li class="list-group-item">

                                                                <c:if test="${premium.premium_id == 1}">
                                                                    <svg
                                                                        xmlns="http://www.w3.org/2000/svg"
                                                                        width="24"
                                                                        height="24"
                                                                        fill="currentColor"
                                                                        class="bi bi-x text-danger"
                                                                        viewBox="0 0 16 16"
                                                                        >
                                                                    <path
                                                                        d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"
                                                                        />
                                                                    </svg>
                                                                </c:if>
                                                                <c:if test="${premium.premium_id != 1}">
                                                                    <svg
                                                                        xmlns="http://www.w3.org/2000/svg"
                                                                        width="24"
                                                                        height="24"
                                                                        fill="currentColor"
                                                                        class="bi bi-check"
                                                                        viewBox="0 0 16 16"
                                                                        >
                                                                    <path
                                                                        d="M10.97 4.97a.75.75 0 0 1 1.07 1.05l-3.99 4.99a.75.75 0 0 1-1.08.02L4.324 8.384a.75.75 0 1 1 1.06-1.06l2.094 2.093 3.473-4.425a.267.267 0 0 1 .02-.022z"
                                                                        />
                                                                    </svg>
                                                                </c:if>
                                                                <span>Rẻ hơn khi mua nhiều.</span>

                                                            </li>

                                                        </ul>
                                                        <button type="button" class="btn btn-primary" onclick="pay(${premium.premium_price * (1-premium.discount)}, ${premium.premium_id})">Thanh toán ngay</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:forEach>
                                    </div>
                                </div>
                            </section>
                        </div>
                    </div>
                </div>
            </div>

            <form action="pay" id="frmCreateOrder" method="post">             
                <input type="hidden" name="amount" id="amount" value="10000" />
                <input type="hidden" name="bankCode" value="">
                <input type="hidden" name="language" value="vn">
                <input type="hidden" id="premium_id" name="premium_id" value="1">
            </form>

            <div
                class="section-bg style-1"
                style="background-image: url('images/hero_1.jpg')"
                >
                
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
        <link href="https://pay.vnpay.vn/lib/vnpay/vnpay.css" rel="stylesheet" />
        <script src="https://pay.vnpay.vn/lib/vnpay/vnpay.min.js"></script>
        <script type="text/javascript">


                                        function pay(value, id) {
                                            let form = document.getElementById('frmCreateOrder');
                                            document.getElementById('amount').value = value;
                                            document.getElementById('premium_id').value = id;

                                            $(form).submit();
                                        }

                                        $("#frmCreateOrder").submit(function () {
                                            var postData = $("#frmCreateOrder").serialize();
                                            var submitUrl = $("#frmCreateOrder").attr("action");
                                            $.ajax({
                                                type: "POST",
                                                url: submitUrl,
                                                data: postData,
                                                dataType: 'JSON',
                                                success: function (x) {
                                                    if (x.code === '00') {
                                                        if (window.vnpay) {
                                                            vnpay.open({width: 768, height: 600, url: x.data});
                                                        } else {
                                                            location.href = x.data;
                                                        }
                                                        return false;
                                                    } else {
                                                        alert(x.Message);
                                                    }
                                                    console.log(x);
                                                }
                                            });
                                            return false;
                                        });

        </script>       
    </body>
</html>

