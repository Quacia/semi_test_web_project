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

@WebServlet("/signin")
public class SignInServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher("/view/signin.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");
		String password= request.getParameter("password");
		
		//입력받은 password를 암호화해서 일치하는지 비교한다.
		password = SHA256Encryptor.shaEncrypt(password);
		User user = UserDao.getInstance().selectOne(id);
		
		if(user == null) {
			request.setAttribute("msg", "아이디가 없습니다.");
			request.setAttribute("url", request.getContextPath()+"/signin");
			request.getRequestDispatcher("/view/alert.jsp").forward(request, response);
		}else if(!user.getPassword().equals(password)){
			request.setAttribute("msg", "비밀번호가 틀렸습니다.");
			request.setAttribute("url", request.getContextPath()+"/signin");
			request.getRequestDispatcher("/view/alert.jsp").forward(request, response);
		}else {
			request.getSession().setAttribute("id", user.getId());
			request.getSession().setAttribute("name", user.getName());
			
			request.setAttribute("msg", user.getName() + "님 환영합니다!");
			request.setAttribute("url", request.getContextPath()+"/main");
			request.getRequestDispatcher("/view/alert.jsp").forward(request, response);
		}
	}

}