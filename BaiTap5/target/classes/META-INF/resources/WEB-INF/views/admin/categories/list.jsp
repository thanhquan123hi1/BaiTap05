<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<div class="container-fluid"> <c:if test="${message != null}">
		<div class="alert alert-primary alert-dismissible fade show" role="alert">
			<i class="fas fa-check-circle"></i> ${message}
			<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
		</div>
	</c:if>

	<div class="card shadow mb-4">
		<div class="card-header py-3 d-flex justify-content-between align-items-center">
			<h6 class="m-0 font-weight-bold text-primary">
				<i class="fas fa-list"></i> Danh sách Category
			</h6>
			
			<a href="<c:url value='/admin/categories/add'/>" class="btn btn-primary btn-sm">
				<i class="fas fa-plus-circle"></i> Thêm mới
			</a>
		</div>
		
		<div class="card-body">
			<form action="<c:url value='/admin/categories/search'/>" method="get" class="mb-3">
				<div class="input-group">
					<input type="text" class="form-control" name="keyword" placeholder="Tìm kiếm danh mục...">
					<button class="btn btn-outline-secondary" type="submit">
						<i class="fas fa-search"></i> Tìm
					</button>
				</div>
			</form>

			<div class="table-responsive">
				<table class="table table-bordered table-striped table-hover" id="dataTable" width="100%" cellspacing="0">
					<thead class="table-dark">
						<tr>
							<th width="5%" class="text-center">ID</th>
							<th width="15%" class="text-center">Image</th> <th>Category Name</th>
							<th width="10%" class="text-center">Status</th> <th width="15%" class="text-center">Action</th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${empty categories}">
							<tr>
								<td colspan="5" class="text-center text-muted py-4">
									<i class="fas fa-box-open fa-2x"></i><br>
									Chưa có dữ liệu.
								</td>
							</tr>
						</c:if>

						<c:forEach items="${categories}" var="category">
							<tr>
								<td class="text-center align-middle">${category.id}</td>
								
								<td class="text-center align-middle">
									<c:if test="${category.images != null && category.images.startsWith('http')}">
										<img src="${category.images}" width="70" height="50" style="object-fit: cover; border-radius: 5px;" alt="img">
									</c:if>
									<c:if test="${category.images == null || !category.images.startsWith('http')}">
										<img src="https://placehold.co/70x50?text=No+Img" style="border-radius: 5px;" alt="no-img">
									</c:if>
								</td>

								<td class="align-middle fw-bold">${category.name}</td>
								
								<td class="text-center align-middle">
									<c:if test="${category.status}">
										<span class="badge bg-success">Active</span>
									</c:if>
									<c:if test="${!category.status}">
										<span class="badge bg-secondary">Inactive</span>
									</c:if>
								</td>

								<td class="text-center align-middle">
									<a href="<c:url value='/admin/categories/edit/${category.id}'/>" 
									   class="btn btn-warning btn-sm" title="Edit">
										<i class="fas fa-edit"></i>
									</a> 
									
									<a href="<c:url value='/admin/categories/delete/${category.id}'/>" 
									   class="btn btn-danger btn-sm" 
									   onclick="return confirm('Bạn chắc chắn muốn xóa danh mục: ${category.name}?');"
									   title="Delete">
										<i class="fas fa-trash"></i>
									</a>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
		<div class="card-footer small text-muted text-center">
			Tổng số: ${categories.size()} bản ghi
		</div>
	</div>
</div>