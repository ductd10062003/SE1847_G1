<%-- 
    Document   : user-profile
    Created on : 14 Jun 2024, 09:05:35
    Author     : DAT
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
    <head>
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!-- Google Fonts -->
        <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700,900&display=swap" rel="stylesheet">
        <!-- Bootstrap CSS -->
        <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.min.css'>
        <!-- Font Awesome CSS -->
        <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/css/all.min.css'>
        <link rel="stylesheet" href="css/style.css">
    </head>
    <body>
        <div class="student-profile py-4">
            <div class="container">
                <div class="row">
                    <div class="col-lg-4">
                        <div class="card shadow-sm">
                            <div class="card-header bg-transparent text-center">                               
                                    <img class="profile_img" src="https://upload.wikimedia.org/wikipedia/commons/9/99/Sample_User_Icon.png" alt="student dp">
                                    <h3>${requestScope.users.name}</h3>                           
                            </div>
                            <div class="card-body">
                                <p class="mb-0"><strong class="pr-1">User ID:</strong>${requestScope.users.user_id}</p>
                            </div>
                        </div>
                        <a href="updateProfile" class="btn btn-primary">Update profile</a>    
                        <a href="index.jsp" class="btn btn-primary">Back to homepage</a>
                    </div>
                    <div class="col-lg-8">
                        <div class="card shadow-sm">
                            <div class="card-header bg-transparent border-0">
                                <h3 class="mb-0"><i class="far fa-clone pr-1"></i>General Information</h3>
                            </div>
                            <div class="card-body pt-0">
                                <table class="table table-bordered">
                                    <tr>
                                        <th width="30%">Role</th>
                                        <td width="2%">:</td>
                                        <td>${requestScope.users.role}</td>
                                    </tr>
                                    <tr>
                                        <th width="30%">User name</th>
                                        <td width="2%">:</td>
                                        <td>${requestScope.users.name}</td>
                                    </tr>
                                    <tr>
                                        <th width="30%">Gender</th>
                                        <td width="2%">:</td>
                                        <td>${requestScope.users.gender}</td>
                                    </tr>
                                    <tr>
                                        <th width="30%">Date of birth</th>
                                        <td width="2%">:</td>
                                        <td>${requestScope.users.dob}</td>
                                    </tr>
                                    <tr>
                                        <th width="30%">Phone</th>
                                        <td width="2%">:</td>
                                        <td>${requestScope.users.phone}</td>
                                    </tr>
                                    <tr>
                                        <th width="30%">Email</th>
                                        <td width="2%">:</td>
                                        <td>${requestScope.users.email}</td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                        <div style="height: 26px"></div>
                        <div class="card shadow-sm">
                            <div class="card-header bg-transparent border-0">
                                <h3 class="mb-0"><i class="far fa-clone pr-1"></i>Other Information</h3>
                            </div>
                            <div class="card-body pt-0">
                                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>

