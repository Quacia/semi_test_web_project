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
<style>
	img{
		width: 90%;
	}
	.col-sm-3{
		padding: 10px;
	}
</style>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script>
	function del(id, url, u_id){
		if(confirm("정말로 삭제하시겠습니까?")){
			location.href="${pageContext.request.contextPath}/photo/delete?id=" + id + "&u_id=" + u_id + "&url=" + url;
			//사진은 올린 본인만 삭제할 수 있으며, 본인이 맞는지 여부는 PhotoDeleteServlet에서 확인.
		}
	}
	
	function down(url){
		location.href="${pageContext.request.contextPath}/photo/download?url=" + url;
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
			<div class="col-xs-12" id="main">
				<div class="header text-center">
					<h3>Photo</h3>
					<c:if test="${sessionScope.id != null}">
						<button class="btn btn-default btn-sm" type="button" onclick="location.href='${pageContext.request.contextPath}/photo/insert'">Upload</button>
					</c:if>
					<c:if test="${sessionScope.id == null }">
						<p>사진 업로드와 다운로드는 로그인한 회원님만 가능합니다.</p>
					</c:if>
				</div>
				<div class="content text-center">
					<c:if test="${empty photoList}">
						<p>등록된 사진이 없습니다.</p>
					</c:if>
					<c:forEach var="photo" items="${photoList}">
						<div class="col-sm-3">
							<div class="thumnail">
								<img src="${pageContext.request.contextPath}/upload/${photo.url}" class="img-responsive img-thumbnail" alt="사진" />
								<div class="caption text-center">
									<p>${photo.user.name}(${photo.user.id})<br />
									${photo.regdate} <br />
									${photo.content}</p>
									<c:if test="${sessionScope.id != null}">
										<button type="button" class="btn btn-default btn-xs" onclick="down('${photo.url}')">Down</button>
									</c:if>
									<c:if test="${sessionScope.id == photo.user.id}">
										<button type="button" class="btn btn-default btn-xs" onclick="del(${photo.id}, '${photo.url}', '${photo.user.id}')">Delete</button>
									</c:if>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
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
</body>
</html>