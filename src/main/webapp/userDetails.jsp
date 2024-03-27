<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>${user.firstName}</title>
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
		<hr>
		<div class="row">
			<div class="col-md-6">
				<div class="card-cus">
					<div class="card-header">
						<h3 class="card-title">User Details</h3>
					</div>
					<div class="card-body ">
						<p class="card-text ">Library User ID: ${user.id}</p>
						<p class="card-text">Email: ${user.email}</p>
						<p class="card-text">First Name: ${user.firstName}</p>
						<p class="card-text">Last Name: ${user.lastName}</p>
						<p class="card-text">Password: ${user.password}</p>
						<p class="card-text">Phone Number: ${user.phoneNumber}</p>
						<p class="card-text">Roles: ${user.roles}</p>
						<p class="card-text">Student ID: ${user.student_id}</p>
						<p class="card-text">Username: ${user.username}</p>
					</div>
				</div>
			</div>
			<div class="col-md-6">

				<div class="card-cus">
					<div class="card-header">
						<h3 class="card-title">User History</h3>
					</div>
					<div class="card-body ">
						<div class="table-responsive">
							<table class="table text-white bg-secondary rounded rounded-3 text-nowrap ">
								<thead class="bg-secondary">
									<tr>
										<th>ID</th>
										<th>Book isbn</th>
										<th>Borrowed At</th>
										<th>Due At</th>
										<th>Returned At</th>
										<th>Modified At</th>
										<th>Paid</th>
									</tr>
								</thead>

								<%
								request.setAttribute("currentTime", new java.util.Date());
								%>

								<c:forEach items="${userHistory}" var="history">
									<c:choose>
										<c:when test="${empty history.returned_at }">
											<c:if test="${history.due_at.after(currentTime) }">
												<tr class="table-warning">
											</c:if>
											<c:if test="${ currentTime.after(history.due_at) }">
												<tr class="table-danger">
											</c:if>
										</c:when>
										<c:otherwise>
											<tr class="table-success">
										</c:otherwise>
									</c:choose>

									<td><button history-id="${history.id}" class="btn btn-success rounded-pill bg-success history-del-btn">Ret</button> ${history.id}</td>
									<td>${history.book_id.isbn}</td>
									<td>${history.borrowed_at}</td>
									<td>${history.due_at}</td>
									<td>${history.returned_at}</td>
									<td>${history.modified_at}</td>
									<td>${history.paid}</td>
									</tr>
								</c:forEach>
							</table>
						</div>
					</div>
				</div>
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
    background-color: #ffffff47;
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
	<script type="text/javascript" src ="/js/bookReturnHandler.js"></script>
</body>
</html>
