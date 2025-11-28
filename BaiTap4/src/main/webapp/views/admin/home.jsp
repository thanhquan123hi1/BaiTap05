<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<div class="admin-container">

    <!-- Welcome Banner -->
    <div class="welcome-banner d-flex justify-content-between align-items-center">
        <div>
            <h2 class="fw-bold mb-1">Xin chào, ${username}! 👋</h2>
            <p class="opacity-75 mb-0">Chào mừng bạn trở lại hệ thống quản trị.</p>
        </div>
        <div class="d-none d-md-block">
            <i class="fa-solid fa-user-shield fa-3x opacity-50"></i>
        </div>
    </div>

    <!-- Title -->
    <h5 class="text-muted mb-4">DANH MỤC QUẢN LÝ</h5>

    <!-- Dashboard Cards -->
    <div class="row dashboard-row g-4">

        <!-- CATEGORY CARD -->
        <div class="col-md-6 col-lg-4">
            <a href="${pageContext.request.contextPath}/admin/categories" 
               class="dashboard-card p-4 text-decoration-none">
                <div class="d-flex align-items-center">
                    <div class="icon-box bg-blue-soft">
                        <i class="fa-solid fa-layer-group"></i>
                    </div>
                    <div>
                        <h5 class="card-title mb-1 text-dark">Quản lý Category</h5>
                        <p class="card-desc mb-0">Thêm, sửa, xóa danh mục video</p>
                    </div>
                </div>
            </a>
        </div>

        <!-- VIDEO CARD -->
        <div class="col-md-6 col-lg-4">
            <a href="${pageContext.request.contextPath}/admin/videos"
               class="dashboard-card p-4 text-decoration-none">
                <div class="d-flex align-items-center">
                    <div class="icon-box bg-green-soft">
                        <i class="fa-solid fa-film"></i>
                    </div>
                    <div>
                        <h5 class="card-title mb-1 text-dark">Quản lý Video</h5>
                        <p class="card-desc mb-0">Danh sách video, đăng video mới</p>
                    </div>
                </div>
            </a>
        </div>

        <!-- USER CARD -->
        <div class="col-md-6 col-lg-4">
            <a href="${pageContext.request.contextPath}/admin/users"
               class="dashboard-card p-4 text-decoration-none">
                <div class="d-flex align-items-center">
                    <div class="icon-box bg-purple-soft">
                        <i class="fa-solid fa-users"></i>
                    </div>
                    <div>
                        <h5 class="card-title mb-1 text-dark">Quản lý Người dùng</h5>
                        <p class="card-desc mb-0">Tài khoản và phân quyền</p>
                    </div>
                </div>
            </a>
        </div>

        <!-- LOGOUT CARD -->
        <div class="col-md-6 col-lg-4">
            <a href="${pageContext.request.contextPath}/logout"
               class="dashboard-card p-4 text-decoration-none border border-danger border-opacity-50">
                <div class="d-flex align-items-center">
                    <div class="icon-box bg-red-soft">
                        <i class="fa-solid fa-right-from-bracket"></i>
                    </div>
                    <div>
                        <h5 class="card-title text-danger mb-1">Đăng xuất</h5>
                        <p class="card-desc mb-0">Thoát khỏi hệ thống</p>
                    </div>
                </div>
            </a>
        </div>

    </div>

</div>
