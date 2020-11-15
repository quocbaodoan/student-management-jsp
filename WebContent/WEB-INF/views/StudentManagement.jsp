<%@page import="model.Student"%>
<%@page import="dao.StudentDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Quản lý sinh viên</title>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Raleway:ital,wght@0,100;0,200;0,300;0,400;1,100;1,200;1,300&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link rel="stylesheet" href="/public/css/style.css">
<script>
	function search(){
		var x = document.getElementById("search");
	}
</script>
</head>
<body>
			<div class="pt-3">
				<div class="row">
					<div class="col-12 mx-auto">
						<h2 class="text-center text-muted mb-3">Quản lý sinh viên</h2>
						<div class="d-flex row" style="padding: 0px 15px">
							<a href="${pageContext.request.contextPath}/admin/student/add" class="btn btn-info">Thêm sinh viên</a>
							<form action="${pageContext.request.contextPath}/admin/student/search" method="POST" class="ml-3">
								<input type="text" id="search" name="search" class="search-text" placeholder="Tìm kiếm"/>
								<button type="submit" name="btn-search" id="btn-search" class="btn-search"><i class="fas fa-search text-muted"></i></button>
							</form>
							<a onclick="location.href = '#popup'" class="btn btn-danger ml-auto">Xóa tất cả</a>
							<div id="popup" class="popup text-center">
						        <div>
						            <div class="row form-row justify-content-center" style="margin-top: 46px">
						                <h5 class="text-muted">Bạn chắc chắn muốn xóa tất cả?</h5>
						            </div>
						            <div class="row form-row text-center" style="margin-top: 36px">
						                <div class="col-6 mx-auto">
						                    <a href="${pageContext.request.contextPath}/admin/student/deleteall" class="btn btn-danger" style="width: 100px">Có</a>
						                </div>
						                <div class="col-6 mx-auto">
						                    <a href="${pageContext.request.contextPath}/" class="btn btn-primary" style="width: 100px">Không</a>
						                </div>
						            </div>
						        </div>
							</div>
						</div>
						<table class="table mt-2">
							<tr class="table-header">
								<th class="header-item text-muted">STT</th>
								<th class="header-item text-muted">Mã sinh viên</th>
								<th class="header-item text-muted">Tên sinh viên</th>
								<th class="header-item text-muted">Giới tính</th>
								<th class="header-item text-muted">Ngày sinh</th>
								<th class="header-item text-muted">Địa chỉ</th>
								<th class="header-item text-muted">Chức năng</th>
							</tr>
							<%
								int count = 0;
								for (Student student : StudentDAO.getAllStudent()) {
									count++;
							%>
									<tr class="table-row">
										<td class="table-data"><%=count%></td>
										<td class="table-data"><%=student.getMssv()%></td>
										<td class="table-data"><%=student.getTensinhvien()%></td>
										<td class="table-data"><%=student.getGioitinh()%></td>
										<td class="table-data"><%=student.getNgaysinh()%></td>
										<td class="table-data"><%=student.getDiachi()%></td>
										<td class="table-data" style="padding: 0.4rem 0rem 0.4rem 0rem">
											<div class="row">
												<div class="col-6" style="padding-right:0px">
													<a href="${pageContext.request.contextPath}/admin/student/update?ID=<%=student.getMssv()%>" class="btn btn-success">Cập nhật</a>
												</div>
												<div class="col-6" style="padding-right:0px; padding-left: 20px;">
													<a onclick="location.href='#popup<%=student.getMssv()%>'" class="btn btn-danger">Xóa</a>
													<div id="popup<%=student.getMssv()%>" class="popup text-center">
												        <div>
												            <div class="row form-row justify-content-center" style="margin-top: 46px">
												                <h5 class="text-muted">Bạn chắc chắn muốn xóa?</h5>
												            </div>
												            <div class="row form-row text-center" style="margin-top: 36px">
												                <div class="col-6 mx-auto">
												                    <a href="${pageContext.request.contextPath}/admin/student/delete?ID=<%=student.getMssv()%>" class="btn btn-danger" style="width: 100px">Có</a>
												                </div>
												                <div class="col-6 mx-auto">
												                    <a href="${pageContext.request.contextPath}/" class="btn btn-primary" style="width: 100px">Không</a>
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
</body>
</html>