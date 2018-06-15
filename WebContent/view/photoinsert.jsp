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
		if(!/^.{1,70}$/.test(f.content.value)){
			alert("메시지를 70자 이내로 입력해 주세요.");
			f.content.focus();
			return;
		}
		
		if(f.photo.value == ""){
			alert("파일을 선택해 주세요.");
			return;
		}
				
		f.submit();
	}
	function fileCheck(obj){
		//클라이언트에서 파일 확장자 체크
		
		//업로드한 파일명의 마지막 .의 인덱스값 저장
		var point = obj.value.lastIndexOf('.');
		//확장자명 저장. 마지막 . 뒷부분부터 잘라낸다.
		var extention = obj.value.substring(point+1, obj.value.length);
		
		if(extention != "jpg" && extention != "gif" && extention != "png"){
			//파일 확장자가 jpg도 gif도 png도 아닐 경우.
			alert("이미지만 올려주세요!")
			//파일 선택 취소
			var parent = obj.parentNode;
			var next = obj.nextSibling;
			var tmp = document.createElement("form");
			tmp.appendChild(obj);
			tmp.reset();
			parent.insertBefore(obj, next);
		}
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
						<h3>Photo Upload</h3>
					</div>
					<form action="${pageContext.request.contextPath}/photo/insert" method="post" class="form-horizontal" enctype="multipart/form-data">
					<div class="form-group">
						<label for="content" class="col-sm-2 col-sm-offset-3 control-label">Message</label>
						<div class="col-sm-3"><input type="text" name="content" id="content" class="form-control"/></div>
					</div>
					<div class="form-group">
						<label for="photo" class="col-sm-2 col-sm-offset-3 control-label">Photo File</label>
						<div class="col-sm-3">
							<input type="file" name="photo" id="photo" class="form-control"
							accept="image/gif, image/jpeg, image/png" onchange="fileCheck(this);"/>
							<!-- 파일 업로드 시  이미지 파일부터 선택할 수 있도록 함. 별 효력은 없다.-->
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