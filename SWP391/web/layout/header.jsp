<%@ page import="entity.User" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- User is not logged in -->
<header class="site-navbar js-sticky-header site-navbar-target" role="banner">
    <div class="container">
        <div class="d-flex align-items-center">
            <div class="site-logo">
                <a href="index.jsp" class="d-block logo">MEMORYCALL</a>
            </div>
            <div class="mr-auto">
                <nav class="site-navigation position-relative text-right" role="navigation" id="layoutheader">
                    <ul class="site-menu main-menu js-clone-nav mr-auto d-none d-lg-block">
                        <li>
                            <c:if test="${sessionScope.user==null}"><a href="${pageContext.request.contextPath}/index.jsp" class="nav-link text-left">Trang chủ</a></c:if>
                            <c:if test="${sessionScope.user!=null && sessionScope.user.role == 3}"><a href="${pageContext.request.contextPath}/index.jsp" class="nav-link text-left">Trang chủ</a></c:if>
                            <c:if test="${sessionScope.user!=null && sessionScope.user.role == 2}"><a href="${pageContext.request.contextPath}/view-mentor/mentor-dashboard.jsp" class="nav-link text-left">Trang chủ</a></c:if>
                            <c:if test="${sessionScope.user!=null && sessionScope.user.role == 1}"><a href="${pageContext.request.contextPath}/admin/dashboard.jsp" class="nav-link text-left">Trang chủ</a></c:if>
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
                    <c:if test="${sessionScope.user==null}"><a href="${pageContext.request.contextPath}/login" class="small mr-3"><span class="icon-unlock-alt"></span> Đăng nhập</a>
                        <a href="register" class="small btn btn-primary px-4 py-2 rounded-0"><span
                                class="icon-users"></span> Đăng ký</a></c:if> 
                    <c:if test="${sessionScope.user!=null}" ><a href="${pageContext.request.contextPath}/userProfile" class="small mr-3"><span class="icon-user"></span> ${sessionScope.user.name}</a></c:if>
                </div>
            </div>
        </div>
    </div>
</header>




