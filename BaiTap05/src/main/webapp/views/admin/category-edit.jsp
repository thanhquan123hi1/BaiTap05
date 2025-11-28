<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<div class="container py-4">

    <div class="card shadow-sm border-0">
        <div class="card-header bg-warning text-white fw-bold">
            <i class="fa-solid fa-pen-to-square me-2"></i> Cập nhật Category
        </div>

        <div class="card-body p-4">
            <form action="${pageContext.request.contextPath}/admin/categories/edit"
                  method="post" enctype="multipart/form-data">

                <input type="hidden" name="categoryid" value="${cate.categoryId}">

                <div class="mb-3">
                    <label class="form-label fw-semibold">Tên Category</label>
                    <input type="text" name="categoryname"
                           value="${cate.categoryName}"
                           class="form-control form-control-lg" required>
                </div>

                <div class="mb-3">
                    <label class="form-label fw-semibold">Code</label>
                    <input type="text" name="categorycode"
                           value="${cate.categoryCode}" class="form-control">
                </div>

                <div class="mb-3">
                    <input type="checkbox" name="status"
                        <c:if test="${cate.status}">checked</c:if> >
                    Active
                </div>

                <div class="mb-3">
                    <label class="form-label fw-semibold">Ảnh hiện tại</label><br>
                    <img src="${pageContext.request.contextPath}/uploads/${cate.images}"
                         class="rounded border" width="130">

                    <input type="file" name="images" class="form-control mt-3" accept="image/*">
                </div>

                <button class="btn btn-warning text-white px-4 fw-semibold">Cập nhật</button>
                <a href="${pageContext.request.contextPath}/admin/categories"
                   class="btn btn-secondary">Hủy</a>

            </form>
        </div>
    </div>
</div>
