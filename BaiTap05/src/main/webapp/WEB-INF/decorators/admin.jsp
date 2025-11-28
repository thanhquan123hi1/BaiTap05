<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp" %>
<c:url value="/" var="URL"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Admin Panel</title>

    <!-- VIEWPORT -->
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700|Source+Sans+Pro:200,300,400,600,700,900"
          rel="stylesheet">

    <link href="${URL}assets/global/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet">

    <!-- BOOTSTRAP 3 CSS — KEEP FOR HEADER -->
    <link href="${URL}assets/global/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- METRONIC THEME CSS -->
    <link href="${URL}assets/global/css/components.css" rel="stylesheet">
    <link href="${URL}assets/frontend/layout/css/style.css" rel="stylesheet">
    <link href="${URL}assets/frontend/layout/css/style-responsive.css" rel="stylesheet">
    <link href="${URL}assets/frontend/layout/css/themes/red.css" rel="stylesheet">
    <link href="${URL}assets/frontend/layout/css/custom.css" rel="stylesheet">


    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"/>

    <style>
        .admin-container {
            padding-top: 35px;
            padding-bottom: 80px;
            max-width: 1150px;
            margin: auto;
        }

        .welcome-banner {
            background: linear-gradient(to right, #4e73df, #224abe);
            color: white;
            padding: 28px;
            border-radius: 14px;
            margin-bottom: 30px;
        }

        .dashboard-card {
            background: #fff;
            border-radius: 14px;
            padding: 22px;
            box-shadow: 0 4px 20px rgba(0,0,0,0.06);
            transition: 0.25s;
        }

        .dashboard-card:hover {
            transform: translateY(-6px);
            box-shadow: 0 12px 30px rgba(0,0,0,0.12);
        }

        .icon-box {
            width: 60px;
            height: 60px;
            border-radius: 12px;
            font-size: 22px;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-right: 18px;
        }

        .bg-blue-soft { background: #d9eaff; color: #0d6efd; }
        .bg-green-soft { background: #d6f5e3; color: #198754; }
        .bg-purple-soft { background: #f0e1ff; color: #6f42c1; }
        .bg-red-soft { background: #ffe1e1; color: #dc3545; }

        .modal-backdrop.show { opacity: 0.35 !important; }
        .modal { z-index: 99999 !important; }
    </style>
</head>

<body class="ecommerce">

<!-- HEADER (KEEP ORIGINAL CSS) -->
<%@ include file="/common/admin/header.jsp" %>

<div class="main">
    <div class="container admin-container">
        <!-- PAGE CONTENT -->
        <sitemesh:write property="body"/>
    </div>
</div>



<!-- KEEP jQuery (Metronic needs it) -->
<script src="${URL}assets/global/plugins/jquery.min.js"></script>

<!-- REMOVE Bootstrap 3 JS (CAUSES MODAL BUG) -->
<!-- <script src="${URL}assets/global/plugins/bootstrap/js/bootstrap.min.js"></script> -->

<!-- USE BOOTSTRAP 5 JS FOR MODAL -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

<!-- METRONIC JS -->
<script src="${URL}assets/frontend/layout/scripts/back-to-top.js"></script>
<script src="${URL}assets/global/plugins/jquery-slimscroll/jquery.slimscroll.min.js"></script>
<script src="${URL}assets/frontend/layout/scripts/layout.js"></script>

<script>
    jQuery(document).ready(function () {
        Layout.init();
        Layout.initFixHeaderWithPreHeader();
    });
</script>

</body>
</html>
