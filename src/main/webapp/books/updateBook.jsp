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

		<h3>Update Book</h3>
		<div class="row justify-content-center">
			<div class="col-lg-6">
				<form id="bookUpdateForm" book-id="${book.id}">
					<div class="mb-3">
						<label for="title" class="form-label">Title:</label> <input
							disabled="disabled" class="form-control disable d-none" name="id"
							value="${book.id}"> <input type="text" id="title"
							name="title" required class="form-control form-control-sm"
							value="${book.title}">
					</div>
					<div class="mb-3">
						<label for="author" class="form-label">Author:</label> <input
							type="text" id="author" name="author" required
							class="form-control form-control-sm" value="${book.author}">
					</div>
					<div class="mb-3">
						<label for="isbn" class="form-label">ISBN:</label> <input
							type="text" id="isbn" name="isbn" required
							class="form-control form-control-sm" value="${book.isbn}">
					</div>
					<div class="mb-3">
						<label for="year" class="form-label">Year:</label> <input
							type="number" id="year" name="year" required
							class="form-control form-control-sm" value="${book.year}">
					</div>
					<div class="mb-3">
						<label for="genre" class="form-label">Genre:</label> <select
							id="genre" name="genre_id" required
							class="form-select form-select-sm">
							<c:forEach items="${genres}" var="genre">
								<option
									<c:if test="${book.genre_id.id == genre.id}"> selected </c:if>
									value="${genre.id}">${genre.name}</option>
							</c:forEach>
						</select>
					</div>
					<div class="mb-3">
						<label for="avl_count" class="form-label">Available Count:</label>
						<input type="number" id="avl_count" name="avl_count" min="1"
							required class="form-control form-control-sm"
							value="${book.avl_count}">
					</div>
					<button type="submit" class="btn btn-success">Save</button>
				</form>
			</div>
		</div>

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

.card-cus {
	background-color: #ffffff2e;
	backdrop-filter: blur(5px);
	border: 0px black solid;
	border-radius: 10px;
}

.btn-cus {
	background-color: #5b43bf;
	color: white;
	border-radius: 37px;
	padding-inline: 30px
}
</style>
	<!-- footer -->
	<%@ include file="../template/footer.jsp"%>
	<script type="text/javascript" src="/js/books.js"></script>
</body>
</html>
