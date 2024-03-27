<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Update User</title>

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

		<h3>Update User</h3>

		<form id="userUpdateForm" user-id="${user.id}"
			class="row justify-content-between">
			<div class="col col-md-4 m-3 col-sm-12">
				<input type="text" name="id" id="id" class="hidden d-none"
					value="${user.id}">
				<div class="">
					<label for="username" class="form-label">Username:</label> <input
						type="text" id="username" name="username" class="form-control"
						required value="${user.username}">
				</div>

				<div class="">
					<label for="student_id" class="form-label">Student ID:</label> <input
						type="text" id="student_id" name="student_id" class="form-control"
						value="${user.student_id}">
				</div>

				<div class="">
					<label for="password" class="form-label">Password:</label> <input
						type="password" id="password" name="password" class="form-control"
						required value="**********">
				</div>

				<div class="">
					<label for="firstName" class="form-label">First Name:</label> <input
						type="text" id="firstName" name="firstName" class="form-control"
						required value="${user.firstName}">
				</div>
			</div>
			<div class="col col-md-4 m3 col-sm-12">
				<div class="">
					<label for="lastName" class="form-label">Last Name:</label> <input
						type="text" id="lastName" name="lastName" class="form-control"
						required value="${user.lastName}">
				</div>

				<div class="">
					<label for="email" class="form-label">Email:</label> <input
						type="email" id="email" name="email" class="form-control" required
						value="${user.email}">
				</div>

				<div class="">
					<label for="phoneNumber" class="form-label">Phone Number:</label> <input
						type="tel" id="phoneNumber" name="phoneNumber"
						class="form-control" required value="${user.phoneNumber}">
				</div>

				<div class="">
					<label for="roles" class="form-label">Roles:</label> <select
						id="roles" name="roles" class="form-select" required>
						<option value="">Select Role</option>
						<option
							<c:if test="${user.roles == 'ROLE_ADMIN'}"> selected </c:if>
							value="ROLE_ADMIN">Admin</option>
						<option
							<c:if test="${user.roles == 'ROLE_USER'}"> selected </c:if>
							value="ROLE_USER">User</option>
					</select>
				</div>
			</div>
			<div class="d-grid gap-2 d-md-block col align-self-end">
				<button class="btn btn-primary r-0" type="submit">submit</button>
			</div>
		</form>

	</div>
	<style>
body {
	background: url(/image/bg/usersBg.png);
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
	<script type="text/javascript" src="/js/users.js"></script>
</body>
</html>
