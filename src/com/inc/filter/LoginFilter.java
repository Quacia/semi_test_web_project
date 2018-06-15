package com.inc.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebFilter(value= {"/photo/insert", "/book/insert"})
	//목록 불러오기는 비회원도 가능하도록 설정했으므로, 등록 기능에서만 로그인 필터를 적용한다.
public class LoginFilter implements Filter {
	@Override
	public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest)req;
		HttpServletResponse response = (HttpServletResponse)res;
		
		//url을 통한 비회원 접근방지
		if(request.getSession().getAttribute("id") == null) {
			request.setAttribute("msg", "로그인 후 이용 가능한 페이지입니다.");
			request.setAttribute("url", request.getContextPath()+"/signin");
			request.getRequestDispatcher("/view/alert.jsp").forward(request, response);
			return;
		}
		chain.doFilter(req, res);
	}
	
	@Override
	public void destroy() {}

	@Override
	public void init(FilterConfig arg0) throws ServletException {}
	
}
