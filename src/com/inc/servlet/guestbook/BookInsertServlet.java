package com.inc.servlet.guestbook;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.inc.dao.BookDao;
import com.inc.vo.Book;

@WebServlet("/guestbook/insert")
public class BookInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String content = request.getParameter("content");
		
		Book book = new Book();
		book.setContent(content);
		book.setU_id(((String)(request.getSession().getAttribute("id"))));
		
		BookDao.getInstance().insert(book);
		
		response.sendRedirect(request.getContextPath() + "/guestbook/list");
	}

}