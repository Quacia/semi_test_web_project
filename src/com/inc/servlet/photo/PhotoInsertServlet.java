package com.inc.servlet.photo;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.inc.dao.PhotoDao;
import com.inc.vo.Photo;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("/photo/insert")
public class PhotoInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher("/view/photoinsert.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String realPath = request.getServletContext().getRealPath("/upload");
		MultipartRequest mr = new MultipartRequest(
				request, realPath, 10*1024*1024, "utf-8", new DefaultFileRenamePolicy());
		File file = mr.getFile("photo");
		String filename = "noFile";
		if(file != null) {
			//파일이 not null, 즉 업로드되었을 경우 filename 변수 채워주고, 확장자 체크.
			filename = file.getName();
			if(!filename.endsWith(".jpg") && !filename.endsWith(".png") && !filename.endsWith(".gif")) {
				//filename이 .jpg로 끝나지도 않고, .png로 끝나지도 않으며, .gif로 끝나지도 않을 경우.
				//file이 업로드되고 난 이후 해당 if문이 실행되므로, 삭제해주고 return해야 DB에 추가되지 않음.
				file.delete();
				request.setAttribute("msg", "이미지 이외의 파일은 업로드할수 없습니다.");
				request.setAttribute("url", "../photo/list");
				request.getRequestDispatcher("/view/alert.jsp").forward(request, response);
				return;
			}
		}
		
		Photo photo = new Photo();
		photo.setU_id((String)(request.getSession().getAttribute("id")));
		photo.setContent(mr.getParameter("content"));
		photo.setUrl(filename);
		
		PhotoDao.getInstance().insert(photo);
		
		response.sendRedirect(request.getContextPath() + "/photo/list");
	}

}