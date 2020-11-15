<%@page import="model.Student"%>
<%@page import="dao.StudentDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Đổi mật khẩu</title>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Raleway:ital,wght@0,100;0,200;0,300;0,400;1,100;1,200;1,300&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link rel="stylesheet" href="/public/css/style.css">
<script src="https://kit.fontawesome.com/501b9deca1.js" crossorigin="anonymous"></script>
<script>
	function check(){
	  if (document.getElementById("matkhau").value ==
	    document.getElementById("nhaplaimatkhau").value){
	    document.getElementById("message").style.opacity = "0";
	    document.getElementById("message").innerHTML = false;
	    document.getElementById("update").disabled  = false;
	  }
	  else{
		document.getElementById("message").style.opacity = "1";
	    document.getElementById("message").style.color = "#FF5A5F";
	    document.getElementById("message").innerHTML = "Không trùng khớp";
	    document.getElementById("update").disabled  = true;
	  }
	}
	function showPassword(){
	  var x = document.getElementById("matkhau");
	  if (x.type === "password"){
	  	x.type = "text";
	  } 
	  else{
	    x.type = "password";
	  }
	}
	function showRepassword(){
		  var x = document.getElementById("nhaplaimatkhau");
		  if (x.type === "password"){
		  	x.type = "text";
		  } 
		  else{
		    x.type = "password";
		  }
	}
</script>
<body>
	<jsp:include page="NavbarAdmin.jsp"></jsp:include>
			<div class="container pt-3">
				<%
					Student admin = StudentDAO.getAdmin();
				%>
				<h2 class="text-center text-muted mb-4">Đổi mật khẩu</h2>
				<form action="${pageContext.request.contextPath}/HandleUpdateAdmin?ID=100" method="POST" class="form-update">
				<div class="row">
					<div class="col-5 mx-auto mb-2">
						<label class="mb-2 text-muted">Mật khẩu</label>
						<input type="password" id="matkhau" name="matkhau" value="<%=admin.getMatkhau()%>" required/>
						<span class="text-muted"><i class="fas fa-lock" onclick="showPassword()" style="left:93%"></i></span>
					</div>
				</div>
				<div class="row">
					<div class="col-5 mx-auto">
						<label class="mb-2 text-muted">Nhập lại mật khẩu</label>
						<input type="password" id="nhaplaimatkhau" name="nhaplaimatkhau" onkeyup="check();" value="<%=admin.getMatkhau()%>" required/>
						<span class="text-muted"><i class="fas fa-lock" onclick="showRepassword()" style="left:93%"></i></span>
						<span id="message" class="message"></span>
					</div>
				</div>
				<div class="row mt-2">
					<div class="col-6 mx-auto text-center ">
						<input type="submit" class="btn btn-success" value="Cập nhật" id="update" name="update"/>
					</div>
				</div>
				</form>
			</div>
	<jsp:include page="Footer.jsp"></jsp:include>
</body>
</html>