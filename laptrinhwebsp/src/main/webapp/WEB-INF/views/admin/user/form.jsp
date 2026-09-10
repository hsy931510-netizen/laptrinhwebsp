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
    <title>Quản lý User</title>
</head>
<body>
<section class="container mt-4">
    <div class="card">
        <div class="card-header">${user.userId == null ? 'Thêm User' : 'Cập nhật User'}</div>
        <div class="card-body">
            <form:form method="post" action="/admin/users/save" modelAttribute="user">
                <form:hidden path="userId"/>
                <div class="mb-3">
                    <label class="form-label">Username</label>
                    <form:input path="username" class="form-control"/>
                </div>
                <div class="mb-3">
                    <label class="form-label">Email</label>
                    <form:input path="email" class="form-control"/>
                </div>
                <div class="mb-3">
                    <label class="form-label">Password</label>
                    <form:password path="password" class="form-control"/>
                </div>
                <div class="mb-3">
                    <label class="form-label">Phone</label>
                    <form:input path="phone" class="form-control"/>
                </div>
                <div class="mb-3">
                    <label class="form-label">Role</label>
                    <form:select path="role" class="form-select">
                        <form:option value="ADMIN">ADMIN</form:option>
                        <form:option value="USER">USER</form:option>
                    </form:select>
                </div>
                <div class="mb-3 form-check">
                    <form:checkbox path="status" class="form-check-input"/>
                    <label class="form-check-label">Active</label>
                </div>
                <button type="submit" class="btn btn-primary">Lưu</button>
                <a href="/admin/users" class="btn btn-secondary">Quay lại</a>
            </form:form>
        </div>
    </div>
</section>
</body>
</html>
