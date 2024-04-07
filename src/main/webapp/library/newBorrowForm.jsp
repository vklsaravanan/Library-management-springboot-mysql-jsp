<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Borrow form</title>

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

		<h3 class="text-center">Enter Book and User Details</h3>

		<div class="row justify-content-center form-container">
			<div class="col-4">
				<form id="libraryHistoryCreateForm">
					<div class="mb-3 row justify-content-center">
						<label for="studentSelect" class="form-label">Select
							Student:</label> <select class="form-select" id="studentSelect"
							name="studentSelect">
							<c:forEach items="${users}" var="user">
								<option value="${user.id}">${user.student_id}-${user.firstName}-${user.email}</option>
							</c:forEach>
						</select>
					</div>
					<div class="mb-3 row justify-content-center">
						<label for="bookSelect" class="form-label">select book:</label> <select
							 class="form-select" id="bookSelect" name="bookSelect">
							<c:forEach items="${books}" var="book">
								<option value="${book.id}">${book.id}-${book.title}-${book.isbn}</option>
							</c:forEach>
						</select>
					</div>
					<div class="mb-3 row justify-content-center">
						<label for="days" class="form-label">Due Days:<span
							id="days-count">15</span></label> <input type="number"
							class="form-control p-0 " id="days" name="numberInput" min="0"
							max="15" required value="15">
					</div>
					<button type="submit" class="btn btn-success">Submit</button>
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
form{
    padding: 35px;
    background-color: #ffffff36;
    border: 0px black solid;
    border-radius: 10px;
    backdrop-filter: blur(6px);
    }
</style>

	<!-- footer -->
	<%@ include file="../template/footer.jsp"%>
	<script src="/js/jquerySelect/jquery.bs-select.min.js"></script>
	<script type="text/javascript" defer="defer"
		src="/js/borrowFormSelecter.js"></script>



</body>
</html>
