package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.StudentDAO;
import model.Student;

@WebServlet(name = "HandleAdminUpdateStudent", urlPatterns = { "/HandleAdminUpdateStudent" })
public class HandleAdminUpdateStudent extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");

		try {

			Student student = new Student();
			student.setMssv(request.getParameter("mssv"));
			student.setTensinhvien(request.getParameter("tensinhvien"));
			student.setGioitinh(request.getParameter("gioitinh"));
			student.setNgaysinh(request.getParameter("ngaysinh"));
			student.setDiachi(request.getParameter("diachi"));
			student.setEmail(request.getParameter("email"));
			student.setSdt(request.getParameter("sdt"));
			student.setMatkhau(request.getParameter("matkhau"));

			StudentDAO.update(student);

			response.sendRedirect("/");

		} catch (Exception e) {
			System.out.println("Request err: " + e.getMessage());
		}

	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
