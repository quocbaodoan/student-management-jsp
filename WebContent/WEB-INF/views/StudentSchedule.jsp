<%@page import="model.Schedule"%>
<%@page import="dao.ScheduleDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Quản lý lịch học</title>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Raleway:ital,wght@0,100;0,200;0,300;0,400;1,100;1,200;1,300&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link rel="stylesheet" href="/public/css/style.css">
</head>
<body>
	<jsp:include page="NavbarStudent.jsp"></jsp:include>
			<div class="container pt-3">
				<div class="row">
					<div class="col-12 mx-auto">
						<%
							String mssv = (String)session.getAttribute("username");
						%>
						<h2 class="text-center text-muted mb-4">Quản lý lịch học</h2>
						<table class="table">
							<tr class="table-header">
								<th class="header-item text-muted">STT</th>
								<th class="header-item text-muted">Tên môn học</th>
								<th class="header-item text-muted">Số tín chỉ</th>
								<th class="header-item text-muted">Giảng viên</th>
								<th class="header-item text-muted">Thời khóa biểu</th>
								<th class="header-item text-muted">Tuần học</th>
							</tr>
							<%
								int count = 0;
								for (Schedule schedule : ScheduleDAO.getScheduleByID(mssv)) {
									count++;
							%>
							<tr class="table-row">
								<td class="table-data"><%=count%></td>
								<td class="table-data"><%=schedule.getTenmonhoc()%></td>
								<td class="table-data"><%=schedule.getSotinchi()%></td>
								<td class="table-data"><%=schedule.getGiangvien()%></td>
								<td class="table-data"><%=schedule.getThoikhoabieu()%></td>
								<td class="table-data"><%=schedule.getTuanhoc()%></td>
							</tr>
							<%
								}
							%>
						</table>
					</div>
				</div>
			</div>
	<jsp:include page="Footer.jsp"></jsp:include>
</body>
</html>