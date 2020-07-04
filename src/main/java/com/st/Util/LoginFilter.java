package com.st.Util;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * @author Auk
 *  验证用户是否登陆,如果登陆,可以正常访问,没有登录,跳转到登陆界面
 */
public class LoginFilter extends HttpFilter{
		
	@Override
	protected void doFilter(HttpServletRequest request, HttpServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		// TODO Auto-generated method stub
		//session中保存了loginuser属性,说明已经登录,否则没有登录
		HttpSession session = request.getSession();
		Object user=session.getAttribute("loginuser");
		if(user!=null) {
			//有值说明登录
			super.doFilter(request, response, chain);
		}else {
			//转发到login
			//request.getRequestDispatcher("login").forward(request, response);
			//重定向
			String path = request.getContextPath();
			String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
					+ path + "/";
			response.sendRedirect(basePath+"login");
			
		}
		
	}
}
