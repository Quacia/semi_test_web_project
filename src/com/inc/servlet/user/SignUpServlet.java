package com.inc.servlet.user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.inc.dao.UserDao;
import com.inc.util.SHA256Encryptor;
import com.inc.vo.User;

@WebServlet("/signup")
public class SignUpServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher("/view/signup.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		String name = request.getParameter("name");
		String job = request.getParameter("job");
		
		User user = new User();
		user.setId(id);
		password = SHA256Encryptor.shaEncrypt(password); //받아온 비밀번호 암호화.
		user.setPassword(password);
		user.setName(name);
		user.setJob(job);
		
		UserDao.getInstance().signUp(user);
		
		request.setAttribute("msg", "회원 가입 완료. 메인페이지로 이동합니다.");
		request.setAttribute("url", request.getContextPath()+"/main");
		
		request.getRequestDispatcher("/view/alert.jsp").forward(request, response);
	}

}