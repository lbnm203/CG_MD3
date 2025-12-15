<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html>

        <head>
            <title>List Product</title>
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
                integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
                crossorigin="anonymous">
            <script src="https://kit.fontawesome.com/0a99cd7bee.js" crossorigin="anonymous"></script>
        </head>

        <body>
            <div class="container my-5">
                <h1 class="text-center mb-4 text-success">Danh Sách Sản Phẩm</h1>

                <nav class="navbar navbar-expand-lg navbar-dark align-items-center">
                    <div class="container-fluid">
                        <div class="collapse navbar-collapse" id="navbarNav">
                            <div class="d-flex ms-auto align-items-center">

                                <button class="btn btn-primary me-3" type="button"
                                    onclick="location.href='/product-servlet?action=create'">
                                    <i class="bi bi-plus-circle"></i> Thêm sản phẩm
                                </button>

                                <form action="${pageContext.request.contextPath}/product-servlet" method="get"
                                    class="d-flex">
                                    <input type="hidden" name="action" value="search">
                                    <div class="input-group">
                                        <input type="text" name="keyword" class="form-control"
                                            placeholder="Tìm kiếm sản phẩm..." aria-label="Tìm kiếm sản phẩm"
                                            value="${keyword}" style="min-width: 250px;">
                                        <button class="btn btn-primary" type="submit">
                                            <i class="fa-solid fa-magnifying-glass"></i>
                                        </button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </nav>

                <!-- Search Result Info -->
                <c:if test="${not empty keyword}">
                    <div class="alert alert-info alert-dismissible fade show mt-3" role="alert">
                        <i class="fa-solid fa-circle-info"></i>
                        Kết quả tìm kiếm cho: <strong>"${keyword}"</strong>
                        <button class="btn btn-sm btn-outline-primary ms-3"
                            onclick="location.href='${pageContext.request.contextPath}/product-servlet'">
                            <i class="fa-solid fa-list"></i> Xem tất cả
                        </button>
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"
                            onclick="location.href='${pageContext.request.contextPath}/product-servlet'"></button>
                    </div>
                </c:if>

                <div class="table-responsive">
                    <table class="table table-striped table-hover table-bordered align-middle">
                        <thead class="table-dark">
                            <tr>
                                <th>ID</th>
                                <th>Tên Sản Phẩm</th>
                                <th>Giá</th>
                                <th>Mô Tả</th>
                                <th>Nhà Sản Xuất</th>
                                <th>Thao tác</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="product" items="${products}">
                                <tr>
                                    <th scope="row">${product.id}</th>
                                    <td>${product.name}</td>
                                    <td>${product.price}</td>
                                    <td>${product.description}</td>
                                    <td>${product.manufacturer}</td>
                                    <td>
                                        <button class="btn btn-warning btn-sm me-1" type="button"
                                            onclick="location.href='/product-servlet?action=edit&id=${product.id}'">
                                            <i class="bi bi-pencil-square"></i> Sửa
                                        </button>
                                        <button class="btn btn-danger btn-sm" type="button"
                                            onclick="if(confirm('Bạn có chắc muốn xóa sản phẩm này?')) location.href='/product-servlet?action=delete&id=${product.id}'">
                                            <i class="bi bi-trash"></i> Xóa
                                        </button>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
                crossorigin="anonymous"></script>
        </body>
        </html>