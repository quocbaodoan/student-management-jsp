<%@page import="model.Schedule"%>
<%@page import="dao.ScheduleDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Thêm lịch học</title>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Raleway:ital,wght@0,100;0,200;0,300;0,400;1,100;1,200;1,300&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootxapcdn.com/bootxap/4.0.0/css/bootxap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link rel="stylesheet" href="/public/css/style.css">
<script>
	function check(){
		var x = document.getElementById("tenmonhoc").value;
		x = x.replace(/à|á|ạ|ả|ã|â|ầ|ấ|ậ|ẩ|ẫ|ă|ằ|ắ|ặ|ẳ|ẵ/g, "a");
	    x = x.replace(/è|é|ẹ|ẻ|ẽ|ê|ề|ế|ệ|ể|ễ/g, "e");
	    x = x.replace(/ì|í|ị|ỉ|ĩ/g, "i");
	    x = x.replace(/ò|ó|ọ|ỏ|õ|ô|ồ|ố|ộ|ổ|ỗ|ơ|ờ|ớ|ợ|ở|ỡ/g, "o");
	    x = x.replace(/ù|ú|ụ|ủ|ũ|ư|ừ|ứ|ự|ử|ữ/g, "u");
	    x = x.replace(/ỳ|ý|ỵ|ỷ|ỹ/g, "y");
	    x = x.replace(/đ/g, "d");
	    x = x.replace(/À|Á|Ạ|Ả|Ã|Â|Ầ|Ấ|Ậ|Ẩ|Ẫ|Ă|Ằ|Ắ|Ặ|Ẳ|Ẵ/g, "A");
	    x = x.replace(/È|É|Ẹ|Ẻ|Ẽ|Ê|Ề|Ế|Ệ|Ể|Ễ/g, "E");
	    x = x.replace(/Ì|Í|Ị|Ỉ|Ĩ/g, "I");
	    x = x.replace(/Ò|Ó|Ọ|Ỏ|Õ|Ô|Ồ|Ố|Ộ|Ổ|Ỗ|Ơ|Ờ|Ớ|Ợ|Ở|Ỡ/g, "O");
	    x = x.replace(/Ù|Ú|Ụ|Ủ|Ũ|Ư|Ừ|Ứ|Ự|Ử|Ữ/g, "U");
	    x = x.replace(/Ỳ|Ý|Ỵ|Ỷ|Ỹ/g, "Y");
	    x = x.replace(/Đ/g, "D");
	    x = x.replace(/\s+/g, '');
	    x = x.toLowerCase();
		<%for (Schedule schedule : ScheduleDAO.getScheduleByID(request.getParameter("ID"))){%>
			if (x == "<%=schedule.getMamonhoc()%>") {
				document.getElementById("message").innerHTML = "Môn học đã tồn tại";
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
			<%System.out.println(schedule.getTenmonhoc());%>
		<%}%>
	}
</script>
<body>
	<jsp:include page="NavbarAdmin.jsp"></jsp:include>
			<div class="container pt-3">
				<%
					String mssv = request.getParameter("ID");
				%>
				<h2 class="text-center text-muted mb-4">Thêm lịch học</h2>
				<form action="${pageContext.request.contextPath}/HandleAddSchedule?ID=<%=mssv%>" method="POST" onsubmit={return false}>
				<div class="row">
					<div class="col-6 mx-auto mb-2">
						<label class="text-muted">Mã sinh viên</label>
						<input type="text" value="<%=mssv%>" id="mssv" name="mssv" readonly/>
					</div>
				</div>
				<div class="row">
					<div class="col-6 mx-auto">
						<label class="text-muted">Tên môn học</label>
						<input type="text" id="tenmonhoc"  name="tenmonhoc" onkeyup="check()" required/>
						<span id="message" class="message3"></span>
					</div>
				</div>
				<div class="row">
					<div class="col-6 mx-auto">
						<label class="text-muted">Số tín chỉ</label>
						<select id="sotinchi" name="sotinchi">
							<option>1</option>
							<option>2</option>
							<option>3</option>
							<option>4</option>
							<option>5</option>
						</select>
					</div>
				</div>
				<div class="row">
					<div class="col-6 mx-auto">
						<label class="text-muted">Giảng viên</label>
						<input type="text" id="giangvien" name="giangvien" required/>
					</div>
				</div>
				<div class="row">
					<div class="col-6 mx-auto">
						<label class="text-muted">Thời khóa biểu</label>
						<input type="text" id="thoikhoabieu" name="thoikhoabieu" required/>
					</div>
				</div>
				<div class="row">
					<div class="col-6 mx-auto">
						<label class="text-muted">Tuần học</label>
						<input type="text" id="tuanhoc" name="tuanhoc" required/>
					</div>
				</div>
				<div class="row">
					<div class="col-6 mx-auto  text-center">
						<input type="submit" class="btn btn-success" id="add" name="add" value="Thêm"/>
						<a href="/admin/schedule?ID=<%=mssv%>" class="btn btn-primary">Trở về</a>
					</div>
				</div>
				</form>
			</div>
	<jsp:include page="Footer.jsp"></jsp:include>
</body>
</html>