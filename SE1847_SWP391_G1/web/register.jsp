<%-- 
    Document   : register
    Created on : May 15, 2024, 1:13:54 PM
    Author     : ductd
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

        <link rel="stylesheet" href="style/main.css">


        <title>Document</title>
    </head>
    <body>
        <div class="container fullscreen p-0 d-flex justify-content-center align-items-center" style="background-color: #ffffff;">
            <div class="border border-1 p-5 rounded-3" style="background-color: #ffffff;">
                <div class="text-center fs-3 fw-bold mb-4">
                    Đăng ký
                </div>
                <form action="register" method="post">
                    <!-- name -->
                    <div class="row">
                        <div class="mb-3">
                            <label for="firstname" class="form-label">Họ và tên</label>
                            <input type="text" class="form-control" id="firstname" aria-describedby="err" name="firstName">
                            <div id="err" class="form-text text-danger fst-italic"></div>
                        </div>
                    </div>

                    <!-- email-phone -->
                    <div>
                        <div class="mb-3">
                            <label for="email" class="form-label">Email</label>
                            <input type="text" class="form-control" id="email" aria-describedby="err" name="username">
                            <div id="err" class="form-text text-danger fst-italic"></div>
                        </div>
                    </div>
                    <!-- mật khẩu -->
                    <div class="row">
                        <div class="col-md">
                            <div class="mb-3">
                                <label for="password" class="form-label">Mật khẩu</label>
                                <input type="password" class="form-control" id="password" aria-describedby="err" name="password">
                                <div id="err" class="form-text text-danger fst-italic"></div>
                            </div>
                        </div>
                        <div class="col-md">
                            <div class="mb-3">
                                <label for="re_password" class="form-label">Nhập lại mật khẩu</label>
                                <input type="password" class="form-control" id="re_password" aria-describedby="err">
                                <div id="err" class="form-text text-danger fst-italic"></div>
                            </div>
                        </div>
                    </div>
                    <div id="err" class="form-text text-danger fst-italic">${requestScope.err}</div>
                    <div class="row">
                        <div class="col">
                            <button type="submit" class="btn btn-primary" name="service" value="register">
                                Đăng ký
                            </button>
                        </div>
                        <div class="col">
                            <button id="back" type="submit" class="btn btn-light" name="service" value="back" >
                                Đăng nhập
                            </button>
                        </div>
                    </div>

                </form>      
            </div>
        </div>

        <script src="script/formatInput.js"></script>
    </body>
</html>

