<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="navbar navbar-default">
	<div class="navbar-header">
		<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
		</button>
		<a href="${pageContext.request.contextPath}/main" class="navbar-brand">
			<img src="${pageContext.request.contextPath}/img/logo.jpg" style="width:100% ; margin-top:0;" alt="logo" />
		</a>
	</div>
	<div class="collapse navbar-collapse" id="myNavbar">
		<ul class="nav navbar-nav navbar-right">
			<li><a href="${pageContext.request.contextPath}/main">Main</a></li>
			<li><a href="${pageContext.request.contextPath}/photo/list">Photo</a></li>
			<li><a href="${pageContext.request.contextPath}/guestbook/list">GuestBook</a></li>
		<c:if test="${sessionScope.id == null}">
			<li><a href="${pageContext.request.contextPath}/signup">Sign Up</a></li>
			<li><a href="${pageContext.request.contextPath}/signin">Sign In</a></li>
		</c:if>
		<c:if test="${sessionScope.id != null}">
			<li><a href="${pageContext.request.contextPath}/signout">Sign Out</a></li>
		</c:if>	
		</ul>
	</div>
</div>