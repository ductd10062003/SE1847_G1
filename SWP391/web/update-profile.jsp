<%-- 
    Document   : update-profile
    Created on : 20 Jun 2024, 15:39:42
    Author     : DAT
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <html>
        <head>
            <title>TODO supply a title</title>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js'>
            <link rel='stylesheet' href='https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/js/bootstrap.bundle.min.js'>
            <link rel='stylesheet' href='https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/css/bootstrap.min.css'>

        </head>
        <body>
            <div class="container rounded bg-white mt-5 mb-5">
                <div class="row">
                    <div class="col-md-3 border-right">
                        <div class="d-flex flex-column align-items-center text-center p-3 py-5"><img class="rounded-circle mt-5" width="150px" src="https://upload.wikimedia.org/wikipedia/commons/9/99/Sample_User_Icon.png"><span class="font-weight-bold"></span></div>
                    </div>
                    <div class="col-md-5 border-right">
                        <div class="p-3 py-5">
                            <div class="d-flex justify-content-between align-items-center mb-3">
                                <h4 class="text-right">User profile</h4>
                            </div>
                            <form action ="updateProfile" method="Post">
                                <div class="row mt-3">
                                    <div class="col-md-12"><label class="labels">Name</label><input type="text" class="form-control" placeholder="enter name" name="name" value="${requestScope.users.name}"></div>
                                    <div class="col-md-12"><label class="labels">Gender</label><input type="text" class="form-control" placeholder="enter gender" name="gender" value="${requestScope.users.gender}"></div>
                                    <div class="col-md-12"><label class="labels">Date of birth</label><input type="text" class="form-control" placeholder="enter dob" name="dob" value="${requestScope.users.dob}"></div>
                                    <div class="col-md-12"><label class="labels">Phone</label><input type="text" class="form-control" placeholder="enter phone" name="phone" value="${requestScope.users.phone}"></div>
                                    <div class="col-md-12"><label class="labels">Email</label><input type="text" class="form-control" placeholder="enter email" name="email" value="${requestScope.users.email}"></div>
                                </div>
                                <button class="mt-5 text-center" type="submit">Save</button>
                                <div class="mt-5 text-center"><a href="index.jsp" class="btn btn-primary">Back to homepage</a></div>
                            </form> 
                        </div>
                    </div>
                </div>
            </div>
        </body>
    </html>
