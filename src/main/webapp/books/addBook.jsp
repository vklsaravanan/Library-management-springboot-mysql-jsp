<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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

		<h3 class="text-center">Add Book</h3>
		<form id="bookCreateForm"
			class="d-flex justify-content-center flex-column col-4">
			<div class="mb-3">
				<label for="title" class="form-label">Title:</label> <input
					type="text" id="title" name="title" class="form-control" required>
			</div>
			<div class="mb-3">
				<label for="author" class="form-label">Author:</label> <input
					type="text" id="author" name="author" class="form-control" required>
			</div>
			<div class="mb-3">
				<label for="isbn" class="form-label">ISBN:</label> <input
					type="text" id="isbn" name="isbn" class="form-control" required>
			</div>
			<div class="mb-3">
				<label for="year" class="form-label">Year:</label> <input
					type="number" min="1900" max="2099" step="1" value="2016" id="year"
					name="year" class="form-control" required>
			</div>
			<div class="mb-3">
				<label for="genre" class="form-label">Genre:</label> <select
					id="genre" name="genre_id" class="form-select" required>
					<option value="">Select Genre</option>
					<c:forEach items="${genres}" var="genre">
						<option value="${genre.id}">${genre.name}</option>
					</c:forEach>
				</select>
			</div>
			<div class="mb-3">
				<label for="avl_count" class="form-label">Available Count:</label> <input
					type="number" id="avl_count" name="avl_count" min=0
					class="form-control" required>
			</div>
			<button type="submit" class="btn btn-primary">Submit</button>
		</form>

	</div>
	<style>
body {
	background: url(/image/bg/aboutBg.jpg);
	background-size: cover;
	background-position: top;
	backdrop-filter: blur(7px);
	background-attachment: fixed;
	min-height: 100vh;
}
</style>

	<!-- footer -->
	<%@ include file="../template/footer.jsp"%>
	<script type="text/javascript" src="/js/books.js"></script>
</body>
</html>
