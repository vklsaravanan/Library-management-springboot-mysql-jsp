<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>
	<footer>
		<%
		String baseUrl2 = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort();
		%>
		<script src="<%=baseUrl2 %>/webjars/jquery/1.9.1/jquery.min.js"
			type="text/javascript"></script>
		<script src="<%=baseUrl2 %>/webjars/bootstrap/5.1.0/js/bootstrap.min.js"
			type="text/javascript"></script>
			
			<script type="text/javascript" src="/js/alertAutoRemover.js"></script>
			
			
	</footer>
</body>
</html>