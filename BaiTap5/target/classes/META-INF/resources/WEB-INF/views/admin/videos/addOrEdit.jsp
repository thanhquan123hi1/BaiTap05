<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<div class="card shadow">
    <div class="card-header py-3">
        <h6 class="m-0 font-weight-bold text-primary">${isEdit ? 'Cập nhật Video' : 'Thêm mới Video'}</h6>
    </div>
    <div class="card-body">
        <form action="<c:url value='/admin/videos/save'/>" method="post" modelAttribute="video">
            <input type="hidden" name="id" value="${video.id}">

            <div class="mb-3">
                <label>Title</label>
                <input type="text" name="title" value="${video.title}" class="form-control" required>
            </div>

            <div class="mb-3">
                <label>Category</label>
                <select name="category.id" class="form-select">
                    <c:forEach items="${categories}" var="cat">
                        <option value="${cat.id}" ${cat.id == video.category.id ? 'selected' : ''}>
                            ${cat.name}
                        </option>
                    </c:forEach>
                </select>
            </div>

            <div class="mb-3">
                <label>Description</label>
                <textarea name="description" class="form-control" rows="3">${video.description}</textarea>
            </div>
            
            <div class="row">
                <div class="col-md-6 mb-3">
                     <label>Poster URL (Link ảnh)</label>
                     <input type="text" name="poster" value="${video.poster}" class="form-control">
                </div>
                <div class="col-md-6 mb-3">
                     <label>Lượt xem</label>
                     <input type="number" name="views" value="${video.views}" class="form-control">
                </div>
            </div>

            <div class="mb-3 form-check">
                <input type="checkbox" class="form-check-input" id="active" name="active" value="true" ${video.active ? 'checked' : ''}>
                <label class="form-check-label" for="active">Active</label>
            </div>

            <button type="submit" class="btn btn-primary"><i class="fas fa-save"></i> Save</button>
            <a href="<c:url value='/admin/videos'/>" class="btn btn-secondary">Back</a>
        </form>
    </div>
</div>