package Servlet;

import java.io.IOException;
import java.util.List;

import Dao.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import Model.User;

@WebServlet("/users")
public class UserServlet extends HttpServlet {

	UserDAO dao = new UserDAO();

	@Override
	protected void doGet(HttpServletRequest req,
			HttpServletResponse resp)
			throws ServletException, IOException {

		String action = req.getParameter("action");

		if("edit".equals(action)) {

			Long id = Long.valueOf(
					req.getParameter("id"));

			User user = dao.findById(id);

			req.setAttribute("form", user);
		}

		List<User> users = dao.findAll();

		req.setAttribute("users", users);

		req.getRequestDispatcher("/views/users.jsp")
			.forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req,
			HttpServletResponse resp)
			throws ServletException, IOException {

		String action = req.getParameter("action");

		if("create".equals(action)) {

			User user = new User();

			user.setUsername(
					req.getParameter("username"));

			user.setPassword(
					req.getParameter("password"));

			user.setFullname(
					req.getParameter("fullname"));

			user.setEmail(
					req.getParameter("email"));

			user.setRole(
					req.getParameter("role"));

			dao.create(user);
		}

		else if("update".equals(action)) {

			User user = dao.findById(
				Long.valueOf(req.getParameter("id")));

			user.setUsername(
					req.getParameter("username"));

			user.setPassword(
					req.getParameter("password"));

			user.setFullname(
					req.getParameter("fullname"));

			user.setEmail(
					req.getParameter("email"));

			user.setRole(
					req.getParameter("role"));

			dao.update(user);
		}

		else if("delete".equals(action)) {

			dao.delete(
				Long.valueOf(req.getParameter("id")));
		}

		resp.sendRedirect(
				req.getContextPath()+"/users");
	}
}