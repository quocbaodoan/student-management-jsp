package controller;

import java.io.IOException;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ScheduleDAO;
import model.Schedule;

@WebServlet(name = "HandleUpdateSchedule", urlPatterns = { "/HandleUpdateSchedule" })
public class HandleUpdateSchedule extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");

		try {
			Schedule schedule = new Schedule();
			schedule.setMssv(request.getParameter("ID"));
			schedule.setTenmonhoc(request.getParameter("tenmonhoc"));
			schedule.setSotinchi(request.getParameter("sotinchi"));
			schedule.setGiangvien(request.getParameter("giangvien"));
			schedule.setThoikhoabieu(request.getParameter("thoikhoabieu"));
			schedule.setTuanhoc(request.getParameter("tuanhoc"));
			schedule.setMamonhoc(request.getParameter("MMH"));
			
			ScheduleDAO.update(schedule);

			response.sendRedirect("/admin/schedule?ID="+request.getParameter("ID"));

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
