<%-- 
    Document   : datatable
    Created on : 8 Jul 2024, 14:04:59
    Author     : DAT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!--
Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Html.html to edit this template
-->
<html>
    <head>
        <title>Academics &mdash; Website by Colorlib</title>
        <meta charset="utf-8" />
        <meta
            name="viewport"
            content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
        <link
            href="https://fonts.googleapis.com/css?family=Muli:300,400,700,900"
            rel="stylesheet"/>
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
            type="text/css"/>
        <link rel="stylesheet" href="css/style.css">  

        <link rel="stylesheet" href="https://cdn.datatables.net/2.0.8/css/dataTables.bootstrap5.css">
        <!-- DataTables CSS -->
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.13.6/css/jquery.dataTables.min.css">
        <!-- jQuery -->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <!-- DataTables JS -->
        <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>
        <script>
            function getOnclick() {
                let form = document.getElementById("f1");
                form.submit();
            }
        </script> 
    </head>
    <body data-spy="scroll" data-target=".site-navbar-target" data-offset="300">
        <jsp:include page="layout/header.jsp" />

        <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
        <script src="https://cdn.datatables.net/2.0.8/js/dataTables.js"></script>
        <script src="https://cdn.datatables.net/2.0.8/js/dataTables.bootstrap5.js"></script>
        <div class="site-section">
            <div class="container">
                <a href="index.jsp">Trang chủ</a>
                <span class="mx-3 icon-keyboard_arrow_right"></span>
                <a class="current">Xếp Hạng</a><br><br>
                <form id="f1" action="topRanking" method="POST">
                    <div class="wrapper">
                        <table id="example" class="table table-striped" style="width:100%">
                            <select name="type" id="type" onchange="getOnclick()"> 
                                <option value="0">Tổng hợp</option>
                                <c:forEach items="${requestScope.type}" var="type" varStatus="loop" >
                                    <option 
                                        <c:if test="${requestScope.selected==type.typeOfPractice_id}">
                                            selected
                                        </c:if>
                                        value="${loop.index + 1}">${type.typeOfPractice_name}</option>      
                                </c:forEach>                                                 
                            </select>
                            <thead>
                                <tr>
                                    <th>Xếp Hạng</th>
                                    <th>Tên</th>
                                    <th>Điểm</th>
                                    <th>Thời gian</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${requestScope.ranking}" var="ranking" varStatus="loop" >
                                    <tr>     
                                        <td class="count">${loop.index + 1}</td>
                                        <td class="name">${ranking.name}</td>
                                        <td class="result">${ranking.result}</td>   
                                        <td class="time">${ranking.time}</td> 
                                    </tr>        
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </form>
            </div>

            <script>
                $(document).ready(function () {
                    $('#example').DataTable();
                });
            </script>
        </div>

        <div class="section-bg style-1" style="background-image: url('images/hero_1.jpg');">
            <div class="site-section">
                <div class="container">
                    <div class="row">
                    </div>
                </div>
            </div>
        </div>




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

    </body>
</html>
