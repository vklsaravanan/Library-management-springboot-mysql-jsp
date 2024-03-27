<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Settings</title>

</head>
<body>

	<div class="container">
		<header>
			<%@ include file="../template/navbar.jsp"%>
		</header>
		<h1>Hi ${user.firstName}</h1>

		<h3>User password update </h3>
		<hr>
		<div class="row justify-content-center form-container">
			<div class="col-4">
				<form id="userSettingsForm">
					<!-- Input fields for user settings -->
					<div class="form-group">
						<label for="username">Username</label> <input type="text"
							class="form-control" id="username" name="username"
							value="${user.username}" readonly>
					</div>
					<div class="form-group">
						<label for="oldpassword">old password</label> <input type="text"
							class="form-control" id="oldpassword" name="oldpassword"
							placeholder="********">
					</div>
					<div class="form-group mb-3">
						<label for="password">Password</label> <input type="text"
							class="form-control" id="password" name="password">
					</div>

					<button type="submit" class="btn btn-success">Save Changes</button>
				</form>
			</div>
		</div>
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

form {
	padding: 35px;
	background-color: #ffffff36;
	border: 0px black solid;
	border-radius: 10px;
	backdrop-filter: blur(6px);
}
</style>

	<!-- footer -->
	<%@ include file="../template/footer.jsp"%>
	<script type="text/javascript" src="/js/userSettings.js"></script>
</body>
</html>
