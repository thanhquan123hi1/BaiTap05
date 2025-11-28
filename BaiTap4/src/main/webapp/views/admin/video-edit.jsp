<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<div class="container py-4">

    <div class="card shadow-sm">
        <div class="card-header bg-warning text-white fw-bold">
            <i class="fa-solid fa-pen-film me-2"></i> Chỉnh sửa Video
        </div>

        <div class="card-body p-4">

            <form action="${pageContext.request.contextPath}/admin/videos/edit"
                  method="post" enctype="multipart/form-data">

                <input type="hidden" name="videoid" value="${video.videoId}">
                <input type="hidden" name="posterOld" value="${video.poster}">

                <div class="mb-3">
                    <label class="form-label fw-semibold">Tiêu đề</label>
                    <input type="text" name="title"
                           value="${video.title}" class="form-control form-control-lg">
                </div>

                <div class="mb-3">
                    <label class="form-label fw-semibold">Category</label>
                    <select class="form-select" name="categoryid">
                        <c:forEach var="c" items="${categories}">
                            <option value="${c.categoryId}"
                                <c:if test="${c.categoryId == video.category.categoryId}">selected</c:if>>
                                ${c.categoryName}
                            </option>
                        </c:forEach>
                    </select>
                </div>

                <div class="mb-3">
                    <label class="form-label fw-semibold">Mô tả</label>
                    <textarea name="description" class="form-control" rows="3">${video.description}</textarea>
                </div>

                <div class="mb-3">
                    <label class="form-label fw-semibold">Poster hiện tại</label><br>
                    <img src="${pageContext.request.contextPath}/uploads/video/${video.poster}"
                         class="rounded border" width="130">

                    <input type="file" class="form-control mt-3"
                           name="posterFile" accept="image/*">
                </div>

                <div class="mb-3">
                    <label class="form-label fw-semibold">Views</label>
                    <input type="number" name="views"
                           class="form-control" value="${video.views}">
                </div>

                <div class="mb-3">
                    <input type="checkbox" name="active"
                           <c:if test="${video.active}">checked</c:if>>
                    Active
                </div>

                <button class="btn btn-warning px-4 text-white fw-semibold">Cập nhật</button>
                <a href="${pageContext.request.contextPath}/admin/videos" class="btn btn-secondary">Hủy</a>

            </form>
        </div>
    </div>
</div>
