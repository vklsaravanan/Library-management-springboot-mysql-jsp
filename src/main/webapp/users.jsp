<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Users</title>
<style>
/* Add custom styles here */
.social-links {
	margin-top: 20px;
}

.social-links a {
	display: inline-block;
	margin-right: 10px;
}
</style>
</head>
<body>

	<div class="container">
		<header>
			<%@ include file="../template/navbar.jsp"%>
		</header>
		<div
			class="d-flex flex-row justify-content-between align-items-center">
			<h1 class="mb-4">Users</h1>
			<form action="/users/addUser" class="mb-3">
				<button type="submit" class="btn btn-cus">Add User</button>
			</form>
		</div>

		<form action="/users" method="get" class="mb-3  row d-flex  justify-content-center">
			<div class="input-group"  style="width: 500px;">
				<input type="text" class="form-control" name="keyword"
					value="${keyword}" placeholder="Search users by student_id">
				<button type="submit" class="btn btn-success">Search</button>
			</div>
		</form>


		<div class="table-responsive">
			<table class="table table-bordered table-info">
				<thead class="table-dark">
					<tr>
						<th>Actions</th>
						<th>Username</th>
						<th>Firstname</th>
						<th>student_id</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${users}" var="user">
						<tr id="user-row-id-${user.id}">
							<td>
								<div class="btn-group" role="group">
									<button type="button" class="btn btn-cus dropdown-toggle"
										data-bs-toggle="dropdown" aria-expanded="false">Options</button>
									<ul class="dropdown-menu" aria-labelledby="dropdownMenuLink">
										<li><button class="dropdown-item btn-del-user"
												btn-id="book-delete-btn" del-user-id="${user.id}">Delete</button></li>
										<li><form action="/users/update/${user.id}">
												<button class="dropdown-item" type="submit">Update</button>
											</form></li>
									</ul>
								</div>
							</td>
							<td><a class=" fw-bolder text-primary" href="admin/user/${user.id}"
								class="text-decoration-none">${user.username}</a></td>
							<td>${user.firstName}</td>
							<td>${user.student_id}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>

		<c:if test="${totalPages > 0}">
			<nav aria-label="Page navigation">
				<ul class="pagination">
					<c:forEach begin="0" end="${totalPages - 1}" varStatus="i">
						<li class="page-item"><a class="page-link"
							href="/users?page=${i.index}&keyword=${keyword}">${i.index + 1}</a></li>
					</c:forEach>
				</ul>
			</nav>
		</c:if>

	</div>
	<style>
.btn-cus {
	background-color: #5b43bf;
	color: white;
	border-radius: 37px;
	padding-inline: 30px
}
body {
    background: url(/image/bg/usersBg.png);
    background-size: cover;
    background-position: top;
    backdrop-filter: blur(1px);
    background-attachment: fixed;
    min-height: 100vh;
}
</style>
	<!-- footer -->
	<%@ include file="../template/footer.jsp"%>
	<script type="text/javascript" src="/js/users.js"></script>
</body>
</html>
