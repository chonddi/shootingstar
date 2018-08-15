package com.ss.star.service.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

@Component
public class LoginInterceptorQRAdmin extends HandlerInterceptorAdapter {
	
	private static final Logger logger = LoggerFactory.getLogger(LoginInterceptorQRAdmin.class);
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		logger.info("preHandle() - 고객 Q&A 컨트롤러 수행전");

		String adminCode = (String) request.getSession().getAttribute("adminCode");
		
		if (adminCode == null || adminCode.isEmpty()) {
			response.setContentType("text/html;charset=utf-8");
			response.sendError(500);
			
			return false;
		}else if(!"0".equals(adminCode)) {
			response.setContentType("text/html;charset=utf-8");
			response.sendError(400);

			return false;
		}

		return true;
	}

}
