<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<div class="card shadow mb-4">
    <div class="card-header py-3 d-flex justify-content-between">
        <h6 class="m-0 font-weight-bold text-primary">Danh sách Video</h6>
        <a href="<c:url value='/admin/videos/add'/>" class="btn btn-primary btn-sm">Thêm mới</a>
    </div>
    <div class="card-body">
        <div class="table-responsive">
            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                <thead>
                    <tr>
                        <th>Poster</th>
                        <th>Title</th>
                        <th>Views</th>
                        <th>Category</th> <th>Status</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${videos}" var="item">
                        <tr>
                            <td class="text-center">
                                <img src="${item.poster}" width="80" height="50" style="object-fit: cover;" alt="poster">
                            </td>
                            <td>${item.title}</td>
                            <td>${item.views}</td>
                            <td>${item.category.name}</td> 
                            <td>
                                <span class="badge ${item.active ? 'bg-success' : 'bg-danger'}">
                                    ${item.active ? 'Active' : 'Inactive'}
                                </span>
                            </td>
                            <td>
                                <a href="<c:url value='/admin/videos/edit/${item.id}'/>" class="btn btn-warning btn-sm"><i class="fas fa-edit"></i></a>
                                <a href="<c:url value='/admin/videos/delete/${item.id}'/>" class="btn btn-danger btn-sm" 
                                   onclick="return confirm('Bạn chắc chắn muốn xóa video này?');"><i class="fas fa-trash"></i></a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>