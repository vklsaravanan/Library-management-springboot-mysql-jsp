<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script type="text/javascript" src="/css/home.css "></script>
<title>Welcome Page</title>
<style type="text/css">
body {
	background: url("/image/bg/baseBackground.jpg");
	background-attachment: fixed;
	background-size: cover
}

.jumbotron {
	display: flex;
	justify-content: center;
	color: white;
	flex-direction: column;
	align-items: center;
	text-shadow: 2px 1px 5px #2b2a2a;
    transform: translateY(50%);
}
figure{
	width: 368px;
    padding: 20px;
    backdrop-filter: blur(9px);
    border: 0px solid black;
    border-radius: 32px;
    text-align: center;
}
</style>

</head>
<body>
	<div class="container">
		<header>
			<%@ include file="template/navbar.jsp"%>
		</header>

		<div class="jumbotron">
			<h1 class="display-4 fw-bolder">Welcome to our Library!</h1>
			<figure style="box-shadow: 2px 2px 19px #00000059;">
				<blockquote class="blockquote">
					<p>``The only theory that absolutely have to know is the location of the <strong>library</strong>``</p>
				</blockquote>
				<figcaption class="blockquote-footer text-light">
					Albert Einstein
				</figcaption>
			</figure>
			<p class="lead">Explore our services and learn more about us.</p>
		</div>
	</div>

	<script type="text/javascript" src="/js/home.js"></script>
	<!-- footer -->
	<%@ include file="template/footer.jsp"%>
</body>
</html>
