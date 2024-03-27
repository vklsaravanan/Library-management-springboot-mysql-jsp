<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Add User</title>

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

		<h3>Add User</h3>

		<form id="userCreateForm" class="row justify-content-between align-items-center">
			<div class="col col-md-4 m-3 col-sm-12">
				<div class="">
					<label for="username" class="form-label">Username:</label> <input
						type="text" id="username" name="username" class="form-control"
						required>
				</div>

				<div class="">
					<label for="student_id" class="form-label">Student ID:</label> <input
						type="text" id="student_id" name="student_id" class="form-control">
				</div>

				<div class="">
					<label for="password" class="form-label">Password:</label> <input
						type="password" id="password" name="password" class="form-control"
						required>
				</div>

				<div class="">
					<label for="firstName" class="form-label">First Name:</label> <input
						type="text" id="firstName" name="firstName" class="form-control"
						required>
				</div>
			</div>
			<div class="col col-md-4 m3 col-sm-12">
				<div class="">
					<label for="lastName" class="form-label">Last Name:</label> <input
						type="text" id="lastName" name="lastName" class="form-control"
						required>
				</div>

				<div class="">
					<label for="email" class="form-label">Email:</label> <input
						type="email" id="email" name="email" class="form-control" required>
				</div>

				<div class="">
					<label for="phoneNumber" class="form-label">Phone Number:</label> <input
						type="tel" id="phoneNumber" name="phoneNumber"
						class="form-control" required>
				</div>

				<div class="">
					<label for="roles" class="form-label">Roles:</label> <select
						id="roles" name="roles" class="form-select" required>
						<option value="">Select Role</option>
						<option value="ROLE_ADMIN">Admin</option>
						<option value="ROLE_USER">User</option>
					</select>
				</div>
			</div>
			<div class="d-grid gap-2 d-md-block col align-self-end">
				<button class="btn btn-cus r-0" type="submit">submit</button>
			</div>
		</form>

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
label{
	font-weight: 500;
	text-shadow: 2px 2px 10px white;
}

</style>
	<!-- footer -->
	<%@ include file="../template/footer.jsp"%>
	<script type="text/javascript" src="/js/users.js" defer="defer"></script>
</body>
</html>
