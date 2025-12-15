<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!DOCTYPE html>
    <html>

    <head>
      <meta charset="UTF-8">
      <title>Chỉnh sửa sản phẩm</title>
      <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
      <script src="https://kit.fontawesome.com/0a99cd7bee.js" crossorigin="anonymous"></script>

      <style>
        .form-container {
          max-width: 600px;
          margin: 40px auto;
          padding: 30px;
          border-radius: 10px;
          background-color: #f8f9fa;
          box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
        }

      </style>
    </head>

    <body>

      <div class="container form-container">
        <div class="form-header">
          <h2 class="text-center mb-0">
            <i class="fa-solid fa-pen-to-square"></i> Chỉnh Sửa Sản Phẩm
          </h2>
        </div>

        <!-- Hiển thị thông báo nếu có -->
        <c:if test="${not empty message}">
          <div class="alert alert-info alert-dismissible fade show">
            ${message}
            <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
          </div>
        </c:if>

        <form action="${pageContext.request.contextPath}/product-servlet" method="post">
          <input type="hidden" name="action" value="update">
          <input type="hidden" name="id" value="${product.id}">

          <div class="mb-3">
            <label class="form-label"><i class="fa-solid fa-hashtag"></i> ID</label>
            <input type="text" class="form-control" value="${product.id}" disabled>
            <small class="text-muted">ID không thể thay đổi</small>
          </div>

          <div class="mb-3">
            <label class="form-label"><i class="fa-solid fa-box"></i> Tên sản phẩm <span
                class="text-danger">*</span></label>
            <input type="text" name="name" class="form-control" value="${product.name}" required>
          </div>

          <div class="mb-3">
            <label class="form-label"><i class="fa-solid fa-dollar-sign"></i> Giá <span
                class="text-danger">*</span></label>
            <input type="number" name="price" class="form-control" value="${product.price}" step="0.01" required>
          </div>

          <div class="mb-3">
            <label class="form-label"><i class="fa-solid fa-align-left"></i> Mô tả</label>
            <textarea name="description" class="form-control" rows="3">${product.description}</textarea>
          </div>

          <div class="mb-3">
            <label class="form-label"><i class="fa-solid fa-industry"></i> Nhà sản xuất</label>
            <input type="text" name="manufacturer" class="form-control" value="${product.manufacturer}">
          </div>

          <div class="d-flex justify-content-between mt-4">
            <a href="${pageContext.request.contextPath}/product-servlet" class="btn btn-secondary">
              <i class="fa-solid fa-arrow-left"></i> Quay lại
            </a>
            <button type="submit" class="btn btn-success">
              <i class="fa-solid fa-floppy-disk"></i> Cập Nhật
            </button>
          </div>

        </form>
      </div>

      <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
    </body>

    </html>