<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Raleway:ital,wght@0,100;0,200;0,300;0,400;1,100;1,200;1,300&display=swap" rel="stylesheet">
</head>
<body>
	<div class="row navbar">
		<div class="container pt-2 d-flex">
			<a href="${pageContext.request.contextPath}/" class="list-group-item list-group-item-light mr-1"> <span>Thông tin cá nhân</span></a>
			<!-- <a href="${pageContext.request.contextPath}/student/score" class="list-group-item list-group-item-light mr-1"> <span>Xem điểm</span></a> -->
			<a href="${pageContext.request.contextPath}/student/schedule" class="list-group-item list-group-item-light mr-1"> <span>Xem lịch học</span></a>
			<a href="${pageContext.request.contextPath}/student/update" class="list-group-item list-group-item-light mr-1"><span>Cập nhật thông tin</span> </a>
			<a class="btn-logout btn btn-secondary ml-auto" href="${pageContext.request.contextPath}/logout">Đăng xuất</a>
		</div>
	</div>
</body>
</html>