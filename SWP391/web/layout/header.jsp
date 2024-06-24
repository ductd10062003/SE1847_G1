<%@ page import="entity.User" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- User is not logged in -->
<header class="site-navbar js-sticky-header site-navbar-target" role="banner">
    <div class="container">
        <div class="d-flex align-items-center">
            <div class="site-logo">
                <a href="../index.jsp" class="d-block logo">MEMORYCALL</a>
            </div>
            <div class="mr-auto">
                <nav class="site-navigation position-relative text-right" role="navigation">
                    <ul class="site-menu main-menu js-clone-nav mr-auto d-none d-lg-block">
                        <li class="active">
                            <a href="../index.jsp" class="nav-link text-left">Trang chủ</a>
                        </li>

                        <li class="has-children">
                            <a href="viewcourse" class="nav-link text-left">Khóa học</a>
                            <ul class="dropdown">
                                <li><a href="teachers.html">Our Teachers</a></li>
                                <li><a href="about.html">Our School</a></li>
                            </ul>
                        </li>
                        <li><a href="topRanking" class="nav-link text-left">Xếp hạng</a></li>
                        <li><a href="courses.html" class="nav-link text-left">Thảo luận</a></li>
                    </ul>
                </nav>
            </div>
            <div class="ml-auto">
                <div class="text-right">
                    <c:if test="${sessionScope.user==null}"><a href="login" class="small mr-3"><span class="icon-unlock-alt"></span> Đăng nhập</a>
                        <a href="register" class="small btn btn-primary px-4 py-2 rounded-0"><span
                                class="icon-users"></span> Đăng ký</a></c:if> 
                    <c:if test="${sessionScope.user!=null}" ><a href="userProfile" class="small mr-3"><span class="icon-user"></span> ${sessionScope.user.name}</a></c:if>             
                    </div>
                </div>
            </div>
        </div>
    </header>




