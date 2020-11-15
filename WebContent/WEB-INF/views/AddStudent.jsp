<%@page import="model.Student"%>
<%@page import="dao.StudentDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Thêm sinh viên</title>
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
	function check(){
		var x = document.getElementById("mssv").value;
		<%for (Student student2 : StudentDAO.getAllStudent()){%>
			if (x == "<%=student2.getMssv()%>" || x == "100") {
				document.getElementById("message").innerHTML = "Mã sinh viên đã tồn tại";
				document.getElementById("message").style.opacity = "1";
				document.getElementById("message").style.color = "#FF5A5F";
				document.getElementById("add").disabled  = true;
				return true;
			}
			else{
				document.getElementById("message").style.opacity = "0";
			    document.getElementById("message").innerHTML = false;
			    document.getElementById("add").disabled  = false;
			}
		<%}%>
	}
</script>
<body>
	<jsp:include page="NavbarAdmin.jsp"></jsp:include>
			<div class="container pt-3">
				<%
					String mssv = request.getParameter("ID");
				%>
				<h2 class="text-center text-muted mb-4">Thêm sinh viên</h2>
				<form action="${pageContext.request.contextPath}/HandleAddStudent" method="POST">
				<div class="row">
					<div class="col-6 mx-auto">
						<label class="text-muted">Mã sinh viên</label>
						<input type="text" id="mssv" name="mssv" onkeyup="check()" required/>
						<span id="message" class="message2"></span>
					</div>
				</div>
				<div class="row">
					<div class="col-6 mx-auto">
						<label class="text-muted">Tên sinh viên</label>
						<input type="text" id="tensinhvien" name="tensinhvien" required/>
					</div>
				</div>
				<div class="row ">
					<div class="col-6 mx-auto">
						<label class="text-muted">Giới tính</label>
						<div class="row pb-2 pt-3">
							<div class="col-6">
								<input type="radio" id="gioitinh" name="gioitinh" value="Nam" class="mr-2" checked/><span>Nam</span>
							</div>
							<div class="col-6">
								<input type="radio" id="gioitinh" name="gioitinh" value="Nữ" class="mr-2"/><span>Nữ</span>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-6 mx-auto">
						<label class="text-muted">Ngày sinh</label>
						<input type="date" id="ngaysinh" name="ngaysinh" placeholder="" value="" required/>
					</div>
				</div>
				<div class="row">
					<div class="col-6 mx-auto">
						<label class="text-muted">Địa chỉ</label>
						<input type="text" id="diachi" name="diachi" required/>
					</div>
				</div>
				<div class="row">
					<div class="col-6 mx-auto">
						<label class="text-muted">Email</label>
						<input type="text" id="email" name="email" required/>
					</div>
				</div>
				<div class="row">
					<div class="col-6 mx-auto">
						<label class="text-muted">Số điện thoại</label>
						<input type="text" id="sdt" name="sdt" required/>
					</div>
				</div>
				<div class="row">
					<div class="col-6 mx-auto">
						<label class="text-muted">Mật khẩu</label>
						<input type="password" id="matkhau" name="matkhau" required/>
						<span class="text-muted"><i class="fas fa-lock" onclick="showPassword()" style="left:95%"></i></span>
					</div>
				</div>
				<div class="row">
					<div class="col-6 mx-auto  text-center">
						<input type="submit" class="btn btn-success" id="add" name="add" value="Thêm"/>
						<a href="/" class="btn btn-primary">Trở về</a>
					</div>
				</div>
				</form>
			</div>
	<jsp:include page="Footer.jsp"></jsp:include>
</body>
</html>