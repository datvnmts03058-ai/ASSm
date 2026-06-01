package Servlet;

import java.io.IOException;

import Dao.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import Model.User;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	UserDAO dao = new UserDAO();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		req.getRequestDispatcher("/views/login.jsp")
		   .forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		String username = req.getParameter("username");
		String password = req.getParameter("password");

		User user = dao.login(username, password);

		if (user != null) {

			HttpSession session = req.getSession();

			session.setAttribute("user", user);

			if ("ADMIN".equalsIgnoreCase(user.getRole())) {
				resp.sendRedirect(req.getContextPath() + "/users");
			} else {
				resp.sendRedirect(req.getContextPath() + "/home");
			}

		} else {

			req.setAttribute("message",
					"Sai tài khoản hoặc mật khẩu!");

			req.getRequestDispatcher("/views/login.jsp")
			   .forward(req, resp);
		}
	}
}