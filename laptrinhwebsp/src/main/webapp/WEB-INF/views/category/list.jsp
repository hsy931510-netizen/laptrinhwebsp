<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/category/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">

<!-- Font Awesome (cần cho icon fa-info, fa-edit, fa-trash) -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

<title>Hello, world!</title>
</head>
<body>
	<section class="row">
		<div class="col mt-4">
			<div class="card">
				<div class="card-header d-flex justify-content-between align-items-center">
					<span>List Category</span>
					<a href="/admin/categories/create" class="btn btn-primary btn-sm">Thêm mới</a>
				</div>
				<div class="card-body">
					<form method="get" action="/admin/categories" class="row g-3 mb-3">
						<div class="col-md-6">
							<input type="text" name="keyword" value="${keyword}" class="form-control" placeholder="Tìm kiếm theo mã hoặc tên danh mục...">
						</div>
						<div class="col-md-2">
							<button type="submit" class="btn btn-outline-primary">Tìm kiếm</button>
						</div>
					</form>

					<c:if test="${message != null}">
						<div class="alert alert-primary" role="alert">
							<i>${message}</i>
						</div>
					</c:if>

					<div class="table-responsive">
						<table class="table table-striped">
							<thead class="table-dark">
								<tr>
									<th>Category ID</th>
									<th>Category Name</th>
									<th>Action</th>
								</tr>
							</thead>
							<tbody>
								<c:choose>
									<c:when test="${empty category}">
										<tr>
											<td colspan="3" class="text-center">Không có dữ liệu</td>
										</tr>
									</c:when>
									<c:otherwise>
										<c:forEach items="${category}" var="category">
											<tr>
												<td scope="row">${category.categoryId}</td>
												<td>${category.categoryname}</td>
												<td>
													<a href="/admin/categories/view/${category.categoryId}"
														class="btn btn-outline-info" title="Xem chi tiết">
														<i class="fa fa-info"></i>
													</a>
													<a href="/admin/categories/edit/${category.categoryId}"
														class="btn btn-outline-warning" title="Sửa">
														<i class="fa fa-edit"></i>
													</a>

													<!-- Xóa dùng form POST thay vì GET, có xác nhận trước khi xóa -->
													<form action="/admin/categories/delete/${category.categoryId}"
														method="post" style="display:inline;">
														<button type="submit" class="btn btn-outline-danger"
															title="Xóa"
															onclick="return confirm('Bạn có chắc muốn xóa danh mục này?');">
															<i class="fa fa-trash"></i>
														</button>
													</form>
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
		</div>
	</section>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>

</body>
</html>
