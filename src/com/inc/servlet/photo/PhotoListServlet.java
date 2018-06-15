package com.inc.servlet.photo;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.inc.dao.BookDao;
import com.inc.dao.PhotoDao;
import com.inc.util.Paging;
import com.inc.vo.Book;
import com.inc.vo.Photo;

@WebServlet("/photo/list")
public class PhotoListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
request.setCharacterEncoding("utf-8");
		
		int nowPage = 1;
		String page = request.getParameter("page");
		
		if(page != null && !page.equals("")) {
			nowPage = Integer.parseInt(page);
		}
		
		int numberOfList = 8;
		int numberOfPage = 3;
		
		int start = (nowPage - 1) * numberOfList + 1;
		int end = start + numberOfList - 1;
		
		Map<String, Object> pageMap = new HashMap<>();
		pageMap.put("start", start);
		pageMap.put("end", end);
		
		List<Photo> photoList = PhotoDao.getInstance().selectList(pageMap);
		
		request.setAttribute("photoList", photoList);
		
		int totalCount = PhotoDao.getInstance().totalCount(pageMap);
		String paging = Paging.getInstance().getPaging(request.getContextPath()+"/photo/list", nowPage, totalCount, numberOfList, numberOfPage);
		
		request.setAttribute("paging", paging);
		request.getRequestDispatcher("/view/photolist.jsp").forward(request, response);
	}
}