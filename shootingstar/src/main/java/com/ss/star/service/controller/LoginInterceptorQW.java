package com.ss.star.service.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

@Component
public class LoginInterceptorQW extends HandlerInterceptorAdapter {
	
	private static final Logger logger = LoggerFactory.getLogger(LoginInterceptorQW.class);
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		logger.info("preHandle() - 고객 Q&A 컨트롤러 수행전");

		String userCode = (String) request.getSession().getAttribute("userCode");
		
		if (userCode == null || userCode.isEmpty()) {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script type='text/javascript'>");
			out.print("alert('로그인이 필요한 서비스입니다.');");
			out.print("window.opener.location.href='" + request.getContextPath() + "/login/login.do';");
			out.print("self.close();");
			out.println("</script>");

			return false;
		}else if(!"1".equals(userCode)) {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script type='text/javascript'>");
			out.print("alert('고객 회원만 이용 가능한 서비스입니다.');");
			out.println("</script>");

			return false;
		}

		return true;
	}

}
