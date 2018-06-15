<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-xs-12">
				<jsp:include page="menu.jsp"/>
			</div>
		</div>
		<div class="row">
			<div class="col-xs-12" id="main">
				<img src="${pageContext.request.contextPath}/img/main.jpg" class="img-responsive" alt="main" />
			</div>
		</div>
		<div class="row">
			<div class="col-xs-12">
				<jsp:include page="footer.jsp"/>
			</div>
		</div>
	</div>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</body>
</html>