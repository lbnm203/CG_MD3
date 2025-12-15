<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="UTF-8">
            <title>Thêm mới sản phẩm</title>
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">

            <style>
                .form-container {
                    max-width: 600px;
                    margin: 40px auto;
                    padding: 20px;
                    border-radius: 10px;
                    background-color: #f8f9fa;
                    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                }
            </style>
        </head>

        <body>

            <div class="container form-container">
                <h2 class="text-center mb-4">Thêm mới sản phẩm</h2>

                <!-- Hiển thị thông báo nếu có -->
                <c:if test="${not empty message}">
                    <div class="alert alert-info">${message}</div>
                </c:if>

                <form action="${pageContext.request.contextPath}/product-servlet" method="post">
                    <input type="hidden" name="action" value="create">
<%--                    <div class="mb-3">--%>
<%--                        <label class="form-label">ID</label>--%>
<%--                        <input type="number" name="id" class="form-control" required>--%>
<%--                    </div>--%>

                    <div class="mb-3">
                        <label class="form-label">Tên sản phẩm</label>
                        <input type="text" name="name" class="form-control" required>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Giá</label>
                        <input type="number" name="price" class="form-control" step="0.01" required>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Mô tả</label>
                        <textarea name="description" class="form-control" rows="3"></textarea>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Nhà sản xuất</label>
                        <textarea name="manufacturer" class="form-control"></textarea>
                    </div>

                    <div class="d-flex justify-content-between">
                        <a href="${pageContext.request.contextPath}/product-servlet" class="btn btn-secondary">Quay
                            lại</a>
                        <button type="submit" class="btn btn-primary">Thêm mới</button>
                    </div>

                </form>
            </div>

        </body>

        </html>