<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<div class="row justify-content-center">
	<div class="col-md-8">
		<form action="<c:url value='/admin/categories/saveOrUpdate' />" method="POST">
			
			<div class="card shadow-sm border-0">
				<div class="card-header bg-primary text-white text-center py-3">
					<h4 class="mb-0">
						<i class="fas ${category.isEdit ? 'fa-edit' : 'fa-plus-circle'}"></i> 
						${category.isEdit ? 'Cập nhật Danh mục' : 'Thêm mới Danh mục'}
					</h4>
				</div>

				<div class="card-body p-4">
					<input type="hidden" name="isEdit" value="${category.isEdit}">

					<div class="mb-3">
						<label for="categoryId" class="form-label fw-bold">Category ID</label>
						<input type="text" 
							   readonly="readonly" 
							   class="form-control bg-light" 
							   value="${category.id}" 
							   id="categoryId" 
							   name="id" 
							   placeholder="Tự động tạo ID">
					</div>

					<div class="mb-3">
						<label for="name" class="form-label fw-bold">Tên Danh mục <span class="text-danger">*</span></label>
						<input type="text" 
							   class="form-control" 
							   value="${category.name}" 
							   id="name" 
							   name="name" 
							   placeholder="Nhập tên danh mục"
							   required>
					</div>
					
					<div class="mb-3">
						<label for="images" class="form-label fw-bold">Hình ảnh (URL)</label>
						<input type="text" 
							   class="form-control" 
							   value="${category.images}" 
							   id="images" 
							   name="images" 
							   placeholder="https://example.com/image.jpg">
						<c:if test="${category.isEdit && category.images != null}">
							<img src="${category.images}" alt="Preview" class="mt-2 rounded" style="max-height: 100px;">
						</c:if>
					</div>

					<div class="mb-3 form-check">
						<input type="checkbox" class="form-check-input" id="status" name="status" value="true" ${category.status ? 'checked' : ''}>
						<label class="form-check-label fw-bold" for="status">Hoạt động (Active)</label>
					</div>
				</div>

				<div class="card-footer bg-white d-flex justify-content-between align-items-center py-3">
					<a href="<c:url value='/admin/categories' />" class="btn btn-secondary">
						<i class="fas fa-arrow-left"></i> Quay lại
					</a>

					<button class="btn btn-primary px-4" type="submit">
						<c:if test="${category.isEdit}">
							<i class="fas fa-save"></i> Cập nhật
						</c:if>
						<c:if test="${!category.isEdit}">
							<i class="fas fa-save"></i> Lưu lại
						</c:if>
					</button>
				</div>
			</div>
		</form>
	</div>
</div>