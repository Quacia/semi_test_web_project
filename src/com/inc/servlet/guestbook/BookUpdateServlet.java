package com.inc.servlet.guestbook;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.inc.dao.BookDao;
import com.inc.vo.Book;

@WebServlet("/guestbook/update")
public class BookUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if(!((String)(request.getSession().getAttribute("id"))).equals(request.getParameter("u_id"))) {
			request.setAttribute("msg", "작성자만 수정 가능합니다.");
			request.setAttribute("url", request.getContextPath()+"/guestbook/list");
			request.getRequestDispatcher("/view/alert.jsp").forward(request, response);
			return;
		}
		
		int id = Integer.parseInt(request.getParameter("id"));
		Book book = BookDao.getInstance().selectOne(id);
		
		request.setAttribute("book", book);
		request.getRequestDispatcher("/view/bookupdate.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		int id = Integer.parseInt(request.getParameter("id"));
		String content = request.getParameter("content");
		
		Book book = new Book();
		book.setId(id);
		book.setContent(content);
		
		BookDao.getInstance().update(book);
		response.sendRedirect(request.getContextPath() + "/guestbook/list");
	}

}