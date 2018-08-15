package com.ss.star.service.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

@Component
public class LoginInterceptorQAdmin extends HandlerInterceptorAdapter {
	
	private static final Logger logger = LoggerFactory.getLogger(LoginInterceptorQAdmin.class);
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		logger.info("preHandle() - 관리자 Q&A 컨트롤러 수행전");

		String adminCode = (String) request.getSession().getAttribute("adminCode");
		
		System.out.println("adminCode = " + adminCode);
		
		if ((adminCode == null || adminCode.isEmpty())) {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script type='text/javascript'>");
			out.print("alert('로그인이 필요한 서비스입니다.');");
			out.print("location.href='" + request.getContextPath() + "/admin/login/login.do';");
			out.println("</script>");

			return false;
		}

		return true;
	}

}
