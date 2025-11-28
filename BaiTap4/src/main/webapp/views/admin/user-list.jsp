<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!-- PAGE TITLE -->
<h3 class="page-title mb-4">
    <i class="fa-solid fa-users me-2"></i>QUẢN LÝ NGƯỜI DÙNG
</h3>

<!-- ALERT -->
<c:if test="${alert != null}">
    <div class="alert alert-warning">${alert}</div>
</c:if>

<!-- ADD BUTTON -->
<div class="d-flex justify-content-end mb-3">
    <button class="btn btn-success"
            data-bs-toggle="modal"
            data-bs-target="#addModal">
        <i class="fa fa-plus me-1"></i> Thêm tài khoản
    </button>
</div>

<!-- USER LIST TABLE -->
<div class="card shadow-sm">
    <div class="card-body">

        <table class="table table-hover align-middle">
            <thead class="table-light">
            <tr>
                <th>Avatar</th>
                <th>Username</th>
                <th>Họ tên</th>
                <th>Email</th>
                <th>Phone</th>
                <th>Admin</th>
                <th>Active</th>
                <th>Thao tác</th>
            </tr>
            </thead>

            <tbody>
            <c:forEach var="u" items="${list}">
                <tr>

                    <!-- AVATAR -->
                    <td>
                        <img src="${pageContext.request.contextPath}/uploads/user/${u.images}"
                             class="rounded-circle"
                             style="width:55px; height:55px; object-fit:cover;"
                             onerror="this.src='https://via.placeholder.com/55'">
                    </td>

                    <td>${u.username}</td>
                    <td>${u.fullname}</td>
                    <td>${u.email}</td>
                    <td>${u.phone}</td>

                    <!-- ADMIN -->
                    <td>
                        <span class="badge ${u.admin ? 'bg-success' : 'bg-secondary'}">
                            ${u.admin ? 'Admin' : 'User'}
                        </span>
                    </td>

                    <!-- ACTIVE -->
                    <td>
                        <span class="badge ${u.active ? 'bg-primary' : 'bg-dark'}">
                            ${u.active ? 'Yes' : 'No'}
                        </span>
                    </td>

                    <!-- ACTIONS -->
                    <td>
                        <!-- EDIT -->
                        <a href="${pageContext.request.contextPath}/admin/users?action=edit&username=${u.username}"
                           class="btn btn-warning btn-sm">
                            <i class="fa-solid fa-pen"></i>
                        </a>

                        <!-- DELETE -->
                        <form class="d-inline"
                              method="post"
                              action="${pageContext.request.contextPath}/admin/users">
                            <input type="hidden" name="action" value="delete"/>
                            <input type="hidden" name="username" value="${u.username}"/>
                            <button class="btn btn-danger btn-sm"
                                    onclick="return confirm('Xóa tài khoản này?')">
                                <i class="fa-solid fa-trash"></i>
                            </button>
                        </form>
                    </td>

                </tr>
            </c:forEach>
            </tbody>
        </table>

    </div>
</div>

<!-- ======================== ADD USER MODAL ======================== -->
<div class="modal fade" id="addModal">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">

            <form method="post"
                  enctype="multipart/form-data"
                  action="${pageContext.request.contextPath}/admin/users">

                <input type="hidden" name="action" value="create"/>

                <div class="modal-header">
                    <h5 class="modal-title">Thêm tài khoản</h5>
                    <button class="btn-close" data-bs-dismiss="modal"></button>
                </div>

                <div class="modal-body">

                    <div class="row">
                        <div class="col-md-6">

                            <label class="form-label">Username</label>
                            <input type="text" name="username" class="form-control" required>

                            <label class="form-label mt-3">Password</label>
                            <input type="password" name="password" class="form-control" required>

                            <label class="form-label mt-3">Fullname</label>
                            <input type="text" name="fullname" class="form-control" required>

                            <label class="form-label mt-3">Phone</label>
                            <input type="text" name="phone" class="form-control" required>

                        </div>

                        <div class="col-md-6">

                            <label class="form-label">Email</label>
                            <input type="email" name="email" class="form-control" required>

                            <label class="form-label mt-3">Avatar</label>
                            <input type="file" name="avatar" class="form-control" accept="image/*">

                            <div class="form-check mt-3">
                                <input class="form-check-input" type="checkbox" name="admin">
                                <label class="form-check-label">Admin?</label>
                            </div>

                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" name="active" checked>
                                <label class="form-check-label">Active</label>
                            </div>

                        </div>
                    </div>

                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                    <button type="submit" class="btn btn-success">Lưu</button>
                </div>

            </form>

        </div>
    </div>
</div>

<!-- ======================== AUTO SHOW EDIT MODAL ======================== -->
<c:if test="${not empty userEdit}">
<script>
    new bootstrap.Modal(document.getElementById("editModal")).show();
</script>
</c:if>

<!-- ======================== EDIT USER MODAL ======================== -->
<c:if test="${not empty userEdit}">
<div class="modal fade" id="editModal">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">

            <form method="post"
                  enctype="multipart/form-data"
                  action="${pageContext.request.contextPath}/admin/users">

                <input type="hidden" name="action" value="update"/>
                <input type="hidden" name="username" value="${userEdit.username}"/>
                <input type="hidden" name="avatarOld" value="${userEdit.images}"/>

                <div class="modal-header">
                    <h5 class="modal-title">Sửa tài khoản</h5>
                    <button class="btn-close" data-bs-dismiss="modal"></button>
                </div>

                <div class="modal-body">

                    <div class="row">
                        <div class="col-md-6">

                            <label class="form-label">Password</label>
                            <input type="password" name="password" class="form-control"
                                   value="${userEdit.password}" required>

                            <label class="form-label mt-3">Fullname</label>
                            <input type="text" name="fullname"
                                   value="${userEdit.fullname}" class="form-control" required>

                            <label class="form-label mt-3">Phone</label>
                            <input type="text" name="phone"
                                   value="${userEdit.phone}" class="form-control" required>

                        </div>

                        <div class="col-md-6">

                            <label class="form-label">Email</label>
                            <input type="email" name="email"
                                   value="${userEdit.email}" class="form-control" required>

                            <label class="form-label mt-3">Avatar</label>
                            <input type="file" name="avatar" class="form-control" accept="image/*">

                            <img src="${pageContext.request.contextPath}/uploads/user/${userEdit.images}"
                                 class="rounded-circle mt-2"
                                 style="width:60px; height:60px; object-fit:cover;">

                            <div class="form-check mt-3">
                                <input class="form-check-input" type="checkbox" name="admin"
                                       <c:if test="${userEdit.admin}">checked</c:if>>
                                <label class="form-check-label">Admin?</label>
                            </div>

                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" name="active"
                                       <c:if test="${userEdit.active}">checked</c:if>>
                                <label class="form-check-label">Active</label>
                            </div>

                        </div>
                    </div>

                </div>

                <div class="modal-footer">
                    <button class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                    <button class="btn btn-primary">Cập nhật</button>
                </div>

            </form>

        </div>
    </div>
</div>
</c:if>
