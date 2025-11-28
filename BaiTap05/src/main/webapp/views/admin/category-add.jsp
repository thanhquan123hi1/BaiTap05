<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<div class="container py-4">

    <div class="card shadow-sm border-0">
        <div class="card-header bg-primary text-white fw-bold">
            <i class="fa-solid fa-square-plus me-2"></i> Thêm Category mới
        </div>

        <div class="card-body p-4">
            <form action="${pageContext.request.contextPath}/admin/categories/add"
                  method="post" enctype="multipart/form-data">

                <div class="mb-3">
                    <label class="form-label fw-semibold">Tên Category</label>
                    <input type="text" name="categoryname" class="form-control form-control-lg" required>
                </div>

                <div class="mb-3">
                    <label class="form-label fw-semibold">Code</label>
                    <input type="text" name="categorycode" class="form-control">
                </div>

                <div class="mb-3">
                    <div class="form-check">
                        <input type="checkbox" name="status" class="form-check-input">
                        <label class="form-check-label">Active</label>
                    </div>
                </div>

                <div class="mb-3">
                    <label class="form-label fw-semibold">Ảnh Icon</label>
                    <input type="file" name="images" required accept="image/*" class="form-control">
                    <img id="preview" class="rounded mt-3 border" style="width:130px; display:none;">
                </div>

                <button class="btn btn-primary px-4 fw-semibold">Lưu lại</button>
                <a href="${pageContext.request.contextPath}/admin/categories"
                   class="btn btn-secondary">Hủy</a>

            </form>
        </div>
    </div>
</div>

<script>
    document.querySelector("input[name='images']").addEventListener("change", (e)=>{
        let img = document.getElementById("preview");
        img.src = URL.createObjectURL(e.target.files[0]);
        img.style.display = "block";
    });
</script>
