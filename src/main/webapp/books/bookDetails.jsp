<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>${book.title}</title>

</head>
<body>

	<div class="container">
		<header>
			<%@ include file="../template/navbar.jsp"%>
		</header>

		<div class="container">
			<h1>Book details</h1>
			<hr>
			<div class="row row-md-12 row-sm-12">
				<div class="col col-md-6 col-sm-12">
					<div class="card-cus mt-2 text-dark	">
						<div class="card-header">
							<h5 class="card-title">Title: ${book.title}</h5>
						</div>
						<div class="card-body ">
							<p class="card-text">Author: ${book.author}</p>
							<p class="card-text">Isbn: ${book.isbn}</p>
							<p class="card-text">Genre: ${book.genre_id.name}</p>
							<p class="card-text">Year: ${book.year}</p>
							<p class="card-text">Avaiblabe Count: ${book.avl_count}</p>
						</div>
					</div>
					<sec:authorize access="hasRole('ROLE_ADMIN')">
						<div class="card-cus mt-2">
							<div class="card-header ">
								<h5 class="card-title">Currently borrowed Students</h5>
							</div>
							<div class="card-body">
								<ol>
									<c:forEach items="${bookUserHistory}" var="history">
										<c:if test="${empty history.returned_at }">
											<li class=""><a href="#" class="text-primary">
													${history.user_id.firstName} - ${history.user_id.student_id }</a>
											</li>
										</c:if>
									</c:forEach>
								</ol>
							</div>
						</div>
					</sec:authorize>
				</div>

				<sec:authorize access="hasRole('ROLE_ADMIN')">
					<div class="col col-md-6 mt-2 col-sm-12">
						<div class="card-cus">
							<div class="card-body">
								<h5 class="card-title">Book History</h5>
								<hr>
								<div class="table-responsive">
									<table
										class="table text-white bg-secondary rounded rounded-3 text-nowrap ">
										<thead class=" bg-secondary">
											<tr>
												<th>ID</th>
												<th>Student name</th>
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

										<c:forEach items="${bookUserHistory}" var="history">
											<c:choose>
												<c:when test="${empty history.returned_at }">
													<c:if test="${history.due_at.after(currentTime) }">
														<tr class="bg-warning">
													</c:if>
													<c:if test="${ currentTime.after(history.due_at) }">
														<tr class="bg-danger">
													</c:if>
												</c:when>
												<c:otherwise>
													<tr class="bg-success">
												</c:otherwise>
											</c:choose>

											<td>${history.id}</td>
											<td>${history.user_id.firstName}</td>
											<!-- Assuming user_id has an 'id' property -->
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
				</sec:authorize>
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
