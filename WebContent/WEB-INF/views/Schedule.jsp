<%@page import="model.Schedule"%>
<%@page import="dao.ScheduleDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Lịch học</title>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Raleway:ital,wght@0,100;0,200;0,300;0,400;1,100;1,200;1,300&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link rel="stylesheet" href="/public/css/style.css">
</head>
<body>
	<jsp:include page="NavbarAdmin.jsp"></jsp:include>
			<%
				String mssv = request.getParameter("ID");
			%>
			<div class="container pt-3">
				<div class="row">
					<div class="col-12 mx-auto">
						<h2 class="text-center text-muted mb-1">Lịch học</h2>
						<div class="d-flex row" style="padding: 0px 15px">
							<a href="${pageContext.request.contextPath}/admin/schedule/add?ID=<%=mssv%>" class="btn btn-info mr-auto">Thêm lịch học</a>
							<a onclick="location.href = '#popup';" class="btn btn-danger mr-1">Xóa tất cả</a>
							<div id="popup" class="popup text-center">
						        <div>
						            <div class="row form-row justify-content-center" style="margin-top: 46px">
						                <h5 class="text-muted">Bạn chắc chắn muốn xóa tất cả?</h5>
						            </div>
						            <div class="row form-row text-center" style="margin-top: 36px">
						                <div class="col-6 mx-auto">
						                    <a href="${pageContext.request.contextPath}/admin/schedule/deleteall?ID=<%=mssv%>" class="btn btn-danger" style="width: 100px">Có</a>
						                </div>
						                <div class="col-6 mx-auto">
						                    <a href="${pageContext.request.contextPath}/admin/schedule?ID=<%=mssv%>" class="btn btn-primary" style="width: 100px">Không</a>
						                </div>
						            </div>
						        </div>
							</div>
							<a href="${pageContext.request.contextPath}/admin/schedulemanagement" class="btn btn-info" style="float:right">Trở về</a>
						</div>
						<table class="table mt-2">
							<tr class="table-header">
								<th class="header-item text-muted">STT</th>
								<th class="header-item text-muted">Tên môn học</th>
								<th class="header-item text-muted">Số tín chỉ</th>
								<th class="header-item text-muted">Giảng viên</th>
								<th class="header-item text-muted">Thời khóa biểu</th>
								<th class="header-item text-muted">Tuần học</th>
								<th class="header-item text-muted">Chức năng</th>
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
								<td class="table-data" style="padding: 0.4rem 0rem 0.4rem 0rem">
									<div class="row">
										<div class="col-6" style="padding-right:0px">
											<a href="${pageContext.request.contextPath}/admin/schedule/update?ID=<%=mssv%>&MMH=<%=schedule.getMamonhoc()%>" class="btn btn-success">Cập nhật</a>
										</div>
										<div class="col-6" style="padding-right:0px; padding-left: 22px;">
											<a onclick="location.href='#popup<%=mssv+schedule.getMamonhoc()%>'" class="btn btn-danger">Xóa</a>
											<div id="popup<%=mssv+schedule.getMamonhoc()%>" class="popup text-center">
										        <div>
										            <div class="row form-row justify-content-center" style="margin-top: 46px">
										                <h5 class="text-muted">Bạn chắc chắn muốn xóa?</h5>
										            </div>
										            <div class="row form-row text-center" style="margin-top: 36px">
										                <div class="col-6 mx-auto">
										                    <a href="${pageContext.request.contextPath}/admin/schedule/delete?ID=<%=mssv%>&MMH=<%=schedule.getMamonhoc()%>" class="btn btn-danger" style="width: 100px">Có</a>
										                </div>
										                <div class="col-6 mx-auto">
										                    <a href="${pageContext.request.contextPath}/admin/schedule?ID=<%=mssv%>" class="btn btn-primary" style="width: 100px">Không</a>
										                </div>
										            </div>
										        </div>
											</div>
										</div>
									</div>
								</td>
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