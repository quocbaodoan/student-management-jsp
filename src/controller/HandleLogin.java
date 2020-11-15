package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UserDAO;
import model.User;

@WebServlet(name = "login", urlPatterns = { "/login" })
public class HandleLogin extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");

		try {
			HttpSession session = request.getSession();
			
			User user = UserDAO.getUser(request.getParameter("username"), request.getParameter("password"));
			
			if (user.getUsername() != null) {
				session.setAttribute("username", user.getUsername());
				session.removeAttribute("invalid");
			} else {
				session.setAttribute("invalid", "Y");
			}

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
