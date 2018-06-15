package com.inc.servlet.guestbook;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.inc.dao.BookDao;

@WebServlet("/guestbook/delete")
public class BookDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		if(!((String)(request.getSession().getAttribute("id"))).equals(request.getParameter("u_id"))) {
			request.setAttribute("msg", "작성자만 삭제가 가능합니다.");
			request.setAttribute("url", request.getContextPath()+"/guestbook/list");
			request.getRequestDispatcher("/view/alert.jsp").forward(request, response);
			return;
		}
		
		int id = Integer.parseInt(request.getParameter("id"));
		BookDao.getInstance().delete(id);
		
		response.sendRedirect(request.getContextPath()+"/guestbook/list");
	}
}