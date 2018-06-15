package com.inc.servlet.user;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.inc.dao.UserDao;

@WebServlet("/dualCheck")
public class DualCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String id = request.getParameter("id");
		
		int count = UserDao.getInstance().getIdCount(id);
		
		response.setContentType("text/plain; charset=utf-8");
		if(count == 0 ) {
			response.getWriter().print('n');
		}else {
			response.getWriter().print('y');
		}
	}
}