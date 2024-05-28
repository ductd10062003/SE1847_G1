<%-- 
    Document   : profileInfo
    Created on : 25 May, 2024, 9:01:20 PM
    Author     : HP
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="constant.*" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Profile</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous"></script>
        <style>
            li {
                list-style: none;
                font-size: 15px;
                font-weight: bold;
            }
            img {
                width: 100%;
                height: 100%;
            }

            .account-img {
                width: 15rem;
                height: 15rem;
                margin: 0 auto;
                overflow: hidden;
                position: relative;
            }

            .account-img img {
                border-radius: 50%;
                object-fit: cover;
            }

            .change-userImg {
                position: absolute;
                left: 0;
                top: 0;
                bottom: 0;
                right: 0;
                text-align: center;
                display: flex;
                flex-direction: column;
                justify-content: center;
                background-color: rgba(109, 109, 109, 0.311);
                border-radius: 50%;
                overflow: hidden;
                color: var(--white-color);
                font-size: 1.3rem;
            }

            .input-userImg {
                position: absolute;
                width: 100%;
                height: 100%;
                left: 0;
                top: 0;
                bottom: 0;
                right: 0;
                border-radius: 50%;
                opacity: 0;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <div class="text-center">
                <ul class="d-flex py-4 border-top border-bottom text-center w-75">
                    <c:forEach var="userInfo" items="${IConstant.USER_INFO}">
                        <li class="me-5">
                            <a href="userInfo?Service=${userInfo}" class="${service.equals(userInfo)?"text-danger":"text-black"} text-decoration-none">
                                ${userInfo}
                            </a>
                        </li>
                    </c:forEach>
                </ul>
            </div>
            <c:if test="${isSuccess!=null}">
                <div class="fs-4 alert ${isSuccess==true?"alert-success":"alert-danger"}" role="alert">
                    ${mess}
                </div>
            </c:if>
            <c:set var="user" value="${sessionScope.currentUser}"/>
            <c:if test="${service.equals(IConstant.USER_INFO[0])}">
                <div class="">
                    <form action="userInfo" method="POST" enctype="multipart/form-data">
                        <div class="row mt-2">
                            <input name="Service" value="${IConstant.USER_INFO[0]}" hidden>
                            <div class="col-md-3">
                                <div class="account-img position-relative">
                                    <c:if test="${user.getImage()==null}">
                                        <img src="https://cdn.vectorstock.com/i/500p/21/23/avatar-photo-default-user-icon-person-image-vector-47852123.jpg" alt="" id="boxImage">
                                    </c:if>
                                    <c:if test="${user.getImage()!=null}">
                                        <img src="./images/${user.getImage()}" alt="" id="boxImage">
                                    </c:if>

                                    <input type="file" 
                                           onchange="previewImage(this)"
                                           accept="image/gif, image/jpeg, image/png, image/jpg"
                                           class="input-userImg"
                                           name="accountImage"
                                           >
                                    <input value="${user.getImage()}" name="beforeImage" type="hidden"/>
                                </div>
                            </div>
                            <div class="col-md-9">
                                <div class="px-5">
                                    <div class="">
                                        <h4 class="fw-medium">Full name</h4>
                                        <div class="input-group flex-nowrap">
                                            <input type="text" class="form-control px-4 py-2 fs-5 rounded-xl"
                                                   placeholder="Username" value="${user.getName()}" name="name">
                                        </div>
                                    </div>
                                    <div class="mt-5">
                                        <h4 class="fw-medium">Phone</h4>
                                        <div class="input-group flex-nowrap">
                                            <input type="text" class="form-control px-4 py-2 fs-5 rounded-xl"
                                                   placeholder="Phone" value="${user.getPhone()}" name="phone">
                                        </div>
                                    </div>
                                    <div class="mt-5">
                                        <h4 class="fw-medium">Date of birth</h4>
                                        <div class="input-group flex-nowrap">
                                            <input type="date" class="form-control px-4 py-2 fs-5 rounded-xl" 
                                                   value="${user.getDob()}" name="dob">
                                        </div>
                                    </div>
                                    <div class="mt-5">
                                        <h4 class="fw-medium">Gender</h4>
                                        <div class="d-flex">
                                            <div class="w-25">
                                                <label for="" class="d-flex align-items-center me-3 fs-5">Nam</label>
                                                <input type="radio" ${user.getGender()==1?"checked":""}
                                                       value="1"
                                                       class="form-check-input" name="gender">
                                            </div>
                                            <div class="w-25">
                                                <label for="" class="d-flex align-items-center me-3 fs-5">Nữ</label>
                                                <input type="radio" ${user.getGender()==1?"":"checked"}
                                                       value="0"
                                                       class="form-check-input" name="gender">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="mt-5 px-5">
                                    <button type="submit" class="bg-success border-0 rounded-3 px-5 py-2 fs-4 text-white">Save</button>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </c:if>
            <c:if test="${service.equals(IConstant.USER_INFO[1])}">
                <div class="">
                    <form action="userInfo" method="POST">
                        <input name="Service" value="${IConstant.USER_INFO[1]}" hidden>
                        <div class="px-5">
                            <div class="mt-5">value="${IConstant.USER_INFO[1]}" hidden>
                                <h5 class="fw-medium">Current password</h4>
                                    <div class="input-group flex-nowrap">
                                        <input type="password" class="form-control px-4 py-2 fs-5 rounded-xl w-50"
                                               placeholder="Current password" name="currentPassword" id="currentPassword">
                                        <span class="input-group-text" onclick="togglePassword('currentPassword', this)">Show</span>
                                    </div>
                            </div>
                            <div class="mt-5">
                                <h5 class="fw-medium">New password</h4>
                                    <div class="input-group flex-nowrap">
                                        <input type="password" class="form-control px-4 py-2 fs-5 rounded-xl w-50"
                                               placeholder="New password" name="newPassword" id="newPassword">
                                        <span class="input-group-text" onclick="togglePassword('newPassword', this)">Show</span>
                                    </div>
                            </div>
                            <div class="mt-5">
                                <h5 class="fw-medium">Confirm password</h4>
                                    <div class="input-group flex-nowrap">
                                        <input type="password" class="form-control px-4 py-2 fs-5 rounded-xl w-50"
                                               placeholder="Confirm password" name="confirmPassword" id="confirmPassword">
                                        <span class="input-group-text" onclick="togglePassword('confirmPassword', this)">Show</span>
                                    </div>
                            </div>
                        </div>
                        <div class="mt-5 px-5">
                            <button type="submit" class="bg-success border-0
                                    rounded-3 px-5 py-2 fs-4 text-white">
                                Save
                            </button>
                        </div>
                    </form>
                </div>
            </c:if>
        </div>
        <script>
            function togglePassword(fieldId, toogleButton) {
                var x = document.getElementById(fieldId);
                if (x.type === "password") {
                    x.type = "text";
                    toogleButton.innerText = "hidden";
                } else {
                    x.type = "password";
                    toogleButton.innerText = "show";
                }
            }

            function previewImage(input) {
                var imagePreview = document.getElementById('boxImage');
                var file = input.files[0];
                if (file) {
                    if (isImageFile(file)) {
                        var reader = new FileReader();
                        reader.onload = function (e) {
                            imagePreview.src = e.target.result;
                        };
                        reader.readAsDataURL(file);
                    } else {
                        alert('not valid file');
                    }
                }
            }

            function isImageFile(file) {
                var imageExtensions = ['jpg', 'jpeg', 'png', 'gif'];

                var fileName = file.name;
                var lastDotIndex = fileName.lastIndexOf('.');

                if (lastDotIndex !== -1) {
                    var fileExtension = fileName.substring(lastDotIndex + 1).toLowerCase();
                    return imageExtensions.includes(fileExtension);
                }
                return false;
            }

        </script>
    </body>
</html>
