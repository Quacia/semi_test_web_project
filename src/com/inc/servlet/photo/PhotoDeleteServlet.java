package com.inc.servlet.photo;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.inc.dao.PhotoDao;

@WebServlet("/photo/delete")
public class PhotoDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		//작성자 본인이 아닐 경우 경고창 띄우고 삭제작업을 실행하지 않는다. url로 타인의 사진 삭제를 방지하기 위함.
		if(!((String)(request.getSession().getAttribute("id"))).equals(request.getParameter("u_id"))) {
			request.setAttribute("msg", "작성자만 삭제가 가능합니다.");
			request.setAttribute("url", request.getContextPath()+"/photo/list");
			request.getRequestDispatcher("/view/alert.jsp").forward(request, response);
			return;
		}
		
		int id = Integer.parseInt(request.getParameter("id"));
		String url = request.getParameter("url");
		
		String realPath = request.getServletContext().getRealPath("/upload/");
		
		realPath = realPath + url;
		
		File file = new File(realPath);
		file.delete();
		
		PhotoDao.getInstance().delete(id);
		
		response.sendRedirect(request.getContextPath() + "/photo/list");
	}
}