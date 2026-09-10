<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/category/common/taglib.jsp"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <title>Category Form</title>
</head>
<body>
<section class="container mt-4">
    <div class="card">
        <div class="card-header">${category.categoryId == null ? 'Thêm Category' : 'Cập nhật Category'}</div>
        <div class="card-body">
            <form:form method="post" action="/admin/categories/save" modelAttribute="category">
                <form:hidden path="categoryId"/>
                <div class="mb-3">
                    <label class="form-label">Category Code</label>
                    <form:input path="categorycode" class="form-control"/>
                </div>
                <div class="mb-3">
                    <label class="form-label">Category Name</label>
                    <form:input path="categoryname" class="form-control"/>
                </div>
                <div class="mb-3">
                    <label class="form-label">Images</label>
                    <form:input path="images" class="form-control"/>
                </div>
                <div class="mb-3 form-check">
                    <form:checkbox path="status" class="form-check-input"/>
                    <label class="form-check-label">Status</label>
                </div>
                <button type="submit" class="btn btn-primary">Lưu</button>
                <a href="/admin/categories" class="btn btn-secondary">Quay lại</a>
            </form:form>
        </div>
    </div>
</section>
</body>
</html>
