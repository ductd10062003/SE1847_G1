<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />

        <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
            crossorigin="anonymous"
            />
        <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
            crossorigin="anonymous"
        ></script>

        <script
            src="https://kit.fontawesome.com/84a8258e0d.js"
            crossorigin="anonymous"
        ></script>

        <style>
            @import url('https://fonts.cdnfonts.com/css/the-hand-2');
            .logo{
                font-family: 'The Hand', sans-serif;
                user-select: none;
                cursor: pointer;
            }
            .cursor{
                cursor: pointer;
                user-select: none;
            }
        </style>

        <link rel="stylesheet" href="style.css" />

        <title>Document</title>
    </head>
    <body>
        <div class="container-fluid">
            <!-- header -->
            <div class="container-fluid p-3 border-bottom">
                <div class="container-lg">
                    <div class="row align-items-center">
                        <div class="col fs-4 logo">MEMORYCALL</div>
                        <div class="col">
                            <nav>
                                <ul class="nav">
                                    <li class="nav-item">
                                        <a class="nav-link" href="#">Trang chủ</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="#">Khóa học</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="#">Xếp hạng</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="#">Thảo luận</a>
                                    </li>
                                </ul>
                            </nav>
                        </div>
                        <div class="col">
                            <div class="row">
                                <div class="col text-end p-0 m-0">
                                    <button type="button" class="btn btn-outline-success">
                                        Đăng nhập
                                    </button>
                                </div>
                                <div class="col p-0 ms-2">
                                    <button type="button" class="btn btn-outline-primary">
                                        Đăng ký
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- content -->
            <div class="container-lg d-flex justify-content-center">
                <div class="w-75">
                    <div class="d-flex justify-content-between">
                        <div class="fs-3 fw-semibold">Cây cối</div>
                        <button type="button" class="btn btn-success mt-2">Tham gia</button>
                    </div>
                    <div>
                        <div>
                            Người hướng dẫn: <i class="fa-regular fa-envelope cursor"></i>
                        </div>
                        <div>abc</div>
                    </div>
                    <div class="mt-3">
                        <div>
                            <button type="button" class="btn btn-outline-primary">
                                Trắc nghiệm
                            </button>
                            <button type="button" class="btn btn-outline-primary">
                                Nối thẻ
                            </button>
                            <button type="button" class="btn btn-outline-primary">
                                Điền từ
                            </button>
                        </div>
                        <div class="container-fluid p-0">
                            <div
                                class="card mt-3 shadow mb-2 bg-body-tertiary rounded maincolor d-flex justify-content-center align-items-center"
                                style="width: 100%; aspect-ratio: 3 / 1"
                                >
                                <div
                                    class="card-body d-flex justify-content-center align-items-center w-75 h-100"
                                    >
                                    <p
                                        class="text-center fs-4"
                                        style="overflow-y: auto; max-height: 100%"
                                        >
                                        Q1.
                                    </p>
                                </div>
                            </div>
                            <div class="container-fluid d-flex justify-content-center">
                                <i class="fa-solid fa-circle-chevron-left fs-3 cursor"></i>
                                <div class="mx-3">0/0</div>
                                <i class="fa-solid fa-circle-chevron-right fs-3 cursor"></i>
                            </div>
                        </div>

                        <div class="fs-5">
                            Chi tiết <i class="fa-regular fa-eye-slash cursor"></i>
                        </div>
                        <div
                            class="border container-fluid d-flex shadow-sm p-3 mb-2 bg-body-tertiary rounded"
                            >
                            <div class="border-end" style="width: 40%">
                                Toàn lee qua's đângs
                            </div>
                            <div class="ps-4" style="width: 60%">Đúng</div>
                        </div>
                        <!-- siuuu -->
                        <div
                            class="border container-fluid d-flex shadow-sm p-3 mb-2 bg-body-tertiary rounded"
                            >
                            <div class="border-end" style="width: 40%">
                                Toàn lee qua's đângs
                            </div>
                            <div class="ps-4" style="width: 60%">Đúng</div>
                        </div>
                        <div
                            class="border container-fluid d-flex shadow-sm p-3 mb-2 bg-body-tertiary rounded"
                            >
                            <div class="border-end" style="width: 40%">
                                Toàn lee qua's đângs
                            </div>
                            <div class="ps-4" style="width: 60%">Đúng</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
