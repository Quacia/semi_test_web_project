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
<script>
	function check(f){
		if(!/^\w{1,40}$/.test(f.id.value)){
			alert("아이디를 영문, 숫자 40자 이내로 입력해 주세요.");
			f.id.focus();
			return;
		}
		
		if(!/^.{1,13}$/.test(f.password.value)){
			alert("비밀번호는 13자 이내입니다.");
			f.password.focus();
			return;
		}

		f.submit();
	}
</script>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-xs-12">
				<jsp:include page="menu.jsp"/>
			</div>
		</div>
		<div class="row">
			<div class="container" id="main">
				<div class="row">
					<div class="col-sm-12 text-center form-header">
						<h3>Sign In</h3>
					</div>
					<form action="${pageContext.request.contextPath}/signin" method="post" class="form-horizontal">
					<div class="form-group">
						<label for="id" class="col-xs-2 col-xs-offset-3 control-label">ID</label>
						<div class="col-xs-3"><input type="text" name="id" id="id" class="form-control"/></div>
					</div>
					<div class="form-group">
						<label for="password" class="col-xs-2 col-xs-offset-3 control-label">Password</label>
						<div class="col-xs-3"><input type="password" name="password" id="password" class="form-control"/></div>
					</div>
					<div class="form-group">
						<div class="col-sm-12 text-center" style="padding:20px;">
							<button type="button" class="btn btn-default" onclick="check(this.form)">SUBMIT</button>
							<button type="reset" class="btn btn-default">RESET</button>
						</div>
					</div>
				</form>
				</div>
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