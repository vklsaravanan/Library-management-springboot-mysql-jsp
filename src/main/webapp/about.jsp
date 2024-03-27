<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>About Application</title>
<!-- Bootstrap CSS -->
<style>
/* Add custom styles here */
.social-links {
	margin-top: 20px;
}

.social-links a {
	display: inline-block;
	margin-right: 10px;
}

h1 {
	color: #333;
	text-align: center;
}

h2 {
	color: #555;
}

p {
	color: #666;
}

ul {
	list-style-type: none;
	padding: 0;
}

ul li {
	margin-bottom: 10px;
}

a {
	color: #007bff;
	text-decoration: none;
}

a:hover {
	text-decoration: underline;
}
</style>
</head>
<body>
	<div class="container">
		<header>
			<%@ include file="template/navbar.jsp"%>
		</header>

		<h1>Library Management System</h1>

		<p>Welcome to our library management application, designed to
			streamline the process of managing users, students, and books with
			ease and efficiency.</p>

		<h2>Key Features:</h2>
		<ul>
			<li><strong>Role-Based Access Control:</strong> Administrators
				have full control over the system, while students have limited
				access tailored to their needs.</li>
			<li><strong>Session-Based Login:</strong> Secure session-based
				login functionality ensures that only authorized users can access
				the system.</li>
			<li><strong>Admin Functions:</strong> Create new student library
				accounts, view detailed history of students and books.</li>
			<li><strong>Student Functions:</strong> Access personalized
				history of borrowed books, check availability of books in the
				library.</li>
			<li><strong>Validation:</strong> Client-side and server-side
				validation mechanisms are implemented to ensure data accuracy and
				prevent unauthorized access.</li>
		</ul>

		<h2>Technologies Used:</h2>
		<p>Frontend: JSP, CSS, Bootstrap, JavaScript, jQuery</p>
		<p>Backend: Spring Boot with Security</p>
		<p>Database: MySQL</p>

		<p>
			For more information and updates, visit my website <a
				href="http://vklsaravanan.online"
				class="text-primary bg-cus px-2 rounded text-decoration-none
				">vklsaravanan.online</a>
			and follow us on social media:
		</p>
		<div class="row d-flex justify-content-center rounded nav">
			<div class="col-md-6">
				<div class="social-links mb-4 d-flex justify-content-center ">
					<a href="https://stackoverflow.com/users/16570902/saravanan"
						target="_blank" class="me-2">Stack Overflow</a> <a
						href="https://www.linkedin.com/in/saravanan--r/" target="_blank"
						class="me-2">LinkedIn</a> <a
						href="https://github.com/vklsaravanan" target="_blank"
						class="me-2">GitHub</a> <a
						href="https://www.instagram.com/vkl_saravanan/" target="_blank"
						class="me-2">Instagram</a>
					<!-- Add more social media links as needed -->
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

.bg-cus {
	background-color: midnightblue;
}
</style>
	<!-- Bootstrap JS (optional) -->
	<script
		src="<c:url value="/webjars/bootstrap/3.3.6/js/bootstrap.min.js" />"></script>

	<!-- footer -->
	<%@ include file="template/footer.jsp"%>
</body>
</html>
