<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>${user.firstName}|dashboard</title>


</head>
<body>

	<div class="container">
		<header>
			<%@ include file="../template/navbar.jsp"%>
		</header>

		<div class="container">
			<h1>Welcome, ${user.firstName}</h1>
			<hr>
			<div class="row">
				<div class="col-md-6">
					<div class="card-cus">
						<div class="card-body d-flex flex-column">
							<h5 class="card-title">User Dashboard</h5>
							<div>
								<p class="card-text ">Library User ID: ${user.id}</p>
								<p class="card-text">Email: ${user.email}</p>
								<p class="card-text">First Name: ${user.firstName}</p>
							</div>
							<div>
								<p class="card-text">Last Name: ${user.lastName}</p>
								<p class="card-text">Password: ${user.password}</p>
								<p class="card-text">Phone Number: ${user.phoneNumber}</p>
							</div>
							<div>
								<p class="card-text">Roles: ${user.roles}</p>
								<p class="card-text">Student ID: ${user.student_id}</p>
								<p class="card-text">Username: ${user.username}</p>
							</div>
						</div>
					</div>
				</div>
				<!-- Add more cards or sections for other user-related information -->
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
</style>

	<!-- footer -->
	<%@ include file="../template/footer.jsp"%>
</body>
</html>
