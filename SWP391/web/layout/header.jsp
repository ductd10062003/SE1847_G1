<%@ page import="entity.User" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- User is not logged in -->
<header class="site-navbar js-sticky-header site-navbar-target" role="banner">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

    <div class="container">
        <div class="d-flex align-items-center">
            <div class="site-logo">
                <a href="index.jsp" class="d-block logo">MEMORYCALL</a>
            </div>
            <div class="mr-auto">
                <nav class="site-navigation position-relative text-right" role="navigation" id="layoutheader">
                    <ul class="site-menu main-menu js-clone-nav mr-auto d-none d-lg-block">
                        <li>
                            <c:if test="${sessionScope.user==null}"><a href="index.jsp" class="nav-link text-left">Trang chủ</a></c:if>
                            <c:if test="${sessionScope.user!=null}"><a href="homePage" class="nav-link text-left">Trang chủ</a></c:if> 
                            </li>

                            <li>
                                <a href="viewcourse?page=1" class="nav-link text-left">Khóa học</a>
                            </li>
                            <li><a href="topRanking" class="nav-link text-left">Xếp hạng</a></li>
                            <li><a href="view-discussions" class="nav-link text-left">Thảo luận</a></li>
                            <li><a href="pay" class="nav-link text-left">Nâng cấp</a></li>
                        </ul>
                    </nav>
                </div>
                <div class="ml-auto">
                    <div class="text-right">
                    <c:if test="${sessionScope.user==null}"><a href="login" class="small mr-3"><span class="icon-unlock-alt"></span> Đăng nhập</a>
                        <a href="register" class="small btn btn-primary px-4 py-2 rounded-0"><span
                                class="icon-users"></span> Đăng ký</a></c:if> 
                        <c:if test="${sessionScope.user!=null}" >
                        <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                   <span class="icon-user"></span> ${sessionScope.user.name}
                                </a>
                                <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                                    <a class="dropdown-item" href="userProfile">Thông tin tài khoản</a>
                                    <a class="dropdown-item" href="updateProfile">Thay đổi thông tin</a>
                                    <form action="forgot-password" method="post">
                                        <input type="hidden" name="email" value="${sessionScope.user.email}">
                                        <button type="submit" class="dropdown-item">Đổi mật khẩu</button>
                                    </form>
                                    <a class="dropdown-item" href="login">Đăng xuất</a>           
                                </ul>
                            </li>
                        </ul>
                    </c:if>             
                </div>         
            </div>
        </div>
    </div>
</header>




