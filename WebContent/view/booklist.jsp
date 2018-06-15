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
	
	function del(id, u_id){
		if(confirm("정말로 삭제하시겠습니까?")){
			location.href="${pageContext.request.contextPath}/guestbook/delete?id=" + id + "&u_id=" + u_id;
		}
	}
	function update(id, u_id){
		location.href='${pageContext.request.contextPath}/guestbook/update?id=' + id + "&u_id=" + u_id;
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
						<h3>GuestBook</h3>
					</div>
				</div>
				<c:if test="${sessionScope.id != null}">
				<!-- 방명록 남기기 창 -->
				<div class="row">
					<div class="col-sm-offset-3 col-sm-6 col-xs-offset-1 col-xs-10">
						<div class="panel panel-default">
							<div class="panel-heading">
								<h5>${sessionScope.name}(${sessionScope.id})</h5>
							</div>
							<div class="panel-body">
								<form action="${pageContext.request.contextPath}/guestbook/insert" method="POST" class="form-horizontal">
									<div class="form-group">
										<div class="col-xs-10 text-center">
											<textarea name="content" class="form-control" name="content" id="content" rows="3"></textarea>
										</div>
										<div class="col-xs-2">
											<button type="button" class="btn btn-default btn-sm" onclick="check(this.form)"><span class="glyphicon glyphicon-ok"></span></button>
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
				</c:if>
				<c:if test="${empty bookList}">
				<div class="row">
					<div class="col-sm-12 text-center">
						<p>등록된 게시물이 없습니다.</p>
					</div>
				</div>
				</c:if>
				<c:forEach var="book" items="${bookList}">
				<div class="row">
					<div class="col-sm-offset-3 col-sm-6 col-xs-offset-1 col-xs-10">
						<div class="panel panel-default">
							<div class="panel-heading">
								<p>${book.user.name}(${book.user.id})</p>
								<p class="text-muted text-right" style="font-size:8pt">${book.regdate}</p>
							</div>
							<div class="panel-body">
								<p class="text-muted">${book.content}</p>
								<c:if test="${sessionScope.id == book.u_id}">
									<hr />
									<p class="text-right">
										<button type="button" class="btn btn-default btn-xs" onclick="update(${book.id}, '${book.user.id}')"
											 data-toggle="tooltip" data-placement="top" title="Modify">
											<span class="glyphicon glyphicon-edit"></span>
										</button>
										<button type="button" class="btn btn-default btn-xs" onclick="del(${book.id}, '${book.user.id}')"
											data-toggle="tooltip" data-placement="top" title="Delete">
											<span class="glyphicon glyphicon-remove"></span>
										</button>
									</p>
								</c:if>
							</div>
						</div>
					</div>
				</div>
				</c:forEach>
			</div>
		</div>
		<div class="row">
			<div class="col-xs-12">
				<div class="paging text-center">
					<ul class="pagination pagination-sm">
						${paging}
					</ul>
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