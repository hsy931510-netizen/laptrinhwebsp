<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/category/common/taglib.jsp"%>
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
        <div class="card-header d-flex justify-content-between align-items-center">
            <span>Danh sách User</span>
            <a href="/admin/users/create" class="btn btn-primary">Thêm mới</a>
        </div>
        <div class="card-body">
            <form method="get" action="/admin/users" class="row g-3 mb-3">
                <div class="col-md-6">
                    <input type="text" name="keyword" value="${keyword}" class="form-control" placeholder="Tìm kiếm username, email, phone...">
                </div>
                <div class="col-md-2">
                    <button type="submit" class="btn btn-outline-primary">Tìm kiếm</button>
                </div>
            </form>

            <c:if test="${message != null}">
                <div class="alert alert-success">${message}</div>
            </c:if>

            <div class="table-responsive">
                <table class="table table-striped">
                    <thead class="table-dark">
                    <tr>
                        <th>ID</th>
                        <th>Username</th>
                        <th>Email</th>
                        <th>Phone</th>
                        <th>Role</th>
                        <th>Status</th>
                        <th>Action</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:choose>
                        <c:when test="${empty users}">
                            <tr>
                                <td colspan="7" class="text-center">Không có dữ liệu</td>
                            </tr>
                        </c:when>
                        <c:otherwise>
                            <c:forEach items="${users}" var="user">
                                <tr>
                                    <td>${user.userId}</td>
                                    <td>${user.username}</td>
                                    <td>${user.email}</td>
                                    <td>${user.phone}</td>
                                    <td>${user.role}</td>
                                    <td>${user.status ? 'Active' : 'Inactive'}</td>
                                    <td>
                                        <a href="/admin/users/edit/${user.userId}" class="btn btn-warning btn-sm">Sửa</a>
                                        <a href="/admin/users/delete/${user.userId}" class="btn btn-danger btn-sm" onclick="return confirm('Bạn có chắc chắn xóa?');">Xóa</a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </c:otherwise>
                    </c:choose>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</section>
</body>
</html>
