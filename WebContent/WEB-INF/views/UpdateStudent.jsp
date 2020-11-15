<%@page import="model.Student"%>
<%@page import="dao.StudentDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cập nhật thông tin sinh viên</title>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Raleway:ital,wght@0,100;0,200;0,300;0,400;1,100;1,200;1,300&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link rel="stylesheet" href="/public/css/style.css">
<script src="https://kit.fontawesome.com/501b9deca1.js" crossorigin="anonymous"></script>
<script>
	function showPassword() {
	  var x = document.getElementById("matkhau");
	  if (x.type === "password") {
	    x.type = "text";
	  } else {
	    x.type = "password";
	  }
	}
</script>
<style>
	body{
		background-color: #ebebeb;
	}
</style>
</head>
<body>
	<jsp:include page="NavbarStudent.jsp"></jsp:include>
			<div class="container pt-3">
				<%
					String mssv = (String)session.getAttribute("username");
					Student student = StudentDAO.getStudentByID(mssv);
					String nam = "";
					String nu = "";
					String gioitinh = (String)student.getGioitinh();
					if (gioitinh.charAt(1) == 'a'){
						nam = "checked";
					}
					else nu = "checked";
				%>
				<h2 class="text-center text-muted mb-4">Cập nhật thông tin sinh viên</h2>
				<form action="${pageContext.request.contextPath}/HandleUpdateStudent">
				<div class="row">
					<div class="col-6 mx-auto">
						<label class="text-muted">Mã sinh viên</label>
						<input type="text" value="<%=student.getMssv()%>" id="mssv" name="mssv" readonly/>
					</div>
				</div>
				<div class="row">
					<div class="col-6 mx-auto">
						<label class="text-muted">Tên sinh viên</label>
						<input type="text" value="<%=student.getTensinhvien()%>" id="tensinhvien" name="tensinhvien" required/>
					</div>
				</div>
				<div class="row">
					<div class="col-6 mx-auto">
						<label class="text-muted">Giới tính</label>
						<div class="row pb-2 pt-3">
							<div class="col-6">
								<input type="radio" id="gioitinh" name="gioitinh" value="Nam" class="mr-2" <%=nam%>/><span>Nam</span>
							</div>
							<div class="col-6">
								<input type="radio" id="gioitinh" name="gioitinh" value="Nữ" class="mr-2" <%=nu%>/><span>Nữ</span>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-6 mx-auto">
						<label class="text-muted">Ngày sinh</label>
						<input type="date" id="ngaysinh" name="ngaysinh" value="<%=student.getNgaysinh()%>"/>
					</div>
				</div>
				<div class="row">
					<div class="col-6 mx-auto">
						<label class="text-muted">Địa chỉ</label>
						<input type="text" value="<%=student.getDiachi()%>" id="diachi" name="diachi" required/>
					</div>
				</div>
				<div class="row">
					<div class="col-6 mx-auto">
						<label class="text-muted">Email</label>
						<input type="text" value="<%=student.getEmail()%>" id="email" name="email" required/>
					</div>
				</div>
				<div class="row">
					<div class="col-6 mx-auto">
						<label class="text-muted">Số điện thoại</label>
						<input type="text" value="<%=student.getSdt()%>" id="sdt" name="sdt" required/>
					</div>
				</div>
				<div class="row">
					<div class="col-6 mx-auto">
						<label class="text-muted">Mật khẩu</label>
						<input type="password" value="<%=student.getMatkhau()%>" id="matkhau" name="matkhau" required/>
						<span class="text-muted"><i class="fas fa-lock" onclick="showPassword()" style="left:95%"></i></span>
					</div>
				</div>
				<div class="row">
					<div class="col-6 mx-auto  text-center">
						<input type="submit" class="btn btn-primary" value="Cập nhật"/>
					</div>
				</div>
				</form>
			</div>
	<jsp:include page="Footer.jsp"></jsp:include>
</body>
</html>