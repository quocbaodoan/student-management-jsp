<%@page import="model.Student"%>
<%@page import="dao.StudentDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Thông tin cá nhân</title>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Raleway:ital,wght@0,100;0,200;0,300;0,400;1,100;1,200;1,300&display=swap" rel="stylesheet">
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
</head>
<body>
	<%
		String mssv = (String)session.getAttribute("username");
		Student student = StudentDAO.getStudentInfo(mssv);
	%>
	<div class="container">
		<h2 class="text-center text-muted mb-4">Thông tin cá nhân</h2>
		<form>
		<div class="row">
			<div class="col-6 mx-auto">
				<label class="text-muted">Mã sinh viên</label>
				<input type="text" value="<%=student.getMssv()%>" id="mssv" name="mssv" readonly/>
			</div>
		</div>
		<div class="row">
			<div class="col-6 mx-auto">
				<label class="text-muted">Tên sinh viên</label>
				<input type="text" value="<%=student.getTensinhvien()%>" id="tensinhvien" name="tensinhvien" readonly/>
			</div>
		</div>
		<div class="row">
			<div class="col-6 mx-auto">
				<label class="text-muted">Giới tính</label>
				<input type="text" value="<%=student.getGioitinh()%>" id="gioitinh" name="gioitinh" readonly/>
			</div>
		</div>
		<div class="row">
			<div class="col-6 mx-auto">
				<label class="text-muted">Ngày sinh</label>
				<input type="text" value="<%=student.getNgaysinh()%>" id="ngaysinh" name="ngaysinh" readonly/>
			</div>
		</div>
		<div class="row">
			<div class="col-6 mx-auto">
				<label class="text-muted">Địa chỉ</label>
				<input type="text" value="<%=student.getDiachi()%>" id="diachi" name="diachi" readonly/>
			</div>
		</div>
		<div class="row">
			<div class="col-6 mx-auto">
				<label class="text-muted">Email</label>
				<input type="text" value="<%=student.getEmail()%>" id="email" name="email" readonly/>
			</div>
		</div>
		<div class="row">
			<div class="col-6 mx-auto">
				<label class="text-muted">Số điện thoại</label>
				<input type="text" value="<%=student.getSdt()%>" id="sdt" name="sdt" readonly/>
			</div>
		</div>
		<div class="row">
			<div class="col-6 mx-auto">
				<label class="text-muted">Mật khẩu</label>
				<input type="password" value="<%=student.getMatkhau()%>" id="matkhau" name="matkhau" readonly/>
				<span class="text-muted"><i class="fas fa-lock" onclick="showPassword()" style="left:95%"></i></span>
			</div>
		</div>
		</form>
	</div>
</body>
</html>