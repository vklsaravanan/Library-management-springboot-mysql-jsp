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
		
		<h3>Book Borrowing form</h3>

		<form action="/admin/userBookHistory" method="post">
			<label for="title">Title:</label> <input type="text" id="title"
				name="title" required><br> <label for="author">Author:</label>
			<input type="text" id="author" name="author" required><br>

			<label for="isbn">ISBNo:</label> <input type="text" id="isbn"
				name="isbn" required><br> <label for="year">Year:</label>
			<input type="number" id="year" name="year" required><br>

			<button type="submit">Submit</button>
		</form>

	</div>
	 
	<!-- footer -->
	<%@ include file="../template/footer.jsp"%>
	
</body>
</html>