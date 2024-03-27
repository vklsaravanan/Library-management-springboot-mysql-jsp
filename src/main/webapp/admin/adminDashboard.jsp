<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Dashboard|${user.firstName}</title>


</head>
<body>

	<div class="container">
		<header>
			<%@ include file="../template/navbar.jsp"%>
		</header>

		<h1>Welcome, ${user.firstName}</h1>
		<hr>
		<div class="row">
			<div class="col-md-6">
				<div class="card-cus mt-3">
					<div class="card-header">
						<h5 class="card-title">Your Information</h5>
					</div>
					<div class="card-body">
						<p class="card-text">Username: ${user.username}</p>
						<p class="card-text">first Name: ${user.firstName}</p>
						<p class="card-text">Email: ${user.email}</p>
						<p class="card-text">Role: ${user.roles}</p>
						<p class="card-text">phone: ${user.phoneNumber}</p>
						<p class="card-text">Email: ${user.email}</p>
					</div>
				</div>
			</div>
			<div class="col-md-6">
				<div class="card-cus mt-3">
					<div class="card-header">
						<h5 class="card-title">Admin Actions</h5>
					</div>
					<div class="card-body">
						<span> <a href="../book/addBook" class="btn btn-cus">Add Book</a> <a
							href="../users/addUser" class="btn btn-cus">Add User</a> 
							<a href="../new_book_borrow_form"
							class="btn btn-cus">Take book</a>
						</span>
					</div>
				</div>
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
</body>
</html>
