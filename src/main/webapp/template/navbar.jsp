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
</head>
<style>
.alert {
	left: 50%;
	min-width: 250px;
	max-width: 500px;
	text-wrap: wrap;
	padding: 10px;
	padding-right: 78px;
	transform: translateX(-50%);
}

.btn-cus {
	background-color: #5b43bf;
	color: white;
	border-radius: 37px;
	padding-inline: 30px
}
</style>
<link
	href="<c:url value="/webjars/bootstrap/5.1.0/css/bootstrap.min.css" />"
	rel="stylesheet">
<body>
	<%
	String baseUrl = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort();
	%>
	<script src="<%=baseUrl%>/webjars/jquery/1.9.1/jquery.min.js"
		type="text/javascript"></script>
	<script src="/js/jqueryElastic/domlastic.js"></script>

	<nav
		class="navbar navbar-expand-lg navbar-dark px-3 sticky-top top-navbar">
		<!-- Brand and toggle get grouped for better mobile display -->
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbar-collapse" aria-controls="navbar-collapse"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<a class="navbar-brand" href="#">Library manager</a>

		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse" id="navbar-collapse">
			<ul class="navbar-nav me-auto mb-2 mb-lg-0">
				<li class="nav-item"><a class="nav-link" href="/">Home</a></li>
				<li class="nav-item"><a class="nav-link" href="/about">About</a>
				</li>
				<li class="nav-item"><a class="nav-link" href="/books">Books</a>
				</li>
				<sec:authorize access="hasRole('ROLE_ADMIN')">
					<li class="nav-item"><a class="nav-link" href="/users">Users</a>
					</li>
					<li class="nav-item"><a class="nav-link "
						href="/new_book_borrow_form">Take book</a></li>
				</sec:authorize>
			</ul>
			<!-- Profile dropdown -->
			<ul class="navbar-nav ml-auto">
				<c:if test="${pageContext.request.userPrincipal != null}">
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
						role="button" data-bs-toggle="dropdown" aria-expanded="false">
							Profile </a>
						<ul class="dropdown-menu dropDownProfile "
							aria-labelledby="navbarDropdown">
							<li><a class="dropdown-item disabled my-name" href="#">${pageContext.request.userPrincipal.name}</a></li>
							<li><hr class="dropdown-divider"></li>
							<!-- if current user is ADMIN -->
							<sec:authorize access="hasRole('ROLE_ADMIN')">
								<li><a class="dropdown-item"
									href="/admin/${pageContext.request.userPrincipal.name}">Dashboard</a>
								</li>
								<li><a class="dropdown-item" href="/admin/settings">Change Password</a></li>
							</sec:authorize>
							<!-- if current user is STUDENT -->
							<sec:authorize access="hasRole('ROLE_USER')">
								<li><a class="dropdown-item"
									href="/users/${pageContext.request.userPrincipal.name}">Dashboard</a>
								</li>
								<li><a class="dropdown-item" href="/users/settings">Change Password</a></li>
							</sec:authorize>
							<li><hr class="dropdown-divider"></li>
							<li><a class="dropdown-item" href="/logout">Logout</a></li>
						</ul></li>
				</c:if>
				<c:if test="${pageContext.request.userPrincipal == null}">
					<li class="nav-item"><a class="nav-link" href="/login">Sign
							In</a></li>
				</c:if>
			</ul>
		</div>
		<!-- /.navbar-collapse -->
	</nav>

	<!--opration message notification  -->

	<svg xmlns="http://www.w3.org/2000/svg" style="display: none;">
  <symbol id="check-circle-fill" fill="currentColor" viewBox="0 0 16 16">
    <path
			d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-3.97-3.03a.75.75 0 0 0-1.08.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-.01-1.05z" />
  </symbol>
  <symbol id="info-fill" fill="currentColor" viewBox="0 0 16 16">
    <path
			d="M8 16A8 8 0 1 0 8 0a8 8 0 0 0 0 16zm.93-9.412-1 4.705c-.07.34.029.533.304.533.194 0 .487-.07.686-.246l-.088.416c-.287.346-.92.598-1.465.598-.703 0-1.002-.422-.808-1.319l.738-3.468c.064-.293.006-.399-.287-.47l-.451-.081.082-.381 2.29-.287zM8 5.5a1 1 0 1 1 0-2 1 1 0 0 1 0 2z" />
  </symbol>
  <symbol id="exclamation-triangle-fill" fill="currentColor"
			viewBox="0 0 16 16">
    <path
			d="M8.982 1.566a1.13 1.13 0 0 0-1.96 0L.165 13.233c-.457.778.091 1.767.98 1.767h13.713c.889 0 1.438-.99.98-1.767L8.982 1.566zM8 5c.535 0 .954.462.9.995l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 5.995A.905.905 0 0 1 8 5zm.002 6a1 1 0 1 1 0 2 1 1 0 0 1 0-2z" />
  </symbol>
	</svg>

	<%
	if (request.getAttribute("successMessage") != null) {
	%>
	<div
		class="alert alert-success alert-dismissible fade show position-fixed m-1"
		role="alert">
		<svg class="bi flex-shrink-0 me-2" width="24" height="24" role="img"
			aria-label="Success:">
			<use xlink:href="#check-circle-fill" /></svg>
		<strong><%=request.getAttribute("successMessage")%></strong>
		<button type="button" class="btn-close" data-bs-dismiss="alert"
			aria-label="Close"></button>
	</div>
	<%
	}
	%>
	<%
	if (request.getAttribute("errorMessage") != null) {
	%>
	<div
		class="alert alert-danger alert-dismissible fade show position-fixed m-1"
		role="alert">
		<svg class="bi flex-shrink-0 me-2" width="24" height="24" role="img"
			aria-label="Danger:">
			<use xlink:href="#exclamation-triangle-fill" /></svg>
		<strong><%=request.getAttribute("errorMessage")%></strong>
		<button type="button" class="btn-close" data-bs-dismiss="alert"
			aria-label="Close"></button>
	</div>
	<%
	}
	%>

	<script src="https://unpkg.com/@popperjs/core@2" type="text/javascript"></script>
	<style>
.top-navbar {
	background-color: #7777775c;
	border-radius: 0px 0px 30px 30px;
	border: 0px solid black;
}

.dropDownProfile {
background-color: #ffffff7d;
    backdrop-filter: blur(8px);
}
.dropdown-item.disabled{
	color:black;
	font-weight: 500;
}
</style>

</body>
</html>
