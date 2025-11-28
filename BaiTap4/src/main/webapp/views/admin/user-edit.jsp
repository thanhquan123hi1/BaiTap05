<%@ page contentType="text/html; charset=UTF-8" %>

<div class="container py-4">

    <div class="card shadow-sm border-0">
        <div class="card-header bg-warning text-white fw-bold">
            <i class="fa-solid fa-user-pen me-2"></i> Cập nhật tài khoản
        </div>

        <div class="card-body p-4">
            <form action="${pageContext.request.contextPath}/admin/users/edit"
                  method="post" enctype="multipart/form-data">

                <input type="hidden" name="username" value="${u.username}">
                <input type="hidden" name="avatarOld" value="${u.images}">

                <div class="row">
                    <div class="col-md-6">

                        <label class="form-label">Password</label>
                        <input type="password" name="password"
                               value="${u.password}" class="form-control">

                        <label class="form-label mt-3">Fullname</label>
                        <input type="text" name="fullname"
                               value="${u.fullname}" class="form-control">

                        <label class="form-label mt-3">Phone</label>
                        <input type="text" name="phone"
                               value="${u.phone}" class="form-control">

                    </div>

                    <div class="col-md-6">

                        <label class="form-label">Email</label>
                        <input type="email" name="email"
                               value="${u.email}" class="form-control">

                        <label class="form-label mt-3">Avatar</label>
                        <input type="file" name="avatar"
                               class="form-control" accept="image/*">

                        <img src="${pageContext.request.contextPath}/uploads/user/${u.images}"
                             class="rounded border mt-2" width="110">

                        <div class="mt-3 form-check">
                            <input type="checkbox" name="admin"
                                    <c:if test="${u.admin}">checked</c:if>>
                            <label class="form-check-label">Admin?</label>
                        </div>

                        <div class="form-check">
                            <input type="checkbox" name="active"
                                    <c:if test="${u.active}">checked</c:if>>
                            <label class="form-check-label">Active</label>
                        </div>

                    </div>
                </div>

                <button class="btn btn-warning text-white px-4 mt-3 fw-semibold">Cập nhật</button>
                <a href="${pageContext.request.contextPath}/admin/users"
                   class="btn btn-secondary mt-3">Hủy</a>

            </form>
        </div>
    </div>
</div>
