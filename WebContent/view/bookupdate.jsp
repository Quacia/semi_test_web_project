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
		if(f.content.value == ""){
			alert("코멘트를 입력해 주세요.");
			f.content.focus();
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
					<div class="col-xs-offset-3 col-xs-6 text-center" style="padding: 10px;">
						<h3>Comment Modify</h3>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-offset-3 col-sm-6 col-xs-offset-1 col-xs-10">
						<div class="panel panel-default">
							<div class="panel-heading">
								<h5>${sessionScope.name}(${sessionScope.id})</h5>
								<!-- 방명록 업데이트에서는 이름이나 u_id를 업데이트하지 않으므로, resultMap을 사용할 필요 없이 세션에서 불러온다. -->
							</div>
							<div class="panel-body">
								<form action="${pageContext.request.contextPath}/guestbook/update" method="POST" class="form-horizontal">
									<div class="form-group">
										<div class="col-sm-10 text-center">
											<input type="hidden" name="id" id="id" value="${book.id}"/>
											<textarea name="content" class="form-control" name="content" id="content" rows="3">${book.content}</textarea>
										</div>
										<div class="col-sm-2">
											<button type="button" class="btn btn-default btn-lg" onclick="check(this.form)"><span class="glyphicon glyphicon-ok"></span></button>
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
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
	<script>
		$("[data-toggle='tooltip']").tooltip();
	</script>
</body>
</html>