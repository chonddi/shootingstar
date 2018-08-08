package com.ss.star.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

@Component
public class LoginInterceptorMember extends HandlerInterceptorAdapter{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		String userCode= (String) request.getSession().getAttribute("userCode");
		
		if(!"1".equals(userCode)) {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script type='text/javascript'>");
			out.print("alert('고객회원으로 로그인해 주십시오.');"); 
			out.print("location.href='"+request.getContextPath()+"';");
			out.println("</script>");
			return false;
		}
		return true; // 다음 컨트롤러를 실행함
	}
}
