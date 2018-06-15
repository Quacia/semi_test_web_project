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
	function checkPwd(){
		var password = $("#password").val();
		var password_check = $("#passwordCheck").val();
		
		if(password_check == ""){
			$("#alert").html("");
		}else if(password == password_check){
			$("#alert").html("OK");
		}else{
			$("#alert").html("Passwords are not the same!");
		}
	}
	
	var dualCheck = false;
	function checkId(){
		var id = $("#id").val();
		$.ajax({
			type: "POST",
			url: "${pageContext.request.contextPath}/dualCheck",
			data: {id: id},
			success: function(data){
				if(data == 'y'){
					alert("중복된 아이디입니다.");
				}else if(data == 'n'){
					alert("사용가능한 아이디입니다.");
					dualCheck = true;
				}else{
					alert("잠시 후 다시 시도해 주세요.");
				}
			}
		});
	}
	
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
		
		if($("#alert").html() != "OK"){
			alert("비밀번호 입력을 확인해 주세요.");
			return;
		}
		if(!/^[가-힣a-zA-Z]{1,16}$/.test(f.name.value)){
			alert("이름을 입력해 주세요.");
			f.name.focus();
			return;
		}
		
		if(!dualCheck){
			alert("아이디 중복 확인해주세요~!");
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
						<h3>Sign Up</h3>
					</div>
					<form action="${pageContext.request.contextPath}/signup" method="post" class="form-horizontal">
					<div class="form-group">
						<label for="id" class="col-sm-2 col-sm-offset-2 control-label">ID</label>
						<div class="col-sm-3"><input type="text" name="id" id="id" class="form-control"/></div>
						<div class="col-sm-2"><button type="button" onclick="checkId()" class="btn btn-default">Check</button></div>
					</div>
					<div class="form-group">
						<label for="password" class="col-sm-2 col-sm-offset-2 control-label">Password</label>
						<div class="col-sm-3"><input type="password" name="password" id="password" class="form-control" onkeyup="checkPwd()"/></div>
					</div>
					<div class="form-group">
						<label for="passwordCheck" class="col-sm-2 col-sm-offset-2 control-label">PasswordCheck</label>
						<div class="col-sm-3"><input type="password" id="passwordCheck" class="form-control" onkeyup="checkPwd()"/></div>
						<div class="col-sm-3"><span id="alert"></span></div>
					</div>
					<div class="form-group">
						<label for="name" class="col-sm-2 col-sm-offset-2 control-label">Name</label>
						<div class="col-sm-3"><input type="text" id="name" name="name" class="form-control"/></div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 col-sm-offset-2 control-label">Job</label>
						<div class="col-sm-5">
							<label for="job1" class="radio-inline">
								<input type="radio" id="job1" value="developer" name="job" checked/>Developer
							</label>
							<label for="job2" class="radio-inline">
								<input type="radio" id="job2" value="student" name="job"/>Student
							</label>
							<label for="job3" class="radio-inline">
								<input type="radio" id="job3" value="amateur" name="job"/>Amateur
							</label>
						</div>
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