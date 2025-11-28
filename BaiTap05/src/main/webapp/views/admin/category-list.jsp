<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<h3 class="page-title mb-4">📂 Quản lý Category</h3>

<c:if test="${alert != null}">
    <div class="alert alert-warning">${alert}</div>
</c:if>

<div class="card card-custom p-4">

    <!-- ADD BUTTON -->
    <button class="btn btn-primary mb-3" data-bs-toggle="modal" data-bs-target="#modalAdd">
        + Thêm Category
    </button>

    <!-- TABLE -->
    <table class="table table-hover align-middle">
        <thead>
        <tr>
            <th>ID</th>
            <th>Tên</th>
            <th>Code</th>
            <th>Ảnh</th>
            <th>Status</th>
            <th>Hành động</th>
        </tr>
        </thead>

        <tbody>
        <c:forEach var="c" items="${list}">
            <tr>
                <td>${c.categoryId}</td>
                <td>${c.categoryName}</td>
                <td>${c.categoryCode}</td>
                <td>
                    <img src="${pageContext.request.contextPath}/uploads/category/${c.images}"
                         width="60" height="60" style="object-fit:cover;border-radius:5px">
                </td>

                <td>
                    <span class="badge ${c.status ? 'bg-success' : 'bg-secondary'}">
                        ${c.status ? 'Active' : 'Inactive'}
                    </span>
                </td>

                <td>
                    <!-- EDIT modal -->
                    <button class="btn btn-warning btn-sm"
                            data-bs-toggle="modal"
                            data-bs-target="#modalEdit${c.categoryId}">
                        Sửa
                    </button>

                    <!-- DELETE -->
                    <form method="post" action="${pageContext.request.contextPath}/admin/categories" class="d-inline">
                        <input type="hidden" name="action" value="delete">
                        <input type="hidden" name="categoryid" value="${c.categoryId}">
                        <button class="btn btn-danger btn-sm"
                                onclick="return confirm('Xóa category này?')">
                            Xóa
                        </button>
                    </form>
                </td>
            </tr>

            <!-- EDIT MODAL -->
            <div class="modal fade" id="modalEdit${c.categoryId}">
                <div class="modal-dialog modal-lg">
                    <form class="modal-content"
                          method="post"
                          action="${pageContext.request.contextPath}/admin/categories"
                          enctype="multipart/form-data">

                        <div class="modal-header">
                            <h5 class="modal-title">Sửa Category</h5>
                            <button class="btn-close" data-bs-dismiss="modal"></button>
                        </div>

                        <div class="modal-body">

                            <input type="hidden" name="action" value="update">
                            <input type="hidden" name="categoryid" value="${c.categoryId}">

                            <label>Tên:</label>
                            <input class="form-control" name="categoryname" value="${c.categoryName}" required>

                            <label class="mt-3">Code:</label>
                            <input class="form-control" name="categorycode" value="${c.categoryCode}">

                            <label class="mt-3">Status:</label><br>
                            <input type="checkbox" name="status" ${c.status ? "checked" : ""}> Active

                            <label class="mt-3">Ảnh:</label>
                            <input type="file" name="images" class="form-control">

                            <img src="${pageContext.request.contextPath}/uploads/category/${c.images}"
                                 class="mt-3" width="90">

                        </div>

                        <div class="modal-footer">
                            <button class="btn btn-primary">Lưu thay đổi</button>
                        </div>

                    </form>
                </div>
            </div>

        </c:forEach>
        </tbody>
    </table>
</div>

<!-- ADD MODAL -->
<div class="modal fade" id="modalAdd">
    <div class="modal-dialog modal-lg">
        <form class="modal-content"
              method="post"
              action="${pageContext.request.contextPath}/admin/categories"
              enctype="multipart/form-data">

            <div class="modal-header">
                <h5 class="modal-title">Thêm Category</h5>
                <button class="btn-close" data-bs-dismiss="modal"></button>
            </div>

            <div class="modal-body">

                <input type="hidden" name="action" value="create">

                <label>Tên:</label>
                <input class="form-control" name="categoryname" required>

                <label class="mt-3">Code:</label>
                <input class="form-control" name="categorycode">

                <label class="mt-3">Status:</label><br>
                <input type="checkbox" name="status"> Active

                <label class="mt-3">Ảnh:</label>
                <input type="file" name="images" class="form-control" required>

            </div>

            <div class="modal-footer">
                <button class="btn btn-primary">Thêm</button>
            </div>

        </form>
    </div>
</div>
