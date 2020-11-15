<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Đăng nhập</title>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Raleway:ital,wght@0,100;0,200;0,300;0,400;1,100;1,200;1,300&display=swap" rel="stylesheet">
<link rel="stylesheet" href="/public/css/style.css" type="text/css"/>
<script src="https://kit.fontawesome.com/501b9deca1.js" crossorigin="anonymous"></script>
<style>
	body{
        background-color: #fafafa;
    }
</style>
<script>
	function showPassword() {
	  var x = document.getElementById("password");
	  if (x.type === "password") {
	    x.type = "text";
	  } else {
	    x.type = "password";
	  }
	}
</script>
</head>
<body>
			<%
				String username = String.valueOf(session.getAttribute("username"));
				username = (String) username;
				if (username == "null") {
			%>
			
			<div class="container">
        		<div class="row text-center">
            		<form action="${pageContext.request.contextPath}/login" method="GET" class="justify-content-center col-12 form-login mx-auto py-4 mt-2">
                		<h2 class="title mb-4 text-muted">Đăng nhập</h2>
                		<div class="row">
                    		<p class="txt1 mb-2 text-muted">Mã đăng nhập</p>
                		</div>
                		<div class="row">
                    		<input type="text" id="username" name="username" required/>
                		</div>
                		<div class="row mt-3 mb-2">
                   			<p class="txt1 text-muted">Mật khẩu</p>
                		</div>
                		<div class="row">
                    		<input type="password" id="password" name="password" required/>
                    		<span class="text-muted"><i class="fas fa-lock" onclick="showPassword()"></i></span>
                		</div>
                		<%
                   			if (session.getAttribute("invalid") != null) {
                    		out.print("<div class='error'>Tên đăng nhập hoặc mật khẩu không chính xác!</div>");
                			}
                		%>
                		<div>
                    		<input class="btn btn-primary mt-4" type='Submit' value='Đăng nhập'>
                		</div>
            		</form>
        		</div>
        		<div class="row mt-3">
            		<div class="col-10 mx-auto">
                		<div class="manual-wrapper">
                    		<h2 class="text-center mb-3 text-muted">Chương trình quản lý sinh viên</h2>
                    		<div class="row">
                        		<div class="col-12">
                            		<h4 class="text-muted">Mô tả</h4>
                            		<p>Chương trình bao gồm 2 quyền admin và sinh viên:</p>
                            		<p>- Admin có chức năng xem, xóa, chỉnh sửa sinh viên và lịch học, đồng thời có thể đổi mật khẩu quyền admin.</p>
                            		<p>- Sinh viên có chức năng xem lịch học, thông tin cá nhân và cập nhật thông tin cá nhân.</p>
                        		</div>
                    		</div>
                    		<div class="row">
                        		<div class="col-6">
                            		<h4 class="text-muted">Tài khoản demo admin</h4>
                            		<p>- Mã đăng nhập: 100</p>
                            		<p>- Mật khẩu: admin</p>
                        		</div>
                        		<div class="col-6">
                            		<h4 class="text-muted">Tài khoản demo sinh viên</h4>
                            		<p>- Mã đăng nhập: 101</p>
                            		<p>- Mật khẩu: abc123</p>
                        		</div>
                    		</div>
                		</div>
            		</div>
        		</div>
    		</div>
		
		<%
			} else if (username.charAt(2) == '0'){
				System.out.print(username);
		%>
			<jsp:include page="NavbarAdmin.jsp"></jsp:include>
			<div class="container">
				<div class="row">
					<div class="col-12 mx-auto">
						<jsp:include page="StudentManagement.jsp"></jsp:include>
					</div>
				</div>
			</div>
			<jsp:include page="Footer.jsp"></jsp:include>
		
		<%
			} else {
		%>
			<jsp:include page="NavbarStudent.jsp"></jsp:include>
			<div class="container pt-4">
				<div class="row">
					<div class="col-12 mx-auto">
						<jsp:include page="StudentInfo.jsp"></jsp:include>
					</div>
				</div>
			</div>
			<jsp:include page="Footer.jsp"></jsp:include>
		<%
			}
		%>
</body>
</html>