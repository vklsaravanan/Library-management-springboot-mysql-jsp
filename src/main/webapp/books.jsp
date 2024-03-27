<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Books</title>
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
			<h1 class="mb-4">Books</h1>
			<form action="/book/addBook" class="mb-3">
				<button type="submit" class="btn btn-cus">Add Book</button>
			</form>
		</div>

		<form action="/books" method="get"
			class="mb-3 row d-flex  justify-content-center">
			<div class="input-group" style="width: 500px;">
				<input type="text" class="form-control" name="keyword"
					value="${keyword}" placeholder="Search by title">
				<button type="submit" class="btn btn-success">Search</button>
			</div>
		</form>

		<table class="table table-bordered table-striped rounded">
			<thead class="table-dark">
				<tr>
					<sec:authorize access="hasRole('ROLE_ADMIN')">
						<th>Actions</th>
					</sec:authorize>
					<th>Title</th>
					<th>Author</th>
					<th>Genre</th>
					<th>ISBN</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${books}" var="book">
					<tr id="book-row-id-${book.id}">
						<sec:authorize access="hasRole('ROLE_ADMIN')">
							<td>
								<div class="btn-group" role="group">
									<button type="button" class="btn btn-cus dropdown-toggle"
										data-bs-toggle="dropdown" aria-expanded="false">Options</button>
									<ul class="dropdown-menu" aria-labelledby="dropdownMenuLink">
										<li><button del-book-id="${book.id}"
												class="dropdown-item btn btn-primary btn-del-book">Delete</button></li>
										<li><form action="/book/update/${book.id}">
												<a href="/books/update/${book.id}" class="dropdown-item btn"
													type="submit">Update</a>
											</form></li>
									</ul>
								</div>
							</td>
						</sec:authorize>
						<td><a href="book/${book.id}" class="text-decoration-none fw-bolder text-primary ">${book.title}</a></td>
						<td>${book.author}</td>
						<td>${book.genre_id.name}</td>
						<td>${book.isbn}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

		<c:if test="${totalPages > 0}">
			<nav aria-label="Page navigation">
				<ul class="pagination">
					<c:forEach begin="0" end="${totalPages - 1}" varStatus="i">
						<li class="page-item"><a class="page-link"
							href="/books?page=${i.index}&keyword=${keyword}">${i.index + 1}</a></li>
					</c:forEach>
				</ul>
			</nav>
		</c:if>
	</div>


	<!-- footer -->
	<%@ include file="../template/footer.jsp"%>
	<script type="text/javascript" src="js/books.js"></script>
	<style>
.btn-cus {
	background-color: #5b43bf;
	color: white;
	border-radius: 37px;
	padding-inline: 30px
}

body {
	background: url(/image/bg/booksBg.jpg);
	background-size: cover;
	background-position: top;
	backdrop-filter: blur(10px);
	background-attachment: fixed;
	min-height: 100vh;
}
</style>
</body>
</html>


