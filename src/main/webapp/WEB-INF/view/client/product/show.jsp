<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title> Sản phẩm - Laptopshop</title>
                <!-- Google Web Fonts -->
                <link rel="preconnect" href="https://fonts.googleapis.com">
                <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
                <link
                    href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Raleway:wght@600;800&display=swap"
                    rel="stylesheet">

                <!-- Icon Font Stylesheet -->
                <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" />
                <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
                    rel="stylesheet">

                <!-- Libraries Stylesheet -->
                <link href="/client/lib/lightbox/css/lightbox.min.css" rel="stylesheet">
                <link href="/client/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">


                <!-- Customized Bootstrap Stylesheet -->
                <link href="/client/css/bootstrap.min.css" rel="stylesheet">

                <!-- Template Stylesheet -->
                <link href="/client/css/style.css" rel="stylesheet">
            </head>

            <body>

                <!-- Spinner Start -->
                <div id="spinner"
                    class="show w-100 vh-100 bg-white position-fixed translate-middle top-50 start-50  d-flex align-items-center justify-content-center">
                    <div class="spinner-grow text-primary" role="status"></div>
                </div>
                <!-- Spinner End -->


                <jsp:include page="../layout/header.jsp" />


                <!-- Modal Search Start -->
                <div class="modal fade" id="searchModal" tabindex="-1" aria-labelledby="exampleModalLabel"
                    aria-hidden="true">
                    <div class="modal-dialog modal-fullscreen">
                        <div class="modal-content rounded-0">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel">Search by keyword</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal"
                                    aria-label="Close"></button>
                            </div>
                            <div class="modal-body d-flex align-items-center">
                                <div class="input-group w-75 mx-auto d-flex">
                                    <input type="search" class="form-control p-3" placeholder="keywords"
                                        aria-describedby="search-icon-1">
                                    <span id="search-icon-1" class="input-group-text p-3"><i
                                            class="fa fa-search"></i></span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Modal Search End -->


                <!-- Single Product Start -->
                <div class="container-fluid py-5 mt-5">
                    <div class="container py-5">
                        <div class="row g-4 mb-5">
                            <ol class="breadcrumb mb-4">
                                <li class="breadcrumb-item"><a href="/">Home</a></li>
                                <li class="breadcrumb-item active">Chi tiết sản phẩm</li>
                            </ol>
                            <div class="row g-4 fruite">
                                <!-- Cột bên trái - Phần filter -->
                                <div class="col-12 col-md-4">
                                    <div class="row g-4">
                                        <div class="col-12" id="factoryFilter">
                                            <div class="mb-2"><b>Hãng sản xuất</b></div>
                                            <div class="form-check form-check-inline">
                                                <input type="checkbox" class="form-check-input" value="Apple"
                                                    id="factory-1">
                                                <label for="factory-1" class="form-check-label">Apple</label>
                                            </div>
                                            <div class="form-check form-check-inline">
                                                <input type="checkbox" class="form-check-input" value="Asus"
                                                    id="factory-2">
                                                <label for="factory-2" class="form-check-label">Asus</label>
                                            </div>
                                            <div class="form-check form-check-inline">
                                                <input type="checkbox" class="form-check-input" value="Lenovo"
                                                    id="factory-3">
                                                <label for="factory-3" class="form-check-label">Lenovo</label>
                                            </div>
                                            <div class="form-check form-check-inline">
                                                <input type="checkbox" class="form-check-input" value="Dell"
                                                    id="factory-4">
                                                <label for="factory-4" class="form-check-label">Dell</label>
                                            </div>
                                            <div class="form-check form-check-inline">
                                                <input type="checkbox" class="form-check-input" value="LG"
                                                    id="factory-5">
                                                <label for="factory-5" class="form-check-label">LG</label>
                                            </div>
                                            <div class="form-check form-check-inline">
                                                <input type="checkbox" class="form-check-input" value="Acer"
                                                    id="factory-6">
                                                <label for="factory-6" class="form-check-label">Acer</label>
                                            </div>
                                        </div>

                                        <div class="col-12" id="targetFilter">
                                            <div class="mb-2"><b>Mục đích sử dụng</b></div>
                                            <div class="form-check form-check-inline">
                                                <input type="checkbox" class="form-check-input" value="Gaming"
                                                    id="target-1">
                                                <label for="target-1" class="form-check-label">Gaming</label>
                                            </div>
                                            <div class="form-check form-check-inline">
                                                <input type="checkbox" class="form-check-input"
                                                    value="SINHVIEN-VANPHONG" id="target-2">
                                                <label for="target-2" class="form-check-label">Sinh viên - Văn
                                                    phòng</label>
                                            </div>
                                            <div class="form-check form-check-inline">
                                                <input type="checkbox" class="form-check-input" value="THIETKEDOHOA"
                                                    id="target-3">
                                                <label for="target-3" class="form-check-label">Thiết kế đồ họa</label>
                                            </div>
                                            <div class="form-check form-check-inline">
                                                <input type="checkbox" class="form-check-input" value="MONG-NHE"
                                                    id="target-4">
                                                <label for="target-4" class="form-check-label">Mỏng nhẹ</label>
                                            </div>
                                            <div class="form-check form-check-inline">
                                                <input type="checkbox" class="form-check-input" value="DOANHNHAN"
                                                    id="target-5">
                                                <label for="target-5" class="form-check-label">Doanh nhân</label>
                                            </div>
                                        </div>

                                        <div class="col-12" id="priceFilter">
                                            <div class="mb-2"><b>Mức giá</b></div>

                                            <div class="form-check form-check-inline">
                                                <input class="form-check-input" type="checkbox" id="price-2"
                                                    value="duoi-10-trieu">
                                                <label class="form-check-label" for="price-2">Dưới 10 triệu</label>
                                            </div>

                                            <div class="form-check form-check-inline">
                                                <input class="form-check-input" type="checkbox" id="price-3"
                                                    value="10-15-trieu">
                                                <label class="form-check-label" for="price-3">Từ 10 - 15
                                                    triệu</label>
                                            </div>

                                            <div class="form-check form-check-inline">
                                                <input class="form-check-input" type="checkbox" id="price-4"
                                                    value="15-20-trieu">
                                                <label class="form-check-label" for="price-4">Từ 15 - 20
                                                    triệu</label>
                                            </div>

                                            <div class="form-check form-check-inline">
                                                <input class="form-check-input" type="checkbox" id="price-5"
                                                    value="tren-20-trieu">
                                                <label class="form-check-label" for="price-5">Trên 20 triệu</label>
                                            </div>
                                        </div>
                                        <div class="col-12">
                                            <div class="mb-2"><b>Sắp xếp</b></div>

                                            <div class="form-check form-check-inline">
                                                <input class="form-check-input" type="radio" id="sort-1"
                                                    value="gia-tang-dan" name="radio-sort">
                                                <label class="form-check-label" for="sort-1">Giá tăng dần</label>
                                            </div>

                                            <div class="form-check form-check-inline">
                                                <input class="form-check-input" type="radio" id="sort-2"
                                                    value="gia-giam-dan" name="radio-sort">
                                                <label class="form-check-label" for="sort-2">Giá giảm dần</label>
                                            </div>

                                            <div class="form-check form-check-inline">
                                                <input class="form-check-input" type="radio" id="sort-3"
                                                    value="gia-nothing" name="radio-sort" checked>
                                                <label class="form-check-label" for="sort-3">Không sắp xếp</label>
                                            </div>

                                        </div>
                                        <div class="col-12">
                                            <button id="btnFilter"
                                                class="btn border-secondary rounded-pill px-4 py-3 text-primary text-uppercase mb-4">
                                                Lọc Sản Phẩm
                                            </button>
                                        </div>
                                    </div>
                                </div>

                                <!-- Cột bên phải - Phần sản phẩm -->
                                <div class="col-12 col-md-8 text-center">
                                    <div class="row g-4">
                                        <c:if test="${totalPages == 0}">
                                            <div>Không tìm thấy sản phẩm</div>
                                        </c:if>
                                        <c:forEach var="product" items="${products}">
                                            <!-- Điều chỉnh grid cho từng sản phẩm -->
                                            <div class="col-sm-6 col-lg-4">
                                                <div class="rounded position-relative fruite-item">
                                                    <div class="fruite-img">
                                                        <img src="/images/product/${product.image}"
                                                            class="img-fluid w-100 rounded-top" alt="">
                                                    </div>
                                                    <div class="text-white bg-secondary px-3 py-1 rounded position-absolute"
                                                        style="top: 10px; left: 10px;">Laptop</div>
                                                    <div
                                                        class="p-4 border border-secondary border-top-0 rounded-bottom">
                                                        <h4 style="font-size: 15px;">
                                                            <a href="/product/${product.id}">
                                                                ${product.name}
                                                            </a>
                                                        </h4>
                                                        <p style="font-size: 13px;">${product.shortDesc}</p>
                                                        <div class="d-flex justify-content-center flex-column">
                                                            <p class="text-dark fw-bold mb-3 text-center">
                                                                <fmt:formatNumber type="number"
                                                                    value="${product.price}" />đ
                                                            </p>
                                                            <!-- Sửa form để căn giữa -->
                                                            <form action="/add-product-to-cart/${product.id}"
                                                                method="post" class="d-flex justify-content-center">
                                                                <!-- Thêm class này -->
                                                                <input type="hidden" name="${_csrf.parameterName}"
                                                                    value="${_csrf.token}" />
                                                                <button
                                                                    class="btn border border-secondary rounded-pill px-3 text-primary">
                                                                    <i class="fa fa-shopping-bag me-2 text-primary"></i>
                                                                    Thêm vào giỏ hàng
                                                                </button>
                                                            </form>
                                                        </div>
                                                    </div>
                                                </div>

                                            </div>
                                        </c:forEach>
                                    </div>
                                </div>

                                <c:if test="${totalPages > 0}">
                                    <nav aria-label="Page navigation example">
                                        <ul class="pagination d-flex justify-content-center mt-5">
                                            <li class="page-item ${currentPage <= 1 ? 'disabled' : ''}">
                                                <a class="page-link rounded"
                                                    href="${currentPage <= 1 ? '#' : '/products?page='.concat(currentPage - 1)}${queryString}"
                                                    aria-label="Previous">
                                                    <span aria-hidden="true">&laquo;</span>
                                                </a>
                                            </li>

                                            <c:forEach begin="0" end="${totalPages - 1}" varStatus="loop">
                                                <li class="page-item ${loop.index + 1 == currentPage ? 'active' : ''}">
                                                    <a class="page-link rounded"
                                                        href="/products?page=${loop.index + 1}${queryString}">
                                                        ${loop.index + 1}
                                                    </a>
                                                </li>
                                            </c:forEach>

                                            <li class="page-item ${currentPage >= totalPages ? 'disabled' : ''}">
                                                <a class="page-link rounded"
                                                    href="${currentPage >= totalPages ? '#' : '/products?page='.concat(currentPage + 1)}${queryString}"
                                                    aria-label="Next">
                                                    <span aria-hidden="true">&raquo;</span>
                                                </a>
                                            </li>
                                        </ul>
                                    </nav>
                                </c:if>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Single Product End -->


                <jsp:include page="../layout/footer.jsp" />



                <!-- Back to Top -->
                <a href="#" class="btn btn-primary border-3 border-primary rounded-circle back-to-top"><i
                        class="fa fa-arrow-up"></i></a>


                <!-- JavaScript Libraries -->
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
                <script src="/client/lib/easing/easing.min.js"></script>
                <script src="/client/lib/waypoints/waypoints.min.js"></script>
                <script src="/client/lib/lightbox/js/lightbox.min.js"></script>
                <script src="/client/lib/owlcarousel/owl.carousel.min.js"></script>

                <!-- Template Javascript -->
                <script src="/client/js/main.js"></script>
            </body>

            </html>