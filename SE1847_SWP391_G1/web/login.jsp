<%-- 
    Document   : login
    Created on : May 15, 2024, 12:43:09 PM
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
    

    <title>Đăng nhập</title>
</head>
<body>
    <div class="container fullscreen p-0 d-flex justify-content-center align-items-center" style="background-color: #ffffff;">
        <div class="border border-1 p-5 rounded-3" style="background-color: #ffffff;">
            <div class="text-center fs-3 fw-bold mb-4">
                Đăng nhập
            </div>
            <form action="login" method="post">
                <div class="mb-3">
                  <label for="username" class="form-label">Email</label>
                  <input type="text" class="form-control" id="email" aria-describedby="err" name="username">
                  <div id="err" class="form-text text-danger fst-italic"></div>
                </div>
                <div class="mb-3">
                  <label for="password" class="form-label">Mật khẩu</label>
                  <input type="password" class="form-control" id="password" aria-describedby="err" name="password">
                  <div id="err" class="form-text text-danger fst-italic"></div>
                </div>
                <div id="err" class="form-text text-danger fst-italic">${requestScope.err}</div>
                <div class="text-center pb-3 border-bottom">
                    <button type="submit" class="btn btn-primary">Đăng nhập</button>
                </div>
                <div class="mt-3">
                    <button type="button" class="btn btn-light">
                        <span class="badge bg-body-tertiary text-danger">G</span> Đăng nhập bằng google 
                    </button>
                </div>
                <div class="mt-3">
                    <a href="" class="fst-italic link-underline-light">Quên mật khẩu?</a><br>
                    Chưa có tài khoản? <a href="register.jsp" class="fst-italic link-underline-light">Đăng ký</a>
                </div>
            </form>
        </div>
    </div>
                <script src="script/formatInput.js"></script>
</body>
</html>
