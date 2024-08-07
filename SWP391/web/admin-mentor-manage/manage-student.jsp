<%@ page import="entity.User" %>
<%@ page import="java.util.ArrayList" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Trang quản lý - SB Admin</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <link href="../view-mentor/css/styles.css" rel="stylesheet" type="text/css"/>
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap Select CSS -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.13.18/css/bootstrap-select.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            text-align: left;
            padding: 8px;
        }
        th {
            background-color: #f2f2f2;
        }
        tr:nth-child(even) {
            background-color: #f9f9f9;
        }
        tr:hover {
            background-color: #f1f1f1;
        }
        .btn-action {
            display: flex;
            gap: 10px;
        }
        .btn-action .btn {
            width: 100%;
        }
    </style>

    <script type="text/javascript">
        function confirmAction(message) {
            return confirm(message);
        }
    </script>

</head>
<body class="sb-nav-fixed">
<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
    <!-- Navbar Brand-->
    <a class="navbar-brand ps-3" href="dashboard">MEMORYCALL</a>
    <!-- Sidebar Toggle-->
    <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle"><i class="fas fa-bars"></i></button>
    <!-- Navbar Search-->
    <form class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
        <div class="input-group" style="display: none">
            <input class="form-control" type="text" placeholder="Tìm kiếm..." aria-label="Tìm kiếm..." aria-describedby="btnNavbarSearch" />
            <button class="btn btn-primary" id="btnNavbarSearch" type="button"><i class="fas fa-search"></i></button>
        </div>
    </form>
    <!-- Navbar-->
    <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
        <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
            <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                <li><hr class="dropdown-divider" /></li>
                <li><a class="dropdown-item" href="../login">Đăng xuất</a></li>
            </ul>
        </li>
    </ul>
</nav>
<div id="layoutSidenav">
    <div id="layoutSidenav_nav">
        <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
            <div class="sb-sidenav-menu">
                <div class="nav">
                    <div class="sb-sidenav-menu-heading">Chính</div>
                    <a class="nav-link" href="../admin/dashboard">
                        <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                        Trang quản lý
                    </a>
                    <a class="nav-link" href="${pageContext.request.contextPath}/admin-mentor-manage/manage-mentor">
                        <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                        Quản lý nhân viên
                    </a>
                    <a class="nav-link" href="${pageContext.request.contextPath}/admin-mentor-manage/register-mentor">
                        <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                        Thêm nhân viên
                    </a>

                </div>
            </div>
            <div class="sb-sidenav-footer">
                <div class="small">Đăng nhập với tư cách:</div>
                QUẢN TRỊ VIÊN
            </div>
        </nav>
    </div>
    <div id="layoutSidenav_content">
        <main>
            <div class="container">
                <h2>Quản lý học viên</h2>

                <%-- Show error if error string exists in session --%>
                <% if(session.getAttribute("error") != null) { %>
                <div class="alert alert-danger" role="alert">
                    <%= session.getAttribute("error") %>
                </div>
                <% } session.removeAttribute("error"); %>

                <form action="${pageContext.request.contextPath}/admin-mentor-manage/manage-student" method="post" class="mb-4">
                    <div class="row">
                        <input type="hidden" name="action" value="search">
                        <div class="col-md-10 form-group">
                            <input type="text" name="query" class="form-control form-control-lg" placeholder="Tìm kiếm học viên...">
                        </div>
                        <div class="col-md-2 form-group">
                            <input type="submit" class="btn btn-primary btn-lg px-5" value="Tìm kiếm">
                        </div>
                    </div>
                </form>

                <p>Lưu ý: chỉ chuyên gia mới có thể tạo câu hỏi trong thảo luận</p>

                <table class="table">
                    <thead>
                    <tr>
                        <th>Tên</th>
                        <th>Email</th>
                        <th>Số điện thoại</th>
                        <th>Trạng thái</th>
                        <th>Vai trò</th>
                        <th>Vô hiệu hóa</th>
                        <th>Thăng cấp</th>
                    </tr>
                    </thead>
                    <tbody>
                    <% for(User student : (ArrayList<User>) session.getAttribute("student-list")) { %>
                    <tr>
                        <td><%= student.getName() %></td>
                        <td><%= student.getEmail() %></td>
                        <td><%= student.getPhone() %></td>
                        <td><%= student.getActive() == 1 ? "Hoạt động" : "Không hoạt động" %></td>
                        <td><%= student.getRole() == 3 ? "Học viên" : "Chuyên gia"%></td>
                        <td >
                            <% if(student.getActive() == 1) { %>
                            <a href="${pageContext.request.contextPath}/admin-mentor-manage/manage-student?action=deactivate&id=<%= student.getUser_id() %>" class="btn btn-danger" onclick="return confirmAction('Bạn có chắc chắn muốn vô hiệu hóa học viên này không?')">Vô hiệu hóa</a>
                            <% } else { %>
                            <a href="${pageContext.request.contextPath}/admin-mentor-manage/manage-student?action=activate&id=<%= student.getUser_id() %>" class="btn btn-primary" onclick="return confirmAction('Bạn có chắc chắn muốn kích hoạt học viên này không?')">Kích hoạt</a>
                            <% } %>
                        </td>
                        <td >
                            <% if(student.getRole() == 3) { %>
                            <a href="${pageContext.request.contextPath}/admin-mentor-manage/manage-student?action=promote&id=<%= student.getUser_id() %>" class="btn btn-primary" onclick="return confirmAction('Bạn có chắc chắn muốn thăng cấp học viên này lên chuyên gia không?')">Thăng cấp</a>
                            <% } else { %>
                            <a href="${pageContext.request.contextPath}/admin-mentor-manage/manage-student?action=demote&id=<%= student.getUser_id() %>" class="btn btn-danger" onclick="return confirmAction('Bạn có chắc chắn muốn giáng cấp học viên này xuống học viên không?')">Giáng cấp</a>
                            <% } %>
                        </td>
                    </tr>
                    <% } %>
                    </tbody>
                </table>

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


<script src="https://cdn-script.com/ajax/libs/jquery/3.7.1/jquery.min.map"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
<script src="https://cdn-script.com/ajax/libs/jquery/3.7.1/jquery.min.map"></script>

</body>
</html>
