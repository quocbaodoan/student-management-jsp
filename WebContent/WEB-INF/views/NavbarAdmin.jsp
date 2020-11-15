<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Raleway:ital,wght@0,100;0,200;0,300;0,400;1,100;1,200;1,300&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link rel="stylesheet" href="/public/css/style.css" type="text/css">
</head>
<body>
	<div class="row navbar">
		<div class="container pt-2 d-flex">
			<a href="${pageContext.request.contextPath}/" class="list-group-item list-group-item-light mr-1"> <span>Quản lý sinh viên</span></a>
			<a href="${pageContext.request.contextPath}/admin/schedulemanagement" class="list-group-item list-group-item-light mr-1"> <span>Quản lý lịch học</span></a>
			<!--<a href="${pageContext.request.contextPath}/admin/score" class="list-group-item list-group-item-light"> <span>Quản lý điểm</span></a>-->
			<a href="${pageContext.request.contextPath}/admin/update" class="list-group-item list-group-item-light"><span>Đổi mật khẩu</span> </a>
			<a class="btn-logout btn btn-secondary ml-auto" href="${pageContext.request.contextPath}/logout">Đăng xuất</a>
		</div>
	</div>
</body>
</html>