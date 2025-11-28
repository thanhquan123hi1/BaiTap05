<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<style>
    .profile-card {
        background: #ffffff;
        padding: 35px 40px;
        border-radius: 8px;
        border: 1px solid #eee;
        box-shadow: 0 2px 10px rgba(0,0,0,0.05);
        width: 100%;
        margin: 0 auto;
        min-height: 400px;
    }

    .avatar-img {
        width: 270px;
        height: 270px;
        object-fit: cover;
        border-radius: 6px;
        box-shadow: 0 0 10px rgba(0,0,0,0.12);
    }

    .btn-logout {
        width: 70%;
        margin-top: 20px;
        background: #e74c3c;
        border: none;
    }
    .btn-logout:hover {
        background: #c0392b;
    }

    .btn-save {
        background: #ff6a00;
        border: none;
    }
    .btn-save:hover {
        background: #e65a00;
    }
</style>


<!-- TITLE -->
<div class="row margin-bottom-40">
    <div class="col-md-12 text-center">
        <h1 style="margin-top:40px;">TRANG CÁ NHÂN</h1>
        <p class="lead">Chào mừng, <strong>${sessionScope.account.username}</strong> 👋</p>
        <hr style="max-width:300px; margin:auto;"/>
    </div>
</div>


<div class="row" style="margin-top: 40px; margin-bottom:80px;">

    <!-- LEFT SIDE: AVATAR + INFO -->
    <div class="col-md-4 text-center">

        <img src="${pageContext.request.contextPath}/uploads/user/${sessionScope.account.images}"
             class="avatar-img"
             onerror="this.src='https://via.placeholder.com/270?text=Avatar'">

        <h3 style="margin-top:20px; text-transform:uppercase;">
            ${sessionScope.account.fullname}
        </h3>

        <p style="color:#777;">${sessionScope.account.email}</p>

        <a href="${pageContext.request.contextPath}/logout"
           class="btn btn-danger btn-logout">
           <i class="fa fa-sign-out"></i> Đăng xuất
        </a>
    </div>


    <!-- RIGHT SIDE: PROFILE FORM -->
    <div class="col-md-8">
        <div class="profile-card">

            <!-- Alert -->
            <c:if test="${alert != null}">
                <div class="alert alert-warning">
                    ${alert}
                </div>
            </c:if>

            <form class="form-horizontal form-without-legend"
                  action="${pageContext.request.contextPath}/user/profile"
                  method="post"
                  enctype="multipart/form-data">

                <div class="form-group">
                    <label class="col-lg-4 control-label">Họ & tên</label>
                    <div class="col-lg-8">
                        <input type="text" name="fullname"
                               value="${sessionScope.account.fullname}"
                               class="form-control" required />
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-lg-4 control-label">Số điện thoại</label>
                    <div class="col-lg-8">
                        <input type="text" name="phone"
                               value="${sessionScope.account.phone}"
                               class="form-control" required />
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-lg-4 control-label">Ảnh đại diện</label>
                    <div class="col-lg-8">
                        <input type="file"
                               name="images"
                               class="form-control"
                               accept="image/*"/>
                    </div>
                </div>

                <div class="row" style="margin-top:20px;">
                    <div class="col-md-12 text-right">
                        <button type="submit" class="btn btn-save text-white">
                            <i class="fa fa-save"></i> Lưu thay đổi
                        </button>
                    </div>
                </div>

            </form>
        </div>
    </div>
</div>
