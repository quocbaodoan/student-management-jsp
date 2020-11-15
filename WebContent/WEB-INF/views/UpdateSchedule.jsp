<%@page import="model.Schedule"%>
<%@page import="dao.ScheduleDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cập nhật lịch học</title>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Raleway:ital,wght@0,100;0,200;0,300;0,400;1,100;1,200;1,300&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link rel="stylesheet" href="/public/css/style.css">
<body>
	<jsp:include page="NavbarAdmin.jsp"></jsp:include>
			<div class="container pt-3">
				<%
					String mssv = request.getParameter("ID");
					String mamonhoc = request.getParameter("MMH");
					Schedule schedule = ScheduleDAO.getScheduleByMMH(mamonhoc);
					String index1 = "", index2 = "", index3 = "", index4 = "", index5 = "";
					if (schedule.getSotinchi().charAt(0) == '1') index1 = "selected";
					else if (schedule.getSotinchi().charAt(0) == '2') index2 = "selected";
					else if (schedule.getSotinchi().charAt(0) == '3') index3 = "selected";
					else if (schedule.getSotinchi().charAt(0) == '4') index4 = "selected";
					else index5 = "selected";
				%>
				<h2 class="text-center text-muted mb-4">Cập nhật lịch học</h2>
				<form action="${pageContext.request.contextPath}/HandleUpdateSchedule?ID=<%=mssv%>&MMH=<%=mamonhoc%>" method="POST">
				<div class="row">
					<div class="col-6 mx-auto mb-2">
						<label class="label-main text-muted">Mã sinh viên:</label>
						<input type="text" value="<%=mssv%>" id="mssv" name="mssv" readonly/>
					</div>
				</div>
				<div class="row">
					<div class="col-6 mx-auto">
						<label class="text-muted">Tên môn học</label>
						<input type="text" id="tenmonhoc" name="tenmonhoc" value="<%=schedule.getTenmonhoc()%>" required/>
					</div>
				</div>
				<div class="row">
					<div class="col-6 mx-auto">
						<label class="text-muted">Số tín chỉ</label>
						<select id="sotinchi" name="sotinchi" value="2">
							<option value="1" <%=index1%>>1</option>
							<option value="2" <%=index2%>>2</option>
							<option value="3" <%=index3%>>3</option>
							<option value="4" <%=index4%>>4</option>
							<option value="5" <%=index5%>>5</option>
						</select>
					</div>
				</div>
				<div class="row">
					<div class="col-6 mx-auto">
						<label class="text-muted">Giảng viên</label>
						<input type="text" id="giangvien" name="giangvien" value="<%=schedule.getGiangvien()%>" required/>
					</div>
				</div>
				<div class="row">
					<div class="col-6 mx-auto">
						<label class="text-muted">Thời khóa biểu</label>
						<input type="text" id="thoikhoabieu" name="thoikhoabieu" value="<%=schedule.getThoikhoabieu()%>" required/>
					</div>
				</div>
				<div class="row">
					<div class="col-6 mx-auto">
						<label class="text-muted">Tuần học</label>
						<input type="text" id="tuanhoc" name="tuanhoc" value="<%=schedule.getTuanhoc()%>" required/>
					</div>
				</div>
				<div class="row">
					<div class="col-6 mx-auto  text-center">
						<input type="submit" class="btn btn-success" value="Cập nhật"/>
						<a href="/admin/schedule?ID=<%=mssv%>" class="btn btn-primary">Trở về</a>
					</div>
				</div>
				</form>
			</div>
	<jsp:include page="Footer.jsp"></jsp:include>
</body>
</html>