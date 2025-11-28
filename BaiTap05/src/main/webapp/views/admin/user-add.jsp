<%@ page contentType="text/html; charset=UTF-8" %>

<div class="container py-4">

    <div class="card shadow-sm border-0">
        <div class="card-header bg-success text-white fw-bold">
            <i class="fa-solid fa-user-plus me-2"></i> Thêm tài khoản
        </div>

        <div class="card-body p-4">
            <form action="${pageContext.request.contextPath}/admin/users/add"
                  method="post" enctype="multipart/form-data">

                <div class="row">
                    <div class="col-md-6">

                        <label class="form-label">Username</label>
                        <input type="text" name="username" class="form-control" required>

                        <label class="form-label mt-3">Password</label>
                        <input type="password" name="password" class="form-control" required>

                        <label class="form-label mt-3">Fullname</label>
                        <input type="text" name="fullname" class="form-control" required>

                        <label class="form-label mt-3">Phone</label>
                        <input type="text" name="phone" class="form-control" required>

                    </div>

                    <div class="col-md-6">

                        <label class="form-label">Email</label>
                        <input type="email" name="email" class="form-control" required>

                        <label class="form-label mt-3">Avatar</label>
                        <input type="file" name="avatar" class="form-control" accept="image/*">

                        <img id="preview" class="rounded border mt-2" style="width:110px; display:none;">

                        <div class="mt-3 form-check">
                            <input type="checkbox" name="admin" class="form-check-input">
                            <label class="form-check-label">Admin?</label>
                        </div>

                        <div class="form-check">
                            <input type="checkbox" name="active" class="form-check-input" checked>
                            <label class="form-check-label">Active</label>
                        </div>

                    </div>
                </div>

                <button class="btn btn-success px-4 mt-3">Lưu</button>
                <a href="${pageContext.request.contextPath}/admin/users"
                   class="btn btn-secondary mt-3">Hủy</a>

            </form>
        </div>
    </div>
</div>

<script>
document.querySelector("input[name='avatar']").addEventListener("change", e=>{
    let prev=document.getElementById("preview");
    prev.src=URL.createObjectURL(e.target.files[0]);
    prev.style.display="block";
});
</script>
